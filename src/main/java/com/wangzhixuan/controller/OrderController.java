package com.wangzhixuan.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.commons.utils.StringEscapeEditor;
import com.wangzhixuan.model.Company;
import com.wangzhixuan.model.Order;
import com.wangzhixuan.service.ICompanyService;
import com.wangzhixuan.service.IOrderService;

/**
 * 
 * <b>类名称：</b>OrderController<br/>
 * <b>类描述：</b>订单管理<br/>
 * <b>创建人：</b>hugo<br/>
 * <b>创建时间：</b>2018年1月4日 下午5:41:02<br/>
 * <b>修改人：</b><br/>
 * <b>修改备注：</b><br/>
 * @version 1.0.0<br/>
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {
	@Autowired
	private IOrderService orderService;
    @Autowired
	private ICompanyService companyService;

	@InitBinder
	@Override
	public void initBinder(ServletRequestDataBinder binder) {
		/**
		 * 自动转换日期类型的字段格式
		 */
		binder.registerCustomEditor(Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
		/**
		 * 防止XSS攻击
		 */
		binder.registerCustomEditor(String.class, new StringEscapeEditor());
	}

    /**
     * 部门管理主页
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
		return "admin/order/order";
    }


    /**
	 * 公司列表
	 *
	 * @param page
	 * @param rows
	 * @param sort
	 * @param order
	 * @return
	 */
	@PostMapping("/dataGrid")
    @ResponseBody
	public Object dataGrid(Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		orderService.selectDataGrid(pageInfo);
		return pageInfo;
    }

	/**
	 * 添加页面
	 *
	 * @return
	 */
	@GetMapping("/addPage")
	public String addPage(Model model) {
		Company company = companyService.selectById(2);
		model.addAttribute("company", company);
		return "admin/order/orderAdd";
	}

	/**
	 * 添加
	 *
	 * @param role
	 * @return
	 */
	@PostMapping("/add")
	@ResponseBody
	public Object add(@Valid Order order) {
		orderService.addOrder(order);
		return renderSuccess("添加成功！");
	}

	/**
	 * 删除
	 *
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(Long id) {
		orderService.deleteById(id);
		return renderSuccess("删除成功！");
	}

	/**
	 * 编辑页
	 *
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(Model model, Long id) {
		Order order = orderService.selectById(id);
		model.addAttribute("order", order);
		return "admin/order/orderEdit";
	}

	/**
	 * 编辑
	 *
	 * @param role
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(@Valid Order order) {
		orderService.updateById(order);
		return renderSuccess("编辑成功！");
	}

}
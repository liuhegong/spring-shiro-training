package com.wangzhixuan.controller;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.commons.utils.StringEscapeEditor;
import com.wangzhixuan.model.Company;
import com.wangzhixuan.model.Customer;
import com.wangzhixuan.model.Order;
import com.wangzhixuan.model.OrderItem;
import com.wangzhixuan.service.ICompanyService;
import com.wangzhixuan.service.ICustomerService;
import com.wangzhixuan.service.IOrderItemService;
import com.wangzhixuan.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@Autowired
	private ICustomerService customerService;
    @Autowired
	private IOrderItemService orderItemService;

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
	 * @param order
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
		Customer customer = customerService.selectById(order.getCustomerId());
		order.setCustomer(customer);

		Map<String, Object> columnMap = new HashMap<String, Object>();
		columnMap.put("order_id", order.getId());
		List<OrderItem> orderItemList = orderItemService.selectByMap(columnMap);

		model.addAttribute("order", order);
		model.addAttribute("orderItemList", orderItemList);
		return "admin/order/orderEdit";
	}

	/**
	 * 查看页
	 *
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/showPage")
	public String showPage(Model model, Long id) {
		Order order = orderService.selectById(id);
		Customer customer = customerService.selectById(order.getCustomerId());
		order.setCustomer(customer);

		Map<String, Object> columnMap = new HashMap<String, Object>();
		columnMap.put("order_id", order.getId());
		List<OrderItem> orderItemList = orderItemService.selectByMap(columnMap);

		model.addAttribute("order", order);
		model.addAttribute("orderItemList", orderItemList);
		return "admin/order/orderView";
	}

	/**
	 * <b>方法描述：</b>获取订单项<br/>
	 * <b>参数描述：</b><br/>
	 * 
	 * @param orderId
	 * @return<br/>
	 * @return String<br/>
	 * @version<b>版本：</b>V1<br/>
	 * @author<b>创建人：</b>hugo<br/>
	 */
	@RequestMapping("/getOrderItemDatagrid")
	@ResponseBody
	public Object getOrderItemDatagrid(Long orderId) {
		PageInfo pageInfo = new PageInfo(1, Integer.MAX_VALUE, "id", "ASC");
		Map<String, Object> condition = new HashMap<>();
		condition.put("orderId", orderId);
		pageInfo.setCondition(condition);
		orderItemService.selectDataGrid(pageInfo);
		return pageInfo;
	}

	/**
	 * 编辑
	 *
	 * @param order
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(@Valid Order order) {
		orderService.updateById(order);
		return renderSuccess("编辑成功！");
	}

	@RequestMapping("/downloadPage")
	public String downloadPage() {
		return "admin/order/downloadPage";
	}

}
package com.wangzhixuan.controller;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.model.Customer;
import com.wangzhixuan.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

/**
 * @description：客户信息管理
 * @author：zhixuan.wang @date：2015/10/1 14:51
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {

    @Autowired
	private ICustomerService customerService;

    /**
     * 部门管理主页
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
		return "admin/customer/customer";
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
		customerService.selectDataGrid(pageInfo);
		return pageInfo;
    }

	/**
	 * 添加页面
	 *
	 * @return
	 */
	@GetMapping("/addPage")
	public String addPage() {
		return "admin/customer/customerAdd";
	}

	/**
	 * 添加
	 *
	 * @param customer
	 * @return
	 */
	@PostMapping("/add")
	@ResponseBody
	public Object add(@Valid Customer customer) {
		customerService.insert(customer);
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
		customerService.deleteById(id);
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
		Customer customer = customerService.selectById(id);
		model.addAttribute("customer", customer);
		return "admin/customer/customerEdit";
	}

	/**
	 * 编辑
	 *
	 * @param customer
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(@Valid Customer customer) {
		customerService.updateById(customer);
		return renderSuccess("编辑成功！");
	}

}
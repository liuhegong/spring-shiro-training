package com.wangzhixuan.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.model.Company;
import com.wangzhixuan.service.ICompanyService;

/**
 * @description：公司管理
 * @author：zhixuan.wang @date：2015/10/1 14:51
 */
@Controller
@RequestMapping("/company")
public class CompanyController extends BaseController {

    @Autowired
	private ICompanyService companyService;

    /**
     * 部门管理主页
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
		return "admin/company/company";
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
		companyService.selectDataGrid(pageInfo);
		return pageInfo;
    }

	/**
	 * 添加页面
	 *
	 * @return
	 */
	@GetMapping("/addPage")
	public String addPage() {
		return "admin/company/companyAdd";
	}

	/**
	 * 添加
	 *
	 * @param role
	 * @return
	 */
	@PostMapping("/add")
	@ResponseBody
	public Object add(@Valid Company company) {
		companyService.insert(company);
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
		companyService.deleteById(id);
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
		Company company = companyService.selectById(id);
		model.addAttribute("company", company);
		return "admin/company/companyEdit";
	}

	/**
	 * 编辑
	 *
	 * @param role
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(@Valid Company company) {
		companyService.updateById(company);
		return renderSuccess("编辑成功！");
	}

}
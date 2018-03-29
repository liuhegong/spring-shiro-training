package com.wangzhixuan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.wangzhixuan.model.Unit;
import com.wangzhixuan.service.IUnitService;

/**
 * @description：单位管理
 * @author：zhixuan.wang @date：2015/10/1 14:51
 */
@Controller
@RequestMapping("/unit")
public class UnitController extends BaseController {

    @Autowired
	private IUnitService unitService;

    /**
     * 部门管理主页
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
		return "admin/unit/unit";
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
		unitService.selectDataGrid(pageInfo);
		return pageInfo;
    }

	/**
	 * 添加页面
	 *
	 * @return
	 */
	@GetMapping("/addPage")
	public String addPage() {
		return "admin/unit/unitAdd";
	}

	/**
	 * 添加
	 *
	 * @param role
	 * @return
	 */
	@PostMapping("/add")
	@ResponseBody
	public Object add(@Valid Unit unit) {
		unitService.insert(unit);
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
		unitService.deleteById(id);
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
		Unit unit = unitService.selectById(id);
		model.addAttribute("unit", unit);
		return "admin/unit/unitEdit";
	}

	/**
	 * 编辑
	 *
	 * @param role
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(@Valid Unit unit) {
		unitService.updateById(unit);
		return renderSuccess("编辑成功！");
	}

	/**
	 * 列表
	 *
	 * @param role
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Object list() {
		Map<String, Object> columnMap = new HashMap<>();
		List<Unit> list = unitService.selectByMap(columnMap);
		return list;
	}

}
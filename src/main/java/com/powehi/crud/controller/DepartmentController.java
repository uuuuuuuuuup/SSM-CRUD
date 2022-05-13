package com.powehi.crud.controller;

import com.powehi.crud.bean.Department;
import com.powehi.crud.bean.Msg;
import com.powehi.crud.dao.DepartmentMapper;
import com.powehi.crud.service.DepartmentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @auther xx
 * @data 2022/5/11
 */
@Controller
public class DepartmentController {

  @Autowired
  DepartmentService departmentService;

  @RequestMapping("/depts")
  @ResponseBody
  public Msg getDepts(){
    List<Department> list = departmentService.getAll();
    return Msg.succsee().add("depts",list);
  }

}

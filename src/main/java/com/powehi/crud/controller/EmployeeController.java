package com.powehi.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.powehi.crud.bean.Department;
import com.powehi.crud.bean.Employee;
import com.powehi.crud.bean.Msg;
import com.powehi.crud.service.EmployeeService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.validation.Valid;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @auther xx
 * @data 2022/5/10 处理员工crud
 */
@Controller
public class EmployeeController {

  @Autowired
  EmployeeService employeeService;

  @ResponseBody
  @DeleteMapping("/emp/{ids}")
  public Msg deleteEmp(@PathVariable("ids") String ids){
    List<Integer> int_ids = new ArrayList<>();
    if(ids.contains("-")){
      String[] str_ids = ids.split("-");
      for(String temp:str_ids){
        int_ids.add(Integer.parseInt(temp));
      }
      employeeService.deleteEmpBatch(int_ids);
    }else {
      int id = Integer.parseInt(ids);
      employeeService.deleteEmp(id);
    }
    return Msg.succsee();
  }

  @PutMapping("/emp/{empId}")
  @ResponseBody
  public Msg updateEmp(Employee employee){
/*    Department department = new Department();
    department.setDeptId(did);
    employee.setDepartment(department);*/
    System.out.println(employee);
    employeeService.updateEmp(employee);
    return Msg.succsee();
  }

  /**
   * 员工信息的查询
   * @param id
   * @return
   */
  @GetMapping("/emp/{id}")
  @ResponseBody
  public Msg getEmp(@PathVariable("ids") int id){
    Employee employee = employeeService.getEmp(id);
    if(employee!=null){
      return Msg.succsee();
    }else {
      return Msg.fail();
    }
  }

  /**
   * 保存员工信息
   * @param employee
   * @param result
   * @return
   */
  @PostMapping("/emp")
  @ResponseBody
  public Msg saveEmp(@Valid Employee employee, BindingResult result) {
    if(result.hasErrors()){
      HashMap<String, Object> map = new HashMap<>();
      List<FieldError> errors = result.getFieldErrors();
      for(FieldError error:errors){
        System.out.println("错误的字段名："+error.getField());
        System.out.println("错误信息："+error.getDefaultMessage());
        map.put(error.getField(),error.getDefaultMessage());
      }
      return Msg.fail().add("errorFields",map);
    }else {
      employeeService.saveEmpInfo(employee);
      return Msg.succsee();
    }
  }

  /**
   * 以json的形式返回数据
   * @param pn
   * @return
   */
  @RequestMapping("/emps")
  @ResponseBody
  public Msg getEmpWithJson(
      @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
    //在查询之前调用，传入页码，以及每页大小
    PageHelper.startPage(pn, 5);
    List<Employee> emps = employeeService.getAll();
    //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
    PageInfo page = new PageInfo(emps, 5);
    return Msg.succsee().add("pageInfo", page);
  }

  @RequestMapping("/checkName")
  @ResponseBody
  public Msg checkName(@Param("ename") String ename){
    String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
    if(!ename.matches(regx)){
      return Msg.fail().add("va_msg","用户名可以是2-5位中文或者6-16位英文和数字的组合!");
    }
    int result = employeeService.judgeEmpName(ename);
    return Msg.succsee().add("result",result);
  }

  /**
   * 查询员工数据（分页查询）
   *
   * @return
   */
  //@RequestMapping("/emps")
  public String getEmps(
      @RequestParam(value = "pn", defaultValue = "1") Integer pn,
      Model model) {
    //在查询之前调用，传入页码，以及每页大小
    PageHelper.startPage(pn, 5);
    List<Employee> emps = employeeService.getAll();
    //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
    PageInfo page = new PageInfo(emps, 5);
    model.addAttribute("pageInfo", page);
    System.out.println("1111111");
    return "list";
  }


}

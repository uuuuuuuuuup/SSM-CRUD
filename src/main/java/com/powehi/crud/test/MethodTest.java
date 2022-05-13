package com.powehi.crud.test;

import com.powehi.crud.bean.Department;
import com.powehi.crud.bean.Employee;
import com.powehi.crud.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @auther xx
 * @data 2022/5/12
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MethodTest {

  @Autowired
  EmployeeService employeeService;

  @Test
  public void testJudgeName(){
    int b = employeeService.judgeEmpName("急急急");
    System.out.println(b);
  }

  @Test
  public void testUpdateEmp(){
    Employee employee = new Employee();
    employee.setEmpId(1);
    employee.setGender("W");
    employee.setEmail("999999");
    Department department = new Department();
    department.setDeptId(2);
    employee.setDepartment(department);
    employeeService.updateEmp(employee);
  }

  @Test
  public void testDeleteEmp(){
    employeeService.deleteEmp(4);
  }
}

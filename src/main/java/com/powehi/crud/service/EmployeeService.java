package com.powehi.crud.service;

import com.powehi.crud.bean.Employee;
import com.powehi.crud.bean.EmployeeExample;
import com.powehi.crud.bean.EmployeeExample.Criteria;
import com.powehi.crud.dao.EmployeeMapper;
import java.util.List;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @auther xx
 * @data 2022/5/10
 */
@Service
public class EmployeeService {

  @Autowired
  EmployeeMapper employeeMapper;



  /**
   * 查询所有员工
   *
   * @return
   */
  public List<Employee> getAll() {
    return employeeMapper.selectByExampleWithDept(null);
  }

  /**
   * 保存员工信息
   */
  public int saveEmpInfo(Employee emp) {
    return employeeMapper.insertSelective(emp);
  }

  /**
   * 判断用户名是否已经存在数据库
   */
  public int judgeEmpName(String ename) {
    EmployeeExample employeeExample = new EmployeeExample();
    Criteria criteria = employeeExample.createCriteria();
    criteria.andEmpNameEqualTo(ename);
    long result = employeeMapper.countByExample(employeeExample);
    if (result == 0) {
      return 100;
    } else {
      return 200;
    }
  }

  /**
   * 查找员工信息
   * @param eid
   * @return
   */
  public Employee getEmp(Integer eid) {
    return employeeMapper.selectByPrimaryKey(eid);
  }

  public void updateEmp(Employee emp){
    employeeMapper.updateByPrimaryKeySelective(emp);
  }

  public void deleteEmp(Integer empId) {
    employeeMapper.deleteByPrimaryKey(empId);
  }

  public void deleteEmpBatch(List<Integer> int_ids) {
    EmployeeExample employeeExample = new EmployeeExample();
    Criteria criteria = employeeExample.createCriteria();
    criteria.andEmpIdIn(int_ids);
    employeeMapper.deleteByExample(employeeExample);
  }
}

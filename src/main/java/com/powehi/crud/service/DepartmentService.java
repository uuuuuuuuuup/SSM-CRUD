package com.powehi.crud.service;

import com.powehi.crud.bean.Department;
import com.powehi.crud.dao.DepartmentMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @auther xx
 * @data 2022/5/11
 */
@Service
public class DepartmentService {

  @Autowired
  DepartmentMapper departmentMapper;

  /**
   * 查询所有部门信息
   * @return
   */
  public List<Department> getAll(){
    return departmentMapper.selectByExample(null);
  }


}

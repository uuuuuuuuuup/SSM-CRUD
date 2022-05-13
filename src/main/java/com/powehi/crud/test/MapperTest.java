package com.powehi.crud.test;

import com.powehi.crud.bean.Department;
import com.powehi.crud.bean.Employee;
import com.powehi.crud.dao.DepartmentMapper;
import com.powehi.crud.dao.EmployeeMapper;
import java.util.UUID;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @auther xx
 * @data 2022/5/10
 * 测试dao
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
public class MapperTest {

  @Autowired
  DepartmentMapper departmentMapper;

  @Autowired
  EmployeeMapper employeeMapper;

  @Autowired
  SqlSession sqlSession;

  @Test
  public void test1(){
  /*  //插入部门
    departmentMapper.insertSelective(new Department(null,"开发部"));
    departmentMapper.insertSelective(new Department(null,"测试部"));*/

/*    //插入员工
    employeeMapper.insertSelective(new Employee(null,"唐璇","W","Tangxuan66@gmail.com",1));
    employeeMapper.insertSelective(new Employee(null,"胡旭","M","Huxu88@gmail.com",2));*/

/*    //3.批量插入多个员工，批量，使用可以执行操作的sqlSession
    EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
    for (int i = 0; i < 1000; i++) {
      String uid = UUID.randomUUID().toString().substring(0, 5)+i;
      mapper.insertSelective(new Employee(null,uid,"M","@powehi.com",1));
    }
    System.out.println("批量完成");*/

/*    //4.测试删除
    System.out.println(employeeMapper.deleteByPrimaryKey(3));*/

    //5.测试更新

  }

}

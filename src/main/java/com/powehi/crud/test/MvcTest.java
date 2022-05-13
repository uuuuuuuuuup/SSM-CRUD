package com.powehi.crud.test;

import com.github.pagehelper.PageInfo;
import com.powehi.crud.bean.Employee;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * @auther xx
 * @data 2022/5/10
 * 使用Spring测试模块提供的测试请求功能，测试crud请求的正确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath*:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {

  //SpringMVC的ioc
  @Autowired
  WebApplicationContext context;

  //虚拟mvc请求，获取到处理结果
  MockMvc mockMvc;

  @Before
  public void initMockcMvc(){
    mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
  }

  @Test
  public void testPage() throws Exception {
    //模拟请求拿到返回值
    MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1"))
        .andReturn();
    //请求成功后，请求域中会有pageInfo我们可以去除pageInfo进行验证
    MockHttpServletRequest request = result.getRequest();
    PageInfo attribute = (PageInfo) request.getAttribute("pageInfo");
    System.out.println("当前页码"+attribute.getPageNum());
    System.out.println("总页码"+attribute.getPages());
    System.out.println("总记录数"+attribute.getTotal());
    System.out.println("在页面显示的页码");
    int[] nums = attribute.getNavigatepageNums();
    for(int i:nums){
      System.out.print(i+" ");
    }
    System.out.println();
    //获取员工数据
    List<Employee> list = attribute.getList();
    for(Employee employee:list){
      System.out.println("id:"+employee.getEmpId()+" name:"+employee.getEmpName());
    }
  }
}

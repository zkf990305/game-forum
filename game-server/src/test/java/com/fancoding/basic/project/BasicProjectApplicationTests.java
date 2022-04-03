package com.fancoding.basic.project;

import com.fancoding.basic.project.config.SensitiveFilter;
import com.fancoding.basic.project.config.email.MailClient;
import lombok.AllArgsConstructor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BasicProjectApplicationTests {

    @Autowired
    private MailClient mailClient;


    @Test
    public void contextLoads() {
        mailClient.sendMail("efan0305@qq.com","TEST","测试邮件发送！");
    }

    @Autowired
    private SensitiveFilter sensitiveFilter;

    @Test
    public void  context() {
        String test = "这里可以￥￥赌^博，可以暴力！哈哈，嫖！娼，哈哈哈！";
        test = sensitiveFilter.filter(test);
        System.out.println(test);
    }

}

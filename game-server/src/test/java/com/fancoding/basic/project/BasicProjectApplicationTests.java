package com.fancoding.basic.project;

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

}

package com.yanzhen.util;


import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {


    public static void sendRegisterEmail(String room,String code,String email){

        try {
            //创建一个配置文件并保存
            Properties properties = new Properties();

            properties.setProperty("mail.host", "smtp.qq.com");

            properties.setProperty("mail.transport.protocol", "smtp");

            properties.setProperty("mail.smtp.auth", "true");


            //QQ存在一个特性设置SSL加密
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);

            //创建一个session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                @Override
                protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                    //配置发送人右键的账号和授权码
                    return new PasswordAuthentication("844299490@qq.com", "tudxfkocqdnfbdcj");
                }
            });
            //开启debug模式
            session.setDebug(true);
            //获取连接对象
            Transport transport = session.getTransport();
            //连接服务器
            //配置发送人右键的账号和授权码
            transport.connect("smtp.qq.com", "844299490@qq.com", "tudxfkocqdnfbdcj");

            //创建邮件对象
            MimeMessage mimeMessage = new MimeMessage(session);

            //邮件发送人
            mimeMessage.setFrom(new InternetAddress("844299490@qq.com"));

            //邮件接收人
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));


            String content="Thank you for booking with sona Hotel! Reservation number is "+code ;

            //邮件标题
            mimeMessage.setSubject("successful reservation");


            //邮件内容
            mimeMessage.setContent(content, "text/html;charset=gbk");

            //发送邮件
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());

            //关闭连接
            transport.close();

        }catch (Exception e){
            e.printStackTrace();
            throw  new RuntimeException("发送注册邮件是失败!");
        }
    } }


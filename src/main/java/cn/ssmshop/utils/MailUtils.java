package cn.ssmshop.utils;


import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.RecipientType;
import java.security.Security;
import java.util.Date;
import java.util.Properties;

/**
 * @Author:黄广
 * @Description: 邮箱的工具类 我的授权码直接放这了。希望学习者不要擅自使用，你可以用自己的，请自重噢
 * @Date: Created in 19-2-17 下午2:37
 */
public class MailUtils {
    private static String hostName = "smtp.qq.com";
    private static String userName = "1159352742@qq.com";
    /**
     * 此处是腾讯邮箱的授权码，而不是明文密码（qq密码）;
     */
    private static String shouquanma = "用你自己的IMAP/SMTP授权码";

    /**
     * 这是使用25端口发送的，在本地可用，然而放服务器就会被禁掉
     *
     * @param email
     * @param emailMsg
     * @throws AddressException
     * @throws MessagingException
     */
    public static void sendMail(String email, String emailMsg)
            throws AddressException, MessagingException {
        // 属性对象
        Properties properties = new Properties();
        // 发送服务器需要身份验证
        properties.setProperty("mail.smtp.auth", "true");
        // 发送服务器端口，可以不设置，默认是25
        properties.setProperty("mail.smtp.port", "25");
        // 发送邮件协议名称
        properties.setProperty("mail.transport.protocol", "smtp");
        // 设置邮件服务器主机名
        properties.setProperty("mail.host", hostName);
        // 环境信息
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 在session中设置账户信息，Transport发送邮件时会使用
                return new PasswordAuthentication(userName, shouquanma);
            }
        });

        // 创建邮件对象
        Message message = new MimeMessage(session);
        // 设置主题
        message.setSubject("守望商城用户激活邮件");
        // 发件人
        message.setFrom(new InternetAddress("1159352742@qq.com"));
        // 多个收件人
        message.setRecipients(RecipientType.TO, InternetAddress.parse(email));
        // 抄送人
        message.setRecipient(RecipientType.CC, new InternetAddress(email));
        // 暗送人
        message.setRecipient(RecipientType.BCC, new InternetAddress(email));
        // HTML内容
        message.setContent(emailMsg, "text/html;charset=utf-8");

        // 连接邮件服务器、发送邮件、关闭连接，全做了
        Transport.send(message);

    }

    /**
     * 发送邮件，网上参考的，这是465端口发送的。放服务器可用这个
     *
     * @param email    收件人邮箱
     * @param emailMsg 邮件内容
     */
    public static void sendEmail(String email, String emailMsg) throws Exception {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        //设置邮件会话参数
        Properties props = new Properties();
        //邮箱的发送服务器地址
        props.setProperty("mail.smtp.host", hostName);
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        //邮箱发送服务器端口,这里设置为465端口
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");
        final String username = userName;
        final String password = shouquanma;
        //获取到邮箱会话,利用匿名内部类的方式,将发送者邮箱用户名和密码授权给jvm
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        //通过会话,得到一个邮件,用于发送
        Message msg = new MimeMessage(session);
        //设置发件人
        msg.setFrom(new InternetAddress(userName));
        //设置收件人,to为收件人,cc为抄送,bcc为密送
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
        msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(email, false));
        msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(email, false));
        //修改邮件编码
        String subject = "守望商城用户激活邮件";
        String encodingSubject = MimeUtility.encodeText(subject, MimeUtility.mimeCharset("gb2312"), null);
        msg.setSubject(encodingSubject);

        //设置邮件消息
        // msg.setText(emailMsg);
        msg.setContent(emailMsg, "text/html;charset=UTF-8");
        //设置发送的日期
        msg.setSentDate(new Date());

        //调用Transport的send方法去发送邮件
        Transport.send(msg);
    }
}

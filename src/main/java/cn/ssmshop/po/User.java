package cn.ssmshop.po;

import lombok.Data;

import java.util.Date;

@Data //相当@Setter @Getter,@ToString,@EqualsAndHashCode
public class User {
    private String uid;

    private String username;

    private String password;

    private String name;

    private String email;

    private String tel;

    private Date birth;

    private String sex;

    private Integer state;

    private String code;
}
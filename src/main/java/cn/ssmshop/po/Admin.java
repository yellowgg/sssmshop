package cn.ssmshop.po;

import lombok.Data;

@Data //相当@Setter @Getter,@ToString,@EqualsAndHashCode
public class Admin {
    private String aid;

    private String username;

    private String password;

    private String status;

    private String name;
}
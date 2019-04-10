package cn.ssmshop.po;

import lombok.Data;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data //相当@Setter @Getter,@ToString,@EqualsAndHashCode
public class Orders {
    private String oid;

    private String uid;

    private Date otime;

    private BigDecimal ototal;

    private String ostatus;

    private String receiver;

    private String tel;

    private String addr;

    //表示当前订单包含的订单项
    private List<OrderItem> items = new ArrayList<>();
}
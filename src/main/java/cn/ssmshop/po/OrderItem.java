package cn.ssmshop.po;

import lombok.Data;

@Data //相当@Setter @Getter,@ToString,@EqualsAndHashCode
public class OrderItem {
    private String itemid;

    private Integer count;

    private Double total;

    private String pid;

    private String oid;
}
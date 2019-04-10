package cn.ssmshop.po;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data //相当@Setter @Getter,@ToString,@EqualsAndHashCode
public class Product {
    private String pid;

    private String pname;

    private String ptid;

    private String pimg;

    private BigDecimal pprice;

    private String pstatus;

    private Integer pcount;

    private Date pdate;

    private String pdetailed;

}
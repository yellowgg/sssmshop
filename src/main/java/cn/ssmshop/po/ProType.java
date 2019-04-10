package cn.ssmshop.po;


import lombok.Data;

@Data //相当@Setter @Getter,@ToString,@EqualsAndHashCode
public class ProType {
    private String ptid;

    private String ptname;

    private String ptstatus;
}
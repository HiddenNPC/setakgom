package com.spring.setak;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class HistorySubVO {

   private String member_id;
   private String his_name;
   private int his_price;
   private Date his_date; 
}
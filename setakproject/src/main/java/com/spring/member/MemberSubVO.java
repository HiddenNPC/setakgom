package com.spring.member;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemberSubVO {

   private String member_id;
   private int washcnt;
   private int shirscnt;
   private int drycnt;
   private int blanketcnt;
   private int deliverycnt;
   private Date subs_start;
   private Date subs_end;
   private String subsname;
   private int subsprice;
}

package com.teng.model;

import java.util.Date;

/**
		 * 
	编号cno：int(12)
	姓名cname：nvarchar(8) 
	性别csex：nchar(1)    男　或　女
	年龄cage：int(4)
	住址caddress：nvarchar(50)
	电话cphone：nvarchar(20)
	备注cremark：nvarchar(50)
		 */
public class Client {
	
		private int cno;
		private String cname;
		private String csex;
		private int cage;
		private String caddress;
		private String cphone;
		private String cremark;
		
		public Client() {
			super();
		}
		public Client(int cno, String cname, String csex, int cage, String caddress, String cphone, String cremark) {
			super();
			this.cno = cno;
			this.cname = cname;
			this.csex = csex;
			this.cage = cage;
			this.caddress = caddress;
			this.cphone = cphone;
			this.cremark = cremark;
		}
		public int getCno() {
			return cno;
		}
		public void setCno(int cno) {
			this.cno = cno;
		}
		public String getCname() {
			return cname;
		}
		public void setCname(String cname) {
			this.cname = cname;
		}
		public String getCsex() {
			return csex;
		}
		public void setCsex(String csex) {
			this.csex = csex;
		}
		public int getCage() {
			return cage;
		}
		public void setCage(int cage) {
			this.cage = cage;
		}
		public String getCaddress() {
			return caddress;
		}
		public void setCaddress(String caddress) {
			this.caddress = caddress;
		}
		public String getCphone() {
			return cphone;
		}
		public void setCphone(String cphone) {
			this.cphone = cphone;
		}
		public String getCremark() {
			return cremark;
		}
		public void setCremark(String cremark) {
			this.cremark = cremark;
		}
		
		@Override
		public String toString() {
			return "Client [cno=" + cno + ", cname=" + cname + ", csex=" + csex + ", cage=" + cage + ", caddress="
					+ caddress + ", cphone=" + cphone + ", cremark=" + cremark + "]";
		}
		
		
			
	}



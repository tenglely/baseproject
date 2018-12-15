package com.teng.model;
/**
	 * 药品信息表（medicine）
	      编号mno：char(12)
	      名称mname：nvarchar(50)
	      服用方法mmode：nchar(2)    内服　或　外用
	      功效mefficacy：nvarchar(50)
	   	价格mprice:int
	   	库存mcount:int

	 */
public class Medicine {
	
		private int  mno;
		private String mname;
		private String mmode;
		private String mefficacy;
		private int mprice;
		private int mcount;
		public Medicine() {
			super();
		}
		public Medicine(int mno, String mname, String mmode, String mefficacy, int mprice, int mcount) {
			super();
			this.mno = mno;
			this.mname = mname;
			this.mmode = mmode;
			this.mefficacy = mefficacy;
			this.mprice = mprice;
			this.mcount = mcount;
		}
		public int getMno() {
			return mno;
		}
		public void setMno(int mno) {
			this.mno = mno;
		}
		public String getMname() {
			return mname;
		}
		public void setMname(String mname) {
			this.mname = mname;
		}
		public String getMmode() {
			return mmode;
		}
		public void setMmode(String mmode) {
			this.mmode = mmode;
		}
		public String getMefficacy() {
			return mefficacy;
		}
		public void setMefficacy(String mefficacy) {
			this.mefficacy = mefficacy;
		}
		public int getMprice() {
			return mprice;
		}
		public void setMprice(int mprice) {
			this.mprice = mprice;
		}
		public int getMcount() {
			return mcount;
		}
		public void setMcount(int mcount) {
			this.mcount = mcount;
		}
		
		@Override
		public String toString() {
			return "Medicine [mno=" + mno + ", mname=" + mname + ", mmode=" + mmode + ", mefficacy=" + mefficacy
					+ ", mprice=" + mprice + ", mcount=" + mcount + "]";
		}
		
		
}

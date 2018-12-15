package com.teng.model;

public class Agency {
	/**
	 * 经办人信息表（agency）
		编号ano：char(8)
		姓名aname：char(8)
		密码apassword:
		性别asex：nchar(1)    男　或　女
		电话aphone：char(12)
		备注aremark：varchar(50)
		职务：aclass varchar  经办人 或 采购人员
	 */
	private int ano;
	private String aname;
	private String apassword;
	private String asex;
	private String aphone;
	private String aremark;
	private String aclass;
	
	public Agency() {
		super();
	}

	public Agency(int ano, String aname, String apassword, String asex, String aphone, String aremark, String aclass) {
		super();
		this.ano = ano;
		this.aname = aname;
		this.apassword = apassword;
		this.asex = asex;
		this.aphone = aphone;
		this.aremark = aremark;
		this.aclass = aclass;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getApassword() {
		return apassword;
	}

	public void setApassword(String apassword) {
		this.apassword = apassword;
	}

	public String getAsex() {
		return asex;
	}

	public void setAsex(String asex) {
		this.asex = asex;
	}

	public String getAphone() {
		return aphone;
	}

	public void setAphone(String aphone) {
		this.aphone = aphone;
	}

	public String getAremark() {
		return aremark;
	}

	public void setAremark(String aremark) {
		this.aremark = aremark;
	}

	public String getAclass() {
		return aclass;
	}

	public void setAclass(String aclass) {
		this.aclass = aclass;
	}

	@Override
	public String toString() {
		return "Agency [ano=" + ano + ", aname=" + aname + ", apassword=" + apassword + ", asex=" + asex + ", aphone="
				+ aphone + ", aremark=" + aremark + ", aclass=" + aclass + "]";
	}
	
	
	
}

package com.teng.model;

import java.util.Date;

/**
 * 销售信息表
 * @author liten
 *
 */
public class Buy {
	private int sno;//订单编号
	private int ano;//经办人编号
	private int cno;//顾客编号
	private int mno;//药品编号
	private String csymptom;//症状
	private int num;//数量
	private int price;//总价
	private Date date;//日期
	
	public Buy() {
		super();
	}
	public Buy(int sno, int ano, int cno, int mno, String csymptom, int num, int price, Date date) {
		super();
		this.sno = sno;
		this.ano = ano;
		this.cno = cno;
		this.mno = mno;
		this.csymptom = csymptom;
		this.num = num;
		this.price = price;
		this.date = date;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getCsymptom() {
		return csymptom;
	}
	public void setCsymptom(String csymptom) {
		this.csymptom = csymptom;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Buy [sno=" + sno + ", ano=" + ano + ", cno=" + cno + ", mno=" + mno + ", csymptom=" + csymptom
				+ ", num=" + num + ", price=" + price + ", date=" + date + "]";
	}
	
	
	
}

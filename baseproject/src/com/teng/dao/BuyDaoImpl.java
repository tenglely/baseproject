package com.teng.dao;

import java.util.List;

import com.teng.model.Buy;

public class BuyDaoImpl extends BaseDao<Buy> implements BuyDao {

	@Override
	public int save(Buy buy) {
		String sql="insert into buy(sno,ano,cno,mno,csymptom,num,price,date) values(?,?,?,?,?,?,?,?)";
		return super.update(sql,buy.getSno(),buy.getAno(),buy.getCno(),buy.getMno(),buy.getCsymptom(),buy.getNum(),buy.getPrice(),buy.getDate());
	}

	@Override
	public int deleteUserById(int id) {
		String sql="delete from buy where sno=?;";
		return super.update(sql, id);
	}

	@Override
	public List<Buy> getAll() {
		String sql="select sno,ano,cno,mno,csymptom,num,price,date from buy";
		return super.getList(sql);
	}

	@Override
	public List<Buy> find(int ano) {
		String sql="select sno,ano,cno,mno,csymptom,num,price,date from buy where 1=1";
		sql=sql+" and ano="+ano;
		return super.getList(sql);
	}

	@Override
	public List<Buy> findByCno(int cno) {
		String sql="select sno,ano,cno,mno,csymptom,num,price,date from buy where 1=1";
		sql=sql+" and cno="+cno;
		return super.getList(sql);
	}

	@Override
	public List<Buy> findByMno(int mno) {
		String sql="select sno,ano,cno,mno,csymptom,num,price,date from buy where 1=1";
		sql=sql+" and mno="+mno;
		return super.getList(sql);
	}

	@Override
	public List<Buy> findBySno(int sno) {
		String sql="select sno,ano,cno,mno,csymptom,num,price,date from buy where 1=1";
		sql=sql+" and sno="+sno;
		return super.getList(sql);
	}

	@Override
	public Buy get(int sno) {
		String sql="select sno,ano,cno,mno,csymptom,num,price,date from buy where sno=?";
		return super.get(sql, sno);
	}

}

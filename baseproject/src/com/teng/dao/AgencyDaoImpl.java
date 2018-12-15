package com.teng.dao;

import java.util.List;

import com.teng.model.Agency;

public class AgencyDaoImpl extends BaseDao<Agency> implements AgencyDao {

	@Override
	public int save(Agency agency) {
		String sql="insert into agency(ano,aname,asex,aphone,aremark,apassword,aclass) values(?,?,?,?,?,?,?)";
		return super.update(sql,agency.getAno(),agency.getAname(),agency.getAsex(),agency.getAphone(),agency.getAremark(),agency.getApassword(),agency.getAclass());
	}

	@Override
	public int deleteUserById(int id) {
		String sql="delete from agency where ano=?;";
		return super.update(sql, id);
	}

	@Override
	public int updateUserById(Agency agency) {
		String sql="update agency set aname=?,asex=?,aphone=?,aremark=?,apassword=?,aclass=? where ano=?;";
		return super.update(sql,agency.getAname(),agency.getAsex(),agency.getAphone(),agency.getAremark(),agency.getApassword(),agency.getAclass(),agency.getAno());
	}

	@Override
	public Agency get(int ano) {
		String sql="select ano,aname,asex,aphone,aremark,apassword,aclass from agency where ano=?";
		return super.get(sql, ano);
	}

	@Override
	public List<Agency> getAll() {
		String sql="select ano,aname,asex,aphone,aremark,apassword,aclass from agency";
		return super.getList(sql);
	}

	@Override
	public int getCountByName(String aname) {
		String sql="select count(ano) from agency where aname=?";
		long i=(long)super.getValue(sql, aname);
		Integer ii=new Integer(String.valueOf(i));
		return ii;
	}

	@Override
	public List<Agency> find(String aname, String aphone) {
		String sql="select ano,aname,asex,aphone,aremark,apassword,aclass from agency where 1=1";
		//记得空格
		if(aname!=null && !"".equals(aname)){
			sql=sql+" and aname like '%"+aname+"%'";
		}
		if(aphone!=null && !"".equals(aphone)){
			sql=sql+" and aphone like '%"+aphone+"%'";
		}
		System.out.println(sql);
		return super.getList(sql);
	}

	@Override
	public Agency login(String username, String password) {
		String sql="select ano,aname,asex,aphone,aremark,apassword,aclass from agency where aname=? and apassword=? ";
		return super.get(sql, username,password);
	}
	
}

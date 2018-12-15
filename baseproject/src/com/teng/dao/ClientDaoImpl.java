package com.teng.dao;

import java.util.List;

import com.teng.model.Client;

public class ClientDaoImpl extends BaseDao<Client> implements ClientDao {

	@Override
	public int save(Client client) {
		String sql="insert into client(cno,cname,csex,cage,caddress,cphone,cremark) values(?,?,?,?,?,?,?)";
		return super.update(sql, client.getCno(),client.getCname(),client.getCsex(),client.getCage(),client.getCaddress(),client.getCphone(),client.getCremark());
	}

	@Override
	public int deleteUserById(int id) {
		String sql="delete from client where cno=?;";
		return super.update(sql, id);
	}

	@Override
	public int updateUserById(Client client) {
		String sql="update client set cname=?,csex=?,cage=?,caddress=?,cphone=?,cremark=? where cno=?;";
		return super.update(sql,client.getCname(),client.getCsex(),client.getCage(),client.getCaddress(),client.getCphone(),client.getCremark(),client.getCno());
	}

	@Override
	public Client get(int cno) {
		String sql="select cno,cname,csex,cage,caddress,cphone,cremark from client where cno=?";
		return super.get(sql,cno);
	}

	@Override
	public List<Client> getAll() {
		String sql="select cno,cname,csex,cage,caddress,cphone,cremark from client";
		return super.getList(sql);
	}

	@Override
	public int getCountByName(String cname) {
		String sql="select count(cno) from client where cname=?";
		long i=(long)super.getValue(sql, cname);
		Integer ii=new Integer(String.valueOf(i));
		return ii;
	}

	@Override
	public List<Client> getNameList(String cname) {
		String sql="select cno,cname,csex,cage,caddress,cphone,cremark from client where 1=1";
		sql=sql+" and cname='"+cname+"'";
		return super.getList(sql);
	}
	
	@Override
	public List<Client> find(String csex, String cage) {
		String sql="select cno,cname,csex,cage,caddress,cphone,cremark from client where 1=1";
		//记得空格
		if(csex!=null && !"".equals(csex)){
				sql=sql+" and csex='"+csex+"'";
			}
		if(cage!=null && !"".equals(cage)){
			int a=Integer.parseInt(cage);
				sql=sql+" and cage="+a;
			}
		return super.getList(sql);
	}

}

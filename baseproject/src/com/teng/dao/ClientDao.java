package com.teng.dao;

import java.util.List;

import com.teng.model.Client;

public interface ClientDao {
	/**
	 * 实现插入一条新用户信息数据
	 * @param Medicine
	 * @return
	 */
	public int save(Client client);
	
	/**
	 * 根据用户id(cno)删除用户信息
	 * @param id
	 * @return
	 */
	public int deleteUserById(int id);
	
	/**
	 * 根据用户id(cno)修改用户信息
	 * @param id
	 * @return
	 */
	public int updateUserById(Client client);
	
	/**
	 * 根据用户id(cno)获取一条用户信息，封装成类Client的一个对象
	 * @param i
	 * @return
	 */
	public Client get(int i);
	
	/**
	 * 获取所有用户数据
	 * @return
	 */
	public List<Client> getAll();
	
	/**
	 * 查询指定用户名的用户有多少
	 * @param name
	 * @return
	 */
	public int getCountByName(String cname);
	
	/**
	 * 查找所有cname用户，返回list对象
	 * @param cname
	 * @return
	 */
	public List<Client> getNameList(String cname);
	
	/**
	 * 根据csex,cage查找所有符合的用户，返回list对象
	 */
	public List<Client> find(String mo,String ao);
}

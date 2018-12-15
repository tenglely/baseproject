package com.teng.service;

import java.util.List;

import com.teng.model.Agency;

public interface AgencyService {
	/**
	 * 实现插入一条新用户信息数据
	 * @param Agency
	 * @return
	 */
	public int save(Agency agency);
	
	/**
	 * 根据用户id(ano)删除用户信息
	 * @param id
	 * @return
	 */
	public int deleteUserById(int id);
	
	/**
	 * 根据用户id(ano)修改用户信息
	 * @param id
	 * @return
	 */
	public int updateUserById(Agency agency);
	
	/**
	 * 根据用户id(ano)获取一条用户信息，封装成类Agency的一个对象
	 * @param i
	 * @return
	 */
	public Agency get(int i);
	
	/**
	 * 获取所有用户数据
	 * @return
	 */
	public List<Agency> getAll();
	
	/**
	 * 查询指定用户名的用户有多少
	 * @param name
	 * @return
	 */
	public int getCountByName(String aname);
	
	/**
	 * 模糊查询，根据aname,aphone来查找
	 * @param ano
	 * @param aname
	 * @param aphone
	 * @return
	 */
	public List<Agency> find(String aname, String aphone);
	
	/**
	 * 登录判断用户名，密码
	 * 返回agency对象
	 * @param username
	 * @param password
	 * @return
	 */
	public Agency login(String username, String password);
}

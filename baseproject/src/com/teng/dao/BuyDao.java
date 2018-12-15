package com.teng.dao;

import java.util.List;
import com.teng.model.Buy;

public interface BuyDao {
	
	/**
	 * 实现插入一条销售信息数据
	 * @param Buy
	 * @return
	 */
	public int save(Buy buy);
	
	/**
	 * 根据用户id(sno)删除用户信息
	 * @param id
	 * @return
	 */
	public int deleteUserById(int id);
	
	/**
	 * 获取所有订单数据
	 * @return
	 */
	public List<Buy> getAll();
	
	/**
	 * 通过sno获取一条信息
	 * @param sno
	 * @return
	 */
	public Buy get(int sno);
	/**
	 * 根据用户id(sno)获取用户信息
	 * @param i
	 * @return
	 */
	public List<Buy> findBySno(int sno);
	
	/**
	 * 根据ano来查找
	 * @param aname
	 * @param aphone
	 * @return
	 */
	public List<Buy> find(int ano);
	/**
	 * 根据cno来查找
	 * @param cname
	 * @return
	 */
	public List<Buy> findByCno(int cno);
	/**
	 * 根据mno来查找
	 * @param mno
	 * @return
	 */
	public List<Buy> findByMno(int mno);
}

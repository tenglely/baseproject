package com.teng.service;

import java.util.List;

import com.teng.model.Medicine;

public interface MedicineService {
   
	/**
	 * 实现插入一条新用户信息数据
	 * @param Medicine
	 * @return
	 */
	public int save(Medicine medicine);
	
	/**
	 * 根据用户id(mno)删除用户信息
	 * @param id
	 * @return
	 */
	public int deleteUserById(int id);
	
	/**
	 * 根据用户id(mno)修改用户信息
	 * @param id
	 * @return
	 */
	public int updateUserById(Medicine medicine);
	
	/**
	 * 根据用户id(mno)获取一条用户信息，封装成类Medicine的一个对象
	 * @param i
	 * @return
	 */
	public Medicine get(int i);
	
	/**
	 * 获取所有用户数据
	 * @return
	 */
	public List<Medicine> getAll();
	
	/**
	 * 查询指定用户名的用户有多少
	 * @param name
	 * @return
	 */
	public int getCountByName(String mname);
	
	/**
	 * 模糊查询,根据mname
	 * @param mname
	 * @return
	 */
	public List<Medicine> find(String mname);
}

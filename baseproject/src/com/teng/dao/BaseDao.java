package com.teng.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.teng.model.Agency;
import com.teng.model.Client;
import com.teng.utils.Jdbc;

public class BaseDao<T> {
	QueryRunner queryRunner=new QueryRunner();
	
	private Class<T> clazz;
	@SuppressWarnings("unchecked")
	public BaseDao(){
		Type superType=this.getClass().getGenericSuperclass();
		if(superType instanceof ParameterizedType){
			ParameterizedType pt=(ParameterizedType)superType;
			Type[] tarry=pt.getActualTypeArguments();
			if(tarry[0] instanceof Class){
				clazz=(Class<T>)tarry[0];
			}
		}
	}
	/**
	 * 查询数据表，取出sql语句的结果集的第一条数据，封装成一个类的对象返回，不支持事务
	 * @param sql
	 * @param args
	 * @return
	 */
	public T get(String sql,Object... args){
		Connection conn=null;
		T entity=null;
		try {
			conn=Jdbc.getConnection();
			entity=queryRunner.query(conn, sql, new BeanHandler<T>(clazz), args);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			Jdbc.closeConn(conn);
		}
		return entity;
	}
	
	/**
	 * 获取多条记录的通用方法，通用
	 * @param sql
	 * @param args
	 * @return
	 */
	public List<T> getList(String sql,Object... args){
		Connection conn=null;
		List<T> list=null;
		try {
			conn=Jdbc.getConnection();
			list=queryRunner.query(conn, sql, new BeanListHandler<T>(clazz), args);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			Jdbc.closeConn(conn);
		}
		return list;
	}
	
	/**
	 * 实现insert,update,delete通用的更新方法
	 * @param sql
	 * @param args
	 * @return
	 */
	public int update(String sql,Object... args){
		Connection conn=null;
		int rows=0;
		try {
			conn=Jdbc.getConnection();
			rows=queryRunner.update(conn, sql, args);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			Jdbc.closeConn(conn);
		}
		return rows;
	}
	
	/**
	 * 通用的放回sql语句的结果只有一个数值的类型的查询，如用户个数，conut(id)
	 * @param sql
	 * @param args
	 * @return
	 */
	public Object getValue(String sql,Object... args){
		Connection conn=null;
		Object obj=null;
		try {
			conn=Jdbc.getConnection();
			obj=queryRunner.query(conn, sql, new ScalarHandler(), args);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			Jdbc.closeConn(conn);
		}
		return obj;
	}
	
	/**
	 * 查询数据表，取出sql语句的结果集的第一条数据，封装成一个类的对象返回,支持事务
	 * @param sql
	 * @param args
	 * @return
	 */
	public T get(Connection conn,String sql,Object... args){
		T entity=null;
		try {
			entity=queryRunner.query(conn, sql, new BeanHandler<T>(clazz), args);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return entity;
	}

}

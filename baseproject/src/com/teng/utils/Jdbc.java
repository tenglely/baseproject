package com.teng.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class Jdbc {
	//数据库连接池，c3p0
		private static DataSource datasource=null;
		static{//静态代码块只会执行一次
			datasource=new ComboPooledDataSource("mysql");
		}
		
		/**
		 * 获取到数据库mysql的数据连接对象conn
		 * @return
		 */
		public static Connection getConnection(){
			Connection conn=null;
			try {
				conn=datasource.getConnection();
				return conn;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return conn;
		}
		
		/**
		 *是通用的关闭数据库连接对象的方法 
		 * @param conn
		 */
		public static void closeConn(Connection conn){
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
}

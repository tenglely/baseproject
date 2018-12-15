package com.teng.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.teng.utils.Jdbc;

public class JdbcTest {

	@Test
	public void testGetConnection() {
		Connection connection=Jdbc.getConnection();
		System.out.println(connection);
	}

}

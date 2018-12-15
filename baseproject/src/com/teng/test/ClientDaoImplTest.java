package com.teng.test;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.teng.dao.ClientDao;
import com.teng.dao.ClientDaoImpl;
import com.teng.model.Client;

public class ClientDaoImplTest {

//	@Test
//	public void testSave() {
//		ClientDao clientDao=new ClientDaoImpl();
//		Client client=new Client();
//		client.setCname("shabi");
//		client.setCpassword("123456");
//		client.setCsex("男");
//		client.setCage(18);
//		client.setCaddress("中国");
//		client.setCphone("11011");
//		client.setCsymptom("不知道");
//		client.setMno(1);
//		client.setAno(1);
//		Date date=new Date();
//		client.setcDate(date);
//		client.setCremark("无");
//		clientDao.save(client);
//	}

//	@Test
//	public void testDeleteUserById() {
//		ClientDao clientDao=new ClientDaoImpl();
//		clientDao.deleteUserById(3);
//	}

//	@Test
//	public void testUpdateUserById() {
//		ClientDao clientDao=new ClientDaoImpl();
//		Date date=new Date();
//		Client client=new Client(2,"修改","666666","女",18,"美国","120","不知道",2,2,date,"无");
//		clientDao.updateUserById(client);
//	}

//	@Test
//	public void testGetInt() {
//		ClientDao clientDao=new ClientDaoImpl();
//		System.out.println(clientDao.get(2));
//	}

//	@Test
//	public void testGetAll() {
//		ClientDao clientDao=new ClientDaoImpl();
//		List<Client> list=clientDao.getAll();
//		for(Client client:list){
//			System.out.println(client);
//		}
//	}

//	@Test
//	public void testGetCountByName() {
//		ClientDao clientDao=new ClientDaoImpl();
//		System.out.println(clientDao.getCountByName("修改"));
//	}
	
	@Test
	public void testFind(){
		ClientDao clientDao=new ClientDaoImpl();
		String mno=null;
		String ano="2";
		List<Client> list=clientDao.find(mno,ano);
		for(Client client:list){
			System.out.println(client);
		}
	}
}

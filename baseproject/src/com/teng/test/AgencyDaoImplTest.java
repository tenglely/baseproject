/**
 * 
 */
package com.teng.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.teng.dao.AgencyDao;
import com.teng.dao.AgencyDaoImpl;
import com.teng.model.Agency;

/**
 * @author liten
 *
 */
public class AgencyDaoImplTest {

	
//	@Test
//	public void testSave() {
//		AgencyDao agencyDao=new AgencyDaoImpl();
//		//Agency agency=new Agency(5,"大黑","123456","男","131","无");
//		Agency agency=new Agency();
//		agency.setAname("大小大");
//		agency.setApassword("1234567");
//		agency.setAsex("男");
//		agency.setAphone("1100");
//		agency.setAremark("无");
//		agencyDao.save(agency);
//	}

//	
//	@Test
//	public void testDeleteUserById() {
//		AgencyDao agencyDao=new AgencyDaoImpl();
//		agencyDao.deleteUserById(4);
//	}

	
//	@Test
//	public void testUpdateUserById() {
//		AgencyDao agencyDao=new AgencyDaoImpl();
//		Agency agency=new Agency(1,"大黑","123456","男","131","无");
//		agencyDao.updateUserById(agency);
//	}

	
	@Test
	public void testGetAll(){
		AgencyDao agencyDao=new AgencyDaoImpl();
		List<Agency> list=agencyDao.getAll();
		for(Agency a:list){
			System.out.println(a);
		}
	}
	
//	@Test
//	public void testGetCountByName() {
//		AgencyDao agencyDao=new AgencyDaoImpl();
//		System.out.println(agencyDao.getCountByName("大黑"));
//	}
}

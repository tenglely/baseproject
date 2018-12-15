package com.teng.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.teng.dao.MedicineDao;
import com.teng.dao.MedicineDaoImpl;
import com.teng.model.Medicine;

public class MedicineDaoImplTest {

//	@Test
//	public void testSave() {
//		MedicineDao medicineDao=new MedicineDaoImpl();
//		Medicine medicine=new Medicine();
//		medicine.setMname("天天");
//		medicine.setMmode("外服");
//		medicine.setMefficacy("不知道");
//		medicineDao.save(medicine);
//	}
//
//	@Test
//	public void testDeleteUserById() {
//		MedicineDao medicineDao=new MedicineDaoImpl();
//		medicineDao.deleteUserById(2);
//	}

//	@Test
//	public void testUpdateUserById() {
//		MedicineDao medicineDao=new MedicineDaoImpl();
//		Medicine medicine=new Medicine(1,"哈哈","外服","真不知道");
//		medicineDao.updateUserById(medicine);
//	}

//	@Test
//	public void testGetInt() {
//		MedicineDao medicineDao=new MedicineDaoImpl();
//		System.out.println(medicineDao.get(1));
//	}

//	@Test
//	public void testGetAll() {
//		MedicineDao medicineDao=new MedicineDaoImpl();
//		List<Medicine> list=medicineDao.getAll();
//		for(Medicine medicine:list){
//			System.out.println(medicine);
//		}
//	}

	@Test
	public void testGetCountByName() {
		MedicineDao medicineDao=new MedicineDaoImpl();
		System.out.println(medicineDao.getCountByName("哈哈"));
	}

}

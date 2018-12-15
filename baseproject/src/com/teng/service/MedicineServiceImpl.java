package com.teng.service;

import java.util.List;

import com.teng.dao.FactoryDao;
import com.teng.dao.MedicineDao;
import com.teng.model.Medicine;

public class MedicineServiceImpl implements MedicineService {
	
	MedicineDao medicineDao=FactoryDao.getMedicineDao();
	@Override
	public int save(Medicine medicine) {
		return medicineDao.save(medicine);
	}

	@Override
	public int deleteUserById(int id) {
		return medicineDao.deleteUserById(id);
	}

	@Override
	public int updateUserById(Medicine medicine) {
		return medicineDao.updateUserById(medicine);
	}

	@Override
	public Medicine get(int i) {
		return medicineDao.get(i);
	}

	@Override
	public List<Medicine> getAll() {
		return medicineDao.getAll();
	}

	@Override
	public int getCountByName(String mname) {
		return medicineDao.getCountByName(mname);
	}

	@Override
	public List<Medicine> find(String mname) {
		return medicineDao.find(mname);
	}

}

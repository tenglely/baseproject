package com.teng.service;

import java.util.List;

import com.teng.dao.AgencyDao;
import com.teng.dao.FactoryDao;
import com.teng.model.Agency;

public class AgencyServiceImpl implements AgencyService {
	
	AgencyDao agencyDao=FactoryDao.getAgencyDao();

	@Override
	public int save(Agency agency) {
		return agencyDao.save(agency);
	}

	@Override
	public int deleteUserById(int id) {
		return agencyDao.deleteUserById(id);
	}

	@Override
	public int updateUserById(Agency agency) {
		return agencyDao.updateUserById(agency);
	}

	@Override
	public Agency get(int i) {
		return agencyDao.get(i);
	}

	@Override
	public List<Agency> getAll() {
		return agencyDao.getAll();
	}

	@Override
	public int getCountByName(String aname) {
		return agencyDao.getCountByName(aname);
	}

	@Override
	public List<Agency> find(String aname, String aphone) {
		return agencyDao.find(aname, aphone);
	}

	@Override
	public Agency login(String username, String password) {
		return agencyDao.login(username,password);
	}
	
}

package com.teng.service;

import java.util.List;

import com.teng.dao.BuyDao;
import com.teng.dao.FactoryDao;
import com.teng.model.Buy;

public class BuyServiceImpl implements BuyService {
	BuyDao buyDao=FactoryDao.getBuyDao();

	@Override
	public int save(Buy buy) {
		return buyDao.save(buy);
	}

	@Override
	public int deleteUserById(int id) {
		return buyDao.deleteUserById(id);
	}

	@Override
	public List<Buy> getAll() {
		return buyDao.getAll();
	}

	@Override
	public List<Buy> find(int ano) {
		return buyDao.find(ano);
	}

	@Override
	public List<Buy> findByCno(int cno) {
		return buyDao.findByCno(cno);
	}

	@Override
	public List<Buy> findByMno(int mno) {
		return buyDao.findByMno(mno);
	}

	@Override
	public List<Buy> findBySno(int sno) {
		return buyDao.findBySno(sno);
	}

	@Override
	public Buy get(int sno) {
		return buyDao.get(sno);
	}
	
	
}

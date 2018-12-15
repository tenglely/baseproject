package com.teng.service;

import java.util.List;

import com.teng.dao.ClientDao;
import com.teng.dao.FactoryDao;
import com.teng.model.Client;


public class ClientServiceImpl implements ClientService {
	ClientDao clientDao=FactoryDao.getClientDao();
	@Override
	public int save(Client client) {
		return clientDao.save(client);
	}

	@Override
	public int deleteUserById(int id) {	
		return clientDao.deleteUserById(id);
	}

	@Override
	public int updateUserById(Client client) {
		return clientDao.updateUserById(client);
	}

	@Override
	public Client get(int i) {
		return clientDao.get(i);
	}

	@Override
	public List<Client> getAll() {
		return clientDao.getAll();
	}

	@Override
	public int getCountByName(String cname) {
		return clientDao.getCountByName(cname);
	}

	@Override
	public List<Client> find(String cname) {
		return clientDao.getNameList(cname);
	}

	@Override
	public List<Client> findSex(String num2) {
		return clientDao.find(num2, null);
	}

	@Override
	public List<Client> findAge(String num3) {
		 return clientDao.find(null,num3);
	}

}

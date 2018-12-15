package com.teng.dao;


public class FactoryDao {
	
	public static AgencyDao getAgencyDao(){
		return new AgencyDaoImpl();
	}
	
	public static MedicineDao getMedicineDao(){
		return new MedicineDaoImpl();
	}
	
	public static ClientDao getClientDao(){
		return new ClientDaoImpl();
	}
	
	public static BuyDao getBuyDao(){
		return new BuyDaoImpl();
	}
}

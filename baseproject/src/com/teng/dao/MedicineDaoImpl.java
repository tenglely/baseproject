package com.teng.dao;

import java.util.List;

import com.teng.model.Agency;
import com.teng.model.Medicine;

public class MedicineDaoImpl extends BaseDao<Medicine> implements MedicineDao {

	@Override
	public int save(Medicine medicine) {
		String sql="insert into medicine(mno,mname,mmode,mefficacy,mprice,mcount) values(?,?,?,?,?,?)";
		return super.update(sql,medicine.getMno(),medicine.getMname(),medicine.getMmode(),medicine.getMefficacy(),medicine.getMprice(),medicine.getMcount());
	}

	@Override
	public int deleteUserById(int id) {
		String sql="delete from medicine where mno=?;";
		return super.update(sql, id);
	}

	@Override
	public int updateUserById(Medicine medicine) {
		String sql="update medicine set mname=?,mmode=?,mefficacy=?,mprice=?,mcount=? where mno=?;";
		return super.update(sql,medicine.getMname(),medicine.getMmode(),medicine.getMefficacy(),medicine.getMprice(),medicine.getMcount(),medicine.getMno());
	}

	@Override
	public Medicine get(int mno) {
		String sql="select mno,mname,mmode,mefficacy,mprice,mcount from medicine where mno=?";
		return super.get(sql,mno);
	}

	@Override
	public List<Medicine> getAll() {
		String sql="select mno,mname,mmode,mefficacy,mprice,mcount from medicine";
		return super.getList(sql);
	}

	@Override
	public int getCountByName(String mname) {
		String sql="select count(mno) from medicine where mname=?";
		long i=(long)super.getValue(sql, mname);
		Integer ii=new Integer(String.valueOf(i));
		return ii;
	}

	@Override
	public List<Medicine> find(String mname) {
		String sql="select mno,mname,mmode,mefficacy,mprice,mcount from medicine where 1=1";
		if(mname!=null&& !"".equals(mname)){
			sql=sql+" and mname like '%"+mname+"%'";
		}
		return super.getList(sql);
	}

	
}

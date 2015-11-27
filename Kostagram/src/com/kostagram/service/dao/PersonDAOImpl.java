package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kosta.service.beans.PersonVO;

public class PersonDAOImpl implements PersonDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(PersonVO person) {
		int t= sqlSession.insert("person.insert",person);
		if(t==1)return true;
		return false;
	}

	@Override
	public boolean delete(int no) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(PersonVO person) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PersonVO find(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonVO> findAll() {		
		return sqlSession.selectList("person2.findAll");
	}

}





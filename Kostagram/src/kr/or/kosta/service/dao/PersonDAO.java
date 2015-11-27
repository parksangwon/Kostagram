package kr.or.kosta.service.dao;

import java.util.List;

import kr.or.kosta.service.beans.PersonVO;

public interface PersonDAO {    
	public boolean insert(PersonVO person);
    public boolean delete(int no);
    public boolean update(PersonVO person);
    public PersonVO find(int no);
    public List<PersonVO> findAll();
}

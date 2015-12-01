package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.ReportVO;

public interface ReportDAO {
	public boolean insert(ReportVO report);
	public List<ReportVO> findList(ReportVO report);
	
}

package com.kostagram.service.dao;

import java.util.HashMap;
import java.util.List;

import com.kostagram.service.beans.ReportVO;

public interface ReportDAO {
	public boolean insert(ReportVO report);
	public List<HashMap> findList(ReportVO report);
	public boolean delete(ReportVO report);
	public boolean delete2(ReportVO report);
}

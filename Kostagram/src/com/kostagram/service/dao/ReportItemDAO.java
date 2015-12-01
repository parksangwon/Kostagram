package com.kostagram.service.dao;

import com.kostagram.service.beans.ReportItemVO;

public interface ReportItemDAO {
	public boolean insert(ReportItemVO reportItem);
	public boolean delete(ReportItemVO reportItem);
    public boolean update(ReportItemVO reportItem);
    
}
   

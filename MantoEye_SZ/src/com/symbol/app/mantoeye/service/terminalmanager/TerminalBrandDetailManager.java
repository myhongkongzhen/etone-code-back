package com.symbol.app.mantoeye.service.terminalmanager;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.symbol.app.mantoeye.dao.terminal.TerminalBrandDetailDAO;
import com.symbol.app.mantoeye.dto.sports.CommonSport;
import com.symbol.wp.modules.orm.Page;

@Service
@Transactional
public class TerminalBrandDetailManager {

	@Autowired
	private TerminalBrandDetailDAO terminalBrandDetailDAO;

	/**
	 * 分页查询
	 */
	public Page<CommonSport> query(final Page page, int isTD,
			int timeLevel, String time_search,int areaType,Long nmAreaId,String vcTerminalBrand) {
		return terminalBrandDetailDAO.query(page, isTD, timeLevel, time_search,areaType,nmAreaId,vcTerminalBrand);
	}

	public List<CommonSport> listData(int isTD,int timeLevel, String time_search,int areaType,Long nmAreaId,String vcTerminalBrand) {
		return terminalBrandDetailDAO.listData(isTD, timeLevel, time_search,areaType,nmAreaId,vcTerminalBrand);
	}

}

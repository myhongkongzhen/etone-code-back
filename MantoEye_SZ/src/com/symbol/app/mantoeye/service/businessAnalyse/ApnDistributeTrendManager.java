package com.symbol.app.mantoeye.service.businessAnalyse;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.symbol.app.mantoeye.dao.businessAnalyse.ApnDistributeTrendDao;
import com.symbol.app.mantoeye.dto.flush.CommonFlush;
import com.symbol.app.mantoeye.util.MantoEyeUtils;
import com.symbol.wp.core.util.Common;
import com.symbol.wp.modules.orm.Page;
import com.symbol.wp.tools.gtgrid.model.SortInfo;
import com.symbol.wp.tools.gtgrid.server.GridServerHandler;

@Service
@Transactional(readOnly = true)
@SuppressWarnings("unchecked")
public class ApnDistributeTrendManager {

	private ApnDistributeTrendDao apnDistributeTrendDao;

	private Page page;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Page<CommonFlush> queryByPage(GridServerHandler gridServerHandler,
			String timeLevel, String apnDomain, String startTime,String endTime,String raitype) {
		

		page = new Page();
		page.setPageSize(gridServerHandler.getPageSize());
		page.setPageNo(gridServerHandler.getPageInfo().getPageNum());

		String tableName = getTableName(Common.StringToInt(timeLevel));


		page.setTotalCount(apnDistributeTrendDao
				.getTotalCount(Common.StringToInt(timeLevel), startTime,endTime,
						tableName, apnDomain,raitype));

		int totalRowNum = gridServerHandler.getTotalRowNum();
		if (totalRowNum < 1) {
			totalRowNum = page.getTotalCount();
			gridServerHandler.setTotalRowNum(totalRowNum);
		}
		
		SortInfo si = gridServerHandler.getSingleSortInfo();
		if (si != null) {
			String order = si.getSortOrder();
			page.setOrder(order);
			page.setOrderBy(MantoEyeUtils.getSortField(si.getFieldName()));

		} else {
			page.setOrderBy("fullDate");
			page.setOrder("asc");
		}

		return apnDistributeTrendDao
				.queryByPage(page, Common.StringToInt(timeLevel),
						startTime,endTime, tableName, apnDomain,raitype);
	}

	public List<CommonFlush> queryAll(String timeLevel, String apnDomain,
			 String startTime,String endTime,String raitype) {
		String tableName = getTableName(Common.StringToInt(timeLevel));

		List<CommonFlush> list = apnDistributeTrendDao.queryAll(
				Common.StringToInt(timeLevel), startTime,endTime, tableName,
				apnDomain,raitype);

		return list;
	}

//	private Map<String, String> getDateTimeKeyValue(String timeLevel,
//			String queryYear, String queryMonth, String queryDay,
//			String queryWeek, String queryHour) {
//		Map<String, String> map = new HashMap<String, String>();
//		switch (Common.StringToInt(timeLevel)) {
//		case 1:
//			map.put("queryYearStart", queryYear.split("-")[0]);
//			map.put("queryMonthStart", queryMonth.split("-")[0]);
//			map.put("queryDayStart", queryDay.split("-")[0]);
//			map.put("queryHourStart", queryHour.split("-")[0]);
//
//			map.put("queryYearEnd", queryYear.split("-")[1]);
//			map.put("queryMonthEnd", queryMonth.split("-")[1]);
//			map.put("queryDayEnd", queryDay.split("-")[1]);
//			map.put("queryHourEnd", queryHour.split("-")[1]);
//			break;
//		case 2:
//			map.put("queryYearStart", queryYear.split("-")[0]);
//			map.put("queryMonthStart", queryMonth.split("-")[0]);
//			map.put("queryDayStart", queryDay.split("-")[0]);
//
//			map.put("queryYearEnd", queryYear.split("-")[1]);
//			map.put("queryMonthEnd", queryMonth.split("-")[1]);
//			map.put("queryDayEnd", queryDay.split("-")[1]);
//			break;
//		case 3:
//			map.put("queryYearStart", queryYear.split("-")[0]);
//			map.put("queryWeekStart", queryWeek.split("-")[0]);
//
//			map.put("queryYearEnd", queryYear.split("-")[1]);
//			map.put("queryWeekEnd", queryWeek.split("-")[1]);
//			break;
//		case 4:
//			map.put("queryYearStart", queryYear.split("-")[0]);
//			map.put("queryMonthStart", queryMonth.split("-")[0]);
//
//			map.put("queryYearEnd", queryYear.split("-")[1]);
//			map.put("queryMonthEnd", queryMonth.split("-")[1]);
//			break;
//		}
//
//		return map;
//	}

//	private String getNameColumnName(int areaType) {
//		String nameColumnName = "";
//
//		switch (areaType) {
//		case 1:
//			// nameColumnName = "vcName";
//			// break;
//		case 2:
//			// nameColumnName = "vcName";
//			// break;
//		case 3:
//			nameColumnName = "vcName";
//			break;
//		case 4:
//			nameColumnName = "vcSaleAreaName";
//			break;
//		case 5:
//			nameColumnName = "vcBranchName";
//			break;
//		}
//
//		return nameColumnName;
//	}

	private String getTableName(int timeLevel) {
		String tableName = "";

		switch (timeLevel) {
		case 1:
			tableName = "vStatHourApnType";
			break;
		case 2:
			tableName = "vStatDayApnType";
			break;
		case 3:
			tableName = "vStatWeekApnType";
			break;
		case 4:
			tableName = "vStatMonthApnType";
			break;
		}
		return tableName;
	}

//	private List<CommonFlush> buildNewBean(List<CommonFlush> list, int timeLevel) {
//		List<CommonFlush> newList = new ArrayList<CommonFlush>();
//
//		if (null != list && !list.isEmpty()) {
//			for (CommonFlush c : list) {
//				c.calculateData();
//				c.setSpanDate(timeLevel);
//				newList.add(c);
//			}
//		}
//
//		return newList;
//	}

	public ApnDistributeTrendDao getApnDistributeTrendDao() {
		return apnDistributeTrendDao;
	}

	@Resource
	public void setApnDistributeTrendDao(
			ApnDistributeTrendDao apnDistributeTrendDao) {
		this.apnDistributeTrendDao = apnDistributeTrendDao;
	}

}

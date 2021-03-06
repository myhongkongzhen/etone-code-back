package com.symbol.app.mantoeye.web.action.terminalmanager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.symbol.app.mantoeye.dto.sports.CommonSport;
import com.symbol.app.mantoeye.service.terminalmanager.TerminalUpgradeManager;
import com.symbol.app.mantoeye.util.CommonUtils;
import com.symbol.wp.core.constants.VarConstants;
import com.symbol.wp.core.service.ICommonManager;
import com.symbol.wp.modules.orm.Page;
import com.symbol.wp.modules.struts2.Struts2Utils;
import com.symbol.wp.modules.struts2.base.BaseDispatchAction;
import com.symbol.wp.tools.gtgrid.model.SortInfo;
import com.symbol.wp.tools.gtgrid.server.GridServerHandler;

public class TerminalUpgradeAction extends BaseDispatchAction {

	HttpServletRequest request = ServletActionContext.getRequest();
	private Page<CommonSport> page = new Page<CommonSport>(
			VarConstants.PAGE_LONG_ROW_SIZE);

	private int area=0;//0：全网	,1：bsc类型,	2：街道类型,	3：分公司类型,	4：营销片区,5：sgsn类型
	private int timeLevel=2;
	private String startTime=CommonUtils.getSYestoday() + " 00";
	private String endTime=CommonUtils.getSYestoday() + " 23";

	private int changUsers_search;
	private int changUsers_end;

	@Autowired
	private TerminalUpgradeManager terminalUpgradeManager;
	@Autowired
	@Qualifier("commonManagerImpl")
	private ICommonManager commonManagerImpl;

	public void query() throws ServletException, IOException {

		List<CommonSport> list = null;
		GridServerHandler gridServerHandler = new GridServerHandler(
				Struts2Utils.getRequest(), Struts2Utils.getResponse());
		SortInfo si = gridServerHandler.getSingleSortInfo();
		if (si != null) {
			String order = si.getSortOrder();
			page.setOrder(order);
			page.setOrderBy(getSortField(si.getFieldName()));

		} else {
			page.setOrderBy("intUserNum");
			page.setOrder("desc");
		}
		page.setPageSize(gridServerHandler.getPageSize());
		page.setPageNo(gridServerHandler.getPageInfo().getPageNum());
		page = terminalUpgradeManager.query(page, area, startTime, endTime,changUsers_search,changUsers_end,timeLevel);
		int totalRowNum = gridServerHandler.getTotalRowNum();
		if (totalRowNum < 1) {
			totalRowNum = page.getTotalCount();
			gridServerHandler.setTotalRowNum(totalRowNum);
		}
		list = page.getResult();

	
		gridServerHandler.setData(list, CommonSport.class);
		Struts2Utils.renderJson(gridServerHandler.getLoadResponseText());
	}
 
	private String getSortField(String sort) {
		if (sort.indexOf("OTreminal") != -1) 
			return "oTerminalBrand";
		
		if (sort.indexOf("NTerminal") != -1) {
			return "nTerminalBrand";
		}
		if (sort.indexOf("area") != -1) {
			return "area";
		}
		if (sort.indexOf("nmUsers") != -1) {
			return "intUserNum";
		}

		return sort;
	}

 
	/**
	 * 数据导出
	 */
	public void export() throws ServletException, IOException {
		List<CommonSport> list = null;
		list = terminalUpgradeManager.listData(area, startTime, endTime,changUsers_search,changUsers_end,timeLevel);
		GridServerHandler gridServerHandler = new GridServerHandler(
				Struts2Utils.getRequest(), Struts2Utils.getResponse());
		String exportmsg = "终端升级";
		commonManagerImpl.log(Struts2Utils.getRequest(), exportmsg);
		gridServerHandler.exportXLS(list, CommonSport.class);
	}

	public Page<CommonSport> getPage() {
		return page;
	}

	public void setPage(Page<CommonSport> page) {
		this.page = page;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public int getTimeLevel() {
		return timeLevel;
	}

	public void setTimeLevel(int timeLevel) {
		this.timeLevel = timeLevel;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getChangUsers_search() {
		return changUsers_search;
	}

	public void setChangUsers_search(int changUsersSearch) {
		changUsers_search = changUsersSearch;
	}

	public int getChangUsers_end() {
		return changUsers_end;
	}

	public void setChangUsers_end(int changUsersEnd) {
		changUsers_end = changUsersEnd;
	}

}

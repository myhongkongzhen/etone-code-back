package com.symbol.app.mantoeye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.symbol.app.mantoeye.dao.DataOutPutDecTaskDAO;
import com.symbol.app.mantoeye.entity.FtbDataOutPutDecTask;
import com.symbol.wp.modules.orm.hibernate.EntityManager;

/**
 * 原始信令数据提取生成文件
 * @author rankin
 *
 */
//Spring Service Bean的标识.
@Service
// 默认将类中的所有函数纳入事务管理.
@Transactional
public class DataOutPutDecTaskManager extends EntityManager<FtbDataOutPutDecTask, Long>{
	@Autowired
	private DataOutPutDecTaskDAO dataOutPutDecTaskDAO;

	/**
	 * 实现回调函数,为EntityManager基类的CRUD操作提供DAO.
	 */
	@Override
	protected DataOutPutDecTaskDAO getEntityDao() {
		return dataOutPutDecTaskDAO;
	}

}

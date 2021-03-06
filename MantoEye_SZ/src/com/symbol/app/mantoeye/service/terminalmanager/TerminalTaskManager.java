package com.symbol.app.mantoeye.service.terminalmanager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.symbol.app.mantoeye.dao.terminal.TerminalTaskDAO;
import com.symbol.app.mantoeye.dto.flush.TerminalTaskEntity;
import com.symbol.wp.modules.orm.Page;
import com.symbol.wp.modules.orm.hibernate.EntityManager;

//Spring Service Bean的标识.
@Service
// 默认将类中的所有函数纳入事务管理.
@Transactional
public class TerminalTaskManager extends EntityManager<TerminalTaskEntity, String>{
	@Autowired
	private TerminalTaskDAO terminalTaskDAO;
	
	/**
	 * 
	 * @param taskEntity
	 * 
	 * 添加任务
	 */
	public void insertTask(TerminalTaskEntity taskEntity){
		//this.deleteTask(taskEntity.getNmTerminalPolicyId()+"");
		terminalTaskDAO.saveTerminalTask(taskEntity);
	}
	
	/**
	 * 
	 * @param taskName
	 * @return int
	 * 通过用户名判断该用户是否存在
	 */
	public int isTaskName(String taskName){
		return terminalTaskDAO.queryIdByTaskName(taskName);
	}
	
	/**
	 * 
	 * @param page
	 * @param taskEntity
	 * @return
	 * 查询所有任务
	 */
	public Page<TerminalTaskEntity> queryEntity(final Page page,TerminalTaskEntity taskEntity){
		return terminalTaskDAO.queryTask(page, taskEntity);
	}
	
	/**
	 * 
	 * @param keys
	 * 
	 * 删除任务及任务关联业务和终端表数据
	 */
	
	public void deleteTask(String keys){
		terminalTaskDAO.deleteTask(keys);
	}
	
	/**
	 * 查询已完成的任务
	 * @return
	 */
	public List<TerminalTaskEntity> queryAllTask(){
		return terminalTaskDAO.queryAllTask();
	}
	
	/**
	 * 通过任务ID 查询任务
	 * @param id
	 * @return
	 */
	public TerminalTaskEntity queryTaskByTaskId(int id){
		return terminalTaskDAO.queryTaskByTaskId(id);
	}
	
}

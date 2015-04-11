
//Generated By XCodeFactory
package org.guihuotv.search.web.dao;

import uw.dm.*;
import uw.dm.impl.*;
import uw.dm.util.*;
import org.guihuotv.search.web.pojo.*;

import java.util.*;
import java.sql.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * Title: Base table SysConfig 的DAO类。
 * Description: 本文件使用XCodeFactory自动生成。
 * 本类为DAO类，通过数据库表映像，实现数据库的三个方法。
 */
public class SysConfigDAO {

	private static final Logger logger = LoggerFactory.getLogger(SysConfigDAO.class);

	/**
	 * 获得对象。
	 *
	 */
	public static SysConfig load(DAOFactoryImpl dao,String tableName,String[] colList,String whereSql,Object[] paramList) throws TransactionException
	{
		SysConfig sysConfig = null;
		if (colList==null){
			sysConfig = selectFromDb(dao,tableName,whereSql,paramList);
		}else{
			sysConfig = liteSelectFromDb(dao,tableName,colList,whereSql,paramList);
		}
		return sysConfig;
	}


	
	/**
	 * 更新数据库。
	 * @throws UnauthorizedException
	 */
	public static void update(DAOFactoryImpl dao,String tableName,SysConfig sysConfig)  throws TransactionException
	{	
		if (sysConfig.LIST_COL_UPDATED==null){//如果updatelist=null，说明肯定是完整模式
			updateToDb(dao,tableName,sysConfig);
		}else{
			liteUpdateToDb(dao,tableName,sysConfig);
		}
	}
	


	/**
	 * 建立对象。
	 *
	 */
	public static SysConfig save(DAOFactoryImpl dao,String tableName,SysConfig sysConfig)  throws TransactionException
	{
		return insertIntoDb(dao,tableName,sysConfig);
	}

	
	
	/**
	 * 向数据库中插入一条数据。
	 */
	private static SysConfig insertIntoDb(DAOFactoryImpl dao,String tableName,SysConfig sysConfig)  throws TransactionException{
		String insertSql=
			"INSERT INTO "+(tableName==null?"sys_config":tableName) +
			"(id,cat_name,prop_name,prop_value,prop_comment,input_comment,display_order,create_date,modify_date,status) "+
			"VALUES "+
			"(?,?,?,?,?,?,?,?,?,?) ";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"sys_config":tableName),"write");
			pstmt = dao.getBatchUpdateController().prepareStatement(con,insertSql);
			
			if (sysConfig.getId()<=0) sysConfig.setId(SequenceManager.nextId("sys_config"));
			
			pstmt.setLong(1,sysConfig.getId());
			pstmt.setString(2,sysConfig.getCatName());
			pstmt.setString(3,sysConfig.getPropName());
			pstmt.setString(4,sysConfig.getPropValue());
			pstmt.setString(5,sysConfig.getPropComment());
			pstmt.setString(6,sysConfig.getInputComment());
			pstmt.setString(7,sysConfig.getDisplayOrder());
			pstmt.setTimestamp(8,DmValueUtils.dateToTimestamp(sysConfig.getCreateDate()));
			pstmt.setTimestamp(9,DmValueUtils.dateToTimestamp(sysConfig.getModifyDate()));
			pstmt.setInt(10,sysConfig.getStatus());
			
			if (dao.getBatchUpdateController().getBatchStatus())
			 pstmt.addBatch();
			else
			 pstmt.executeUpdate();
			 sysConfig.CURRENT_TABLE_NAME = (tableName==null?null:tableName);
		}
		catch( SQLException sqle ){
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbSysConfig.java:insertIntoDb(): " , sqle );
		}
		finally {
			try {  if (!dao.getBatchUpdateController().getBatchStatus()) pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try {  if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
		return sysConfig;
	}

	/**
	 * 保存该对象数据到数据库中.
	 */
	private static  void updateToDb(DAOFactoryImpl dao,String tableName,SysConfig sysConfig)  throws TransactionException{
		String updateSql =
		"UPDATE "+(tableName==null?"sys_config":tableName)+" SET " +
		"cat_name=?,prop_name=?,prop_value=?,prop_comment=?,input_comment=?,display_order=?,create_date=?,modify_date=?,status=? "+
		"WHERE id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"sys_config":tableName),"write");
			pstmt = dao.getBatchUpdateController().prepareStatement(con,updateSql);
			pstmt.setString(1,sysConfig.getCatName());
			pstmt.setString(2,sysConfig.getPropName());
			pstmt.setString(3,sysConfig.getPropValue());
			pstmt.setString(4,sysConfig.getPropComment());
			pstmt.setString(5,sysConfig.getInputComment());
			pstmt.setString(6,sysConfig.getDisplayOrder());
			pstmt.setTimestamp(7,DmValueUtils.dateToTimestamp(sysConfig.getCreateDate()));
			pstmt.setTimestamp(8,DmValueUtils.dateToTimestamp(sysConfig.getModifyDate()));
			pstmt.setInt(9,sysConfig.getStatus());
			
			pstmt.setLong(10,sysConfig.getId());
			
			if (dao.getBatchUpdateController().getBatchStatus())
			 pstmt.addBatch();			
			else
			 pstmt.executeUpdate();
			 sysConfig.CURRENT_TABLE_NAME = (tableName==null?null:tableName);

		}
		catch( SQLException sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbSysConfig.java:updateToDb(): " , sqle );
		}
		finally {
			try {  if (!dao.getBatchUpdateController().getBatchStatus()) pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try { if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
	}
	
	/**
	 * 轻量级保存该对象数据到数据库中.
	 */
	private static  void liteUpdateToDb(DAOFactoryImpl dao,String tableName,SysConfig sysConfig)  throws TransactionException{
		Connection con = null;
		PreparedStatement pstmt = null;
		List<String> list = sysConfig.LIST_COL_UPDATED;
        StringBuilder sb = new StringBuilder();
        sb.append("UPDATE "+(tableName==null?"sys_config":tableName)+" set ");
        for (int i=0;i<list.size();i++){
        	if (i==0){
        		sb.append(list.get(i)+"=?");
        	}else{
				sb.append(","+list.get(i)+"=?");
			}
		}
		sb.append(" WHERE id=?");
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"sys_config":tableName),"write");
			pstmt = dao.getBatchUpdateController().prepareStatement(con,sb.toString());
			String col = "";
			for (int i=0;i<list.size();i++){
				col = list.get(i);
				DmReflectUtils.DAOLiteSaveReflect(pstmt,sysConfig,i+1,SysConfig.MAP_COL_NAME.get(col),SysConfig.MAP_COL_TYPE.get(col));
			}
			
			col = "id";
			DmReflectUtils.DAOLiteSaveReflect(pstmt,sysConfig,list.size()+1,SysConfig.MAP_COL_NAME.get(col),SysConfig.MAP_COL_TYPE.get(col));
			
			if (dao.getBatchUpdateController().getBatchStatus())
			 pstmt.addBatch();
			else
			 pstmt.executeUpdate();
			sysConfig.CURRENT_TABLE_NAME = (tableName==null?null:tableName);

		}
		catch( Exception sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbSysConfig.java:liteUpdateToDb(): " , sqle );
		}
		finally {
			try {  if (!dao.getBatchUpdateController().getBatchStatus()) pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try { if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
	}
	


	/**
	 * 从数据库装入该对象所需要的数据
	 */
	private static SysConfig selectFromDb(DAOFactoryImpl dao,String tableName,String whereSql,Object[] paramList) throws TransactionException{
		Connection con = null;
		PreparedStatement pstmt = null;
		SysConfig sysConfig= null;
		try {
			String loadSql =
			"SELECT id,cat_name,prop_name,prop_value,prop_comment,input_comment,display_order,create_date,modify_date,status FROM "+(tableName==null?"sys_config":tableName)+" "+(whereSql==null?"WHERE id=?":whereSql);
			con = dao.getTransactionController().getConnection((tableName==null?"sys_config":tableName),"read");
			pstmt = con.prepareStatement(loadSql);
			if (paramList != null && paramList.length > 0) {
				for (int i = 0; i < paramList.length; i++) {
					DmReflectUtils.CommandUpdateReflect(pstmt, i + 1, paramList[i]);
				}
			}
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
			sysConfig= new SysConfig(rs.getLong("id"),DmValueUtils.nullToStr(rs.getString("cat_name")),DmValueUtils.nullToStr(rs.getString("prop_name")),DmValueUtils.nullToStr(rs.getString("prop_value")),DmValueUtils.nullToStr(rs.getString("prop_comment")),DmValueUtils.nullToStr(rs.getString("input_comment")),DmValueUtils.nullToStr(rs.getString("display_order")),rs.getTimestamp("create_date"),rs.getTimestamp("modify_date"),rs.getInt("status"));
			sysConfig.CURRENT_TABLE_NAME = (tableName==null?null:tableName);

			}
			rs.close();
		}
		catch( Exception sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbSysConfig.java:selectFromDb(): ", sqle );
		}
		finally {
			try {  pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try {  if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
		return sysConfig;
	}
	/**
	 * 轻量级载入对象.
	 */
	private static SysConfig liteSelectFromDb(DAOFactoryImpl dao,String tableName,String[] colList,String whereSql,Object[] paramList) throws TransactionException{
		Connection con = null;
		PreparedStatement pstmt = null;
		SysConfig sysConfig= null;
        StringBuilder sb = new StringBuilder();
        sb.append(" select ");
        for (int i=0;i<colList.length;i++){
        	if (i==0) {
        		sb.append(colList[i]);
        	}else{
				sb.append(","+colList[i]);
			}
		}
		sb.append(" FROM "+(tableName==null?"sys_config":tableName));
		sb.append(" ").append(whereSql==null?"WHERE id=?":whereSql);
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"sys_config":tableName),"read");
			pstmt = con.prepareStatement(sb.toString());
			if (paramList != null && paramList.length > 0) {
				for (int i = 0; i < paramList.length; i++) {
					DmReflectUtils.CommandUpdateReflect(pstmt, i + 1, paramList[i]);
				}
			}
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				sysConfig = new SysConfig();
				String col = "";
				for (int i=0;i<colList.length;i++){
					col = colList[i];
					DmReflectUtils.DAOLiteLoadReflect(rs,sysConfig,col,SysConfig.MAP_COL_NAME.get(col),SysConfig.MAP_COL_TYPE.get(col));
				}
				sysConfig.CURRENT_TABLE_NAME = (tableName==null?null:tableName);
			}
			rs.close();
		}
		catch( Exception sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbSysConfig.java:liteSelectFromDb(): " , sqle );
		}
		finally {
			try {  pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try {  if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
		return sysConfig;
	}

	
	/**
	 * 删除数据。
	 */
	public static void delete(DAOFactoryImpl dao,String tableName,SysConfig sysConfig)  throws TransactionException
	{
		deleteFromDb(dao,tableName,sysConfig);
	}

	/**
	 * 直接从数据库中删除数据.
	 */
	private static void deleteFromDb(DAOFactoryImpl dao,String tableName,SysConfig sysConfig)  throws TransactionException
	{
		String deleteSql = 
		"DELETE FROM "+(tableName==null?"sys_config":tableName)+" WHERE id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"sys_config":tableName),"write");
			pstmt = dao.getBatchUpdateController().prepareStatement(con,deleteSql);
			pstmt.setLong(1,sysConfig.getId());
			
			if (dao.getBatchUpdateController().getBatchStatus())
			 pstmt.addBatch();			
			else
			 pstmt.executeUpdate();
		}
		catch( SQLException sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbSysConfig.java:deleteFromDb(): " , sqle );
		}
		finally {
			try {  if (!dao.getBatchUpdateController().getBatchStatus()) pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try {  if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
	}

	

}
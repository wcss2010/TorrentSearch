
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
 * Title: Base table NgnUser 的DAO类。
 * Description: 本文件使用XCodeFactory自动生成。
 * 本类为DAO类，通过数据库表映像，实现数据库的三个方法。
 */
public class NgnUserDAO {

	private static final Logger logger = LoggerFactory.getLogger(NgnUserDAO.class);

	/**
	 * 获得对象。
	 *
	 */
	public static NgnUser load(DAOFactoryImpl dao,String tableName,String[] colList,String whereSql,Object[] paramList) throws TransactionException
	{
		NgnUser ngnUser = null;
		if (colList==null){
			ngnUser = selectFromDb(dao,tableName,whereSql,paramList);
		}else{
			ngnUser = liteSelectFromDb(dao,tableName,colList,whereSql,paramList);
		}
		return ngnUser;
	}


	
	/**
	 * 更新数据库。
	 * @throws UnauthorizedException
	 */
	public static void update(DAOFactoryImpl dao,String tableName,NgnUser ngnUser)  throws TransactionException
	{	
		if (ngnUser.LIST_COL_UPDATED==null){//如果updatelist=null，说明肯定是完整模式
			updateToDb(dao,tableName,ngnUser);
		}else{
			liteUpdateToDb(dao,tableName,ngnUser);
		}
	}
	


	/**
	 * 建立对象。
	 *
	 */
	public static NgnUser save(DAOFactoryImpl dao,String tableName,NgnUser ngnUser)  throws TransactionException
	{
		return insertIntoDb(dao,tableName,ngnUser);
	}

	
	
	/**
	 * 向数据库中插入一条数据。
	 */
	private static NgnUser insertIntoDb(DAOFactoryImpl dao,String tableName,NgnUser ngnUser)  throws TransactionException{
		String insertSql=
			"INSERT INTO "+(tableName==null?"ngn_user":tableName) +
			"(id,user_type,username,passwd,mobile,email,alias_name,birthday,age,gender,remark,school,company,occupation,industry,user_point,last_logon_date,create_date,modify_date,status) "+
			"VALUES "+
			"(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"ngn_user":tableName),"write");
			pstmt = dao.getBatchUpdateController().prepareStatement(con,insertSql);
			
			if (ngnUser.getId()<=0) ngnUser.setId(SequenceManager.nextId("ngn_user"));
			
			pstmt.setLong(1,ngnUser.getId());
			pstmt.setInt(2,ngnUser.getUserType());
			pstmt.setString(3,ngnUser.getUsername());
			pstmt.setString(4,ngnUser.getPasswd());
			pstmt.setString(5,ngnUser.getMobile());
			pstmt.setString(6,ngnUser.getEmail());
			pstmt.setString(7,ngnUser.getAliasName());
			pstmt.setTimestamp(8,DmValueUtils.dateToTimestamp(ngnUser.getBirthday()));
			pstmt.setInt(9,ngnUser.getAge());
			pstmt.setInt(10,ngnUser.getGender());
			pstmt.setString(11,ngnUser.getRemark());
			pstmt.setString(12,ngnUser.getSchool());
			pstmt.setString(13,ngnUser.getCompany());
			pstmt.setString(14,ngnUser.getOccupation());
			pstmt.setString(15,ngnUser.getIndustry());
			pstmt.setInt(16,ngnUser.getUserPoint());
			pstmt.setTimestamp(17,DmValueUtils.dateToTimestamp(ngnUser.getLastLogonDate()));
			pstmt.setTimestamp(18,DmValueUtils.dateToTimestamp(ngnUser.getCreateDate()));
			pstmt.setTimestamp(19,DmValueUtils.dateToTimestamp(ngnUser.getModifyDate()));
			pstmt.setInt(20,ngnUser.getStatus());
			
			if (dao.getBatchUpdateController().getBatchStatus())
			 pstmt.addBatch();
			else
			 pstmt.executeUpdate();
			 ngnUser.CURRENT_TABLE_NAME = (tableName==null?null:tableName);
		}
		catch( SQLException sqle ){
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbNgnUser.java:insertIntoDb(): " , sqle );
		}
		finally {
			try {  if (!dao.getBatchUpdateController().getBatchStatus()) pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try {  if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
		return ngnUser;
	}

	/**
	 * 保存该对象数据到数据库中.
	 */
	private static  void updateToDb(DAOFactoryImpl dao,String tableName,NgnUser ngnUser)  throws TransactionException{
		String updateSql =
		"UPDATE "+(tableName==null?"ngn_user":tableName)+" SET " +
		"user_type=?,username=?,passwd=?,mobile=?,email=?,alias_name=?,birthday=?,age=?,gender=?,remark=?,school=?,company=?,occupation=?,industry=?,user_point=?,last_logon_date=?,create_date=?,modify_date=?,status=? "+
		"WHERE id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"ngn_user":tableName),"write");
			pstmt = dao.getBatchUpdateController().prepareStatement(con,updateSql);
			pstmt.setInt(1,ngnUser.getUserType());
			pstmt.setString(2,ngnUser.getUsername());
			pstmt.setString(3,ngnUser.getPasswd());
			pstmt.setString(4,ngnUser.getMobile());
			pstmt.setString(5,ngnUser.getEmail());
			pstmt.setString(6,ngnUser.getAliasName());
			pstmt.setTimestamp(7,DmValueUtils.dateToTimestamp(ngnUser.getBirthday()));
			pstmt.setInt(8,ngnUser.getAge());
			pstmt.setInt(9,ngnUser.getGender());
			pstmt.setString(10,ngnUser.getRemark());
			pstmt.setString(11,ngnUser.getSchool());
			pstmt.setString(12,ngnUser.getCompany());
			pstmt.setString(13,ngnUser.getOccupation());
			pstmt.setString(14,ngnUser.getIndustry());
			pstmt.setInt(15,ngnUser.getUserPoint());
			pstmt.setTimestamp(16,DmValueUtils.dateToTimestamp(ngnUser.getLastLogonDate()));
			pstmt.setTimestamp(17,DmValueUtils.dateToTimestamp(ngnUser.getCreateDate()));
			pstmt.setTimestamp(18,DmValueUtils.dateToTimestamp(ngnUser.getModifyDate()));
			pstmt.setInt(19,ngnUser.getStatus());
			
			pstmt.setLong(20,ngnUser.getId());
			
			if (dao.getBatchUpdateController().getBatchStatus())
			 pstmt.addBatch();			
			else
			 pstmt.executeUpdate();
			 ngnUser.CURRENT_TABLE_NAME = (tableName==null?null:tableName);

		}
		catch( SQLException sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbNgnUser.java:updateToDb(): " , sqle );
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
	private static  void liteUpdateToDb(DAOFactoryImpl dao,String tableName,NgnUser ngnUser)  throws TransactionException{
		Connection con = null;
		PreparedStatement pstmt = null;
		List<String> list = ngnUser.LIST_COL_UPDATED;
        StringBuilder sb = new StringBuilder();
        sb.append("UPDATE "+(tableName==null?"ngn_user":tableName)+" set ");
        for (int i=0;i<list.size();i++){
        	if (i==0){
        		sb.append(list.get(i)+"=?");
        	}else{
				sb.append(","+list.get(i)+"=?");
			}
		}
		sb.append(" WHERE id=?");
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"ngn_user":tableName),"write");
			pstmt = dao.getBatchUpdateController().prepareStatement(con,sb.toString());
			String col = "";
			for (int i=0;i<list.size();i++){
				col = list.get(i);
				DmReflectUtils.DAOLiteSaveReflect(pstmt,ngnUser,i+1,NgnUser.MAP_COL_NAME.get(col),NgnUser.MAP_COL_TYPE.get(col));
			}
			
			col = "id";
			DmReflectUtils.DAOLiteSaveReflect(pstmt,ngnUser,list.size()+1,NgnUser.MAP_COL_NAME.get(col),NgnUser.MAP_COL_TYPE.get(col));
			
			if (dao.getBatchUpdateController().getBatchStatus())
			 pstmt.addBatch();
			else
			 pstmt.executeUpdate();
			ngnUser.CURRENT_TABLE_NAME = (tableName==null?null:tableName);

		}
		catch( Exception sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbNgnUser.java:liteUpdateToDb(): " , sqle );
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
	private static NgnUser selectFromDb(DAOFactoryImpl dao,String tableName,String whereSql,Object[] paramList) throws TransactionException{
		Connection con = null;
		PreparedStatement pstmt = null;
		NgnUser ngnUser= null;
		try {
			String loadSql =
			"SELECT id,user_type,username,passwd,mobile,email,alias_name,birthday,age,gender,remark,school,company,occupation,industry,user_point,last_logon_date,create_date,modify_date,status FROM "+(tableName==null?"ngn_user":tableName)+" "+(whereSql==null?"WHERE id=?":whereSql);
			con = dao.getTransactionController().getConnection((tableName==null?"ngn_user":tableName),"read");
			pstmt = con.prepareStatement(loadSql);
			if (paramList != null && paramList.length > 0) {
				for (int i = 0; i < paramList.length; i++) {
					DmReflectUtils.CommandUpdateReflect(pstmt, i + 1, paramList[i]);
				}
			}
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
			ngnUser= new NgnUser(rs.getLong("id"),rs.getInt("user_type"),DmValueUtils.nullToStr(rs.getString("username")),DmValueUtils.nullToStr(rs.getString("passwd")),DmValueUtils.nullToStr(rs.getString("mobile")),DmValueUtils.nullToStr(rs.getString("email")),DmValueUtils.nullToStr(rs.getString("alias_name")),rs.getTimestamp("birthday"),rs.getInt("age"),rs.getInt("gender"),DmValueUtils.nullToStr(rs.getString("remark")),DmValueUtils.nullToStr(rs.getString("school")),DmValueUtils.nullToStr(rs.getString("company")),DmValueUtils.nullToStr(rs.getString("occupation")),DmValueUtils.nullToStr(rs.getString("industry")),rs.getInt("user_point"),rs.getTimestamp("last_logon_date"),rs.getTimestamp("create_date"),rs.getTimestamp("modify_date"),rs.getInt("status"));
			ngnUser.CURRENT_TABLE_NAME = (tableName==null?null:tableName);

			}
			rs.close();
		}
		catch( Exception sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbNgnUser.java:selectFromDb(): ", sqle );
		}
		finally {
			try {  pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try {  if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
		return ngnUser;
	}
	/**
	 * 轻量级载入对象.
	 */
	private static NgnUser liteSelectFromDb(DAOFactoryImpl dao,String tableName,String[] colList,String whereSql,Object[] paramList) throws TransactionException{
		Connection con = null;
		PreparedStatement pstmt = null;
		NgnUser ngnUser= null;
        StringBuilder sb = new StringBuilder();
        sb.append(" select ");
        for (int i=0;i<colList.length;i++){
        	if (i==0) {
        		sb.append(colList[i]);
        	}else{
				sb.append(","+colList[i]);
			}
		}
		sb.append(" FROM "+(tableName==null?"ngn_user":tableName));
		sb.append(" ").append(whereSql==null?"WHERE id=?":whereSql);
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"ngn_user":tableName),"read");
			pstmt = con.prepareStatement(sb.toString());
			if (paramList != null && paramList.length > 0) {
				for (int i = 0; i < paramList.length; i++) {
					DmReflectUtils.CommandUpdateReflect(pstmt, i + 1, paramList[i]);
				}
			}
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				ngnUser = new NgnUser();
				String col = "";
				for (int i=0;i<colList.length;i++){
					col = colList[i];
					DmReflectUtils.DAOLiteLoadReflect(rs,ngnUser,col,NgnUser.MAP_COL_NAME.get(col),NgnUser.MAP_COL_TYPE.get(col));
				}
				ngnUser.CURRENT_TABLE_NAME = (tableName==null?null:tableName);
			}
			rs.close();
		}
		catch( Exception sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbNgnUser.java:liteSelectFromDb(): " , sqle );
		}
		finally {
			try {  pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try {  if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
		return ngnUser;
	}

	
	/**
	 * 删除数据。
	 */
	public static void delete(DAOFactoryImpl dao,String tableName,NgnUser ngnUser)  throws TransactionException
	{
		deleteFromDb(dao,tableName,ngnUser);
	}

	/**
	 * 直接从数据库中删除数据.
	 */
	private static void deleteFromDb(DAOFactoryImpl dao,String tableName,NgnUser ngnUser)  throws TransactionException
	{
		String deleteSql = 
		"DELETE FROM "+(tableName==null?"ngn_user":tableName)+" WHERE id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dao.getTransactionController().getConnection((tableName==null?"ngn_user":tableName),"write");
			pstmt = dao.getBatchUpdateController().prepareStatement(con,deleteSql);
			pstmt.setLong(1,ngnUser.getId());
			
			if (dao.getBatchUpdateController().getBatchStatus())
			 pstmt.addBatch();			
			else
			 pstmt.executeUpdate();
		}
		catch( SQLException sqle ) {
			logger.error(sqle.getMessage(),sqle);
			throw new TransactionException("TransactionException in DbNgnUser.java:deleteFromDb(): " , sqle );
		}
		finally {
			try {  if (!dao.getBatchUpdateController().getBatchStatus()) pstmt.close(); }
			catch (Exception e) { logger.error(e.getMessage(),e); }
			try {  if (dao.getTransactionController().isAutoCommit()) con.close();   }
			catch (Exception e) { logger.error(e.getMessage(),e); }
		}
	}

	

}
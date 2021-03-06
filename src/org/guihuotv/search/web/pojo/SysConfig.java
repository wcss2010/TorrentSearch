
 //Generated By XCodeFactory
package org.guihuotv.search.web.pojo;

import uw.dm.util.*;
import java.util.*;
import java.io.Serializable;

/**
 * Title: Base table SysConfig的pojo类
 * Description: 本文件使用XCodeFactory自动生成。
 * 本类为ValueObject类，通过数据库表映像。
 */
public class SysConfig implements Serializable,Cloneable {

	private static final long serialVersionUID = 1L;
	
	/*
	 * 字段，类型map表
	 */
	public static final HashMap<String, Integer> MAP_COL_TYPE = new HashMap<String, Integer>();
	
	/*
	 * 原始名称，属性名称map表
	 */
	public static final HashMap<String, String> MAP_COL_NAME = new HashMap<String, String>();
	
	 
	static{
		
		MAP_COL_TYPE.put("id",DmObjectType.LONG);
		MAP_COL_NAME.put("id","id");
		
		MAP_COL_TYPE.put("cat_name",DmObjectType.STRING);
		MAP_COL_NAME.put("cat_name","catName");
		
		MAP_COL_TYPE.put("prop_name",DmObjectType.STRING);
		MAP_COL_NAME.put("prop_name","propName");
		
		MAP_COL_TYPE.put("prop_value",DmObjectType.STRING);
		MAP_COL_NAME.put("prop_value","propValue");
		
		MAP_COL_TYPE.put("prop_comment",DmObjectType.STRING);
		MAP_COL_NAME.put("prop_comment","propComment");
		
		MAP_COL_TYPE.put("input_comment",DmObjectType.STRING);
		MAP_COL_NAME.put("input_comment","inputComment");
		
		MAP_COL_TYPE.put("display_order",DmObjectType.STRING);
		MAP_COL_NAME.put("display_order","displayOrder");
		
		MAP_COL_TYPE.put("create_date",DmObjectType.DATE);
		MAP_COL_NAME.put("create_date","createDate");
		
		MAP_COL_TYPE.put("modify_date",DmObjectType.DATE);
		MAP_COL_NAME.put("modify_date","modifyDate");
		
		MAP_COL_TYPE.put("status",DmObjectType.INT);
		MAP_COL_NAME.put("status","status");
		
	}

	public static final String TABLE_NAME = "sys_config";
	
	
	public static final String COL_ID = "id";
	
	public static final String COL_CAT_NAME = "cat_name";
	
	public static final String COL_PROP_NAME = "prop_name";
	
	public static final String COL_PROP_VALUE = "prop_value";
	
	public static final String COL_PROP_COMMENT = "prop_comment";
	
	public static final String COL_INPUT_COMMENT = "input_comment";
	
	public static final String COL_DISPLAY_ORDER = "display_order";
	
	public static final String COL_CREATE_DATE = "create_date";
	
	public static final String COL_MODIFY_DATE = "modify_date";
	
	public static final String COL_STATUS = "status";
	

	/*
	 * 轻量级状态下更新列表list
	 */
	public List<String> LIST_COL_UPDATED = null;
	
	/*
	 * 自定义的附属信息
	 */
	public Map<Object,Object> MAP_EXT_PROPERTY = null;
	
	/*
	 * 变更信息
	 */
	private StringBuilder _CHANGED_INFO = null;
	
	/*
	 * 分割行
	 */
	private static final String _SEPARATE_LINE = "************************************\r\n";
	

	/*
	 * 实际的表名
	 */
	public String CURRENT_TABLE_NAME = null;
	
	
	//属性定义区域
	
	
	/**
	 * 
	 */
	private long id = 0l;
	
	
	/**
	 * 分类名
	 */
	private String catName = "";
	
	
	/**
	 * 属性名
	 */
	private String propName = "";
	
	
	/**
	 * 属性数值
	 */
	private String propValue = "";
	
	
	/**
	 * 属性备注
	 */
	private String propComment = "";
	
	
	/**
	 * 输入说明
	 */
	private String inputComment = "";
	
	
	/**
	 * 显示排序
	 */
	private String displayOrder = "";
	
	
	/**
	 * 建立时间
	 */
	private java.util.Date createDate = null;
	
	
	/**
	 * 最后修改时间
	 */
	private java.util.Date modifyDate = null;
	
	
	/**
	 * 状态。1为正常，-1为标记删除
	 */
	private int status = 0;
	
	
	/**
	 * 设置附加属性
	 */
	public void SET_EXT_PROPERTY(Object key,Object value){
		if (MAP_EXT_PROPERTY==null)
			MAP_EXT_PROPERTY = new LinkedHashMap<Object,Object>();
		MAP_EXT_PROPERTY.put(key,value);
	}
	
	/**
	 * 获得附加属性
	 */
	public Object GET_EXT_PROPERTY(Object key){
		if (MAP_EXT_PROPERTY!=null)
			return MAP_EXT_PROPERTY.get(key);
		else
			return null;
	}
	
	/**
	 * 获得附加属性MAP
	 */
	public Map<Object,Object> GET_EXT_PROPERTY_MAP(){
		return MAP_EXT_PROPERTY;
	}
	
	/**
	 * 获得更改的字段列表.
	 */
	public List<String> GET_UPDATED_COL_LIST(){
		return LIST_COL_UPDATED;
	}
	
	/**
	 * 得到_CHANGED_INFO
	 */
	public String GET_CHANGED_INFO(){
		if (this._CHANGED_INFO==null){
			return null;
		}else{
			this._CHANGED_INFO.append(_SEPARATE_LINE);
			return this._CHANGED_INFO.toString(); 
		}
	}
	
	
	/**
	 * 获取数值
	 */
	public long getId()
	{
		return this.id;
	}
	
	/**
	 * 获取分类名数值
	 */
	public String getCatName()
	{
		return this.catName;
	}
	
	/**
	 * 获取属性名数值
	 */
	public String getPropName()
	{
		return this.propName;
	}
	
	/**
	 * 获取属性数值数值
	 */
	public String getPropValue()
	{
		return this.propValue;
	}
	
	/**
	 * 获取属性备注数值
	 */
	public String getPropComment()
	{
		return this.propComment;
	}
	
	/**
	 * 获取输入说明数值
	 */
	public String getInputComment()
	{
		return this.inputComment;
	}
	
	/**
	 * 获取显示排序数值
	 */
	public String getDisplayOrder()
	{
		return this.displayOrder;
	}
	
	/**
	 * 获取建立时间数值
	 */
	public java.util.Date getCreateDate()
	{
		return this.createDate;
	}
	
	/**
	 * 获取最后修改时间数值
	 */
	public java.util.Date getModifyDate()
	{
		return this.modifyDate;
	}
	
	/**
	 * 获取状态。1为正常，-1为标记删除数值
	 */
	public int getStatus()
	{
		return this.status;
	}
	

	
	/**
	 * 初始化set相关的信息
	 */
	private void initSetInfo(){
			this.LIST_COL_UPDATED = new ArrayList<String>();
			this._CHANGED_INFO = new StringBuilder(_SEPARATE_LINE+"表SysConfig，主键\""+this.id+"\"变更信息为:\r\n");
	}

	
	/**
	 * 设置数值
	 */
	public void setId(long id)
	{
		if (this.id!=id){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("id")){ 
				this.LIST_COL_UPDATED.add("id");
			}
			this._CHANGED_INFO.append("字段id由\""+this.id+"\"修改为\""+id+"\"\r\n");
			this.id = id;
		}
	}
	
	/**
	 * 设置分类名数值
	 */
	public void setCatName(String catName)
	{
		if ((!String.valueOf(this.catName).equals(String.valueOf(catName)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("cat_name")){ 
				this.LIST_COL_UPDATED.add("cat_name");
			}
			this._CHANGED_INFO.append("字段cat_name由\""+this.catName+"\"修改为\""+catName+"\"\r\n");
			this.catName = catName;
		}
	}
	
	/**
	 * 设置属性名数值
	 */
	public void setPropName(String propName)
	{
		if ((!String.valueOf(this.propName).equals(String.valueOf(propName)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("prop_name")){ 
				this.LIST_COL_UPDATED.add("prop_name");
			}
			this._CHANGED_INFO.append("字段prop_name由\""+this.propName+"\"修改为\""+propName+"\"\r\n");
			this.propName = propName;
		}
	}
	
	/**
	 * 设置属性数值数值
	 */
	public void setPropValue(String propValue)
	{
		if ((!String.valueOf(this.propValue).equals(String.valueOf(propValue)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("prop_value")){ 
				this.LIST_COL_UPDATED.add("prop_value");
			}
			this._CHANGED_INFO.append("字段prop_value由\""+this.propValue+"\"修改为\""+propValue+"\"\r\n");
			this.propValue = propValue;
		}
	}
	
	/**
	 * 设置属性备注数值
	 */
	public void setPropComment(String propComment)
	{
		if ((!String.valueOf(this.propComment).equals(String.valueOf(propComment)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("prop_comment")){ 
				this.LIST_COL_UPDATED.add("prop_comment");
			}
			this._CHANGED_INFO.append("字段prop_comment由\""+this.propComment+"\"修改为\""+propComment+"\"\r\n");
			this.propComment = propComment;
		}
	}
	
	/**
	 * 设置输入说明数值
	 */
	public void setInputComment(String inputComment)
	{
		if ((!String.valueOf(this.inputComment).equals(String.valueOf(inputComment)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("input_comment")){ 
				this.LIST_COL_UPDATED.add("input_comment");
			}
			this._CHANGED_INFO.append("字段input_comment由\""+this.inputComment+"\"修改为\""+inputComment+"\"\r\n");
			this.inputComment = inputComment;
		}
	}
	
	/**
	 * 设置显示排序数值
	 */
	public void setDisplayOrder(String displayOrder)
	{
		if ((!String.valueOf(this.displayOrder).equals(String.valueOf(displayOrder)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("display_order")){ 
				this.LIST_COL_UPDATED.add("display_order");
			}
			this._CHANGED_INFO.append("字段display_order由\""+this.displayOrder+"\"修改为\""+displayOrder+"\"\r\n");
			this.displayOrder = displayOrder;
		}
	}
	
	/**
	 * 设置建立时间数值
	 */
	public void setCreateDate(java.util.Date createDate)
	{
		if ((this.createDate!=null&&createDate!=null&&!this.createDate.equals(createDate))||(this.createDate!=createDate)){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("create_date")){ 
				this.LIST_COL_UPDATED.add("create_date");
			}
			this._CHANGED_INFO.append("字段create_date由\""+this.createDate+"\"修改为\""+createDate+"\"\r\n");
			this.createDate = createDate;
		}
	}
	
	/**
	 * 设置最后修改时间数值
	 */
	public void setModifyDate(java.util.Date modifyDate)
	{
		if ((this.modifyDate!=null&&modifyDate!=null&&!this.modifyDate.equals(modifyDate))||(this.modifyDate!=modifyDate)){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("modify_date")){ 
				this.LIST_COL_UPDATED.add("modify_date");
			}
			this._CHANGED_INFO.append("字段modify_date由\""+this.modifyDate+"\"修改为\""+modifyDate+"\"\r\n");
			this.modifyDate = modifyDate;
		}
	}
	
	/**
	 * 设置状态。1为正常，-1为标记删除数值
	 */
	public void setStatus(int status)
	{
		if (this.status!=status){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("status")){ 
				this.LIST_COL_UPDATED.add("status");
			}
			this._CHANGED_INFO.append("字段status由\""+this.status+"\"修改为\""+status+"\"\r\n");
			this.status = status;
		}
	}
	
	

	/**
	 * 构造器
	 */
	public SysConfig(long id,String catName,String propName,String propValue,String propComment,String inputComment,String displayOrder,java.util.Date createDate,java.util.Date modifyDate,int status){
	
		this.id = id;
		this.catName = catName;
		this.propName = propName;
		this.propValue = propValue;
		this.propComment = propComment;
		this.inputComment = inputComment;
		this.displayOrder = displayOrder;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		
	}
	
	/**
	 * 构造器
	 */
	public SysConfig(){
	}
	

	
	/**
	 * 重载toString方法
	 */
	public String toString(){
		StringBuilder sb = new StringBuilder(_SEPARATE_LINE+"表SysConfig，主键\""+this.id+"\"的全部信息为:\r\n");
		sb.append("字段id数值为:"+id+"\r\n");
		sb.append("字段cat_name数值为:"+catName+"\r\n");
		sb.append("字段prop_name数值为:"+propName+"\r\n");
		sb.append("字段prop_value数值为:"+propValue+"\r\n");
		sb.append("字段prop_comment数值为:"+propComment+"\r\n");
		sb.append("字段input_comment数值为:"+inputComment+"\r\n");
		sb.append("字段display_order数值为:"+displayOrder+"\r\n");
		sb.append("字段create_date数值为:"+createDate+"\r\n");
		sb.append("字段modify_date数值为:"+modifyDate+"\r\n");
		sb.append("字段status数值为:"+status+"\r\n");
		
		sb.append(_SEPARATE_LINE);
		return sb.toString();
	}

	/**
	* 克隆自身
	* @return<a name=""></a>
	*/
	public Object clone(){
		Object o = null;
		try {
			o = super.clone();
		} catch (CloneNotSupportedException e) {}
		return o;
	}

	
}
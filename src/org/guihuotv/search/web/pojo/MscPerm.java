
 //Generated By XCodeFactory
package org.guihuotv.search.web.pojo;

import uw.dm.util.*;
import java.util.*;
import java.io.Serializable;

/**
 * Title: Base table MscPerm的pojo类
 * Description: 本文件使用XCodeFactory自动生成。
 * 本类为ValueObject类，通过数据库表映像。
 */
public class MscPerm implements Serializable,Cloneable {

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
		
		MAP_COL_TYPE.put("parent_id",DmObjectType.LONG);
		MAP_COL_NAME.put("parent_id","parentId");
		
		MAP_COL_TYPE.put("perm_type",DmObjectType.INT);
		MAP_COL_NAME.put("perm_type","permType");
		
		MAP_COL_TYPE.put("perm_name",DmObjectType.STRING);
		MAP_COL_NAME.put("perm_name","permName");
		
		MAP_COL_TYPE.put("perm_desc",DmObjectType.STRING);
		MAP_COL_NAME.put("perm_desc","permDesc");
		
		MAP_COL_TYPE.put("child_num",DmObjectType.INT);
		MAP_COL_NAME.put("child_num","childNum");
		
		MAP_COL_TYPE.put("action_url",DmObjectType.STRING);
		MAP_COL_NAME.put("action_url","actionUrl");
		
		MAP_COL_TYPE.put("menu_layer",DmObjectType.INT);
		MAP_COL_NAME.put("menu_layer","menuLayer");
		
		MAP_COL_TYPE.put("menu_path",DmObjectType.STRING);
		MAP_COL_NAME.put("menu_path","menuPath");
		
		MAP_COL_TYPE.put("create_date",DmObjectType.DATE);
		MAP_COL_NAME.put("create_date","createDate");
		
		MAP_COL_TYPE.put("modify_date",DmObjectType.DATE);
		MAP_COL_NAME.put("modify_date","modifyDate");
		
		MAP_COL_TYPE.put("status",DmObjectType.INT);
		MAP_COL_NAME.put("status","status");
		
	}

	public static final String TABLE_NAME = "msc_perm";
	
	
	public static final String COL_ID = "id";
	
	public static final String COL_PARENT_ID = "parent_id";
	
	public static final String COL_PERM_TYPE = "perm_type";
	
	public static final String COL_PERM_NAME = "perm_name";
	
	public static final String COL_PERM_DESC = "perm_desc";
	
	public static final String COL_CHILD_NUM = "child_num";
	
	public static final String COL_ACTION_URL = "action_url";
	
	public static final String COL_MENU_LAYER = "menu_layer";
	
	public static final String COL_MENU_PATH = "menu_path";
	
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
	 * 菜单所属的上级ID
	 */
	private long parentId = 0l;
	
	
	/**
	 * 0.是菜单项，1是api
	 */
	private int permType = 0;
	
	
	/**
	 * 权限的名称
	 */
	private String permName = "";
	
	
	/**
	 * 权限的描述
	 */
	private String permDesc = "";
	
	
	/**
	 * 拥有子元素的个数
	 */
	private int childNum = 0;
	
	
	/**
	 * 权限执行的url目录
	 */
	private String actionUrl = "";
	
	
	/**
	 * 单位目录层次深度
	 */
	private int menuLayer = 0;
	
	
	/**
	 * 单位层次路径
	 */
	private String menuPath = "";
	
	
	/**
	 * 创建时间
	 */
	private java.util.Date createDate = null;
	
	
	/**
	 * 最后一次的修改时间
	 */
	private java.util.Date modifyDate = null;
	
	
	/**
	 * 状态
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
	 * 获取菜单所属的上级ID数值
	 */
	public long getParentId()
	{
		return this.parentId;
	}
	
	/**
	 * 获取0.是菜单项，1是api数值
	 */
	public int getPermType()
	{
		return this.permType;
	}
	
	/**
	 * 获取权限的名称数值
	 */
	public String getPermName()
	{
		return this.permName;
	}
	
	/**
	 * 获取权限的描述数值
	 */
	public String getPermDesc()
	{
		return this.permDesc;
	}
	
	/**
	 * 获取拥有子元素的个数数值
	 */
	public int getChildNum()
	{
		return this.childNum;
	}
	
	/**
	 * 获取权限执行的url目录数值
	 */
	public String getActionUrl()
	{
		return this.actionUrl;
	}
	
	/**
	 * 获取单位目录层次深度数值
	 */
	public int getMenuLayer()
	{
		return this.menuLayer;
	}
	
	/**
	 * 获取单位层次路径数值
	 */
	public String getMenuPath()
	{
		return this.menuPath;
	}
	
	/**
	 * 获取创建时间数值
	 */
	public java.util.Date getCreateDate()
	{
		return this.createDate;
	}
	
	/**
	 * 获取最后一次的修改时间数值
	 */
	public java.util.Date getModifyDate()
	{
		return this.modifyDate;
	}
	
	/**
	 * 获取状态数值
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
			this._CHANGED_INFO = new StringBuilder(_SEPARATE_LINE+"表MscPerm，主键\""+this.id+"\"变更信息为:\r\n");
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
	 * 设置菜单所属的上级ID数值
	 */
	public void setParentId(long parentId)
	{
		if (this.parentId!=parentId){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("parent_id")){ 
				this.LIST_COL_UPDATED.add("parent_id");
			}
			this._CHANGED_INFO.append("字段parent_id由\""+this.parentId+"\"修改为\""+parentId+"\"\r\n");
			this.parentId = parentId;
		}
	}
	
	/**
	 * 设置0.是菜单项，1是api数值
	 */
	public void setPermType(int permType)
	{
		if (this.permType!=permType){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("perm_type")){ 
				this.LIST_COL_UPDATED.add("perm_type");
			}
			this._CHANGED_INFO.append("字段perm_type由\""+this.permType+"\"修改为\""+permType+"\"\r\n");
			this.permType = permType;
		}
	}
	
	/**
	 * 设置权限的名称数值
	 */
	public void setPermName(String permName)
	{
		if ((!String.valueOf(this.permName).equals(String.valueOf(permName)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("perm_name")){ 
				this.LIST_COL_UPDATED.add("perm_name");
			}
			this._CHANGED_INFO.append("字段perm_name由\""+this.permName+"\"修改为\""+permName+"\"\r\n");
			this.permName = permName;
		}
	}
	
	/**
	 * 设置权限的描述数值
	 */
	public void setPermDesc(String permDesc)
	{
		if ((!String.valueOf(this.permDesc).equals(String.valueOf(permDesc)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("perm_desc")){ 
				this.LIST_COL_UPDATED.add("perm_desc");
			}
			this._CHANGED_INFO.append("字段perm_desc由\""+this.permDesc+"\"修改为\""+permDesc+"\"\r\n");
			this.permDesc = permDesc;
		}
	}
	
	/**
	 * 设置拥有子元素的个数数值
	 */
	public void setChildNum(int childNum)
	{
		if (this.childNum!=childNum){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("child_num")){ 
				this.LIST_COL_UPDATED.add("child_num");
			}
			this._CHANGED_INFO.append("字段child_num由\""+this.childNum+"\"修改为\""+childNum+"\"\r\n");
			this.childNum = childNum;
		}
	}
	
	/**
	 * 设置权限执行的url目录数值
	 */
	public void setActionUrl(String actionUrl)
	{
		if ((!String.valueOf(this.actionUrl).equals(String.valueOf(actionUrl)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("action_url")){ 
				this.LIST_COL_UPDATED.add("action_url");
			}
			this._CHANGED_INFO.append("字段action_url由\""+this.actionUrl+"\"修改为\""+actionUrl+"\"\r\n");
			this.actionUrl = actionUrl;
		}
	}
	
	/**
	 * 设置单位目录层次深度数值
	 */
	public void setMenuLayer(int menuLayer)
	{
		if (this.menuLayer!=menuLayer){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("menu_layer")){ 
				this.LIST_COL_UPDATED.add("menu_layer");
			}
			this._CHANGED_INFO.append("字段menu_layer由\""+this.menuLayer+"\"修改为\""+menuLayer+"\"\r\n");
			this.menuLayer = menuLayer;
		}
	}
	
	/**
	 * 设置单位层次路径数值
	 */
	public void setMenuPath(String menuPath)
	{
		if ((!String.valueOf(this.menuPath).equals(String.valueOf(menuPath)))){
			if (this.LIST_COL_UPDATED==null){ 
				initSetInfo();
			}
			if (!this.LIST_COL_UPDATED.contains("menu_path")){ 
				this.LIST_COL_UPDATED.add("menu_path");
			}
			this._CHANGED_INFO.append("字段menu_path由\""+this.menuPath+"\"修改为\""+menuPath+"\"\r\n");
			this.menuPath = menuPath;
		}
	}
	
	/**
	 * 设置创建时间数值
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
	 * 设置最后一次的修改时间数值
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
	 * 设置状态数值
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
	public MscPerm(long id,long parentId,int permType,String permName,String permDesc,int childNum,String actionUrl,int menuLayer,String menuPath,java.util.Date createDate,java.util.Date modifyDate,int status){
	
		this.id = id;
		this.parentId = parentId;
		this.permType = permType;
		this.permName = permName;
		this.permDesc = permDesc;
		this.childNum = childNum;
		this.actionUrl = actionUrl;
		this.menuLayer = menuLayer;
		this.menuPath = menuPath;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		
	}
	
	/**
	 * 构造器
	 */
	public MscPerm(){
	}
	

	
	/**
	 * 重载toString方法
	 */
	public String toString(){
		StringBuilder sb = new StringBuilder(_SEPARATE_LINE+"表MscPerm，主键\""+this.id+"\"的全部信息为:\r\n");
		sb.append("字段id数值为:"+id+"\r\n");
		sb.append("字段parent_id数值为:"+parentId+"\r\n");
		sb.append("字段perm_type数值为:"+permType+"\r\n");
		sb.append("字段perm_name数值为:"+permName+"\r\n");
		sb.append("字段perm_desc数值为:"+permDesc+"\r\n");
		sb.append("字段child_num数值为:"+childNum+"\r\n");
		sb.append("字段action_url数值为:"+actionUrl+"\r\n");
		sb.append("字段menu_layer数值为:"+menuLayer+"\r\n");
		sb.append("字段menu_path数值为:"+menuPath+"\r\n");
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
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.XuqiuBean;
import bean.DemandtypeBean;
import dbutil.DBUtil;

public class XuqiuDao {
	private static Connection con;
	private static Statement state;
	private static ResultSet rs;
	public XuqiuDao(){};
	public void zhuce(XuqiuBean xuqiuBean){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="insert into xuqiu(name,jigou,bumen,txadd,diyu,dwUrl,"
				+"daibiao,email,youbian,contact,phone,telphone,chuanzhen"
				+",shuxing,mingcheng,start,finish,problem,guanjian,zijin,leixing,moshi,fenlei,fenlei1,fenlei2,lingyu,lingyuu,usehangye,"
				+"jianjie,shijian,status) values('"+xuqiuBean.getName()+"','"+xuqiuBean.getJigou()+"','"+xuqiuBean.getBumen()+"','"+xuqiuBean.getTxadd()
				+"','"+xuqiuBean.getDiyu()+"','"+xuqiuBean.getDwUrl()+"','"+xuqiuBean.getDaibiao()
				+"','"+xuqiuBean.getEmail()+"','"+xuqiuBean.getYoubian()
				+"','"+xuqiuBean.getContact()+"','"+xuqiuBean.getPhone()
				+"','"+xuqiuBean.getTelphone()+"','"+xuqiuBean.getChuanzhen()
				+"','"+xuqiuBean.getShuxing()+"','"+xuqiuBean.getMingcheng()+"','"+xuqiuBean.getStart()
				+"','"+xuqiuBean.getFinish()+"','"+xuqiuBean.getProblem()
				+"','"+xuqiuBean.getGuanjian()+"','"+xuqiuBean.getZijin()+"','"+xuqiuBean.getLeixing()
				+"','"+xuqiuBean.getMoshi()+"','"+xuqiuBean.getFenlei()+"','"+xuqiuBean.getFenlei1()+"','"+xuqiuBean.getFenlei2()
				+"','"+xuqiuBean.getLingyu()+"','"+xuqiuBean.getLingyuu()
				+"','"+xuqiuBean.getUsehangye()+"','"+xuqiuBean.getJianjie()+"','"+xuqiuBean.getShijian()+"','"+xuqiuBean.getStatus()+"')";
		try{
			state=con.createStatement();
			state.execute(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
	}
	public List<XuqiuBean> list1(){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="";
		sql="select mingcheng from xuqiu";
		List<XuqiuBean> jsxqmc=new ArrayList<XuqiuBean>();
		try{
			state=con.createStatement();
			rs=state.executeQuery(sql);
			XuqiuBean xuqiuBean;
			while(rs.next()){
				xuqiuBean=new XuqiuBean();
				xuqiuBean.setMingcheng(rs.getString("mingcheng"));
				jsxqmc.add(xuqiuBean);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
		return jsxqmc;
	}
	public List<XuqiuBean> list(String username,String[] xx1,String[] typelx,String type1,String[] tj,String[] tj1,String sj1,String sj2){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="";
		String type="";
		sql="select name,mingcheng,contact,daibiao,problem,shijian,status from xuqiu where name='"+username+"'";
		if(type1.equals("0")||type1.equals("1")||type1.equals("2")||type1.equals("3")){
			if(type1.equals("0")) type="已保存";
			else if(type1.equals("1")) type="已提交";
			else if(type1.equals("2")) type="已通过审核";
			else type="未通过审核";
			sql+=" and status='"+type+"'";
			/*if(type1.equals("0")) type="已保存";
			else type="已提交";
			if(type2.equals("")){
				sql+=" and status='"+type+"'";
			}else{
				sql+=" and status='"+type+"' "+ "and mingcheng='"+type2+"'";
			}*/
		}
		/*if(typelx.equals("0")){
			sql+="and contact like '%"+lxr+"%'";
		}else{
			if(!lxr.equals("")){
				sql+="and contact='"+lxr+"'";
			}else{
				sql+="";
			}
		}*/
		else{
			if(tj!=null){
				for(int i=0;i<tj.length;i++){
					if(tj1[i]=="")
						sql+="";
					else{
						if(typelx[i].equals("like"))
							tj1[i]="%"+tj1[i]+"%";
						//System.out.println(xx1[i]);
						sql+=" "+xx1[i]+" "+tj[i]+" "+typelx[i]+"'"+tj1[i]+"' ";
					}
				}
				/*if(type2[0]!=""){
					sql+=" and mingcheng='"+type2+"'";
				}*/
			}
		}
		if(!sj1.equals("")&&!sj2.equals("")){
			sql+="and shijian between '"+sj1+"' and '"+sj2+"'";
		}
		List<XuqiuBean> xuqiuBean1=new ArrayList<XuqiuBean>();
		try{
			state=con.createStatement();
			rs=state.executeQuery(sql);
			XuqiuBean xuqiuBean;
		    while(rs.next()){
		        xuqiuBean=new XuqiuBean();
				xuqiuBean.setContact(rs.getString("contact"));
				xuqiuBean.setName(rs.getString("name"));
				xuqiuBean.setMingcheng(rs.getString("mingcheng"));
				xuqiuBean.setDaibiao(rs.getString("daibiao"));
				xuqiuBean.setProblem(rs.getString("problem"));
				xuqiuBean.setShijian(rs.getString("shijian"));
				xuqiuBean.setStatus(rs.getString("status"));
				xuqiuBean1.add(xuqiuBean);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
		return xuqiuBean1;
	}
	public XuqiuBean chakan(String xuqiuname){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="";
		XuqiuBean xuqiuBean=null;
		sql="select * from xuqiu where mingcheng='"+xuqiuname+"'";
		try{
			state=con.createStatement();
			rs=state.executeQuery(sql);
			if(rs.next()){
				xuqiuBean=new XuqiuBean();
				xuqiuBean.setName(rs.getString("name"));
				xuqiuBean.setJigou(rs.getString("jigou"));
				xuqiuBean.setBumen(rs.getString("bumen"));
				xuqiuBean.setTxadd(rs.getString("txadd"));
				xuqiuBean.setDiyu(rs.getString("diyu"));
				xuqiuBean.setDwUrl(rs.getString("dwUrl"));
				xuqiuBean.setEmail(rs.getString("email"));
				xuqiuBean.setDaibiao(rs.getString("daibiao"));
				xuqiuBean.setYoubian(rs.getString("youbian"));
				xuqiuBean.setContact(rs.getString("contact"));
				xuqiuBean.setPhone(rs.getString("phone"));
				xuqiuBean.setTelphone(rs.getString("telphone"));
				xuqiuBean.setChuanzhen(rs.getString("chuanzhen"));
				xuqiuBean.setShuxing(rs.getString("shuxing"));
				xuqiuBean.setMingcheng(rs.getString("mingcheng"));
				xuqiuBean.setStart(rs.getString("start"));
				xuqiuBean.setFinish(rs.getString("finish"));
				xuqiuBean.setProblem(rs.getString("problem"));
				xuqiuBean.setFenlei(rs.getString("fenlei"));
				xuqiuBean.setFenlei1(rs.getString("fenlei1"));
				xuqiuBean.setFenlei2(rs.getString("fenlei2"));
				xuqiuBean.setGuanjian(rs.getString("guanjian"));
				xuqiuBean.setZijin(rs.getString("zijin"));
				xuqiuBean.setLeixing(rs.getString("leixing"));
				if(rs.getString("lingyu")==null||rs.getString("lingyu")==""){
					xuqiuBean.setLingyu(rs.getString("lingyuu"));
				}else{
					xuqiuBean.setLingyu(rs.getString("lingyu"));
				}
				xuqiuBean.setUsehangye(rs.getString("usehangye"));
				xuqiuBean.setJianjie(rs.getString("jianjie"));
				xuqiuBean.setShijian(rs.getString("shijian"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
		return xuqiuBean;
	}
	public List<XuqiuBean> findbyType(int typeid){
		String sql = "select * from xuqiu where academictype='" + typeid + "'";
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		List<XuqiuBean> demandBeans = new ArrayList<XuqiuBean>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				XuqiuBean demandBean = new XuqiuBean();
				
				demandBean.setName("name");
				demandBean.setMingcheng(rs.getString("mingcheng"));
				demandBean.setStart(rs.getString("start"));
				demandBean.setFinish(rs.getString("finish"));
				demandBean.setTelphone(rs.getString("telphone"));
				demandBean.setStatus(rs.getString("status"));
				demandBean.setLeixing(rs.getString("leixing"));
				demandBeans.add(demandBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs,st,conn);
		}
		return demandBeans;
	}
	public List<DemandtypeBean> gettype(int parentId){
		String sql="select * from academictype where parentid='"+parentId+"'";
		List<DemandtypeBean> list=new ArrayList<>();
		Connection conn=DBUtil.getConnection();
		Statement st=null;
		ResultSet rs=null;
		try{
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			DemandtypeBean demandtypeBean=null;
			while(rs.next())
			{	int id=rs.getInt("id");
				String name=rs.getString("name");
				demandtypeBean=new DemandtypeBean(id,name,parentId);
				list.add(demandtypeBean);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBUtil.close(rs,st,conn);
		}
	return list;
	}
	public void delete(String xqname){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="";
		sql="delete from xuqiu where mingcheng='"+xqname+"'";
		try{
			state=con.createStatement();
			state.execute(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
	}
	public List<XuqiuBean> tree1(String username){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="";
		sql="select leixing,fenlei,fenlei1,fenlei2 from xuqiu where name='"+username+"'";
		List<XuqiuBean> xkfl=new ArrayList<XuqiuBean>();
		try{
			state=con.createStatement();
			rs=state.executeQuery(sql);
			XuqiuBean xuqiuBeanxk;
			while(rs.next()){
				xuqiuBeanxk=new XuqiuBean();
				xuqiuBeanxk.setLeixing(rs.getString("leixing"));
				xuqiuBeanxk.setFenlei(rs.getString("fenlei"));
				xuqiuBeanxk.setFenlei1(rs.getString("fenlei1"));
				xuqiuBeanxk.setFenlei2(rs.getString("fenlei2"));
				xkfl.add(xuqiuBeanxk);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
		return xkfl;
	}
	public List<XuqiuBean> shenhe1(String username,String xqname){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="";
		sql="select name,mingcheng,contact,daibiao,problem,shijian,status from xuqiu where mingcheng='"+xqname+"'";
		List<XuqiuBean> xuqiuBean12=new ArrayList<XuqiuBean>();
		try{
			state=con.createStatement();
			rs=state.executeQuery(sql);
			XuqiuBean xuqiuBean;
		    while(rs.next()){
		        xuqiuBean=new XuqiuBean();
				xuqiuBean.setContact(rs.getString("contact"));
				xuqiuBean.setName(rs.getString("name"));
				xuqiuBean.setMingcheng(rs.getString("mingcheng"));
				xuqiuBean.setDaibiao(rs.getString("daibiao"));
				xuqiuBean.setProblem(rs.getString("problem"));
				xuqiuBean.setShijian(rs.getString("shijian"));
				xuqiuBean.setStatus(rs.getString("status"));
				xuqiuBean12.add(xuqiuBean);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
		return xuqiuBean12;
	}
	public void tg(String xqname,String status){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="";
		sql="update xuqiu set status='"+status+"' where mingcheng='"+xqname+"'";
		try{
			state=con.createStatement();
			state.execute(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs, state,con); 
	}
}

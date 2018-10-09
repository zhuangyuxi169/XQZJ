package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.AdminBean;
import bean.QuanxianBean;
import dbutil.DBUtil;

public class AdminDao {
	private Connection con,con2;
	private static Statement state,state2;
	private static ResultSet rs,rs2;
	public AdminDao(){};
	
	public boolean check(String username){
		boolean flag=true;
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="select name from userr where name='"+username+"'";
		try{
			state=con.createStatement();
			rs=state.executeQuery(sql);
			if(rs.next()){
				flag=false;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
		return flag;
	}
	public AdminBean login(String username,String password){
		con=DBUtil.getConnection();
		con2=DBUtil.getConnection();
		state=null;
		state2=null;
		rs=null;
		rs2=null;
		AdminBean adminBean=null;
		String sql="select name,juese from userr where name='"+username+"'";
		try{
			state=con.createStatement();
			rs=state.executeQuery(sql);
			if(rs.next()){
				String sql3="select * from quanxian where name='"+rs.getString("name")+"'";
				state2=con2.createStatement();
				rs2=state2.executeQuery(sql3);
				QuanxianBean quanxianBean=null;
				 if(rs2.next()){
					 quanxianBean=new QuanxianBean();
					 quanxianBean.setName(rs2.getString("name"));
					 quanxianBean.setTianbao(rs2.getString("tianbao"));
					 quanxianBean.setShenhe(rs2.getString("shenhe"));
					 quanxianBean.setLiulan(rs2.getString("liulan"));
					 quanxianBean.setChaxun(rs2.getString("chaxun"));
					 quanxianBean.setGerenxinxi(rs2.getString("gerenxinxi"));
					 quanxianBean.setQuanxianguanli(rs2.getString("quanxianguanli"));
					 quanxianBean.setYonghu(rs2.getString("yonghu"));
				 }
				 DBUtil.close(rs2, state2,con2);
				adminBean=new AdminBean();
				adminBean.setName(rs.getString("name"));
				adminBean.setPassword(password);
				adminBean.setQuanxianBean(quanxianBean);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs, state,con);
		return adminBean;
	}
	public void zhuce(AdminBean adminBean){
		con=DBUtil.getConnection();
		con2=DBUtil.getConnection();
		state2=null;
		state=null;
		rs=null;
		rs2=null;
		String js=null;
		if(adminBean.getUsername().length()<=7)
			js="填报员";
		else if(adminBean.getUsername().length()<=9)
			js="审核员";
		else
			js="管理员";
		String sql="insert into userr(name,password,mima,"
				+"xingming,sex,area,danwei,fangxiang,hangye,teach"
				+",zhicheng,telarea,youbian,tel,phone,email,qq,"
				+"msn,juese) values('"+adminBean.getUsername()+"','"+adminBean.getPassword()
				+"','"+adminBean.getMima()+"','"+adminBean.getName()
				+"','"+adminBean.getSex()+"','"+adminBean.getArea()
				+"','"+adminBean.getDanwei()+"','"+adminBean.getFangxiang()
				+"','"+adminBean.getHangye()+"','"+adminBean.getTeach()
				+"','"+adminBean.getZhicheng()+"','"+adminBean.getTelarea()
				+"','"+adminBean.getYoubian()+"','"+adminBean.getTel()
				+"','"+adminBean.getPhone()+"','"+adminBean.getEmail()
				+"','"+adminBean.getQq()+"','"+adminBean.getMsn()+"','"+js+"')";
		try{
			String sql2=null;
			if(js.equals("填报员")){
				sql2="insert into quanxian(name,tianbao,shenhe,liulan,chaxun,gerenxinxi,quanxianguanli,yonghu)"
						+ " values('"+adminBean.getUsername()+"','"+"1"+"','"+"0"+"','"+"1"+"','"+"1"+"','"+"1"+"','"+"0"+"','"+"0"+"')";
				}
				else if(js.equals("审核员")){
					sql2="insert into quanxian(name,tianbao,shenhe,liulan,chaxun,gerenxinxi,quanxianguanli,yonghu)"
							+ " values('"+adminBean.getUsername()+"','"+"0"+"','"+"1"+"','"+"1"+"','"+"1"+"','"+"1"+"','"+"0"+"','"+"0"+"')";
				}
				else if(js.equals("管理员")){
					sql2="insert into quanxian(name,tianbao,shenhe,liulan,chaxun,gerenxinxi,quanxianguanli,yonghu)"
							+ " values('"+adminBean.getUsername()+"','"+"0"+"','"+"0"+"','"+"1"+"','"+"1"+"','"+"1"+"','"+"1"+"','"+"1"+"')";
				}
			try{
				state2=con2.createStatement();
				state2.execute(sql2);
			}catch(SQLException e){
				e.printStackTrace();
			}
			DBUtil.close(rs2,state2,con2);

			state=con.createStatement();
			state.execute(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
	}
	
	public void updatepassword(String username,String password){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="update userr set password='"+password+"',mima='"+password+"' where name='"+username+"'";
		try{
			state=con.createStatement();
			state.execute(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs, state,con); 
	}
	public AdminBean userinfo(String username){
		con=DBUtil.getConnection();
		state=null;
		rs=null;
		String sql="";
		AdminBean adminBean=null;
		sql="select * from userr where name='"+username+"'";
		try{
			state=con.createStatement();
			rs=state.executeQuery(sql);
			if(rs.next()){
				adminBean=new AdminBean();
				adminBean.setUsername(rs.getString("name"));
				adminBean.setName(rs.getString("xingming"));
				adminBean.setSex(rs.getString("sex"));
				adminBean.setArea(rs.getString("area"));
				adminBean.setDanwei(rs.getString("danwei"));
				adminBean.setTeach(rs.getString("teach"));
				adminBean.setTelarea(rs.getString("telarea"));
				adminBean.setYoubian(rs.getString("youbian"));
				adminBean.setTel(rs.getString("tel"));
				adminBean.setPhone(rs.getString("phone"));
				adminBean.setEmail(rs.getString("email"));
				adminBean.setQq(rs.getString("qq"));
				adminBean.setMsn(rs.getString("msn"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs,state,con);
		return adminBean;
	}
}

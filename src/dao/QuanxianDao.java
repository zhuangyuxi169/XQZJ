package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.QuanxianBean;
import bean.AdminBean;
import dbutil.DBUtil;

public class QuanxianDao {
	private static Connection con;
	private static Statement state;
	private static ResultSet rs;
	public QuanxianDao(){};
	
	public List<QuanxianBean> list(){
		con = DBUtil.getConnection();
		state = null;
		rs = null;
		String sql="select * from quanxian";
		List<QuanxianBean> quanxianBean=new ArrayList<QuanxianBean>();
		try{
			state = con.createStatement();
			rs = state.executeQuery(sql);
			QuanxianBean quanxianBean1;
			while(rs.next())
			{
				
				quanxianBean1=new QuanxianBean();
				quanxianBean1.setName(rs.getString("name"));
				quanxianBean1.setTianbao(rs.getString("tianbao"));
				quanxianBean1.setShenhe(rs.getString("shenhe"));
				quanxianBean1.setLiulan(rs.getString("liulan"));
				quanxianBean1.setChaxun(rs.getString("chaxun"));
				quanxianBean1.setGerenxinxi(rs.getString("gerenxinxi"));
				quanxianBean1.setQuanxianguanli(rs.getString("quanxianguanli"));
				quanxianBean1.setYonghu(rs.getString("yonghu"));
				quanxianBean.add(quanxianBean1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, state, con);
		}
		
		return quanxianBean;
	}
	public void updateqx(String name,String tianbao,String shenhe,String liulan,String chaxun,String gerenxinxi,String quanxianguanli,String yonghu){
		con = DBUtil.getConnection();
		state = null;
		rs = null;
		String sql="update quanxian set tianbao='"+tianbao+"',shenhe='"+shenhe+"',liulan='"+liulan+"'"
				+ ",chaxun='"+chaxun+"',gerenxinxi='"+gerenxinxi+"',quanxianguanli='"+quanxianguanli+"'"
						+ ",yonghu='"+yonghu+"' where name='"+name+"'";
		try{
			state=con.createStatement();
			state.execute(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBUtil.close(rs, state,con); 
	}
	public List<QuanxianBean> list1(){
		con = DBUtil.getConnection();
		state = null;
		rs = null;
		String sql="select * from quanxian where tianbao='"+"1"+"'";
		List<QuanxianBean> quanxianBean11=new ArrayList<QuanxianBean>();
		try{
			state = con.createStatement();
			rs = state.executeQuery(sql);
			QuanxianBean quanxianBean1;
			while(rs.next())
			{
				quanxianBean1=new QuanxianBean();
				quanxianBean1.setName(rs.getString("name"));
				quanxianBean11.add(quanxianBean1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, state, con);
		}
		
		return quanxianBean11;
	}
}

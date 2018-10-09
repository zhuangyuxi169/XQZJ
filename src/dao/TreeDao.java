package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bean.TreeInfo;
import dbutil.DBUtil;
public class TreeDao {
	public static List<TreeInfo> retrieveNodeInfos() {
		List<TreeInfo> coll = new ArrayList<TreeInfo>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		TreeInfo info = null;
		String sql = "select * from academictype";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs != null && rs.next()) {
				info = new TreeInfo();
				info.setNodeId(rs.getInt("id"));
				info.setParentId(rs.getInt("parentid"));
				info.setNodeName(rs.getString("name"));
				info.setUrl(rs.getString("url"));
				coll.add(info);
			}
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (ps != null) {
				ps.close();
				ps = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return coll;
	}
	public static String createTreeInfo(List<TreeInfo> alist){
		StringBuffer contents=new StringBuffer();
		contents.append("var Tree = new Array;");//create a array in javascript
		TreeInfo info =null;
		for(int max = alist.size(),i=0;i<max;i++){
			 info = alist.get(i);
			//define elements of array
		    contents.append("Tree[");
			contents.append(i);
			contents.append("]=");
			contents.append("'");
			contents.append(info.getNodeId());
			contents.append("|");
			contents.append(info.getParentId());
			contents.append("|");
			contents.append(info.getNodeName());
			contents.append("|");
			contents.append(info.getUrl()+info.getNodeId());
			contents.append("';");
			
	}
		contents.append("docment.writer(Tree);");
		return contents.toString();
	}	 
}


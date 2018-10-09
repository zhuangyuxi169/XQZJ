package Tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import javax.servlet.jsp.tagext.TagSupport;

import dao.TreeDao;

public class InitTreeTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int doEndTag()throws JspException
	{
		StringBuffer tree=new StringBuffer();
		tree.append("<script type='text/javascript'>");
		tree.append(TreeDao.createTreeInfo(TreeDao.retrieveNodeInfos()));
		tree.append("</script>");
		try{
			pageContext.getOut().println(tree.toString());
		}catch(IOException e){
			e.printStackTrace();
		}
		return super.doEndTag();
	}
	
}

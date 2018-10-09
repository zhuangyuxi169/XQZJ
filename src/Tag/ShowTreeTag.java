package Tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class ShowTreeTag extends TagSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public int doEndTag()throws JspException{
		StringBuffer buffer=showTree();
		try{
			pageContext.getOut().println(buffer.toString());
		}catch(IOException e){
			e.printStackTrace();
		}
		return super.doEndTag();
	}
	public StringBuffer showTree(){
		StringBuffer sb=new StringBuffer();
		sb.append("<div class='tree'>");
		sb.append("<script type='text/javascript'>");
		sb.append("createTree(Tree);");
		sb.append("</script>");
		sb.append("</div>");
		return sb;
	}
}

package Controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.AdminBean;
import dao.AdminDao;

@RequestMapping("/user")
@Controller
public class UserController extends HttpServlet{
	/*
	 * 使用@RequestMapping注解来映射请求的URL
	 * 返回值会通过视图解析器解析为实际的物理视图，对于InternalResourceViewResolver视图解析器会做如下解析：
	 * 通过prefix+returnVal+后缀方式得到实际的物理视图，然后做转发操作
	 */
	private static final long serialVersionUID=1L;
	
	public UserController(){
		super();
	}
	
	@RequestMapping("/login")
	protected void login(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		AdminDao adminDao=new AdminDao();
		PrintWriter out=response.getWriter();  
        HttpSession session = request.getSession();
        //System.out.println("14515");
		if(request.getParameter("codeCheck").equalsIgnoreCase((String) session.getAttribute("randCheckCode"))){
			if(adminDao.login(username, password)!=null){
				out.println("3");
				request.getSession().setAttribute("adminBean", adminDao.login(username, password) );
			}else{
				System.out.println("14515");
				out.println("1");
			}
		}else{
			out.println("2");
		}
	}
	
	@RequestMapping("/reg")
	protected void reg(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String mima=request.getParameter("mima");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String area1=request.getParameter("area1");
		String area2=request.getParameter("area2");
		String area3=request.getParameter("area3");
		String area=null;
		area=area1+area2+area3;
		String danwei=request.getParameter("danwei");
		String fangxiang=request.getParameter("fangxiang");
		String hangye=request.getParameter("hangye");
		String teach=request.getParameter("teach");
		String zhicheng=request.getParameter("zhicheng");
		String telarea=request.getParameter("telarea");
		String youbian=request.getParameter("youbian");
		String tel=request.getParameter("tel");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String qq=request.getParameter("qq");
		String msn=request.getParameter("msn");
		AdminDao adminDao=new AdminDao();
		AdminBean adminBean=new AdminBean();
		adminBean.setUsername(username);
		adminBean.setPassword(password);
		adminBean.setMima(mima);
		adminBean.setName(name);
		adminBean.setSex(sex);
		adminBean.setArea(area);
		adminBean.setDanwei(danwei);
		adminBean.setFangxiang(fangxiang);
		adminBean.setHangye(hangye);
		adminBean.setTeach(teach);
		adminBean.setZhicheng(zhicheng);
		adminBean.setTelarea(telarea);
		adminBean.setYoubian(youbian);
		adminBean.setTel(tel);
		adminBean.setPhone(phone);
		adminBean.setEmail(email);
		adminBean.setQq(qq);
		adminBean.setMsn(msn);
		if(username==""||password==""||mima==""||name==""||sex==""||area==""||danwei==""||fangxiang==""||hangye==""||teach==""||zhicheng==""||telarea==""||youbian==""||tel==""||phone==""||email==""||qq==""||msn==""){
			//System.out.println("asadsadsadsa");
			request.getRequestDispatcher("zhuce.jsp?status=3").forward(request,response);
		}else{
			if(adminDao.check(username)){
				adminDao.zhuce(adminBean);
				response.sendRedirect("zhuce.jsp?status=1");
			}else{
				request.getRequestDispatcher("zhuce.jsp?status=2").forward(request,response);
			}
		}
	}
	
	@RequestMapping("/updatepassword")
	protected void updatepassword(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String password1=request.getParameter("password1");
		String password2=request.getParameter("password2");
		AdminDao adminDao=new AdminDao();
		if(password.equals(password1)){
			adminDao.updatepassword(username, password2);
			AdminBean adminBean=new AdminBean();
			adminBean.setUsername(username);
			adminBean.setPassword(password2);
			response.sendRedirect("updatepassword?status=2");
			request.getSession().setAttribute("adminBean", adminBean);
		}else{
			response.sendRedirect("updatepassword.jsp?status=1");
		}
	}
	@RequestMapping("/info")
	protected void info(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		AdminDao adminDao=new AdminDao();
		String username=request.getParameter("username");
		request.getSession().setAttribute("adminBeans",adminDao.userinfo(username));
		//System.out.print("asas");
		response.sendRedirect("info.jsp?status=1");
	}
}

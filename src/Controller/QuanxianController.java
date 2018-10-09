package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.QuanxianDao;

@RequestMapping("/quanxian")
@Controller
public class QuanxianController extends HttpServlet{
	 private static final long serialVersionUID=1L;
		
	 public QuanxianController(){
		super();
	 }
	 @RequestMapping("/list")
	 protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			QuanxianDao quanxianDao=new QuanxianDao();
			request.getSession().setAttribute("quanxianBean", quanxianDao.list() );
			request.getRequestDispatcher("quanxian.jsp").forward(request, response);
			request.getSession().setAttribute("quanxianBean", null );
	 }
	 @RequestMapping("/updateqx")
	 protected void updateqx(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			QuanxianDao quanxianDao=new QuanxianDao();
			String name=request.getParameter("name");
			String tianbao=request.getParameter("tianbao");
			String shenhe=request.getParameter("shenhe");
			String liulan=request.getParameter("liulan");
			String chaxun=request.getParameter("chaxun");
			String gerenxinxi=request.getParameter("gerenxinxi");
			String quanxianguanli=request.getParameter("quanxianguanli");
			String yonghu=request.getParameter("yonghu");
			quanxianDao.updateqx(name,tianbao,shenhe,liulan,chaxun,gerenxinxi,quanxianguanli,yonghu);
			response.sendRedirect("update.jsp?status=1");
	 }
}

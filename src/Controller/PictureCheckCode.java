package Controller;
import java.awt.BasicStroke;  
import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics;  
import java.awt.Graphics2D;  
import java.awt.geom.AffineTransform;  
import java.awt.geom.Line2D;  
import java.awt.image.BufferedImage;  
import java.io.IOException;  
import java.util.Random;  
  
import javax.imageio.ImageIO;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  
/** 
 *验证码生成与更新 
 */  
@WebServlet("/pictureCheckCode")  
public class PictureCheckCode extends HttpServlet {  
  
    private static final long serialVersionUID = 1L;  
      
  
    /* 该方法主要作用是获得随机生成的颜�? */  
    public Color getRandColor(int s, int e) {  
        Random random = new Random();  
        if (s > 255)  
            s = 255;  
        if (e > 255)  
            e = 255;  
        int r, g, b;  
        r = s + random.nextInt(e - s); // 随机生成RGB颜色中的r�?  
        g = s + random.nextInt(e - s); // 随机生成RGB颜色中的g�?  
        b = s + random.nextInt(e - s); // 随机生成RGB颜色中的b�?  
        return new Color(r, g, b);  
    }  
      
    private Random r = new Random();  
      
    // 随机字符集合中不包括0和o，O�?1和l，因为这些不易区�?   
    private String codes = "23456789abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYXZ";    
    private char randomChar() {    
        int index = r.nextInt(codes.length());    
        return codes.charAt(index);    
    }   
  
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        doPost(request, response);  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
  
        request.setCharacterEncoding("UTF-8");  
        response.setCharacterEncoding("UTF-8");  
          
        // 设置不缓存图�?  
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "No-cache");  
        response.setDateHeader("Expires", 0);  
          
        // 指定生成的响应图�?,�?定不能缺少这句话,否则错误.  
        response.setContentType("image/jpeg");  
        int width = 80, height = 30; // 指定生成验证码的宽度和高�?  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); // 创建BufferedImage对象,其作用相当于�?图片  
        Graphics g = image.getGraphics(); // 创建Graphics对象,其作用相当于画笔  
        Graphics2D g2d = (Graphics2D) g; // 创建Grapchics2D对象  
          
        Random random = new Random();  
        Font mfont = new Font("Times New Roman", Font.BOLD, 18); // 定义字体样式  
        g.setColor(getRandColor(200, 250));  
        g.fillRect(0, 0, width, height); // 绘制背景  
        g.setFont(mfont); // 设置字体  
        g.setColor(getRandColor(180, 200));  
  
        // 绘制50条颜色和位置全部为随机产生的线条,该线条为2f  
        for (int i = 0; i < 50; i++) {  
            int x = random.nextInt(width - 1);  
            int y = random.nextInt(height - 1);  
            int x1 = random.nextInt(6) + 1;  
            int y1 = random.nextInt(12) + 1;  
            BasicStroke bs = new BasicStroke(2f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL); // 定制线条样式  
            Line2D line = new Line2D.Double(x, y, x + x1, y + y1);  
            g2d.setStroke(bs);  
            g2d.draw(line); // 绘制直线  
        }  
          
        //用来保存验证码字符串文本内容    
        StringBuilder sb = new StringBuilder();    
        int []a=new int[4];
        a[0]=15;
        for(int i1=1;i1<4;i1++){
        	a[i1]=a[i1-1]+15;
        }
        int m,index;
        for (int i = 0; i < 4; ++i) {// 随机生成4个字�?    
            String sTemp = String.valueOf(randomChar());  
            sb.append(sTemp);    
              
            Color color = new Color(20 + random.nextInt(110), 20 + random.nextInt(110), random.nextInt(110));  
            g.setColor(color);  
            // 将生成的随机数进行随机缩放并旋转制定角度 PS.建议不要对文字进行缩放与旋转,因为这样图片可能不正常显�?  
            
            /* 将文字旋转制定角�? */  
            Graphics2D g2d_word = (Graphics2D) g;  
            AffineTransform trans = new AffineTransform();
            index = random.nextInt(a.length-1);
            m=a[index];
            trans.rotate((m) * 3.14 / 180, 15 * i + 8, 7); 
            /* 缩放文字 */  
            float scaleSize = random.nextFloat() + 0.8f;  
            if (scaleSize > 1f)  
                scaleSize = 1f;  
            trans.scale(scaleSize, scaleSize);  
            g2d_word.setTransform(trans);  
            g.drawString(sTemp, 15 * i + 18, 14);  
        }  
          
        HttpSession session = request.getSession(true);  
        session.setAttribute("randCheckCode", sb.toString());
        g.dispose(); // 释放g�?占用的系统资�?  
        ImageIO.write(image, "JPEG", response.getOutputStream()); // 输出图片  
    }  
  
}  

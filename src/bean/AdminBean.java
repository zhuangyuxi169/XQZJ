package bean;

public class AdminBean {
	private String name,
				   password,
				   mima,
				   xingming,
				   sex,
				   area,
				   danwei,
				   fangxiang,
				   hangye,
				   teach,
				   zhicheng,
				   telarea,
				   youbian,
				   tel,
				   phone,
				   email,
				   qq,
				   msn;
	private QuanxianBean quanxianBean;
	public AdminBean(){}
	public QuanxianBean getQuanxianBean(){
		return quanxianBean;
	}
	public void setQuanxianBean(QuanxianBean quanxianBean){
		this.quanxianBean=quanxianBean;
	}
	public String getUsername(){
		return name;
	}
	public void setUsername(String username){
		this.name=username;
	}
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public String getMima(){
		return mima;
	}
	public void setMima(String mima){
		this.mima=mima;
	}
	public String getName(){
		return xingming;
	}
	public void setName(String name){
		this.xingming=name;
	}
	public String getSex(){
		return sex;
	}
	public void setSex(String sex){
		this.sex=sex;
	}
	public String getArea(){
		return area;
	}
	public void setArea(String area){
		this.area=area;
	}
	public String getDanwei(){
		return danwei;
	}
	public void setDanwei(String danwei){
		this.danwei=danwei;
	}
	public String getFangxiang(){
		return fangxiang;
	}
	public void setFangxiang(String fangxiang){
		this.fangxiang=fangxiang;
	}
	public String getHangye(){
		return hangye;
	}
	public void setHangye(String hangye){
		this.hangye=hangye;
	}
	public String getTeach(){
		return teach;
	}
	public void setTeach(String teach){
		this.teach=teach;
	}
	public String getZhicheng(){
		return zhicheng;
	}
	public void setZhicheng(String zhicheng){
		this.zhicheng=zhicheng;
	}
	public String getTelarea(){
		return telarea;
	}
	public void setTelarea(String telarea){
		this.telarea=telarea;
	}
	public String getYoubian(){
		return youbian;
	}
	public void setYoubian(String youbian){
		this.youbian=youbian;
	}
	public String getTel(){
		return tel;
	}
	public void setTel(String tel){
		this.tel=tel;
	}
	public String getPhone(){
		return phone;
	}
	public void setPhone(String phone){
		this.phone=phone;
	}
	public String getEmail(){
		return email;
	}
	public void setEmail(String email){
		this.email=email;
	}
	public String getQq(){
		return qq;
	}
	public void setQq(String qq){
		this.qq=qq;
	}
	public String getMsn(){
		return msn;
	}
	public void setMsn(String msn){
		this.msn=msn;
	}
}

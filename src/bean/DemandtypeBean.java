package bean;

public class DemandtypeBean {
	int id;
	String name;
	int parentid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public DemandtypeBean(int id, String name, int parentid) {
		super();
		this.id = id;
		this.name = name;
		this.parentid = parentid;
	}
	@Override
	public String toString() {
		return "DemandtypeBean [id=" + id + ", name=" + name + ", parentid=" + parentid + "]";
	}

	
}

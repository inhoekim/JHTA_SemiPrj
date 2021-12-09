package semi.member.Vo.je;

import java.util.Date;

public class HloginVoje {
	private String id;
	private String pwd;
	private String name;
	private String jnum;
	private String area;
	private int age;
	private Date regdate;
	private int num;
	
	public HloginVoje() {}

	public HloginVoje(String id, String pwd, String name, String jnum, String area, int age, Date regdate, int num) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.jnum = jnum;
		this.area = area;
		this.age = age;
		this.regdate = regdate;
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public String getPwd() {
		return pwd;
	}

	public String getName() {
		return name;
	}

	public String getJnum() {
		return jnum;
	}

	public String getArea() {
		return area;
	}

	public int getAge() {
		return age;
	}

	public Date getRegdate() {
		return regdate;
	}

	public int getNum() {
		return num;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setJnum(String jnum) {
		this.jnum = jnum;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	

}

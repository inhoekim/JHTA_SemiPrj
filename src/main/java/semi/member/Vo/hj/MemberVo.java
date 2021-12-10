package semi.member.Vo.hj;

import java.sql.Date;

public class MemberVo {
	private String hlogin_id;
	private String pwd;
	private String name;
	private String jnum;
	private int age;
	private String area;
	private Date regdate;
	private int num;
	
	public MemberVo() {}

	public MemberVo(String hlogin_id, String pwd, String name, String jnum, int age, String area, Date regdate,
			int num) {
		super();
		this.hlogin_id = hlogin_id;
		this.pwd = pwd;
		this.name = name;
		this.jnum = jnum;
		this.age = age;
		this.area = area;
		this.regdate = regdate;
		this.num = num;
	}

	public String getHlogin_id() {
		return hlogin_id;
	}

	public void setHlogin_id(String hlogin_id) {
		this.hlogin_id = hlogin_id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJnum() {
		return jnum;
	}

	public void setJnum(String jnum) {
		this.jnum = jnum;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
}

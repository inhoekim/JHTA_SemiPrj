package semi.member.Vo.je;

import java.util.Date;

public class BoardVoje {
	private int service_id;
	private String hlogin_id;
	private String title;
	private String content;
	private String pwd;
	private int ref;
	private int lev;
	private int step;
	private Date created_day;
	private Date update_day;
	
	public BoardVoje() {}

	public BoardVoje(int service_id, String hlogin_id, String title, String content, String pwd, int ref, int lev,
			int step, Date created_day, Date update_day) {
		super();
		this.service_id = service_id;
		this.hlogin_id = hlogin_id;
		this.title = title;
		this.content = content;
		this.pwd = pwd;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
		this.created_day = created_day;
		this.update_day = update_day;
	}

	public int getService_id() {
		return service_id;
	}

	public String getHlogin_id() {
		return hlogin_id;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getPwd() {
		return pwd;
	}

	public int getRef() {
		return ref;
	}

	public int getLev() {
		return lev;
	}

	public int getStep() {
		return step;
	}

	public Date getCreated_day() {
		return created_day;
	}

	public Date getUpdate_day() {
		return update_day;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public void setHlogin_id(String hlogin_id) {
		this.hlogin_id = hlogin_id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public void setCreated_day(Date created_day) {
		this.created_day = created_day;
	}

	public void setUpdate_day(Date update_day) {
		this.update_day = update_day;
	}
	
}

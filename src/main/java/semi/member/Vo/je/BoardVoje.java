package semi.member.Vo.je;

import java.util.Date;

public class BoardVoje {
	private int service_id;
	private String writer;
	private String title;
	private String content;
	private String pwd;
	private int ref;
	private int lev;
	private int step;
	private Date created_day;
	private Date updated_day;

	

	public BoardVoje() {}

	public BoardVoje(int service_id, String writer, String title, String content, String pwd, int ref, int lev,
			int step, Date created_day, Date updated_day) {
		super();
		this.service_id = service_id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.pwd = pwd;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
		this.created_day = created_day;
		this.updated_day = updated_day;
	}

	public int getService_id() {
		return service_id;
	}

	public String getWriter() {
		return writer;
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

	public Date getUpdated_day() {
		return updated_day;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public void setwriter(String writer) {
		this.writer = writer;
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

	public void setUpdated_day(Date update_day) {
		this.updated_day = update_day;
	}
	
}

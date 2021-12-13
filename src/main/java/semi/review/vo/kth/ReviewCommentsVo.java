package semi.review.vo.kth;

import java.sql.Date;

public class ReviewCommentsVo {
	private int comment_id;
	private int review_id;
	private String hlogin_id;
	private String content;
	private int ref;
	private int lev;
	private int step;
	private int read;
	private Date created_day;
	
	public ReviewCommentsVo(int comment_id, int review_id, String hlogin_id, String content, int ref, int lev, int step,
			int read, Date created_day) {
		this.comment_id = comment_id;
		this.review_id = review_id;
		this.hlogin_id = hlogin_id;
		this.content = content;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
		this.read = read;
		this.created_day = created_day;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getHlogin_id() {
		return hlogin_id;
	}

	public void setHlogin_id(String hlogin_id) {
		this.hlogin_id = hlogin_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String connent) {
		this.content = connent;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	public Date getCreated_day() {
		return created_day;
	}

	public void setCreated_day(Date created_day) {
		this.created_day = created_day;
	}
	
}

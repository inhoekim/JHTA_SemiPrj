package semi.review.vo.kth;

import java.sql.Date;

public class ReviewBoardVo {
	private int review_id;
	private int room_id;
	private String hlogin_id;
	private String title;
	private String content;
	private int rate;
	private int views;
	private int recommend;
	private Date created_day;
	private Date updated_day;
	
	public ReviewBoardVo() {
	}

	public ReviewBoardVo(int review_id, int room_id, String hlogin_id, String title, String content, int rate, int views, int recommend,
			Date created_day, Date updated_day) {
		this.review_id = review_id;
		this.room_id = room_id;
		this.hlogin_id = hlogin_id;
		this.title = title;
		this.content = content;
		this.rate = rate;
		this.views = views; 
		this.recommend = recommend;
		this.created_day = created_day;
		this.updated_day = updated_day;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getHlogin_id() {
		return hlogin_id;
	}

	public void setHlogin_id(String hlogin_id) {
		this.hlogin_id = hlogin_id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public Date getCreated_day() {
		return created_day;
	}

	public void setCreated_day(Date created_day) {
		this.created_day = created_day;
	}

	public Date getUpdated_day() {
		return updated_day;
	}

	public void setUpdated_day(Date updated_day) {
		this.updated_day = updated_day;
	}
	
}

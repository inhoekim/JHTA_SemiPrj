package semi.img_file.vo.kth;

import java.sql.Date;

public class ImgFileVo {
	private int file_id;
	private int review_id;
	private String type;
	private String org_name;
	private String src_name;
	private Date created_day;
	
	public ImgFileVo(int file_id, int review_id, String type, String org_name, String src_name, Date created_day) {
		this.file_id = file_id;
		this.review_id = review_id;
		this.type = type;
		this.org_name = org_name;
		this.src_name = src_name;
		this.created_day = created_day;
	}

	public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	public String getSrc_name() {
		return src_name;
	}

	public void setSrc_name(String src_name) {
		this.src_name = src_name;
	}

	public Date getCreated_day() {
		return created_day;
	}

	public void setCreated_day(Date created_day) {
		this.created_day = created_day;
	}
	
}

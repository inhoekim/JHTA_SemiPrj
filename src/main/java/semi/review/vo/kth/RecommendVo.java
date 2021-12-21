package semi.review.vo.kth;

public class RecommendVo {
	private int rec_id;
	private int review_id;
	private int thumb_up;
	private int thumb_down;
	
	public RecommendVo(int rec_id, int review_id, int thumb_up, int thumb_down) {
		this.rec_id = rec_id;
		this.review_id = review_id;
		this.thumb_up = thumb_up;
		this.thumb_down = thumb_down;
	}

	public int getRec_id() {
		return rec_id;
	}

	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getThumb_up() {
		return thumb_up;
	}

	public void setThumb_up(int thumb_up) {
		this.thumb_up = thumb_up;
	}

	public int getThumb_down() {
		return thumb_down;
	}

	public void setThumb_down(int thumb_down) {
		this.thumb_down = thumb_down;
	}
	
}

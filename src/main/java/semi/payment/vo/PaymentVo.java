package semi.payment.vo;

public class PaymentVo {
	private int payment_id;
	private int reserve_id;
	private int method;
	private int payment;
	private int statement;
	
	public PaymentVo(int payment_id, int reserve_id, int method, int payment, int statement) {
		super();
		this.payment_id = payment_id;
		this.reserve_id = reserve_id;
		this.method = method;
		this.payment = payment;
		this.statement = statement;
	}

	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public int getReserve_id() {
		return reserve_id;
	}

	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}

	public int getMethod() {
		return method;
	}

	public void setMethod(int method) {
		this.method = method;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getStatement() {
		return statement;
	}

	public void setStatement(int statement) {
		this.statement = statement;
	}
}
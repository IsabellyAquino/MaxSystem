package modelo;

/**
 * Esta classe modelo (JavaBean) representa uma entidade de Javabean.
 *
 */

public class JavaBeans {

	private int id;
	private String date;
	private String time;
	private String apartamento;

	public JavaBeans() {
		super();
	}
	
	public JavaBeans(String apartamento) {
		super();

		this.apartamento = apartamento;
	}

	public JavaBeans(String date, String time, String apartamento) {
		super();

		this.date = date;
		this.time = time;
		this.apartamento = apartamento;
	}
	
	public JavaBeans(int id, String date, String time, String apartamento) {
		super();

		this.id = id;
		this.date = date;
		this.time = time;
		this.apartamento = apartamento;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getApartamento() {
		return apartamento;
	}

	public void setApartamento(String apartamento) {
		this.apartamento = apartamento;
	}
	
}

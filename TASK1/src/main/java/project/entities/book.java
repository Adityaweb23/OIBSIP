package project.entities;

public class book {

	private String tname;
	private int tid;
	private String date;
	private String classs;
	private String depart;
	private String destiny;
	private int uid;
	
	

public book() {
	
		super();
		
		this.tname = "null";
		this.tid = 00;
		this.date = "null";
		this.classs = "null";
		this.depart = "null";
		this.destiny = "null";
		this.uid=00;
	
}
	
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getClasss() {
		return classs;
	}
	public void setClasss(String classs) {
		this.classs = classs;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	public String getDestiny() {
		return destiny;
	}
	public void setDestiny(String destiny) {
		this.destiny = destiny;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public book(String tname,int tid,String date,String classs,String depart,String destiny,int uid) {
		super();
		this.tname = tname;
		this.tid = tid;
		this.date = date;
		this.classs = classs;
		this.depart = depart;
		this.destiny = destiny;
		this.uid=uid;
	}
}

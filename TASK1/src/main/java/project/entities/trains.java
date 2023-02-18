package project.entities;

public class trains {

	private int pid;
	private String ptitle;
	
	public trains() {
		
	}

	public trains(String ptitle) {
		super();
		this.ptitle = ptitle;
	}

	public trains(int pid, String ptitle) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	
}

package project.dao;



import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.entities.trains;


public class trainDao {
	private Connection con;
	public trainDao(Connection con) {
		this.con=con;
	}
	
	public ArrayList<trains> gettrains(){
		ArrayList<trains> al=new ArrayList<trains>();
		try {
			String q="select * from trains";
			PreparedStatement pst=con.prepareStatement(q);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				trains p=new trains();
				p.setPid(rs.getInt("trainid"));
				p.setPtitle(rs.getString("name"));
				al.add(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	public ArrayList<trains> gettrainssbyId(int id){
		ArrayList<trains> al=new ArrayList<trains>();
		try {
			String q="select * from trains where trainid=?";
			PreparedStatement pst=con.prepareStatement(q);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				trains p=new trains();
				p.setPid(rs.getInt("trainid"));
				p.setPtitle(rs.getString("name"));
				al.add(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public trains gettrainsById(int i) {
		trains p=new trains();
		try {
			String q="select * from trains where trainid=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setInt(1, i);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				p.setPid(rs.getInt("trainid"));
				p.setPtitle(rs.getString("name"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
}

package project.dao;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;

import project.entities.book;
import project.entities.user;

	public class bookDao {
	
		Connection con;
		public bookDao(Connection con) {
			this.con=con;
		}
		
		public boolean saveBook(book train) {
			boolean f=false;
			try {
				String q="insert into book(tid,tname,date,classs,depart,destiny,uid) values(?,?,?,?,?,?,?)";
				PreparedStatement pst=con.prepareStatement(q);
				String tname=train.getTname();
				int tid=train.getTid();
				String date=train.getDate();
				String classs=train.getClasss();
				String depart=train.getDepart();
				String destiny=train.getDestiny();
				int uid=train.getUid();
				pst.setInt(1, tid);
				pst.setString(2, tname);
				pst.setString(3, date);
				pst.setString(4, classs);
				pst.setString(5, depart);
				pst.setString(6, destiny);
				pst.setInt(7, uid);
				pst.executeUpdate();
				f=true;
			}catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}

		
		
		public book getbookingbyuser(int uid) {
			book u=null;
			String q="select * from book where uid=?";
			try {
				PreparedStatement pst=con.prepareStatement(q);
				pst.setInt(1, uid);
				ResultSet rs=pst.executeQuery();
				if(rs.next()) {
					u=new book();
					u.setTid(rs.getInt("tid"));
					u.setTname(rs.getString("tname"));
					u.setDate(rs.getString("date"));
					u.setClasss(rs.getString("classs"));
					u.setDepart(rs.getString("depart"));
					u.setDestiny(rs.getString("destiny"));
					u.setUid(rs.getInt("uid"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			if(u==null)u=new book();
			System.out.println(u.getClasss());
			return u;
		}
		public user getUserbyId(int id){
			user u=null;
			String q="select * from user where id=?";
			try {
				
			PreparedStatement pst=con.prepareStatement(q);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			u=new user();
			u.setId(rs.getInt("id"));
			u.setUname(rs.getString("name"));
			u.setEmail(rs.getString("email"));
			u.setPassword(rs.getString("password"));
			u.setGender(rs.getString("gender"));
			u.setAbout(rs.getNString("about"));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return u;
		}
		public boolean editUser(user user) {
			boolean f=false;
			String q="update user set name=?,email=?,password=?,about=?,gender=? where id=?";
			try {
				PreparedStatement pst= con.prepareStatement(q);
				pst.setString(1, user.getUname());
				pst.setString(2, user.getEmail());
				pst.setString(3, user.getPassword());
				pst.setString(4, user.getAbout());
				pst.setString(5, user.getGender());
				pst.setInt(6, user.getId());
				pst.executeUpdate();
				f=true;
			}catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}
		public boolean deleteBook(int tid,String tname) {
			boolean f=true;
			try {
				String q="delete from book where tid=? and tname=?";
				PreparedStatement pst=con.prepareStatement(q);
				pst.setInt(1, tid);
				pst.setString(2, tname);
						pst.execute();
						f=true;
			}catch(Exception e) {
				e.printStackTrace();
			}
			System.out.println(f);
			return f;
		}
	}

package project.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.dao.bookDao;
import project.dao.userDao;
import project.entities.book;
import project.entities.user;
import project.helper.connectionProvider;

@WebServlet("/bookServlet")
public class bookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public bookServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String tname=request.getParameter("tname");
		int tid=Integer.parseInt(request.getParameter("tid"));
		String date=request.getParameter("date");
		String classs=request.getParameter("class");
		String depart=request.getParameter("depart");
		String destiny=request.getParameter("destiny");
		int uid=Integer.parseInt(request.getParameter("user"));
		book book=new book( tname, tid, date, classs, depart, destiny, uid);
		try {
			
			try {
				bookDao ud=new bookDao(connectionProvider.getConnection());
				if(ud.saveBook(book)) {
					response.sendRedirect("success.jsp");
					out.println("done");
				}else {
					
					response.sendRedirect("errorpage.jsp");
					out.println("someting went wrong");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

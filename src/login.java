

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.glassfish.api.container.RequestDispatcher;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String uname= request.getParameter("uname");
		String pass= request.getParameter("pwd");
		out.println("name inserted"+uname);
		out.println("pass inserted"+pass);
		
		try {
		Connection con = Mydb.initializeDatabase(); 
		  
        // Create a SQL query to insert data into demo table 
        // demo table consists of two columns, so two '?' is used 
		 Statement st = con.createStatement();
       // PreparedStatement st = con 
               //.prepareStatement("select * from user where uname='"+uname+"'and upass'"+pass+"'"); 
		  ResultSet rs;
		 rs = st.executeQuery("select * from user where uname='" + uname + "' and upass='" + pass + "'");
       // PreparedStatement stmt =  con.prepareStatement();
        //stmt.executeUpdate("insert into user (uname,upass,email)values('"+name+"','"+pass+"','"+email+"')");

        // For the first parameter, 
        // get the data using request object 
        // sets the data to st pointer 
        //st.setNString(1, Integer.valueOf(request.getParameter("name"))); 

        // Same for second parameter 
        //st.setString(2, request.getParameter("name")); 
       // st.setString(3, request.getParameter("email"));

        // Execute the insert command using executeUpdate() 
        // to make changes in database 
        //ResultSet rs;
        //rs=st.executeQuery(); 
        if ( rs.next() ) {
            //session.setAttribute("userid", userid);
            System.out.println("welcome " + uname);
            //HttpSession session = request.getSession(true); // reuse existing
			// session if exist
			// or create one
//session.setAttribute("user", uname);
//session.setMaxInactiveInterval(60); // 30 seconds
//response.sendRedirect("home.jsp");
            //out.println("<input type=\"hidden\" id=\"uname\" value="+uname+"> " );
            //out.println("<a href='logout.jsp'>Log out</a>");
            //request.getSession().setAttribute("message", uname);
            //request.setAttribute("message", uname);
            //request.setAttribute("uname", uname);
            // RequestDispatcher dispatcher = request.getRequestDispatcher("/html/ltr/loadfiles.jsp");
        	// dispatcher.forward(request, response); 
        	//request.setAttribute("message", "File Successfully Uploaded...!");
            if (null !=uname && uname.length()>0)
            {
            	 //System.out.println("welcome2 " + uname);
            	request.getSession().setAttribute("uname", uname);
            	
            }
		
        	String redirectURL = "/Pipeline/html/ltr/index.jsp";
            response.sendRedirect(redirectURL); 
        	
            //response.sendRedirect("/Pipeline/html/ltr/index.jsp");
            //response.sendRedirect("succ");
        } else {
        	
        	//RequestDispatcher rd = (RequestDispatcher) request.getRequestDispatcher("index.jsp");
		//	out.println("<font color=red>Either user name or password is wrong.</font>");
			//((javax.servlet.RequestDispatcher) rd).include(request, response);
            //out.println("Invalid password <a href='index.jsp'>try again</a>");
        	//request.setAttribute("message", "Invalid password ..try again!");
        	String names="Invalid password ..try again!";
        	  request.getSession().setAttribute("names", names);
        	 //request.setAttribute("names", names);
        	//String redirectURL = "/Pipeline/html/ltr/index.jsp?message="+message;
        	//response.sendRedirect(redirectURL); 
            response.sendRedirect("/Pipeline/html/ltr/index.jsp?names="+names);
        }

        // Close all the connections 
        st.close(); 
        con.close();  
		//Mydb db = new Mydb();
		//Connection con =  db.getCon();
		
		//Statement stmt =  (Statement) ((java.sql.Connection) con).createStatement();
		//((java.sql.Statement) stmt).executeUpdate("insert into user (uname,upass,email)values('"+name+"','"+pass+"','"+email+"')");
		/*out.println("login  sucessfully");
		out.println("name inserted"+uname);
		out.println("pass inserted"+pass);*/

		} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		
		
		
	}

}

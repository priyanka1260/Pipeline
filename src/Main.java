
import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 
  

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Main
 */
@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request,response);
		PrintWriter out = response.getWriter();
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
	
		//String emailid= (String) request.getSession().setAttribute("emailid",email);
		 
		out.println("name inserted "+name);
		out.println("pass inserted "+pass);
		out.println("email inserted "+email);
		
		request.getSession().setAttribute("email", email);
		
		try {
		Connection con = Mydb.initializeDatabase(); 
		  
        // Create a SQL query to insert data into demo table 
        // demo table consists of two columns, so two '?' is used 
        PreparedStatement st = con 
               .prepareStatement("insert into user (uname,upass,email)values('"+name+"','"+pass+"','"+email+"')"); 
        
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
        st.executeUpdate(); 

        // Close all the connections 
        st.close(); 
        con.close();  
		//Mydb db = new Mydb();
		//Connection con =  db.getCon();
		
		//Statement stmt =  (Statement) ((java.sql.Connection) con).createStatement();
		//((java.sql.Statement) stmt).executeUpdate("insert into user (uname,upass,email)values('"+name+"','"+pass+"','"+email+"')");
		out.println("data inserted sucessfully");
		response.sendRedirect("/Pipeline/html/ltr/index.jsp");
		//out.println("name inserted"+name);
		//out.println("pass inserted"+pass);
		//out.println("email inserted"+email);
		} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}

}

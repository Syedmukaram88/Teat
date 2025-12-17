import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AmstrongChecker extends HttpServlet {
   
  
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html:charset=UTF-8");
        PrintWriter out = response.getWriter();
        

     
        String numberStr = request.getParameter("number");

        if (numberStr != null && !numberStr.isEmpty()) {
            try {
                int number = Integer.parseInt(numberStr);
                int originalNumber = number;
                int sum = 0;
                int numberOfDigits = String.valueOf(number).length();

                int temp = number;
                while (temp > 0) {
                    int digit = temp % 10;
                    sum += Math.pow(digit, numberOfDigits);
                    temp /= 10;
                }

                
                out.println("Result:");
                out.println("The number entered is: " + originalNumber + "");

                if (sum == originalNumber) {
                    out.println("" + originalNumber + " is an Armstrong number.");
                } else {
                    out.println("" + originalNumber + " is not an Armstrong number. ");
                }
                

            } catch (NumberFormatException e) {
                
                out.println("Please enter a valid integer. ");
               
            } finally {
                out.close();
            }
        }
        }
    
}







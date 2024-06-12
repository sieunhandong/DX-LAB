
package controllerITAdmin;

import dal.AdminDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;
import models.Account;

/**
 *
 * @author ADMIN
 */
public class CreateAccount extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AdminDAO adminDao = new AdminDAO();
        String user_id = request.getParameter("user_id");
        String username = request.getParameter("username");
        String role_idStr = request.getParameter("role_id");
        String fullName = request.getParameter("full_name");
        String dobStr = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String phoneNumber = request.getParameter("phone_number");
        String avatar = request.getParameter("avatar");
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("repeatPassword");

        int role_id = Integer.parseInt(role_idStr);
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        try {
            Date dob = dateFormat.parse(dobStr);

            if (!username.endsWith("@fpt.edu.vn") && !username.endsWith("@fe.edu.vn")) {
                request.setAttribute("messErrorUsername", "Username must end with @fpt.edu.vn or @fe.edu.vn.");
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
                return;
            }

            Date now = new Date();
            long ageInMillis = now.getTime() - dob.getTime();
            long age = ageInMillis / (1000L * 60 * 60 * 24 * 365);
            if (age < 18) {
                request.setAttribute("messErrorDob", "You must be at least 18 years old.");
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
                return;
            }

            if (!Pattern.matches("\\d{10}", phoneNumber)) {
                request.setAttribute("messErrorPhone", "Phone number must have 10 digits.");
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
                return;
            }

            if (avatar != null && !avatar.isEmpty()) {
                String mimeType = getServletContext().getMimeType(avatar);
                if (mimeType == null || !mimeType.startsWith("image")) {
                    request.setAttribute("messErrorAvatar", "Avatar must be an image file.");
                    request.getRequestDispatcher("createAccount.jsp").forward(request, response);
                    return;
                }
            }

            if (!password.equals(repeatPassword)) {
                request.setAttribute("messErrorPass", "Password and Re-Password must be the same.");
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
                return;
            }

            if (!password.matches("^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?\":{}|<>])[A-Za-z\\d!@#$%^&*(),.?\":{}|<>]{8,}$")) {
                request.setAttribute("messErrorPass", "Password must be at least 8 characters long, contain at least one uppercase letter and one special character.");
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
                return;
            }

            Account existingAccount = adminDao.searchAccountByUsername(username);
            if (existingAccount != null) {
                request.setAttribute("messErrorUsername", "This username is already registered.");
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
            } else {
                adminDao.addAccountUser(user_id, username, role_id, fullName, dob, gender, phoneNumber, avatar, password);
                request.setAttribute("successMessage", "Account created successfully");
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("successMessage", "Account created unsuccessfully");
            request.getRequestDispatcher("createAccountCandidate.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

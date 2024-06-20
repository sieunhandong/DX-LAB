package controllerMentor;

import dal.MentorDAO;
import models.Certificate;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CertificateControll extends HttpServlet {

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    MentorDAO dao = new MentorDAO();
    String userId = request.getParameter("user_id");

    List<Certificate> certificates = dao.getListCertificate(userId);
    request.setAttribute("certificates", certificates);

    String action = request.getParameter("action");
    if ("add".equals(action)) {
        request.getRequestDispatcher("addCertificate.jsp").forward(request, response);
    } else if ("edit".equals(action)) {
        int cerId = Integer.parseInt(request.getParameter("cer_id"));
        Certificate certificate = dao.getCertificateById(cerId);
        request.setAttribute("certificate", certificate); 
        request.getRequestDispatcher("editCertificate.jsp").forward(request, response);
    } else {
        request.getRequestDispatcher("viewCertificatebyMentor.jsp").forward(request, response);
    }
}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String cerName = request.getParameter("cer_name");
        String issueDateStr = request.getParameter("issue_date");
        String cerCompany = request.getParameter("cer_company");
        String cerImg = request.getParameter("cer_img");
        String cerLink = request.getParameter("cer_link");
        int internId = Integer.parseInt(request.getParameter("intern_id"));
        String senderId = request.getParameter("senderId");
        Date issueDate = Date.valueOf(issueDateStr);

        MentorDAO dao = new MentorDAO();

        String action = request.getParameter("action");
        if (action == null || action.equals("add")) {
            dao.addCertificate(cerName, issueDate, cerCompany, cerImg, cerLink, internId, senderId);
        } else if (action.equals("edit")) {
            int cerId = Integer.parseInt(request.getParameter("cer_id"));
            dao.editCertificate(cerId, cerName, issueDate, cerCompany, cerImg, cerLink, internId, senderId);
        }

        List<Certificate> certificates = dao.getListCertificate(user_id);
        request.setAttribute("certificates", certificates);
        request.setAttribute("user_id", user_id);
        request.getRequestDispatcher("viewCertificatebyMentor.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

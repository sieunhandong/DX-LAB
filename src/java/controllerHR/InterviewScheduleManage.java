/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerHR;

import dal.HRDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import models.Account;
import models.Notifications;
import models.ProjectWithPositions;

/**
 *
 * @author admin
 */
public class InterviewScheduleManage extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InterviewScheduleManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InterviewScheduleManage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        request.setAttribute("interviewScheduleManage", "Yes");
        if (service == null) {
            service = "listAll";
        }
        if (service.equals("listAll")) {
            Account acc = (Account) request.getSession().getAttribute("account");
            String user_id = acc.getUser_id();
            List<Notifications> notification = (new HRDAO()).getAllInterviewScheduleByHR(user_id);
            request.setAttribute("allInterviewSchedule", notification);
            request.getRequestDispatcher("InterviewSchedule.jsp").forward(request, response);
        }
        if (service.equals("requestInsert")) {
            List<ProjectWithPositions> listProject = (new HRDAO()).getAllProjectsWithPositions();
            List<Account> listMentor = (new HRDAO()).getAllMentor();
            request.setAttribute("listMentor", listMentor);
            request.setAttribute("listProject", listProject);
            request.setAttribute("createInterviewSchedule", "createInterviewSchedule");
            request.getRequestDispatcher("InterviewSchedule.jsp").forward(request, response);
        }
        if (service.equals("sendInsertDetail")) {
            String sendId = request.getParameter("send_id");
            String mentorId = request.getParameter("mentor_id");
            String projectCode = request.getParameter("project_code");
            String dateStr = request.getParameter("date");
            String timeStr = request.getParameter("time");

            String message = request.getParameter("message");
            String title = request.getParameter("title");
            String room = request.getParameter("room");

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Time time = Time.valueOf(timeStr);
            try {
                Date dateStart = dateFormat.parse(dateStr);

                HRDAO dao = new HRDAO();
                dao.addInterviewShedule(sendId, mentorId, projectCode, dateStart, time, message, title, room);
                request.setAttribute("InsertDone", "Insert Successful!");
            } catch (ParseException e) {
                request.setAttribute("InsertDone", "Insert failed: Invalid date or time format.");
            } catch (Exception e) {
                request.setAttribute("InsertDone", "Insert failed: " + e.getMessage());
            }

            response.sendRedirect("interviewScheduleManage");
        }
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

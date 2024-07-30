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
import models.InterviewSchedule;

/**
 *
 * @author admin
 */
public class CreateInterviewSchedule extends HttpServlet {

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
        String service = request.getParameter("service");
        request.setAttribute("createInterviewSchedule", "Yes");
        Account acc = (Account) request.getSession().getAttribute("account");
        String user_id = acc.getUser_id();
        HRDAO dao = new HRDAO();

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
            String timePattern = "^([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$";
            try {
                Date currentDate = new Date();
                Date dateStart = dateFormat.parse(dateStr);
                Time time = Time.valueOf(timeStr);

                if (dao.isInterviewScheduleExists(projectCode)) {
                    request.setAttribute("InsertDone", "An interview schedule for this project already exists.");
                    List<InterviewSchedule> list = (new HRDAO()).getAllInterviewScheduleByHR(user_id);
                    request.setAttribute("allInterviewSchedule", list);
                    request.getRequestDispatcher("InterviewSchedule.jsp").forward(request, response);
                    return;
                }
                if (dateStart.before(currentDate)) {
                    request.setAttribute("InsertDone", "The start date cannot be before the current date.");
                    List<InterviewSchedule> list = (new HRDAO()).getAllInterviewScheduleByHR(user_id);
                    request.setAttribute("allInterviewSchedule", list);
                    request.getRequestDispatcher("InterviewSchedule.jsp").forward(request, response);
                    return;
                }
                if (!timeStr.matches(timePattern)) {
                    List<InterviewSchedule> notification = (new HRDAO()).getAllInterviewScheduleByHR(user_id);
                    request.setAttribute("allInterviewSchedule", notification);
                    request.setAttribute("InsertDone", "Create failed: Time format is incorrect! Please use HH:mm:ss format.");
                    request.getRequestDispatcher("InterviewSchedule.jsp").forward(request, response);
                    return;
                }
                // Kiểm tra các ca phỏng vấn trong cùng một ngày
                List<InterviewSchedule> schedulesOnSameDay = dao.getInterviewSchedulesByDate(room, dateStart);
                for (InterviewSchedule schedule : schedulesOnSameDay) {
                    long timeDifference = Math.abs(schedule.getTime().getTime() - time.getTime());
                    if (timeDifference < 5 * 60 * 60 * 1000) { // 5 tiếng = 5 * 60 * 60 * 1000 milliseconds
                        request.setAttribute("InsertDone", "Create failed: Interviews on the same day must be at least 5 hours apart.");
                        List<InterviewSchedule> list = dao.getAllInterviewScheduleByHR(user_id);
                        request.setAttribute("allInterviewSchedule", list);
                        request.getRequestDispatcher("InterviewSchedule.jsp").forward(request, response);
                        return;
                    }
                }

                dao.createInterviewShedule(sendId, mentorId, projectCode, dateStart, time, message, title, room);
                request.setAttribute("InsertDone", "Insert Successful!");
            } catch (ParseException e) {
                request.setAttribute("InsertDone", "Create failed!");
            } catch (Exception e) {
                request.setAttribute("InsertDone", "Create failed: " + e.getMessage());
            }
            List<InterviewSchedule> list = dao.getAllInterviewScheduleByHR(user_id);
            request.setAttribute("allInterviewSchedule", list);
            request.getRequestDispatcher("InterviewSchedule.jsp").forward(request, response);
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

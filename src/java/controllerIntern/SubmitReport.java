package controllerIntern;

import dal.InternDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Servlet implementation class SubmitReport
 */
public class SubmitReport extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InternDao dao = new InternDao();
        String user_id = request.getParameter("user_id");
        int week = Integer.parseInt(request.getParameter("week"));
        String report = request.getParameter("report");
        String reportLink = request.getParameter("report_link");
        String mentorId = request.getParameter("mentor_id");
        String projectCode = request.getParameter("project_code");

        try {
            if (week < 1) {
                request.setAttribute("error", "Week must be a positive number.");
                processRequest(request, response);
                return;
            }

            int intern_id = dao.getInternIdByUserId(user_id);
            if (request.getParameter("edit") != null && request.getParameter("edit").equalsIgnoreCase("edit")) {
               
                dao.editReport(intern_id, week, report, reportLink, mentorId, projectCode);
            } else {
                dao.createReport(intern_id, week, report, reportLink, mentorId, projectCode);
            }
            request.getRequestDispatcher("viewReport").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

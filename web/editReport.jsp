<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Report</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .container {
                margin-top: 20px;
            }
            .form-container {
                margin-top: 20px;
                border: 1px solid #ccc;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <h2>Edit Report</h2>
            <div class="form-container">
                <form action="submitReport" method="post">
                    <input type="hidden" name="user_id" value="${sessionScope.account.user_id}">
                    <input type="hidden" name="action" value="edit">

                    <div class="mb-3">
                        <label for="week" class="form-label">Week:</label>
                        <input type="number" class="form-control" id="week" name="week" value="${report.week}" required>
                    </div>

                    <div class="mb-3">
                        <label for="report" class="form-label">Report:</label>
                        <textarea class="form-control" id="report" name="report" rows="5" required>${report.report}</textarea>
                    </div>

                    <div class="mb-3">
                        <label for="report_link" class="form-label">Report Link:</label>
                        <input type="text" class="form-control" id="report_link" name="report_link" value="${report.reportLink}">
                    </div>

                    <div class="mb-3">
                        <label for="mentor_id" class="form-label">Mentor ID:</label>
                        <input type="text" class="form-control" id="mentor_id" name="mentor_id" value="${report.mentorId}" required>
                    </div>

                    <div class="mb-3">
                        <label for="project_code" class="form-label">Project Code:</label>
                        <input type="text" class="form-control" id="project_code" name="project_code" value="${report.projectCode}" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Update Report</button>

            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-pflPW7sA7WO8MWByxoO2Zx8pJsxwZEqeq2WXDfD7j4N4sqksE+6DQkApU5Fi58O6" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIqKaWPL5SBRO14AOp5L6bL5w5fqLc1LHK/6VqqKnv1PAdOBVzI" crossorigin="anonymous"></script>
    </body>
</html>

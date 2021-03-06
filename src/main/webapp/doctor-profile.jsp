<%@ page import="dto.ClientProfileOutputDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="utility.SessionUtil" %>
<%@ page import="dto.DoctorProfileOutputDTO" %>
<%@ page import="entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="en" xmlns:fb="http://www.w3.org/1999/xhtml" xmlns:g="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport"    content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">

    <title>Nano Medical - Progressive Medical Center</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/gt_favicon.png">

    <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">

    <!-- Custom styles for our template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.css" media="screen" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
    <![endif]-->

    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<% if ((request.getSession(false).getAttribute("role")) != Role.DOCTOR){
    %> <jsp:forward page="status/404.jsp"/> <%
    }%>
<!-- Fixed navbar -->
<jsp:include page="wrapper/nav-bar.jsp"/>
<!-- /.navbar -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="text-left" style="padding-top:100px; font-style: italic">Your Profile</h3>

    </div>
    <div class="panel-body">

        <% Doctor doctor = (Doctor) session.getAttribute("user"); %>
        <table class="table">
            <thead class="thead-inverse">
            <tr>
                <th> </th>
                <th> </th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td><b>First Name</b></td>
                <td><%= doctor.getFirstName() %></td>
            </tr>
            <tr>
                <td><b>Last Name</b></td>
                <td><%= doctor.getLastName() %></td>
            </tr>
            <tr>
                <td><b>Username</b></td>
                <td><%= doctor.getUsername() %> </td>
            </tr>
            <tr>
                <td><b>Worktime</b></td>
                <%--getting normalized string of worktimes--%>
                <%String startTime = doctor.getStartOfWork().getHourOfDay() + ":" + ((String.valueOf(doctor.getStartOfWork().getMinuteOfHour()).length() < 2) ? ("0" + doctor.getStartOfWork().getMinuteOfHour()) : doctor.getStartOfWork().getMinuteOfHour());%>
                <%String endTime = doctor.getEndOfWork().getHourOfDay() + ":" + ((String.valueOf(doctor.getEndOfWork().getMinuteOfHour()).length() < 2) ? ("0" + doctor.getEndOfWork().getMinuteOfHour()) : doctor.getEndOfWork().getMinuteOfHour());%>
                <td><%= startTime + " - " + endTime %> </td>
            </tr>
            <tr>
                <td><b>Max appointment duration</b></td>
                <td><%= ((doctor.getMaxDurationOfAppointment() != 0) ? doctor.getMaxDurationOfAppointment() : "none") %> </td>
            </tr>
            <tr>
                <td>
                    <b>My Appointments  </b>
                </td>
                <td>
                    <table class="google-visualization-table-table">
                        <thead style="color: darkblue">
                        <tr>
                            <th>Doctor</th>
                            <th>Speciality</th>
                            <th>Time</th>
                            <th>Date</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <% DoctorProfileOutputDTO dto = (DoctorProfileOutputDTO) session.getAttribute("dto"); %>
                        <% for (Map.Entry<TimeSlot, Doctor> entry: dto.getSlotDoctorMap().entrySet()){
                        %> <tr>
                            <td><%=entry.getValue().getFullName()%></td>
                            <td><%=entry.getValue().getSpeciality()%></td>
                            <%String startTimeMin = entry.getKey().getStartTime().getMinuteOfHour() + "";%>
                            <td><%=entry.getKey().getStartTime().getHourOfDay() + ":" + ((startTimeMin.length() < 2) ? (startTimeMin + "0") : startTimeMin)%></td>
                            <td><%= entry.getKey().getStartTime().getDayOfMonth()+ "/" + entry.getKey().getStartTime().getMonthOfYear() %></td>
                        </tr> <%
                            }%>
                        </tbody>
                    </table>
                </td>
            </tr>

            </tbody>
        </table>
    </div>
</div>
</body>
<jsp:include page="wrapper/footer.jsp"/>

<script>
    function sendRemove(id) {
        const Url = '${pageContext.request.contextPath}/nano-medical/slot-action';
        const data={
            id:id,
            action:"REMOVE"
        }
        $.post(Url, data, function () {
            alert("Time slot removed");
            location.reload(true);
        });
    }
</script>
<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/headroom.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jQuery.headroom.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</html>

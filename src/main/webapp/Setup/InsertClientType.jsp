<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 05/10/18
  Time: 11.24
  To change this template use File | Settings | File Templates.
--%>
<%@ page info="Inserimento nuova Compagnia" %>
<%@ page session="false" %>
<%@ page buffer="30kb" %>

<jsp:useBean id="adminPanelManager" scope="page" class="bflows.AdminPanelManager"/>
<jsp:setProperty name="adminPanelManager" property="*"/>
<%

    String status = null;
    String message = null;
    boolean complete = false;

    status = request.getParameter("status");

    if (status == null) {
        status = "view";
    }

    if (status.equals("insertClientType")) {
        adminPanelManager.insertClientType();

        if (adminPanelManager.getResult() == 0) {
            complete = true;
        } else {
            status = "view";
        }
    }

    if (adminPanelManager.getResult() == -2) {
        message = adminPanelManager.getErrorMessage();
    }
%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">

    <title>Kozel100</title>
    <link rel="stylesheet" type="text/css" href="/css/common.css">

</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<div class="container col-lg-12">
    <%if (complete){%>
    <div class="jumbotron">
        <h2>Client Type successfully added!</h2>
    </div>
    <%}%>
    <div class="col-sm-10 form-group-lg block center">
        <h1 class="text-center">
            New Client Type
        </h1>
        <form action="../AdminPanel.jsp">

            <button style="float:right" type="submit" value="InsertClientType" class="btn btn-default">
                Back To Panel
            </button>
            </h1>
        </form>
        <form name="adminPanelManager" action="" method="post">
            <div class="form-group">
                <label for="clientTypeName" class="bmd-label-floating">Name</label>
                <input type="text" name="clientTypeName" class="form-control" id="clientTypeName">
                <span class="bmd-help">Insert a new Client Type</span>
            </div>
            <button class="btn btn-default">Cancel</button>
            <button type="submit" class="btn btn-primary btn-raised" onclick="insert(this.form)">Submit</button>
            <input type="hidden" name="status" value="insertClientType"/>
        </form>
    </div>
</div>
</body>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
        integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
        integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
        crossorigin="anonymous"></script>
<script>$(document).ready(function () {
    $('body').bootstrapMaterialDesign();
});</script>
</html>
<script>

    function insert(form) {

        form.action = "InsertClientType.jsp";
        form.submit();
    }

</script>
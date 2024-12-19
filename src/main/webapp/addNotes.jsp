<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 12/18/2024
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="all_js_css.jsp"%>
</head>
<body>
<%@include file="Navbar.jsp"%>
<h2>
    Please fill your note details
</h2>

<%--This the add form--%>

<form action="SaveNoteServlet" method="post">
    <div class="mb-3">
        <label for="title" class="form-label">Note Title</label>
        <input
                name="title"
                required
                type="text"
                class="form-control"
                id="title"
                aria-describedby="titleHelp"/>
    </div>
    <div class="mb-3">
        <label for="content" class="form-label">Note Content</label>
       <textarea
               name="content"
               required
               class="form-control"
               style="height: 300px"
               id="content"
               placeholder="Enter your content here" ></textarea>
    </div>
    <div class="container text-center"><button type="submit" class="btn btn-primary" onclick="">Add Note</button></div>
</form>
</body>
</html>

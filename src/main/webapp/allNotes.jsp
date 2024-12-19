<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="com.helpers.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Notes</title>
    <%@include file="all_js_css.jsp"%>
    <style>
        .card {
            width: 100%;
            max-width: 300px;
            height: auto; /* Automatically adjusts height based on content */
        }
        .card-img-top {
            max-height: 150px;
            object-fit: contain; /* Ensures the image looks good in its container */
        }
        .row {
            gap: 20px; /* Adds spacing between cards */
        }
    </style>
</head>
<body>

    <%@include file="Navbar.jsp"%>

<br>
<h1 class="text-uppercase justify-content-center text-center">All Notes:</h1>
<div class="container text-center">
    <div class="row">
        <%
            SessionFactory sf = FactoryProvider.getFactory();
            Session session1 = sf.openSession();
            Query q = session1.createQuery("from Note");
            List<Note> listOfNote = q.getResultList();
            for (Note note : listOfNote) {
        %>
        <div class="col-12 d-flex justify-content-center align-items-stretch">
            <div class="card">
                <img src="./img/noteImage.png" class="card-img-top p-4" alt="Note Image">
                <div class="card-body">
                    <h5 class="card-title"><%= note.getTitle() %></h5>
                    <p class="card-text"><%= note.getContent() %></p>
                    <a  href="editNote.jsp?note_id=<%=note.getId()%>"  class="btn btn-primary">Edit</a>
                    <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>

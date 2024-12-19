<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helpers.FactoryProvider" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 12/19/2024
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.entities.Note" %>
<html>
<head>
    <title>Title</title>
    <%@include file="all_js_css.jsp"%>
</head>
<body>
    <%@include file="Navbar.jsp"%>
    <div class="container">
        <h2>Edit Note</h2>
    </div>
    <%
        int note_id = Integer.parseInt(request.getParameter("note_id"));
        System.out.println("Note_id: "+note_id);
        Session sess = FactoryProvider.getFactory().openSession();
        Note note =(Note)sess.get(Note.class , note_id );
        System.out.println(note.getContent());

    %>
    <form action="EditNoteServlet" method="post">
        <div class="mb-3">
            <label for="title" class="form-label">Note Title</label>
            <input name="note_id" type="hidden" value="<%=note.getId()%>">
            <input
                    name="title"
                    required
                    type="text"
                    class="form-control"
                    id="title"
                    aria-describedby="titleHelp"
                    value="<%=note.getTitle()%>"
            />
        </div>
        <div class="mb-3">
            <label
                    for="content"
                    class="form-label">Note Content
            </label>
            <textarea
                    name="content"
                    required
                    class="form-control"
                    style="height: 300px"
                    id="content"
                    placeholder="Enter your content here"

            ><%=note.getContent()%></textarea>
        </div>

        <div class="container text-center">
            <button
                    type="submit"
                    class="btn btn-success"
                    onclick="">Save Note</button></div>
    </form>
</body>
</html>

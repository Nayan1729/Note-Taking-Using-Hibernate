package com.servlets;
import com.entities.Note;
import com.helpers.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;

@WebServlet("/EditNoteServlet")
public class EditNoteServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int id = Integer.parseInt(request.getParameter("note_id").trim());
            Session session = FactoryProvider.getFactory().openSession();
            session.beginTransaction();
            Note note = session.get(Note.class, id);
            note.setTitle(title);
            note.setContent(content);
            session.update(note);
            session.getTransaction().commit();
            session.close();

            response.sendRedirect("allNotes.jsp");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

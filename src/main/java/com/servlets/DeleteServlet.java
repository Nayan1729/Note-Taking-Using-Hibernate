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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try{
            int note_id = Integer.parseInt(req.getParameter("note_id").trim());
            System.out.println("inside the delete servlet");
            System.out.println("Note_id: "+note_id);
            Session session = FactoryProvider.getFactory().openSession();
            session.beginTransaction();
            Note note = (Note) session.get(Note.class,note_id);
            session.delete(note);
            session.getTransaction().commit();
            res.sendRedirect("allNotes.jsp");
            session.close();
        }catch (Exception e){

        }
    }
}

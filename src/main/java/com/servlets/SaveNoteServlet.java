package com.servlets;
import com.helpers.FactoryProvider;
import com.entities.Note;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
       try{
           String title = req.getParameter("title");
           String content = req.getParameter("content");

           Note note = new Note(title, content) ;
           System.out.println(note.getId()+" "+note.getAddedDate());

           SessionFactory sf = FactoryProvider.getFactory();
           Session session = sf.openSession();
           Transaction tx = session.beginTransaction();
           session.save(note);
           PrintWriter out = res.getWriter();
           res.setContentType("text/html");
           out.println("<h1 style='text-align:center' >Note saved successfully</h1>");
           out.println("<h1 style='text-align:center'><a href='allNotes.jsp'>View All Notes</h1>");
           tx.commit();
           session.close();

       }catch (Exception e){
            System.out.println(e);
       }
    }
}

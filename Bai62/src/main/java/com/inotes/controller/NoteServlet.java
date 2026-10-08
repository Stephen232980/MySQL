package com.inotes.controller;

import com.inotes.service.NoteManagement;
import com.inotes.strategy.NoteDBStrategy;
import com.inotes.strategy.NoteFileStrategy;
import com.inotes.model.Note;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class NoteServlet extends HttpServlet {
    private NoteManagement noteManagement;

    @Override
    public void init() throws ServletException {
        noteManagement = new NoteManagement();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();

        switch (action) {
            case "/add":
                showAddForm(request, response);
                break;
            case "/delete":
                deleteNote(request, response);
                break;
            case "/switch":
                switchStorage(request, response);
                break;
            default:
                listNotes(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();
        
        if ("/add".equals(action)) {
            addNote(request, response);
        } else {
            doGet(request, response);
        }
    }
    
    private void switchStorage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String type = request.getParameter("type");
        if ("file".equals(type)) {
            noteManagement.setStrategy(new NoteFileStrategy());
            request.getServletContext().setAttribute("storageType", "File text/csv");
        } else {
            noteManagement.setStrategy(new NoteDBStrategy());
            request.getServletContext().setAttribute("storageType", "Cơ sở dữ liệu (MySQL)");
        }
        response.sendRedirect(request.getContextPath() + "/");
    }

    private void listNotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Note> notes = noteManagement.searchNotes(keyword);
        request.setAttribute("notes", notes);
        request.setAttribute("keyword", keyword);
        if (request.getServletContext().getAttribute("storageType") == null) {
            request.getServletContext().setAttribute("storageType", "Cơ sở dữ liệu (MySQL)");
        }
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/add.jsp").forward(request, response);
    }

    private void addNote(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        
        noteManagement.addNote(title, content, typeId);
        response.sendRedirect(request.getContextPath() + "/");
    }

    private void deleteNote(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            noteManagement.deleteNote(id);
        }
        response.sendRedirect(request.getContextPath() + "/");
    }
}


package com.inotes.service;

import com.inotes.model.Note;
import com.inotes.strategy.NoteStrategy;
import com.inotes.strategy.NoteDBStrategy;

import java.util.List;

public class NoteManagement {
    private NoteStrategy strategy;

    public NoteManagement() {
        // Mặc định sử dụng CSDL
        this.strategy = new NoteDBStrategy();
    }

    public void setStrategy(NoteStrategy strategy) {
        this.strategy = strategy;
    }

    public List<Note> searchNotes(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return strategy.findAll();
        }
        return strategy.search(keyword);
    }
    
    public List<Note> findAll() {
        return strategy.findAll();
    }

    public void addNote(String title, String content, int typeId) {
        Note note = new Note(0, title, content, typeId);
        strategy.save(note);
    }
    
    public void updateNote(int id, String title, String content, int typeId) {
        Note note = new Note(id, title, content, typeId);
        strategy.save(note);
    }

    public void deleteNote(int id) {
        strategy.delete(id);
    }
}


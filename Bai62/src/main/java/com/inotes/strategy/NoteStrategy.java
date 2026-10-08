package com.inotes.strategy;

import com.inotes.model.Note;
import java.util.List;

public interface NoteStrategy {
    void save(Note note);
    void delete(int id);
    List<Note> findAll();
    List<Note> search(String keyword);
}


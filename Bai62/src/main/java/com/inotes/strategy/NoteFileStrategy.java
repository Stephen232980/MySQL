package com.inotes.strategy;

import com.inotes.model.Note;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class NoteFileStrategy implements NoteStrategy {
    private static final String FILE_PATH = "notes.csv";
    
    private int getNextId(List<Note> notes) {
        int max = 0;
        for (Note n : notes) {
            if (n.getId() > max) max = n.getId();
        }
        return max + 1;
    }

    private void saveAllToFile(List<Note> notes) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Note n : notes) {
                String title = n.getTitle() != null ? n.getTitle().replace("|", "") : "";
                String content = n.getContent() != null ? n.getContent().replace("|", "").replace("\n", "\\n") : "";
                bw.write(n.getId() + "|" + title + "|" + content + "|" + n.getTypeId());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void save(Note note) {
        List<Note> notes = findAll();
        if (note.getId() == 0) {
            note.setId(getNextId(notes));
            notes.add(note);
        } else {
            for (int i = 0; i < notes.size(); i++) {
                if (notes.get(i).getId() == note.getId()) {
                    notes.set(i, note);
                    break;
                }
            }
        }
        saveAllToFile(notes);
    }

    @Override
    public void delete(int id) {
        List<Note> notes = findAll();
        notes.removeIf(n -> n.getId() == id);
        saveAllToFile(notes);
    }

    @Override
    public List<Note> findAll() {
        List<Note> notes = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return notes;
        
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length >= 4) {
                    Note note = new Note();
                    note.setId(Integer.parseInt(parts[0]));
                    note.setTitle(parts[1]);
                    note.setContent(parts[2].replace("\\n", "\n"));
                    note.setTypeId(Integer.parseInt(parts[3]));
                    
                    switch(note.getTypeId()) {
                        case 1: note.setTypeName("Cá nhân"); break;
                        case 2: note.setTypeName("Công việc"); break;
                        case 3: note.setTypeName("Học tập"); break;
                        default: note.setTypeName("Khác");
                    }
                    notes.add(note);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return notes;
    }

    @Override
    public List<Note> search(String keyword) {
        List<Note> all = findAll();
        List<Note> result = new ArrayList<>();
        if (keyword == null || keyword.trim().isEmpty()) return all;
        String lowerKeyword = keyword.toLowerCase();
        for (Note n : all) {
            if ((n.getTitle() != null && n.getTitle().toLowerCase().contains(lowerKeyword)) ||
                (n.getContent() != null && n.getContent().toLowerCase().contains(lowerKeyword))) {
                result.add(n);
            }
        }
        return result;
    }
}


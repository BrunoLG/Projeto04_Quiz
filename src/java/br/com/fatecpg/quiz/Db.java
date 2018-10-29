package br.com.fatecpg.quiz;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;

public class Db {
   
    public static ArrayList<Question> getQuestions(){
        ArrayList<Question> questions = new ArrayList<>();
        questions.add(new Question ("1+0?", "1", new String[]{"1","2","3","4"}));
        questions.add(new Question ("2+0?", "2", new String[]{"1","2","3","4"}));
        questions.add(new Question ("2+1?", "3", new String[]{"1","2","3","4"}));
        questions.add(new Question ("2+2?", "4", new String[]{"1","2","3","4"}));
        questions.add(new Question ("2-1?", "1", new String[]{"1","2","3","4"}));
        questions.add(new Question ("3-1?", "2", new String[]{"1","2","3","4"}));
        questions.add(new Question ("4-1?", "3", new String[]{"1","2","3","4"}));
        questions.add(new Question ("5-1?", "4", new String[]{"1","2","3","4"}));
        questions.add(new Question ("3-2?", "1", new String[]{"1","2","3","4"}));
        questions.add(new Question ("4-2?", "2", new String[]{"1","2","3","4"}));
        
        Collections.shuffle(questions);
        
        return questions;
    }
    
    private static final ArrayList<Historic> historics = new ArrayList<>();
    
    public static ArrayList<Historic> getHistoric(){
        Calendar cal = Calendar.getInstance();
        
        if (historics.isEmpty()){          
            cal.set(2012, 2, 20, 20, 39);
            historics.add(new Historic ("Bruno", 5.5, cal.getTime()));
            
            cal.set(2016, 2, 10, 10, 23);
            historics.add(new Historic ("Leonardo", 9.0, cal.getTime())); 
            
            cal.set(2012, 2, 10, 5, 3);
            historics.add(new Historic ("Nicolas", 7.0, cal.getTime())); 
            
            cal.set(2017, 9, 14, 15, 29);
            historics.add(new Historic ("Paolla", 6.5, cal.getTime()));
        }
        return historics;
    }
    
    private static final ArrayList<User> users = new ArrayList<>();
    
    public static ArrayList<User> getUser(){
        users.add(new User ("Bruno"));
        users.add(new User ("Paolla"));
        users.add(new User ("Nicolas"));
        users.add(new User ("Anderson"));
        users.add(new User ("Leonardo"));
        return users;
    }
    
    public static boolean searchArrayList(String user) {
        for(User u: Db.getUser()){
            if (u.getUser().equals(user) == true){
                return u.getUser().contains(user);
            }
        }           
        return false;
    }
    
    public static ArrayList<Historic> sortArraybyDate(ArrayList<Historic> historics){
        Collections.sort(historics, new Comparator<Historic>() {
            @Override
            public int compare(Historic h1, Historic h2) {
                if (h1.getDate().after(h2.getDate())) {
                    return -1;
                } else {
                    return 1;
                }
            }
        });    
        return historics;
    }
    
    public static ArrayList<Historic> sortArraybyResult(ArrayList<Historic> historics){
        Collections.sort(historics, new Comparator<Historic>() {
            @Override
            public int compare(Historic h1, Historic h2) {
                if (h1.getResult() > h2.getResult()) {
                    return -1;
                } else if(h1.getResult() == h2.getResult()){ 
                    return 0;
                } else {
                    return 1;
                }
            }
        });  
        return historics;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.quiz;

import java.util.ArrayList;

/**
 *
 * @author BrunoLG <bruno_lg1998@hotmail.com>
 */
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
        
        return questions;
    }
    
    public static ArrayList<Historic> getHistoric(){
        ArrayList<Historic> historics = new ArrayList<>();
        if (historics.isEmpty()){
            historics.add(new Historic ("Bruno", 2.9, "20/02/2019 20:39"));
            historics.add(new Historic ("Leonardo", 9.1, "10/02/2016 10:23"));
            historics.add(new Historic ("Paolla", 6.5, "14/09/2017 15:29"));
        }
        return historics;
    }
    
    public static ArrayList<User> getUser(){
        ArrayList<User> users = new ArrayList<>();
        users.add(new User ("Bruno"));
        users.add(new User ("Paolla"));
        users.add(new User ("Nicolas"));
        users.add(new User ("Anderson"));
        users.add(new User ("Leonardo"));
        return users;
    }
    
    public static boolean searchArrayList(String user) {
        for(User u: Db.getUser()){
            if (u.getUser().contains(user) == true){
                return u.getUser().contains(user);
            }      
        }           
        return false;
    }
}
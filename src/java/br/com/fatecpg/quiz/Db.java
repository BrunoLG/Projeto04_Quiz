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
            historics.add(new Historic ("Bruno", "2,9", "20/02/2019 20:39"));
        }
        return historics;
    }
    
    public static ArrayList<User> getUser(){
        ArrayList<User> users = new ArrayList<>();
        if (users.isEmpty()){
            users.add(new User ("Bruno", "123"));
            users.add(new User ("Paolla", "123"));
            users.add(new User ("Nicolas", "123"));
            users.add(new User ("Anderson", "123"));
            users.add(new User ("Leonardo", "123"));
        }
        return users;
    }
}

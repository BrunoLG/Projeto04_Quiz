package br.com.fatecpg.quiz;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

public class Historic {
    private String user;
    private double result;
    private Date date;

    public Historic(String user, double result, Date date) {
        this.user = user;
        this.result = result;
        this.date = date;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

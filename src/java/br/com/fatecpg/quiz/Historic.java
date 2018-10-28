/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.quiz;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author BrunoLG <bruno_lg1998@hotmail.com>
 */
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
}

package br.com.fatecpg.quiz;

public class User {
    private String user;

    public User(String user) {
        this.user = user;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
    public static boolean searchUser(String user) {
        for(User u: Db.getUser()){
            if (u.getUser().equals(user)){
                return true;
            }
        }           
        return false;
    }
}

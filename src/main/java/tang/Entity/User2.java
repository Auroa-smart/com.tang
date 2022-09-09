package tang.Entity;

public class User2 {
    private int user_id;
    private String user_name;
    private String password;
    private int role;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String toString(){
        return "user_id:"+user_id+" user_name:"+user_name+" password:"+password+" role:"+role;

    }
}

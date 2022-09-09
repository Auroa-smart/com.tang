package tang.Entity;

public class User {
    private int uId;
    private String uName;
    private String uPassword;
    private String ucreateTime;

    private int uRole;

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getucreateTime() {
        return ucreateTime;
    }

    public void setucreateTime(String ucreateTime) {
        this.ucreateTime = ucreateTime;
    }

    public int getuRole(){return uRole;}
    public void setuRole(int role){this.uRole=role;}

    @Override
    public String toString() {
        return "uid:"+uId+"username:"+uName+"userpassword:"+uPassword+
                "usercreatetime:"+ucreateTime+" userRole:"+uRole;
    }
}

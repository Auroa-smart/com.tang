package tang.Entity;

public class Student {
    private String sId;
    private String sName;
    private String sSex;
    private String sPhone;


    public String getsId() {
        return sId;
    }

    public void setsId(String sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getsSex() {
        return sSex;
    }

    public void setsSex(String sex) {
        this.sSex = sex;
    }

    public String getsPhone() {
        return sPhone;
    }

    public void setsPhone(String sPhone) {
        this.sPhone = sPhone;
    }

    @Override
    public String toString() {
        return "Student{"+"id="+sId+" name="+sName+" sex="+sSex
                +" phone="+sPhone+"}";
    }
}

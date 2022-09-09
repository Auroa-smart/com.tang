package tang.Entity;

public class Comment {
    private  int comment_id;
   private String comment_name;
    private  String content;
   private  int parent_id;

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_name() {
        return comment_name;
    }

    public void setComment_name(String comment_name) {
        this.comment_name = comment_name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }

    public String toString(){
        return " comment_id:"+comment_id+" comment_name:"+
                comment_name+" content:"+content+" parent_id:"+parent_id;
    }
}

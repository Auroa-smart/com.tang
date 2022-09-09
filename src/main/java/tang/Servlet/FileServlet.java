package tang.Servlet;

import tang.Service.File.FileService;
import tang.Service.File.FileServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //读取总页数
        int totalPage =0;
        FileService fileService = new FileServiceImpl();
        try {
            totalPage = fileService.getFileCounet();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        req.setAttribute("totalPage",totalPage);
        req.getRequestDispatcher("readDoc.jsp").forward(req, resp);
        //读取文章列表
//        List<File> fileList = new ArrayList<>();
//        FileDao fileDao = new FileDaoImpl();
//        FileService fileread = new FileServiceImpl();
//        Connection con = BaseDao.getConnection();
//
//        fileList = fileDao.fileRead(con);
//        for(File file:fileList) {
//            String text = fileread.FileRead(file.getFilepath());
//        }
//
//        BaseDao.closeResource(con,null,null);
    }
}

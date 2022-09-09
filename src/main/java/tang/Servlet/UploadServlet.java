package tang.Servlet;

import tang.Service.File.FileService;
import tang.Service.File.FileServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //先判断上传文件类型 法一
//        String filetype = req.getParameter("type");
//        System.out.println(filetype);

//        判断上传的文件是普通表单还是带文件的表单
        String msg = "文件上传失败";
        if(!ServletFileUpload.isMultipartContent(req)){
            return;
        }

//        创建上传文件的保存路径，建议放在web-inf路径下以保证安全，用户无法直接访问上传的文件
//        String uploadPath = this.getServletContext().getRealPath("/WEB-INF/upload");
//        上传到webapps目录下的文件会自己删除，就在tomcat-webapps外建了一个upload文件夹
        String uploadPath="D:\\java\\apache-tomcat-9.0.64\\upload";
        File uploadFile = new File(uploadPath);
        if(!uploadFile.exists()){//如果文件夹不存在，则创建改文件夹
            uploadFile.mkdir();
        }

//        缓存临时文件
//        临时路径，如果文件超过了预期大小，就放到临时文件夹下
        String tmpPath = this.getServletContext().getRealPath("/WEB-INF/tmp");
        File tmpFile = new File(tmpPath);
        if(!tmpFile.exists()){
            tmpFile.mkdir();
        }

//        处理上传的文件，一般需要通过流来获取
//        此处使用apache的组件来实现  commons-io

        /*
         * ServletFileUpload负责处理上传的文件数据，并将表单中的每个输入项封装成fileItem对象
         * 在使用ServletFileUpload对象解析请求时需要DIskFileItemFactory对象
         * 所有，需要在进行解析工作前构造好DiskFileItemFactory对象*/

//       1. 创建DiskFileIntemFactory对象，处理文件上传路径或者大小限制
        DiskFileItemFactory factory = getDiskFileItemFactory(tmpFile);

//      2。获取ServletFileUpload
        ServletFileUpload upload = getServletFileUpload(factory);

//        3.处理上传文件
        String readpath = uploadFile(req, resp,upload, uploadPath);
        FileService fileReadService = new FileServiceImpl();
        try {
//            String uploadFileName = fileItem.getName();
//            //                获得上传的文件后缀
            String fileExtName = readpath.substring(readpath.lastIndexOf("."));
            System.out.println(fileExtName);
//            //根据后缀标记文件类型名
            String filetype = null;
            if(fileExtName.equals(".mp4")){
                filetype="视频";
            }else if(fileExtName.equals(".jpg")){
                filetype="图片";
            }else if(fileExtName.equals(".doc")||fileExtName.equals(".docx")){
                filetype="文档";
            }
            System.out.println(filetype);
            fileReadService.filePathKeep(readpath,filetype);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        //文件上传后在前端显示 uploadPath为上传文件保存位置
        FileServiceImpl readService = new FileServiceImpl();
        String textContent = readService.FileRead(readpath);

        req.setAttribute("textContent",textContent);
        req.getRequestDispatcher("/jsp/readDoc.jsp").forward(req, resp);


    }
    public DiskFileItemFactory getDiskFileItemFactory(File tempFile){
        DiskFileItemFactory factory = new DiskFileItemFactory();
//        为上传文件设置一个大小限定，当文件超过这个大小的时候，缓存在暂存区
        factory.setSizeThreshold(1024*1024); //大小为1M
        factory.setRepository(tempFile); //设置暂存区
        return factory;
    }

    public ServletFileUpload getServletFileUpload(DiskFileItemFactory factory){
        ServletFileUpload upload = new ServletFileUpload(factory);
//        upload.setProgressListener(new ProgressListener() {
//            @Override
////            pBytesRead:已经读取的文件大小
////            pContentLength:文件总大小
//            public void update(long pBytesRead, long pContentLength, int pItems) {
////                System.out.println("总大小："+ pContentLength + "；已上传：" + pBytesRead);
//            }
//        });
//        处理乱码问题
        upload.setHeaderEncoding("UTF-8");
//        设置单个文件的最大值
        upload.setFileSizeMax(1024*1024*10);
//        设置总共能够上传文件的大小
        upload.setSizeMax(1024*1024*10);

        return upload;
    }

    public String uploadFile(HttpServletRequest req, HttpServletResponse resp,ServletFileUpload upload, String uploadPath) throws IOException, ServletException {
        String msg = "文件上传失败";

        String readpath = null;
//        把前端请求解析，封装成一个FileItem对象，从ServletFIleUpload对象中获取
        List<FileItem> fileItems = null;
        try {
            fileItems = upload.parseRequest(req);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        String fileName = null;
        for (FileItem fileItem : fileItems) {
//            当前FileItem对象只是一个表单对象
            if (fileItem.isFormField()) {
                String name = fileItem.getFieldName(); //获得表单控件的name值
                String value = fileItem.getString("UTF-8");//获得文本，处理乱码
                System.out.println(name + " :" + value);
            } else {
//            当前FileItem包含文件
//                    ===========================处理文件===============================
                String uploadFileName = fileItem.getName();
                if (uploadFileName.trim().equals("") || uploadFileName == null) {
                    continue;
                }
                //                获得上传的文件名
                fileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);
//                使用UUID获得一个唯一的识别通用码，保证文件名唯一
//                网络传输中的东西，都需要序列化
//                实体类如果想要在多个电脑上运行，需要进行传输===》使用序列号
                String uuidPath = UUID.randomUUID().toString();

//                ==========================存放地址==========================================
                String readPath = uploadPath + "/" + uuidPath;
//                给每个文件创建也给对应的文件夹
                File realPathFile = new File(readPath);
                if (!realPathFile.exists()) {
                    realPathFile.mkdir();
                }

//               ===========================文件传输==========================================
//                获得文件上传的流
                InputStream inputStream = fileItem.getInputStream();
//                创建一个文件输出流
                FileOutputStream fos = new FileOutputStream(readPath + "/" + fileName);
//                创建一个缓冲区
                byte[] buffer = new byte[1024 * 1024];
//                判断是否读取完毕
                int len = 0;
                while ((len = inputStream.read(buffer)) > 0) {
                    fos.write(buffer, 0, len);
                }
//                关闭流
                fos.close();
                inputStream.close();
                System.out.println(readPath + "/" + fileName);
                readpath = readPath + "/" + fileName;
            }
            msg = "文件上传成功";
        }
        System.out.println(msg);
//        req.setAttribute("msg", msg);
//        req.getRequestDispatcher("reasDoc.jsp").forward(req, resp);

        return readpath;
    }


}


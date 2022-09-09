package tang.Service.File;

import tang.Dao.File.FileDao;
import tang.Dao.File.FileDaoImpl;
import tang.util.BaseDao;
import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;


public class FileServiceImpl implements FileService {

    public String FileRead(String path){
//        文本文件读取
            String resullt = "";
            //首先判断文件中的是doc/docx
            try {
                if (path.endsWith(".doc")) {
                    InputStream is = new FileInputStream(new File(path));
                    WordExtractor re = new WordExtractor(is);
                    resullt = re.getText();
                    re.close();
                } else if (path.endsWith(".docx")) {
                    OPCPackage opcPackage = POIXMLDocument.openPackage(path);
                    POIXMLTextExtractor extractor = new XWPFWordExtractor(opcPackage);
                    resullt = extractor.getText();
                    extractor.close();
                } else {
                    System.out.println("此文件不是word文件");
                }
            } catch(Exception e){
                e.printStackTrace();
            }
            return resullt;
    }
//    读取视频文件
//private void getVideoInfo(String filePath) {
//            File source = new File(filePath);
//            Encoder encoder = new Encoder();
//            FileChannel fc = null;
//            try {
//                FileInputStream fis = new FileInputStream(source);
//                fc = null;
//                fc = fis.getChannel();
//                BigDecimal fileSize = new BigDecimal(fc.size());
//            } catch (Exception e) {
//                e.printStackTrace();
//            } finally {
//                if (null != fc) {
//                    try {
//                        fc.close();
//                    } catch (IOException e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
//}

//    public String getVedio(String vediopath) throws FileNotFoundException {
//        String resullt = "";
//        if (vediopath.endsWith(".mp4")) {
//            InputStream is = new FileInputStream(new File(vediopath));
//
//        }
//
//        return resullt;
//    }

    //把文件存储路径写入数据库
    public void filePathKeep(String filepath,String filetype) throws Exception {
        Connection con = BaseDao.getConnection();
        FileDao fileDao = new FileDaoImpl();
        fileDao.filePathKeep(con , filepath,filetype);

        }

    @Override
    public int getFileCounet() throws Exception {
        int count = 0;
        FileDao fileDao = new FileDaoImpl();

        Connection con = BaseDao.getConnection();
       count = fileDao.getFileCount(con);
        BaseDao.closeResource(con,null,null);
        return count;
    }
}





package tang.Dao.Role;

import tang.Entity.Role;
import tang.util.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleDaoImpl implements RoleDao{
    @Override
    public List<Role> getRole(Connection con) throws SQLException {
        List<Role> list = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs =null;
        if(con!=null){
            String sql="select * from role";

            Object[] params={};
            rs= BaseDao.execute(con,sql,rs,pst,params);
            while(rs.next()){
                Role role = new Role();
                role.setRoleId(rs.getInt("role_id"));
                role.setRoleName(rs.getString("rolename"));
                list.add(role);
            }
        }
        BaseDao.closeResource(null,pst,rs);
        return list;
    }
}

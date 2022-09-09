package tang.Service.Role;

import tang.Dao.Role.RoleDao;
import tang.Dao.Role.RoleDaoImpl;
import tang.Entity.Role;
import tang.util.BaseDao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class RoleServiceImpl implements RoleService{
    @Override
    public List<Role> getRole() throws Exception {
        List<Role> roles = new ArrayList<>();
        Connection con = BaseDao.getConnection();
        RoleDao roleDao=new RoleDaoImpl();
        roles=roleDao.getRole(con);
        BaseDao.closeResource(con,null,null);
        return roles;

    }
}

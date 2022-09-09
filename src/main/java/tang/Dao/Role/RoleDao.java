package tang.Dao.Role;

import tang.Entity.Role;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface RoleDao {
    List<Role> getRole(Connection con) throws SQLException;
}

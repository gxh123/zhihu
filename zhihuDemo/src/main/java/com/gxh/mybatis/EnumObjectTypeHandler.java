package com.gxh.mybatis;

import com.gxh.mq.ObjectType;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EnumObjectTypeHandler extends BaseTypeHandler<ObjectType> {

    private Class<ObjectType> type;

    private final ObjectType[] enums;

    /**
     * 设置配置文件设置的转换类以及枚举类内容，供其他方法更便捷高效的实现 
     * @param type 配置文件中设置的转换类 
     */
    public EnumObjectTypeHandler(Class<ObjectType> type) {
        if (type == null)
            throw new IllegalArgumentException("Type argument cannot be null");
        this.type = type;
        this.enums = type.getEnumConstants();
        if (this.enums == null)
            throw new IllegalArgumentException(type.getSimpleName()
                    + " does not represent an enum type.");
    }

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i,
                                    ObjectType parameter, JdbcType jdbcType) throws SQLException {
        // baseTypeHandler已经帮我们做了parameter的null判断  
        ps.setInt(i, parameter.getValue());

    }

    @Override
    public ObjectType getNullableResult(ResultSet rs, String columnName)
            throws SQLException {
        // 根据数据库存储类型决定获取类型，本例子中数据库中存放INT类型  
        int i = rs.getInt(columnName);

        if (rs.wasNull()) {
            return null;
        } else {
            // 根据数据库中的code值，定位EnumStatus子类  
            return locateEnumStatus(i);
        }
    }

    @Override
    public ObjectType getNullableResult(ResultSet rs, int columnIndex)
            throws SQLException {
        // 根据数据库存储类型决定获取类型，本例子中数据库中存放INT类型  
        int i = rs.getInt(columnIndex);
        if (rs.wasNull()) {
            return null;
        } else {
            // 根据数据库中的code值，定位EnumStatus子类  
            return locateEnumStatus(i);
        }
    }

    @Override
    public ObjectType getNullableResult(CallableStatement cs, int columnIndex)
            throws SQLException {
        // 根据数据库存储类型决定获取类型，本例子中数据库中存放INT类型  
        int i = cs.getInt(columnIndex);
        if (cs.wasNull()) {
            return null;
        } else {
            // 根据数据库中的code值，定位EnumStatus子类  
            return locateEnumStatus(i);
        }
    }

    /**
     * 枚举类型转换，由于构造函数获取了枚举的子类enums，让遍历更加高效快捷 
     * @param code 数据库中存储的自定义code属性 
     * @return code对应的枚举类
     */
    private ObjectType locateEnumStatus(int code) {
        for(ObjectType status : enums) {
            if(status.getValue()==(Integer.valueOf(code))) {
                return status;
            }
        }
        throw new IllegalArgumentException("未知的枚举类型：" + code + ",请核对" + type.getSimpleName());
    }

}

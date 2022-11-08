package com.southwind.mapper;

import com.southwind.entity.SystemAdmin;

/**
 * used for login functionality
 */
public interface SystemAdminMapper {

    public SystemAdmin findByUsername(String username);
}

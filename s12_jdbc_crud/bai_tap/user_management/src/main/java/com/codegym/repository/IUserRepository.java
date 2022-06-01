package com.codegym.repository;

import com.codegym.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public void insertUser(User user) throws SQLException;
    public User selectUser(int id);
    public List<User>selectAllUsers();
    public List<User> searchUsersByCountry(String country);
    public List<User>sortUsersByName();
    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

}

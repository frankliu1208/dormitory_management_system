package com.southwind.mapper;

import com.southwind.entity.Moveout;
import com.southwind.entity.Student;

import java.util.List;

// some functions regarding move-out register are also defined here
public interface StudentMapper {
    public List<Student> list();
    public List<Student> searchByNumber(String value);
    public List<Student> searchByName(String value);
    public void save(Student student);
    public void update(Student student);
    public void delete(Integer id);
    public List<Integer> findStudentIdByDormitoryId(Integer dormitoryId);
    public void resetDormitoryId(Integer studentId,Integer dormitoryId);

//    used for move-out functionality
    public List<Student> moveoutList();
    public List<Student> searchForMoveoutByNumber(String value);
    public List<Student> searchForMoveoutByName(String value);
    public void updateStateById(Integer id);
    public void moveout(Moveout moveout);
    public List<Student> findByDormitoryId(Integer dormitoryId);
}

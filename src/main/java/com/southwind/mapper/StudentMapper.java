package com.southwind.mapper;

import com.southwind.entity.Moveout;
import com.southwind.entity.Student;

import java.util.List;

// Student management functionality
// some functions regarding move-out register are also defined here
public interface StudentMapper {
    public List<Student> list();
    public List<Student> searchByNumber(String value);
    public List<Student> searchByName(String value);
    public void save(Student student);
    public void update(Student student);
    public void delete(Integer id);

    // search for student id through dormitory id
    public List<Integer> findStudentIdByDormitoryId(Integer dormitoryId);

    // modify the dormitory id for the students whose building is being deleted. (so they have to assign to another dormitory)
    public void resetDormitoryId(Integer studentId,Integer dormitoryId);

    //    used for move-out functionality
    public List<Student> moveoutList();

    // search functions in move-out management section
    public List<Student> searchForMoveoutByNumber(String value);

    // search functions in move-out management section
    public List<Student> searchForMoveoutByName(String value);

    // update the state of a student when he moves out
    public void updateStateById(Integer id);

    // add moveout info in the list
    public void moveout(Moveout moveout);

    public List<Student> findByDormitoryId(Integer dormitoryId);
}

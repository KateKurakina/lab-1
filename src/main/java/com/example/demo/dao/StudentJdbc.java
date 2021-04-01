package com.example.demo.dao;

import com.example.demo.model.Student;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class StudentJdbc {

    private final JdbcTemplate jdbcTemplate;

    public StudentJdbc(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Student> getAllLocal() {
        return jdbcTemplate.query("SELECT * FROM student_local", this::mapStudent);
    }

    //  Просмотр студента
    public Student get(int id){
        String sql = "SELECT * FROM STUDENT WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapStudent, id);
    }

    //  Просмотр студентов по группе
    public List<Student> getStudentByGroup(int study_group_id){
        String sql = "SELECT * FROM STUDENT WHERE study_group_id = ?";
        return jdbcTemplate.query(sql, this::mapStudent, study_group_id);
    }

    //  Просмотр всех студентов
    public List<Student> getAll(){
        String sql = "SELECT * FROM STUDENT";
        return jdbcTemplate.query(sql, this::mapStudent);
    }

    //  Создание студента
    public void CreateStudent(int id, String surname, String name, String second_name) {
        this.jdbcTemplate.update(
                "INSERT INTO STUDENT VALUES(?, ?, ?, ?)",
                id, surname, name,second_name);
    }

    public void CreateStudent(Student student) {
        this.jdbcTemplate.update(
                "INSERT INTO STUDENT VALUES(?, ?, ?, ?)",
                student.getId(), student.getSurname(),
                student.getName(),student.getSecond_name());
    }

    //  Редактирование студента
    public void UpdateStudent(int id, String surname, String name, String second_name) {
        this.jdbcTemplate.update(
                "MERGE INTO CUSTOMER KEY (ID) VALUES (?, ?, ?, ?)",
                id, surname, name,second_name);

    }

    public int UpdateStudent(Student student) {
        int status = jdbcTemplate.update("UPDATE STUDENT SET VALUES(?, ?, ?, ?)",
                student.getId(), student.getSurname(),
                student.getName(),student.getSecond_name());
        if(status == 0){
            CreateStudent(student);
        }
        return status;
    }


    private Student mapStudent(ResultSet rs, int i) throws SQLException{
        return new Student(
                rs.getInt("id"),
                rs.getString("surname"),
                rs.getString("name"),
                rs.getString("second_name")
        );
    }

    //  Удаление студента
    public int delete(String id) {
        return jdbcTemplate.update("DELETE FROM STUDENT WHERE id = ?", id);
    }

}
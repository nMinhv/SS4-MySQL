package com.example.ss6jv05;

public class Student {
    private String studentId;
    private String fullName;
    private int age;
    private boolean sex;

    public Student() {
    }

    public Student(String studentId, String fullName, int age, boolean sex) {
        this.studentId = studentId;
        this.fullName = fullName;
        this.age = age;
        this.sex = sex;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

}

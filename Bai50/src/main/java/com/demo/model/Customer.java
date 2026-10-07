package com.demo.model;

public class Customer {
    private String name;
    private String birthDate;
    private String address;
    private String imagePath;

    public Customer(String name, String birthDate, String address, String imagePath) {
        this.name = name;
        this.birthDate = birthDate;
        this.address = address;
        this.imagePath = imagePath;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}


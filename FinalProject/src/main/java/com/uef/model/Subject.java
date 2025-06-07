/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.model;

/**
 *
 * @author qnhat
 */
import jakarta.validation.constraints.*;

public class Subject {
    
    @NotNull(message = "Không được để trống")
    private int SubId;
    
    private Admin admin = new Admin();
    
    @NotBlank(message = "Không được để trống")
    @Size(min = 1, max = 100)
    private String Su_Name;
    
    @Size(min = 1, max = 200)
    private String Su_Description;

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public int getSubId() {
        return SubId;
    }

    public void setSubId(int SubId) {
        this.SubId = SubId;
    }

    public String getSu_Name() {
        return Su_Name;
    }

    public void setSu_Name(String Su_Name) {
        this.Su_Name = Su_Name;
    }

    public String getSu_Description() {
        return Su_Description;
    }

    public void setSu_Description(String Su_Description) {
        this.Su_Description = Su_Description;
    }
    
    
}

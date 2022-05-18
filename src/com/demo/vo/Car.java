package com.demo.vo;

import java.io.Serializable;

/**
 * 车辆（t_car表对应的Java实体类）
 */
public class Car implements Serializable {
    private Long id;//主键
    private String carPai;//车牌
    private String carName;//品牌型号
    private String carChexing;//车型
    private String carCheng;//里程
    private String carIndate;//购买日期
    private String carStatus;//状态:正常/故障
    private String carUser;//驾驶员
    private String carPhone;//联系方式
    private String carText;//备注

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public String getCarPai() {
        return carPai;
    }

    public void setCarPai(String carPai) {
        this.carPai = carPai;
    }
    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }
    public String getCarChexing() {
        return carChexing;
    }

    public void setCarChexing(String carChexing) {
        this.carChexing = carChexing;
    }
    public String getCarCheng() {
        return carCheng;
    }

    public void setCarCheng(String carCheng) {
        this.carCheng = carCheng;
    }
    public String getCarIndate() {
        return carIndate;
    }

    public void setCarIndate(String carIndate) {
        this.carIndate = carIndate;
    }
    public String getCarStatus() {
        return carStatus;
    }

    public void setCarStatus(String carStatus) {
        this.carStatus = carStatus;
    }
    public String getCarUser() {
        return carUser;
    }

    public void setCarUser(String carUser) {
        this.carUser = carUser;
    }
    public String getCarPhone() {
        return carPhone;
    }

    public void setCarPhone(String carPhone) {
        this.carPhone = carPhone;
    }
    public String getCarText() {
        return carText;
    }

    public void setCarText(String carText) {
        this.carText = carText;
    }
}

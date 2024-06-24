package models;

import java.util.Date;

public class Certificate {
    private int cerId; 
    private String cerName;
    private Date issueDate;
    private String cerCompany;
    private String cerImg;
    private String cerLink;
    private int internId;
    private String senderId;

    public Certificate() {}

    public Certificate(int cerId, String cerName, Date issueDate, String cerCompany, String cerImg, String cerLink, int internId, String senderId) {
        this.cerId = cerId;
        this.cerName = cerName;
        this.issueDate = issueDate;
        this.cerCompany = cerCompany;
        this.cerImg = cerImg;
        this.cerLink = cerLink;
        this.internId = internId;
        this.senderId = senderId; 
    }

    public int getCertId() {
        return cerId;
    }

    public void setCertId(int certId) {
        this.cerId = certId;
    }

    public String getCerName() {
        return cerName;
    }

    public void setCerName(String cerName) {
        this.cerName = cerName;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public String getCerCompany() {
        return cerCompany;
    }

    public void setCerCompany(String cerCompany) {
        this.cerCompany = cerCompany;
    }

    public String getCerImg() {
        return cerImg;
    }

    public void setCerImg(String cerImg) {
        this.cerImg = cerImg;
    }

    public String getCerLink() {
        return cerLink;
    }

    public void setCerLink(String cerLink) {
        this.cerLink = cerLink;
    }

    public int getInternId() {
        return internId;
    }

    public void setInternId(int internId) {
        this.internId = internId;
    }

    public String getSenderId() {
        return senderId;
    }

    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }
}

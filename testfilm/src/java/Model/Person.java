
package Model;

import java.time.LocalDate;


public class Person {
   private String src,ten;
   private String theloai,thoigian;
   private String khoichieu,tuoi;

    public Person(String src, String ten, String theloai, String thoigian, String khoichieu, String tuoi) {
        this.src = src;
        this.ten = ten;
        this.theloai = theloai;
        this.thoigian = thoigian;
        this.khoichieu = khoichieu;
        this.tuoi = tuoi;
    }

    public Person() {
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getTheloai() {
        return theloai;
    }

    public void setTheloai(String theloai) {
        this.theloai = theloai;
    }

    public String getThoigian() {
        return thoigian;
    }

    public void setThoigian(String thoigian) {
        this.thoigian = thoigian;
    }

    public String getKhoichieu() {
        return khoichieu;
    }

    public void setKhoichieu(String khoichieu) {
        this.khoichieu = khoichieu;
    }

    public String getTuoi() {
        return tuoi;
    }

    public void setTuoi(String tuoi) {
        this.tuoi = tuoi;
    }
    

}
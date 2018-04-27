package com.sopra.model;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Repository
@Entity
@Table(name = "esamesostenuto")
public class EsameSostenuto implements Serializable {
    @Id
    @Column(name = "idEsameSostenuto")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEsameSostenuto;

    @Column(name = "idEsame")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEsame;

    @Column(name = "idStudente")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idStudente;

    @Column(name = "data")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date data;

    @Column(name = "voto")
    private int voto;

    public EsameSostenuto() {
//        this.voto = 0;
//        this.data = null;
    }
    public EsameSostenuto (int id){
        this.idStudente = id;
    }

    public int getIdEsameSostenuto() {
        return idEsameSostenuto;
    }

    public void setIdEsameSostenuto(int idEsameSostenuto) {
        this.idEsameSostenuto = idEsameSostenuto;
    }

    public int getIdEsame() {
        return idEsame;
    }

    public void setIdEsame(int idEsame) {
        this.idEsame = idEsame;
    }

    public int getIdStudente() {
        return idStudente;
    }

    public void setIdStudente(int idStudente) {
        this.idStudente = idStudente;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public int getVoto() {
        return voto;
    }

    public void setVoto(int voto) {
        this.voto = voto;
    }

    @Override
    public String toString() {
        return "EsameSostenuto{" +
                "idEsameSostenuto=" + idEsameSostenuto +
                ", idEsame=" + idEsame +
                ", idStudente=" + idStudente +
                ", data=" + data +
                ", voto=" + voto +
                '}';
    }

}

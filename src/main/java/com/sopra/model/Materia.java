package com.sopra.model;

import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
@Entity
@Table(name = "esami")
public class Materia {
    @Id
    @Column(name = "idEsame")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEsame;

    @Column(name = "nomeEsame")
    private String nomeEsame;

    public Materia(){}

    public Materia(String nomeEsame) {
        this.nomeEsame = nomeEsame;
    }

    public int getIdEsame() {
        return idEsame;
    }

    public void setIdEsame(int idEsame) {
        this.idEsame = idEsame;
    }

    public String getNomeEsame() {
        return nomeEsame;
    }

    public void setNomeEsame(String nomeEsame) {
        this.nomeEsame = nomeEsame;
    }

    @Override
    public String toString() {
        return "Esame{" +
                "idEsame=" + idEsame +
                ", nomeEsame='" + nomeEsame + '\'' +
                '}';
    }
}

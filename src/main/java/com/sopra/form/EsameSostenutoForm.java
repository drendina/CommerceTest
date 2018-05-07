package com.sopra.form;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import java.util.Date;

public class EsameSostenutoForm {
    @Id
    @NotNull
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEsameSostenuto;

    @NotNull
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEsame;

    @NotNull
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idStudente;

    @NotNull
    @Past
    private Date data;

    @Min(18)
    @Max(33)
    private int voto;

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
        return "EsameSostenutoForm{" +
                "idEsameSostenuto=" + idEsameSostenuto +
                ", idEsame=" + idEsame +
                ", idStudente=" + idStudente +
                ", data=" + data +
                ", voto=" + voto +
                '}';
    }
}

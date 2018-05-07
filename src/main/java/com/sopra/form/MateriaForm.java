package com.sopra.form;

import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class MateriaForm {

    @Id
    @NotNull
    private int id;

    @NotNull
    @Size(min = 5)
    private String nomeEsame;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeEsame() {
        return nomeEsame;
    }

    public void setNomeEsame(String nomeEsame) {
        this.nomeEsame = nomeEsame;
    }

    @Override
    public String toString() {
        return "MateriaForm{" +
                "id=" + id +
                ", nomeEsame='" + nomeEsame + '\'' +
                '}';
    }
}

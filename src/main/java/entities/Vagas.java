package entities;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.ConectaBD;

public class Vagas {
	// ATRIBUTOS
    private int id;
    private String descricao_cc;
    private String req_obrigatorios_cc;
    private String req_desejaveis_cc;
    private String remuneracao_cc;
    private String aberta_cc;
    private String beneficios_cc;
    private String local_trabalho_cc;



    // GETTER & SETTER
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao_cc() {
        return descricao_cc;
    }

    public void setDescricao_cc(String descricao_cc) {
        this.descricao_cc = descricao_cc;
    }

    public String getReq_obrigatorios_cc() {
        return req_obrigatorios_cc;
    }

    public void setReq_obrigatorios_cc(String req_obrigatorios_cc) {
        this.req_obrigatorios_cc = req_obrigatorios_cc;
    }

    public String getReq_desejaveis_cc() {
        return req_desejaveis_cc;
    }

    public void setReq_desejaveis_cc(String req_desejaveis_cc) {
        this.req_desejaveis_cc = req_desejaveis_cc;
    }

    public String getRemuneracao_cc() {
        return remuneracao_cc;
    }

    public void setRemuneracao_cc(String remuneracao_cc) {
        this.remuneracao_cc = remuneracao_cc;
    }

    public String getAberta_cc() {
        return aberta_cc;
    }

    public void setAberta_cc(String aberta_cc) {
        this.aberta_cc = aberta_cc;
    }

    public String getBeneficios_cc() {
        return beneficios_cc;
    }

    public void setBeneficios_cc(String beneficios_cc) {
        this.beneficios_cc = beneficios_cc;
    }

    public String getLocal_trabalho_cc() {
        return local_trabalho_cc;
    }

    public void setLocal_trabalho_cc(String local_trabalho_cc) {
        this.local_trabalho_cc = local_trabalho_cc;
    }
}
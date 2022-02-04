package entities;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.ConectaBD;

public class Vagas {
    // ATRIBUTOS
    private int id;
    private String descricao;
    private String req_obrigatorios;
    private String req_desejaveis;
    private String remuneracao;
    private String aberta;
    private String beneficios;
    private String local_trabalho;

    // GETTER & SETTER
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getReq_obrigatorios() {
        return req_obrigatorios;
    }

    public void setReq_obrigatorios(String req_obrigatorios) {
        this.req_obrigatorios = req_obrigatorios;
    }

    public String getReq_desejaveis() {
        return req_desejaveis;
    }

    public void setReq_desejaveis(String req_desejaveis) {
        this.req_desejaveis = req_desejaveis;
    }

    public String getRemuneracao() {
        return remuneracao;
    }

    public void setRemuneracao(String remuneracao) {
        this.remuneracao = remuneracao;
    }

    public String getAberta() {
        return aberta;
    }

    public void setAberta(String aberta) {
        this.aberta = aberta;
    }

    public String getBeneficios() {
        return beneficios;
    }

    public void setBeneficios(String beneficios) {
        this.beneficios = beneficios;
    }

    public String getLocal_trabalho() {
        return local_trabalho;
    }

    public void setLocal_trabalho(String local_trabalho) {
        this.local_trabalho = local_trabalho;
    }
}
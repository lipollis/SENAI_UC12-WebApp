package entities;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.ConectaBD;

public class Vagas {
    // ATRIBUTOS
    private int id_java;
    private String descricao_java;
    private String req_obrigatorios_java;
    private String req_desejaveis_java;
    private double remuneracao_java;
    private String beneficios_java;
    private String local_trabalho_java;
    private int aberta_java;

    // GETTER & SETTER
    public int getId_java() {
        return id_java;
    }

    public void setId_java(int id_java) {
        this.id_java = id_java;
    }

    public String getDescricao_java() {
        return descricao_java;
    }

    public void setDescricao_java(String descricao_java) {
        this.descricao_java = descricao_java;
    }

    public String getReq_obrigatorios_java() {
        return req_obrigatorios_java;
    }

    public void setReq_obrigatorios_java(String req_obrigatorios_java) {
        this.req_obrigatorios_java = req_obrigatorios_java;
    }

    public String getReq_desejaveis_java() {
        return req_desejaveis_java;
    }

    public void setReq_desejaveis_java(String req_desejaveis_java) {
        this.req_desejaveis_java = req_desejaveis_java;
    }

    public double getRemuneracao_java() {
        return remuneracao_java;
    }

    public void setRemuneracao_java(double remuneracao_java) {
        this.remuneracao_java = remuneracao_java;
    }

    public String getBeneficios_java() {
        return beneficios_java;
    }

    public void setBeneficios_java(String beneficios_java) {
        this.beneficios_java = beneficios_java;
    }

    public String getLocal_trabalho_java() {
        return local_trabalho_java;
    }

    public void setLocal_trabalho_java(String local_trabalho_java) {
        this.local_trabalho_java = local_trabalho_java;
    }
    
    public int getAberta_java() {
        return aberta_java;
    }

    public void setAberta_java(int aberta_java) {
        this.aberta_java = aberta_java;
    }
    
    /*
    create database empregos;
    use empregos;
    create TABLE vagas(
    	id INT PRIMARY KEY AUTO_INCREMENT,
        descricao VARCHAR(45) NOT NULL,
        req_obrigatorios VARCHAR(45) NOT NULL,
        req_desejaveis VARCHAR(45),
        remuneracao FLOAT NOT NULL,
        aberta TINYINT DEFAULT 1, -- 1 true aberta e 0 false fechada
        beneficios VARCHAR(45) NOT NULL,
        local_trabalho VARCHAR(45) NOT NULL
    ) AUTO_INCREMENT = 1000; -- Inicia o código das vagas no valor 1000
    */
}

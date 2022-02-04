package dao;

import java.util.List;
import java.util.Optional;

import entities.Vagas;

public interface IDao<T> {
    // REFER�NCIA 'T' PARA QUE A MESMA INTERFACE SE COMUNIQUE DE FORMA GEN�RICA
    // PASSA 't' E RETORNA 'T'
    public T Incluir(T t);

    public T Alterar(T t);

    public void Excluir(Integer id_line);

    public String Listar(int aberta);

    public T Buscar(Integer id_line); // BUSCAR O END DO PACIENTE

}

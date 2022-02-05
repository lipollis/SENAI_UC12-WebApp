package dao;

import java.util.List;
import java.util.Optional;

import entities.Vagas;

public interface IDao<T> {
    // REFERENCIA 'T' PARA QUE A MESMA INTERFACE SE COMUNIQUE DE FORMA GENERICA
    // PASSA 't' E RETORNA 'T'
    public T Create(T t);
    
    public String Read(int aberta_java);

    public void Update(T t);

    public void Delete(int id_java);

    public T Search(int id_java); 

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import java.util.List;
import java.util.Optional;

/**
 * @param <T>
 * @author Desktop
 */
public interface DAO<T> {
    List<T> getAll();

    Optional<T> get(int id);

    void save(T t);

    void update(T t);

    void delete(int id);
}
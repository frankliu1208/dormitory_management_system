package com.southwind.service;

import com.southwind.entity.Moveout;

import java.util.List;

//used for move-out record function
public interface MoveoutService {
    public List<Moveout> list();
    public List<Moveout> search(String key,String value);
}

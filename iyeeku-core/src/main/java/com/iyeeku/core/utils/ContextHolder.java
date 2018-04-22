package com.iyeeku.core.utils;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class ContextHolder implements Serializable {

    private static final long serialVersionUID = 1L;

    private Map contexts = new HashMap();

    public Object get(String key){
        return this.contexts.get(key);
    }

    public void put(String key, Object value){
        this.contexts.put(key, value);
    }

    public void clear(){
        this.contexts.clear();
    }

}

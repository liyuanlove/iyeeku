package com.iyeeku.core.cache;

import java.util.Map;

public abstract interface ICacheLoader<K , V> {

    public abstract Map<K , V> preLoad();

    public abstract V get(Object paramObject);

    public abstract void put(K paramK , V paramV);

    public abstract V remove(Object paramObject);

}

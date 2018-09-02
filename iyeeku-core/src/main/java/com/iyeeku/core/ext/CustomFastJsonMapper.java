package com.iyeeku.core.ext;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

public class CustomFastJsonMapper extends ObjectMapper {

    public CustomFastJsonMapper(){
        this.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        this.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS , false);
    }

}

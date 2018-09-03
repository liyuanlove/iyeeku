package com.iyeeku.core.mvc.handlermapping;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface FunctionDesc {

    public abstract String value();

}

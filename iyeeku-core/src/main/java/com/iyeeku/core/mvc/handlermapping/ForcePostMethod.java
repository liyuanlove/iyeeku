package com.iyeeku.core.mvc.handlermapping;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ForcePostMethod {

    public abstract boolean value();

}

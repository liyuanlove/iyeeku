package com.iyeeku.controller.home.webUtils;

import com.iyeeku.controller.home.menu.Button;
import com.iyeeku.controller.home.menu.ClickButton;
import com.iyeeku.controller.home.menu.Menu;
import com.iyeeku.controller.home.menu.ViewButton;

public class WeiXinUtil {

    public static final String BTN_TYPE_CLICK = "click";

    public static final String BTN_TYPE_VIEW = "view";


    public static Menu initMenu(){

        Menu menu = new Menu();
        ClickButton button11 = new ClickButton();
        button11.setName("测试按钮11");
        button11.setType(BTN_TYPE_CLICK);
        button11.setKey("11");

        ClickButton button12 = new ClickButton();
        button12.setName("测试按钮12");
        button11.setType(BTN_TYPE_CLICK);
        button11.setKey("12");

        ViewButton button21 = new ViewButton();
        button21.setName("xxx官网");
        button21.setType(BTN_TYPE_VIEW);
        button21.setUrl("http://wwww.baidu.com");


        ViewButton button22 = new ViewButton();
        button22.setName("xxx官网22");
        button22.setType(BTN_TYPE_VIEW);
        button22.setUrl("http://wwww.baidu.com");

        ClickButton button31 = new ClickButton();
        button31.setName("杨旭东");
        button31.setType(BTN_TYPE_CLICK);
        button31.setKey("31");

        Button button1 = new Button();
        button1.setName("二级按钮测试");
        button1.setSub_button(new Button[]{button11,button12});

        Button button2 = new Button();
        button2.setName("相关网址");
        button2.setSub_button(new Button[]{button21,button22});

        menu.setButton(new Button[]{button1 , button2 , button31});

        return  menu;

    }

}

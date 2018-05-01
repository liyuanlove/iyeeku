package com.iyeeku.controller.home;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class TempController {

    @RequestMapping(value="/news",method=RequestMethod.GET)
    public ModelAndView toNews(){
        return new ModelAndView("news");
    }

    @RequestMapping(value="/newsInfo",method=RequestMethod.GET)
    public ModelAndView toNewsInfo(){
        return new ModelAndView("newsInfo");
    }

    @RequestMapping(value="/question",method=RequestMethod.GET)
    public ModelAndView toQuestion(){
        return new ModelAndView("question");
    }

    @RequestMapping(value="/question2",method=RequestMethod.GET)
    public ModelAndView toQuestion2(){
        return new ModelAndView("question2");
    }

    @RequestMapping(value="/question3",method=RequestMethod.GET)
    public ModelAndView toQuestion3(){
        return new ModelAndView("question3");
    }

    @RequestMapping(value="/question4",method=RequestMethod.GET)
    public ModelAndView toQuestion4(){
        return new ModelAndView("question4");
    }

    @RequestMapping(value="/question5",method=RequestMethod.GET)
    public ModelAndView toQuestion5(){
        return new ModelAndView("question5");
    }

    @RequestMapping(value="/blog",method=RequestMethod.GET)
    public ModelAndView toBlog(){
        return new ModelAndView("blog");
    }

    @RequestMapping(value="/blogInfo",method=RequestMethod.GET)
    public ModelAndView toBlogInfo(){
        return new ModelAndView("blogInfo");
    }

    @RequestMapping(value="/tweetInfo",method=RequestMethod.GET)
    public ModelAndView toTweetInfo(){
        return new ModelAndView("tweetInfo");
    }

    @RequestMapping(value="/tweets",method=RequestMethod.GET)
    public ModelAndView toTweets(){
        return new ModelAndView("tweets");
    }

    @RequestMapping(value="/personalBox",method=RequestMethod.GET)
    public ModelAndView toPersonalBox(){
        return new ModelAndView("personalBox");
    }

    @RequestMapping(value="/modifyPersonInfo",method=RequestMethod.GET)
    public ModelAndView toModifyPersonInfo(){
        return new ModelAndView("modifyPersonInfo");
    }

    @RequestMapping(value="/myblogs",method=RequestMethod.GET)
    public ModelAndView toMyblogs(){
        return new ModelAndView("myblogs");
    }

    @RequestMapping(value="/register",method=RequestMethod.GET)
    public ModelAndView toRegister(){
        return new ModelAndView("register");
    }

    @RequestMapping(value="/userInfo",method=RequestMethod.GET)
    public ModelAndView toIndex(){
        return new ModelAndView("index");
    }

    @RequestMapping(value="/answer",method=RequestMethod.GET)
    public ModelAndView toAnswer(){
        return new ModelAndView("answer");
    }

    @RequestMapping(value="/ask",method=RequestMethod.GET)
    public ModelAndView toAsk(){
        return new ModelAndView("ask");
    }

    @RequestMapping(value="/postedit",method=RequestMethod.GET)
    public ModelAndView toPostedit(){
        return new ModelAndView("postedit");
    }

    @RequestMapping(value="/modifyEmailPwd",method=RequestMethod.GET)
    public ModelAndView toModifyEmailPwd(){
        return new ModelAndView("modifyEmailPwd");
    }

    @RequestMapping(value="/login",method=RequestMethod.GET)
    public ModelAndView toLogin(){
        return new ModelAndView("login");
    }




}

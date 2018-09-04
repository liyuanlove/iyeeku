package com.iyeeku.ext.directory.web;

import com.iyeeku.ext.directory.service.DirectoryService;
import com.iyeeku.ext.directory.vo.DirectoryVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/directory")
public class DirectoryController {

    private final Logger logger = LoggerFactory.getLogger(DirectoryController.class);

    @Autowired
    private DirectoryService directoryService;

    @RequestMapping(value = "/loadDict")
    @ResponseBody
    public List<DirectoryVO> loadDict(String dictId){
        this.logger.info("DirectoryController loadDict");
        if (dictId == null || "".equals(dictId)){
            return null;
        }else {
            return this.directoryService.findInfoListByCodeType(dictId , null);
        }
    }


}

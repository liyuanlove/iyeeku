package com.iyeeku.ext.staff.service.impl;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.role.dao.PFRoleDao;
import com.iyeeku.ext.role.vo.PFRoleVO;
import com.iyeeku.ext.staff.dao.PFStaffDao;
import com.iyeeku.ext.staff.service.PFStaffService;
import com.iyeeku.ext.staff.util.StaffExcelModelUtil;
import com.iyeeku.ext.staff.vo.PFStaffVO;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PFStaffServiceImpl implements PFStaffService {

    private final Logger logger = LoggerFactory.getLogger(PFStaffServiceImpl.class);

    private PFStaffDao pfStaffDao;
    private PFRoleDao pfRoleDao;

    @Override
    public Map<String, Object> findAllStaffs(PFStaffVO staffVO, Pagination pagination) {
        Map<String , Object> result = new HashMap<>();

        List<PFStaffVO> list = this.pfStaffDao.findAllStaffs(staffVO ,
                pagination.getPageIndex()*pagination.getPageSize() , pagination.getPageSize());
        int count = this.pfStaffDao.findAllStaffsCount(staffVO);

        result.put("data" , list);
        result.put("total" , count);
        return result;
    }

    @Override
    public Map<String, Object> getListAddedRole(String yhbh, String jsmc, Pagination pagination) {

        List<PFRoleVO> list = this.pfRoleDao.findListAddedRole(yhbh , jsmc ,
                pagination.getPageIndex()*pagination.getPageSize() , pagination.getPageSize());
        int total = this.pfRoleDao.findListAddedRoleCount(yhbh , jsmc);

        Map<String , Object> rtnMap = new HashMap<>();
        rtnMap.put("data" , list);
        rtnMap.put("total" , total);
        return rtnMap;
    }

    @Override
    public Map<String, Object> getListNotAddedRole(String yhbh, String jsmc, Pagination pagination) {

        return null;
    }

    @Override
    public Map<String, Object> getListNotAddedStaff(Map<String, String> map, Pagination pagination) {
        List<PFStaffVO> list = this.pfStaffDao.findListNotAddedStaff(map ,
                pagination.getPageIndex() * pagination.getPageSize() , pagination.getPageSize());
        int count = this.pfStaffDao.findListNotAddedStaffCount(map);
        Map<String , Object> result = new HashMap<>();
        result.put("data" , list);
        result.put("total" , count);
        return result;
    }

    @Override
    public List<PFStaffVO> findAllStaffInfos() {
        this.logger.info("PFStaffServiceImpl findAllStaffInfos");
        return this.pfStaffDao.findAllStaffInfos();
    }

    @Override
    public PFStaffVO findStaffByYhbh(String yhbh) {
        this.logger.info("PFStaffServiceImpl findStaffByYhbh");
        return this.pfStaffDao.findStaffByYhbh(yhbh);
    }

    @Override
    public void save(PFStaffVO staffVO) {
        this.logger.info("PFStaffServiceImpl save");
        staffVO.setYhbh(UUIDGenerator.generate("").substring(0,9));
        staffVO.setCjr(ContextUtil.getLoginUser().getUserId());
        staffVO.setCjsj(new Date());
        staffVO.setJlzt("1");
        staffVO.setRzrq(new Date());
        this.pfStaffDao.save(staffVO);
    }

    @Override
    public void update(PFStaffVO staffVO) {
        this.logger.info("PFStaffServiceImpl update");
        staffVO.setZhxgr(ContextUtil.getLoginUser().getUserId());
        staffVO.setZhxgsj(new Date());
        this.pfStaffDao.update(staffVO);
    }

    @Override
    public void delete(PFStaffVO staffVO) {
        this.logger.info("PFStaffServiceImpl delete");
        this.pfStaffDao.delete(staffVO);
    }

    @Override
    public void exportStaffExcel(OutputStream out) {

        // XSSFWorkbook 操作 2007版以上excel，后缀是 xlsx
        // HSSFWorkbook 操作 2003版以下excel，后缀是 xls
        XSSFWorkbook wb = new XSSFWorkbook();


        //1.0 加载表头样式
        String color = "808080";
        XSSFColor xssfColor = new XSSFColor(new java.awt.Color(100,100,100));
        //xssfColor.setARGBHex(color);

        XSSFCellStyle headStyle = wb.createCellStyle();
        headStyle.setFillBackgroundColor(xssfColor);
        headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        //headStyle.setFillPattern(FillPatternType.ALT_BARS);
        headStyle.setAlignment(HorizontalAlignment.CENTER);  //水平居中
        headStyle.setVerticalAlignment(VerticalAlignment.CENTER);  //垂直居中
        headStyle.setBorderBottom(BorderStyle.THIN);  //下边框
        headStyle.setBorderLeft(BorderStyle.THIN);
        headStyle.setBorderRight(BorderStyle.THIN);
        headStyle.setBorderTop(BorderStyle.THIN);

        XSSFFont headFont = wb.createFont();
        headFont.setFontName("宋体");
        headFont.setColor(IndexedColors.WHITE.index);
        headFont.setBold(true);
        headStyle.setFont(headFont);  //设置字体



        XSSFCellStyle cellStyle = wb.createCellStyle();
        cellStyle.setAlignment(HorizontalAlignment.CENTER);  //水平居中
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);  //垂直居中
        cellStyle.setBorderBottom(BorderStyle.THIN);  //下边框
        cellStyle.setBorderLeft(BorderStyle.THIN);
        cellStyle.setBorderRight(BorderStyle.THIN);
        cellStyle.setBorderTop(BorderStyle.THIN);

        XSSFFont dataFont = wb.createFont();
        dataFont.setFontName("宋体");
        dataFont.setFontHeightInPoints((short) 10);
        cellStyle.setFont(dataFont);


        //String color = "cbfdee";
        //转换RGB码
        //int r = Integer.parseInt(color.substring(0,2),16);
        //int g = Integer.parseInt(color.substring(2,4),16);
        //int b = Integer.parseInt(color.substring(4,6),16);
        //Palette palette = wb.getCustomPalette();
        //这里9是索引
        //palette.setColorAtIndex((short)9 , (byte) r , (byte) g , (byte) b);





        XSSFSheet sheet = wb.createSheet("员工基本信息");

        //List<PFStaffVO> staffData = this.pfStaffDao.findAllStaffInfos();

        int rowIndex = 0;

        List<String[]> staffModel = StaffExcelModelUtil.getStaffModel();
        XSSFRow titleRow = sheet.createRow(rowIndex);

        for (int i = 0 , l = staffModel.size() ; i < l ; i++){
            sheet.setColumnWidth(i , getColumnWidth(Integer.valueOf(staffModel.get(i)[2]))); //设置列宽
            XSSFCell cell = titleRow.createCell(i);
            cell.setCellStyle(headStyle);
            cell.setCellType(CellType.STRING);
            cell.setCellValue(staffModel.get(i)[0]);
        }

        List<Map> staffData = this.pfStaffDao.getStaffExportData();
        for (int i = 0 , l = staffData.size() ; i < l ; i++){
            XSSFRow dataRow = sheet.createRow(i+1);

            Map oneRecord = staffData.get(i);

            for (int j = 0 , n = staffModel.size() ; j < n ; j++){
                XSSFCell cell = dataRow.createCell(j);
                cell.setCellStyle(cellStyle);
                cell.setCellType(CellType.STRING);
                cell.setCellValue((String) oneRecord.get((String)staffModel.get(j)[1]));
            }
        }

        try {
            //把构建好的Workbook输出到本地
            wb.write(out);
            wb.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    /**
     * 计算列宽
     * @param num
     * @return
     */
    private int getColumnWidth(int num){
        return 256 * num + 184;
    }

    public void setPfStaffDao(PFStaffDao pfStaffDao) {
        this.pfStaffDao = pfStaffDao;
    }

    public void setPfRoleDao(PFRoleDao pfRoleDao) {
        this.pfRoleDao = pfRoleDao;
    }
}

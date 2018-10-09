package com.iyeeku.ext;

import java.util.ArrayList;
import java.util.List;

public class Test {

    /**
     * 开机总时长 （s）
     */
    public static int TOTAL_TIME = 12 * 60 * 60;
    // 假设有10个节目需要播放。每个节目播放时长以15s为基准成倍增长。
    // Menu[0]表示第一个节目  menu[0] = 2 表示第一个节目的播放时长为2*15s;
    // menu_gy[] 存放公益节目
    public static int menu[] = {1, 5, 3, 7, 8, 9, 6, 4, 1, 2};
    public static int menu_gy[] = {4, 2, 3, 1,5,6};
    // 2，假设每个节目最低播放次数
    public static int minN[] = {15, 10, 11, 20, 12, 22, 30, 25, 10, 16};
    public static int minN_gy[] = {15, 10, 11, 20,10,12};
    // 3,假设每个节目最多播放次数
    public static int maxN[] = {20, 12, 13, 22, 14, 24, 32, 27, 12, 18};
    //public static int maxN_gy[] = {15, 10, 11, 20,10,12};
    public static int maxN_gy[] = {18, 14, 16, 25,14,16};

    // 开始计算
    public static void main(String[] args) {
        List<List<Integer>> allRtn = new ArrayList<List<Integer>>();
        List<Integer> rtnMenu = new ArrayList<Integer>();
        // 初始化节目i的播放次数
        // menu1[i] = 0 表示节目还没有被播放过，  = 1 表示被播放过一次
        // 前10位是普通节目  后6位是公益节目
        int[] visitN = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0,0};
        int[] randArray = randMenu();
        for (int m = 0 , l = randArray.length ; m < l ; m++){
            System.out.print(randArray[m] + " , " );
        }
        backtrack(visitN, randArray, rtnMenu, allRtn);

        System.out.println("所有解 = " + allRtn.size());
        System.out.println("节目单1 ");
        System.out.println(allRtn.get(0));

        int checkVisitN[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0,0,0};
        for (Integer a : allRtn.get(0)) {
            checkVisitN[a]++;
        }
        int length = checkVisitN.length;
        for (int i = 0; i < length; i++) {
            System.out.println( "节目" + (i + 1) + "  :  " + checkVisitN[i] + "  :  " + checkN(i, checkVisitN[i]));
        }
        System.out.println("节目总时长 = " + getMenuTotalTime(checkVisitN));


        System.out.println("节目单2 ");
        System.out.println(allRtn.get(1));
        int checkVisitN2[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        for (Integer a : allRtn.get(1)) {
            checkVisitN2[a]++;
        }
        int length2 = checkVisitN2.length;
        for (int i = 0; i < length2; i++) {
            System.out.println("节目" + (i + 1) + "  :  " + checkVisitN2[i] + "  :  " + checkN(i, checkVisitN2[i]));
        }
        System.out.println("节目总时长 = " + getMenuTotalTime(checkVisitN2));

    }

    /**
     * 获取节目总时长
     *
     * @param checkVisitN 节目数组
     * @return 总时长
     */
    private static int getMenuTotalTime(int[] checkVisitN) {
        // 所有播放过的节目个数
        int length = checkVisitN.length;
        // 商业节目个数-1
        int menuLength = menu.length - 1;
        // 总时长
        int totalTime = 0;
        for (int i = 0; i < 16; i++) {
            // 编号大于商业节目个数的时候  播放的是公益节目
            if (i > menuLength) {
                totalTime += menu_gy[i - 10] * checkVisitN[i];
            } else {
                // 编号小于于商业节目个数的时候  播放的是商业节目
                totalTime += menu[i] * checkVisitN[i];
            }
        }
        // 总时长乘以15等于总秒数
        int total = totalTime * 15;

        System.out.println("--------" + total / 3600);
        System.out.println("--------" + (total % 3600) / 60);
        System.out.println("--------" + total % 60);
        return total;
    }

    private static String checkN(int i, int num) {
        if (i > 9) {
            if (num < minN_gy[i - 10]) {
                return "未通过，公益节目播放次数未达到最小值";
            } else if (num > maxN_gy[i - 10]) {
                return "未通过，公益节目播放次数超过最大值";
            } else {
                return "OK";
            }
        } else {
            if (num < minN[i]) {
                return "未通过，普通节目播放次数未达到最小值";
            } else if (num > maxN[i]) {
                return "未通过，普通节目播放次数超过最大值";
            } else {
                return "OK";
            }
        }
    }

    private static void backtrack(int[] visitN, int[] menuIdArray, List<Integer> rtnMenu, List<List<Integer>> allRtn) {
        if (rtnMenu != null && rtnMenu.size() != 0) {
            //if (rtnMenu.size() != 0) {
                for (int i = 0, l = menuIdArray.length; i < l; i++) {
                    int menuId = menuIdArray[i];
                    // 判断新的节目Id是否与上一个节目Id相同，避免相同节目排在一起
                    if (rtnMenu.get(rtnMenu.size() - 1) == menuId)
                        continue;
                    // 该节目访问次数+1
                    visitN[menuId]++;
                    // 节目单接入节目编号
                    rtnMenu.add(menuId);
                    if (menuId > 9) {
                        if (visitN[menuId] < maxN_gy[menuId - 10]) {
                            backtrack(visitN, randMenu(), rtnMenu, allRtn);
                        } else {
                            visitN[menuId]--;
                            rtnMenu.remove(rtnMenu.size() - 1);
                            if (judgeMenu(visitN)) {
                                List<Integer> newList = new ArrayList<Integer>();
                                newList.addAll(rtnMenu);
                                allRtn.add(newList);
                            } else {
                            }
                        }
                    } else {
                        if (visitN[menuId] < maxN[menuId]) {
                            backtrack(visitN, randMenu(), rtnMenu, allRtn);
                        } else {
                            visitN[menuId]--;
                            rtnMenu.remove(rtnMenu.size() - 1);
                            if (judgeMenu(visitN)) {
                                List<Integer> newList = new ArrayList<Integer>();
                                newList.addAll(rtnMenu);
                                allRtn.add(newList);
                            } else {
                            }
                        }
                    }
                }
            } else {
                for (int i = 0, l = menuIdArray.length; i < l; i++) {
                    int menuID = menuIdArray[i];
                    // 该节目播放次数加1
                    visitN[menuID]++;
                    // 节目单接入节目编号
                    rtnMenu.add(menuID);
                    if (!judgeMenu(visitN)) {
                        backtrack(visitN, randMenu(), rtnMenu, allRtn);
                    }
                }
            }
        }


    //}

    private static int[] randMenu() {
        int length = menu_gy.length + menu.length;
        int[] temp = new int[16];
        int count = 0;
        while (count < 15) {
            int mum = randMenuId();
            boolean flag = true;
            for (int j = 0; j < 16; j++) {
                if (mum == temp[j]) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                temp[count] = mum;
                count++;
            }
        }
        return temp;
    }

    public static int[] cloneArray(int arrs[]) {
        int temp[] = new int[arrs.length];
        System.arraycopy(arrs, 0, temp, 0, arrs.length);
        return temp;

    }

    /**
     * 产生一个随机数在0到总节目数内的随机数
     *
     * @return 节目id
     */
    private static int randMenuId() {
        return (int) (0 + Math.random() * (15 - 0 + 1));
//        return (int) (Math.random() * (menu.length + menu_gy.length));
    }

    public static boolean judgeMenu(int visitN[]) {
        // 遍历校验播放次数是否满足要求

        // 所有播放过的节目个数
        int length = visitN.length;
        // 商业节目个数-1
        int menuLength = menu.length - 1;
        for (int i = 0; i < 16; i++) {
            // 编号大于商业节目个数的时候  播放的是公益节目
            if (i > 9) {
                if (visitN[i] < minN_gy[i - 10] || visitN[i] > maxN_gy[i - 10]) {
                    return false;
                }
            } else {
                // 编号小于商业节目个数的时候  播放的是商业节目
                if (visitN[i] < minN[i] || visitN[i] > maxN[i]) {
                    return false;
                }
            }
        }
        return true;
    }

}

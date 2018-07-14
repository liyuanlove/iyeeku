<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/5/17
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />--%>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
    <title>微信公众号开发</title>
    <link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
    <script type="text/javascript" src="https://res.wx.qq.com/open/libs/weuijs/1.1.3/weui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>

    <style>

/*        .weui-navbar__item{
            font-size: 12px;
            padding: 8px 0;
        }*/

        .weui-flex__item{
            border: 1px solid gray;
        }

        .weui-navbar__item.weui-bar__item_on{
            color: red;
            border-bottom: 2px solid red;
            background-color: #fafafa;
        }
        .weui-navbar__item:after{
            border-right: 0px;
        }


        /*  =============== 商品展示区样式   ========================= */

* {
    margin: 0;
    padding: 0;
    border: 0;
    list-style: none;
    -webkit-tap-highlight-color: transparent;
    -webkit-appearance: none;
}


a:link {
    text-decoration: none;
}

a:visited {
    text-decoration: none;
    background-color: transparent !important;
}

i {
    font-style: normal;
}

        .goods-list {
            background: #fff;
            width: 100%;
            overflow: hidden;
            font-size: 0.928rem;
            margin-bottom: 10px;
        }

.goods-list li:nth-of-type(odd) {
    padding: 5px 2px 0 5px;
    box-sizing: border-box;
}

.goods-list li:nth-of-type(even) {
    padding: 5px 5px 0 2px;
    box-sizing: border-box;
}

.goods-list .line {
    width: 50%;
    overflow: hidden;
    float: left;
    position: relative;
    padding-bottom: 15px;
}

.goods-list .line-pic {
    position: relative;
    padding-top: 100%;
    background: url(../../images/we/loading_181x181.gif) no-repeat center center;
    background-size: cover;
    position: relative;
}

.goods-list .line-pic div {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

.goods-list .line-pic .number {
    position: absolute;
    right: 4px;
    bottom: 4px;
    height: 14px;
    line-height: 14px;
    background: rgba(0,0,0,0.5);
    border-radius: 2px;
    padding: 0 9px;
    font-size: 9px;
    color: #fff;
}

.goods-list-h {
    margin-top: 13px;
    overflow: hidden;
}

.goods-list .line-title, .goods-list .line-selling, .line-money {
    overflow: hidden;
    white-space: nowrap;
    text-align: left;
    padding: 0 3px;
    box-sizing: border-box;
    text-overflow: ellipsis;
}

.goods-list .line-title {
    color: #000000;
    font-size: 1rem;
    white-space: nowrap;
}

.goods-list .line-selling {
    color: #7f7f7f;
    font-size: 0.857rem;
    width: 100%;
}

.goods-list .por-car .left {
    display: inline-block;
}

.goods-list .line-red {
    color: #e50012;
    font-size: 0.757rem;
    margin-top: 7px;
    font-weight: bold;
    text-align: left;
    padding: 0 3px;
    line-height: 15px;
}


.goods-list .line-money {
    font-size: 0.757rem;
    height: 17px;
    line-height: 17px;
}

.goods-list-h span.money {
    letter-spacing: -1px;
}

.goods-list-h span.vip, .goods-list-h span.money {
    width: 64px;
    display: block;
    float: left;
}


.goods-list .goods-list-h .shopping-cart {
    float: right;
    margin-right: 5px;
    margin-top: 5px;
    background: url(../../images/we/shopping-cart.png) no-repeat;
    background-size: contain;
    width: 32px;
    height: 32px;
}








    </style>

        <script>
            $(function() {
                $(".weui-navbar__item").click(function(){
                    $(".weui-navbar__item").removeClass("weui-bar__item_on");
                    $(this).addClass("weui-bar__item_on");
                    $(".home_panel").css("display","none");
                    $($(".home_panel")[$(this).index()]).css("display","block");
                });

                $(".weui-tabbar__item").click(function (){
                    $(".weui-tabbar__item").removeClass("weui-bar__item_on");
                    $(this).addClass("weui-bar__item_on");
                    $(".tabbarCtrContent").css("display","none");
                    $($(".tabbarCtrContent")[$(this).index()]).css("display","block");

                });

            })
        </script>

</head>
<body ontouchstart style="height: 100%;">


<div class="weui-tab" style="height: 100%;width: 100%;">

    <div class="weui-tab__panel">
        <div class="tabbarCtrContent">

            <!-- 首页 -->
            <div class="weui-tab">
                    <div class="weui-navbar test111" style="position: fixed;">
                        <div class="weui-navbar__item weui-bar__item_on">
                            全部
                        </div>
                        <div class="weui-navbar__item">
                            特供
                        </div>
                        <div class="weui-navbar__item">
                            好食材
                        </div>
                        <div class="weui-navbar__item">
                            零食
                        </div>
                        <div class="weui-navbar__item">
                            生鲜
                        </div>
                    </div>
                <div class="weui-tab__panel">
                    <div class="home_panel">

                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide" style="height: 190px;">
                                    <a href="#">
                                        <img src="../../images/we/下载11.jpg" style="width: 100%;height: auto;" alt="">
                                    </a>
                                </div>
                                <div class="swiper-slide" style="height: 190px;">
                                    <a href="#">
                                        <img src="../../images/we/下载12.jpg" style="width: 100%;height: auto;" alt="">
                                    </a>
                                </div>
                                <div class="swiper-slide" style="height: 190px;">
                                    <a href="#">
                                        <img src="../../images/we/下载13.jpg" style="width: 100%;height: auto;" alt="">
                                    </a>
                                </div>

                                <!-- 如果需要分页器 -->
                                <div class="swiper-pagination"></div>

                            </div>
                        </div>

                        <script>
                            var mySwiper = new Swiper ('.swiper-container', {
                                loop : true,
                                autoplay: {
                                    disableOnInteraction: false,
                                },
                                pagination: {
                                    el: '.swiper-pagination',
                                },
                            })
                        </script>

                        <div class="weui-flex" style="height: 10px; background-color: #f5f4f9;">
                        </div>


                        <div class="weui-flex" style="height: 100px;">
                            <div class="weui-flex__item"><div class="placeholder">消息展示</div></div>
                        </div>

                        <div class="weui-flex" style="height: 10px; background-color: #f5f4f9;">
                        </div>

                        <!-- 商品展示区 -->
                        <ul class="goods-list img-content">

                            <li class="line">
                                <div class="line-pic">
                                    <a href="#">
                                        <div class="lazy-div" style="background-image: url(../../images/we/下载1.jpg);">
                                        </div>
                                    </a>
                                    <span class="number">
                                        已售<i>9021</i>袋
                                    </span>
                                </div>
                                <div class="goods-list-h">
                                    <p class="line-title">五常有机大米</p>
                                    <p class="line-selling">门店同款</p>
                                    <div class="por-car">
                                        <div class="left">
                                            <p class="line-red">
                                                <span class="vip">VIP特权价</span>¥119.00
                                            </p>
                                            <p class="line-money">
                                                <span class="money">普通会员价</span>¥135.00
                                            </p>
                                        </div>
                                        <a class="shopping-cart add_shopCart_opt"></a>
                                    </div>
                                </div>
                            </li>

                            <li class="line">
                                <div class="line-pic">
                                    <a href="#">
                                        <div class="lazy-div" style="background-image: url(../../images/we/下载2.jpg);">
                                        </div>
                                    </a>
                                    <span class="number">
                                        已售<i>9021</i>袋
                                    </span>
                                </div>
                                <div class="goods-list-h">
                                    <p class="line-title">五常有机大米</p>
                                    <p class="line-selling">门店同款</p>
                                    <div class="por-car">
                                        <div class="left">
                                            <p class="line-red">
                                                <span class="vip">VIP特权价</span>¥119.00
                                            </p>
                                            <p class="line-money">
                                                <span class="money">普通会员价</span>¥135.00
                                            </p>
                                        </div>
                                        <a class="shopping-cart add_shopCart_opt"></a>
                                    </div>
                                </div>
                            </li>

                            <li class="line">
                                <div class="line-pic">
                                    <a href="#">
                                        <div class="lazy-div" style="background-image: url(../../images/we/下载3.jpg);">
                                        </div>
                                    </a>
                                    <span class="number">
                                        已售<i>9021</i>袋
                                    </span>
                                </div>
                                <div class="goods-list-h">
                                    <p class="line-title">五常有机大米</p>
                                    <p class="line-selling">门店同款</p>
                                    <div class="por-car">
                                        <div class="left">
                                            <p class="line-red">
                                                <span class="vip">VIP特权价</span>¥119.00
                                            </p>
                                            <p class="line-money">
                                                <span class="money">普通会员价</span>¥135.00
                                            </p>
                                        </div>
                                        <a class="shopping-cart add_shopCart_opt"></a>
                                    </div>
                                </div>
                            </li>

                            <li class="line">
                                <div class="line-pic">
                                    <a href="#">
                                        <div class="lazy-div" style="background-image: url(../../images/we/下载4.jpg);">
                                        </div>
                                    </a>
                                    <span class="number">
                                        已售<i>9021</i>袋
                                    </span>
                                </div>
                                <div class="goods-list-h">
                                    <p class="line-title">五常有机大米</p>
                                    <p class="line-selling">门店同款</p>
                                    <div class="por-car">
                                        <div class="left">
                                            <p class="line-red">
                                                <span class="vip">VIP特权价</span>¥119.00
                                            </p>
                                            <p class="line-money">
                                                <span class="money">普通会员价</span>¥135.00
                                            </p>
                                        </div>
                                        <a class="shopping-cart add_shopCart_opt"></a>
                                    </div>
                                </div>
                            </li>


                        </ul>


                        <div class="weui-flex" style="height: 200px;">
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                        </div>

                        <div class="weui-flex" style="height: 200px;">
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                        </div>

                        <div class="weui-flex" style="height: 200px;">
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                        </div>

                        <div class="weui-flex" style="height: 200px;">
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                        </div>

                        <div class="weui-flex" style="height: 200px;">
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                        </div>

                        <div class="weui-flex" style="height: 200px;">
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                        </div>

                        <div class="weui-flex" style="height: 200px;">
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                        </div>

                        <div class="weui-flex" style="height: 200px;">
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                            <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                        </div>

                    </div>
                    <div class="home_panel" style="display:none">特供展示页面</div>
                    <div class="home_panel" style="display:none">好食材</div>
                    <div class="home_panel" style="display:none">零食</div>
                    <div class="home_panel" style="display:none">生鲜</div>
                </div>
            </div>

        </div>

        <!-- 发现页 -->
        <div class="tabbarCtrContent" style="display:none">

            <div class="weui-flex" style="height: 150px;background-color: #00bfff;color: white;">
                好牛奶，助你零基础驾驭两款经典奶甜品
            </div>

            <div class="weui-flex" style="height: 150px;background-color: #c9a6ff;color: white;">
                减肥必备：适合懒人的百搭主粮
            </div>

            <div class="weui-flex" style="height: 150px;background-color: #ffbdeb;color: white;">
                一碗粥，号称民国第一夫人的养颜秘籍
            </div>

            <div class="weui-flex" style="height: 150px;background-color: #d1ffe0;color: white;">
                营养满分！自制Smoothie早晨
            </div>

            <div class="weui-flex" style="height: 150px;background-color: #ffe8cd;color: white;">
                亲测：家庭锅具养护指南
            </div>

            <div class="weui-flex" style="height: 150px;background-color: #b0d4ff;color: white;">
                武保林: 我敢说这是全中国最好的沙拉
            </div>

            <div class="weui-flex" style="height: 150px;background-color: #ffa27e;color: white;">
                与好粥对话：用心煮好一粥一饭
            </div>

            <div class="weui-flex" style="height: 150px;background-color: #b559ff;color: white;">
                春夏吃汤面有点热？空心挂面这么吃就舒服
            </div>

            <div class="weui-flex" style="height: 150px;background-color: #9d6eff;color: white;">
                最佳买米间隔出炉，请对号入座
            </div>

            <div class="weui-flex" style="height: 150px;background-color: #47bcff;color: white;">
                好酱油值得好好用：4款经典复合酱油汁
            </div>

        </div>

        <!-- 购物车页 -->
        <div class="tabbarCtrContent" style="display:none">

            <div class="weui-flex" style="height: 320px;background-color: #f5f4f9;">
                <div style="width: 150px;height: 120px;margin: auto;">
                    <div style="width: 80px;height: 80px;margin: auto;">
                        <img src="../../images/we/购物车11.png" alt="" style="width: 80px;height: 80px;">
                    </div>
                    <div style="margin: auto;font-size: 14px;text-align: center;">
                        购物车还没有商品哦
                    </div>
                </div>
            </div>

            <div class="weui-flex" style="background-color:#f5f4f9;font-size: 14px;color: #999;">
                <font style="margin: auto;">-- 推荐商品 --</font>
            </div>

            <div class="weui-flex" style="height: 10px;">

            </div>

            <div class="weui-flex" style="height: 200px;">
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
            </div>

            <div class="weui-flex" style="height: 200px;">
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
            </div>

            <div class="weui-flex" style="height: 200px;">
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
            </div>

            <div class="weui-flex" style="height: 200px;">
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
            </div>


        </div>

        <!-- 我的基本信息页 -->
        <div class="tabbarCtrContent" style="display:none">
            <div class="weui-flex" style="height: 120px;background-color: red;">
                <div style="display: block;width: 60px;height: 60px;margin: 30px 0px 0px 20px;background-color: white;border-radius: 50%;"></div>
            </div>
            <div class="weui-panel__ft">
                <a href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link">
                    <div class="weui-cell__bd">我的订单</div>
                    <span class="weui-cell__ft">查看更多订单</span>
                </a>
            </div>

            <div class="weui-flex" style="height: 90px; border-top: 1px solid #f5f4f9;">
                <table style="width: 100%;height: 100%;color: #999;">
                    <tr>
                        <td align="center">
                            <img src="../../images/we/付款.png" alt="" style="height: 28px;height: 28px;">
                            <br/>
                            待付款
                        </td>
                        <td align="center">
                            <img src="../../images/we/待发货.png" alt="" style="height: 28px;height: 28px;">
                            <br/>
                            待发货
                        </td>
                        <td align="center">
                            <img src="../../images/we/发货.png" alt="" style="height: 28px;height: 28px;">
                            <br/>
                            已发货
                        </td>
                        <td align="center">
                            <img src="../../images/we/评价.png" alt="" style="height: 28px;height: 28px;">
                            <br/>
                            待评价
                        </td>
                    </tr>
                </table>
            </div>

            <div class="weui-flex" style="height: 15px; background-color: #f5f4f9;">

            </div>

            <div class="weui-flex" style="height: 42px;font-size: 14px;">
                <div style="display: block;margin: 10px 0px 0px 15px;">我的服务</div>
            </div>

            <div class="weui-flex" style="height: 90px;">
                <table style="width: 100%;height: 100%;">
                    <tr>
                        <td align="center" style="width: 20%;font-size:13px;border-top: 1px solid #f5f4f9;border-right: 1px solid #f5f4f9;">
                            <img src="../../images/we/优惠券.png" alt="" style="height: 22px;height: 22px;">
                            <br/>
                            优惠券(0)
                        </td>
                        <td align="center" style="width: 20%;font-size:13px;border-top: 1px solid #f5f4f9;border-right: 1px solid #f5f4f9;">
                            <img src="../../images/we/收货地址.png" alt="" style="height: 22px;height: 22px;">
                            <br/>
                            收获地址
                        </td>
                        <td align="center" style="width: 20%;font-size:13px;border-top: 1px solid #f5f4f9;border-right: 1px solid #f5f4f9;">
                            <img src="../../images/we/收藏夹.png" alt="" style="height: 22px;height: 22px;">
                            <br/>
                            收藏夹
                        </td>
                        <td align="center" style="width: 20%;font-size:13px;border-top: 1px solid #f5f4f9;border-right: 1px solid #f5f4f9;">
                            <img src="../../images/we/常见问题.png" alt="" style="height: 22px;height: 22px;">
                            <br/>
                            常见问题
                        </td>
                        <td align="center" style="width: 20%; font-size:13px; border-top: 1px solid #f5f4f9;">
                             <img src="../../images/we/联系客服.png" alt="" style="height: 22px;height: 22px;">
                            <br/>
                            联系客服
                        </td>
                    </tr>
                </table>
            </div>

            <div class="weui-flex" style="height: 15px; background-color: #f5f4f9;">

            </div>


            <div class="weui-flex" style="height: 80px;">
                广告区
            </div>

            <div class="weui-flex" style="height: 15px; background-color: #f5f4f9;">

            </div>

            <div class="weui-flex" style="height: 42px;font-size: 14px;">
                <div style="display: block;margin: 10px 0px 0px 15px;">会员特供</div>
            </div>

            <div class="weui-flex" style="height: 200px;">
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
            </div>

            <div class="weui-flex" style="height: 200px;">
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
            </div>

            <div class="weui-flex" style="height: 200px;">
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
            </div>

            <div class="weui-flex" style="height: 200px;">
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
                <div class="weui-flex__item"><div class="placeholder">商品展示区</div></div>
            </div>






        </div>
    </div>
    <div class="weui-tabbar" style="position: fixed;">
        <a href="javascript:;" class="weui-tabbar__item weui-bar__item_on">
            <img src="../../images/we/首页.png" alt="" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">首页</p>
        </a>
        <a href="javascript:;" class="weui-tabbar__item">
            <img src="../../images/we/发现.png" alt="" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">发现</p>
        </a>
        <a href="javascript:;" class="weui-tabbar__item">
            <img src="../../images/we/购物车.png" alt="" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">购物车</p>
        </a>
        <a href="javascript:;" class="weui-tabbar__item">
            <img src="../../images/we/我.png" alt="" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">我</p>
        </a>
    </div>


</div>



</body>
</html>

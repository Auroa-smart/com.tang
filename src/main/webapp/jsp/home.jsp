<%@ page import="tang.Service.Comment.CommentService" %>
<%@ page import="tang.Service.Comment.CommentServiceImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="tang.Entity.Comment" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit"/>
    <meta name="viewport"
          content="width=device-width,user-scalable=0,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"/>
    <title>浙江师范大学</title>
    <meta name="keywords" content="浙江师范大学">
    <link rel="stylesheet" href="../html/css/style5.css" >
    <link rel="stylesheet" href="../pages/layui-v2.7.5/layui/css/layui.css" >
</head>
<body class="main">
<!--Start||head-->
<div style="z-index: 2000"><p id="top"></p></div>
<div id="pst2" style="text-align:center; width: 30px;height: 40px;border-radius: 10px;background-color: red;position: fixed;" ><a href="#top">回到顶部</a></div>
<div class="wrapper header nav wp-navi" id="header">
    <div class="inner">
        <div class="mod clearfix">
            <div class="navbox">
                <div class="wp-window wcb" frag="窗口1">

                    <ul class="wp-menu clearfix" data-nav-aside='{"title":"导航","index":0}'>

                        <li class="menu-item i1"><a class="menu-link" href="" target="_self">xxx</a>
                        </li>

                        <li class="menu-item i2"><a class="menu-link" href="http://www.zjnu.edu.cn/"
                                                    target="_self">浙师大</a>
                        </li>

                        <li class="menu-item i3"><a class="menu-link" href="http://paper.people.com.cn/rmrb/html/2022-09/02/nbs.D110000renmrb_01.htm"
                                                    target="_self">人民日报</a>
                        </li>

                        <li class="menu-item i4"><a class="menu-link" href="http://xh.xhby.net/pc/layout/202209/02/node_1.html"
                                                    target="_self">新华日报</a>
                        </li>

<%--                        <li class="menu-item i5"><a class="menu-link" href="http://www.fudan.edu.cn/489/list.htm"--%>
<%--                                                    target="_self">机构设置</a>--%>
<%--                        </li>--%>

<%--                        <li class="menu-item i6"><a class="menu-link" href="" target="_self">校园生活</a>--%>
<%--                        </li>--%>
                    </ul>
                    <ul class="layui-nav layui-layout-right">
                        <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                            <a href="javascript:;">
                                <img src="../img/6.jpg" class="layui-nav-img">
                                tester
                            </a>
                            <dl class="layui-nav-child">
                                <dd><a href="excute.jsp">修改密码</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/user.do?method=query">管理员界面</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/jsp/comment.jsp">评论</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/logout.do">退出登录</a></dd>
                            </dl>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="banner_nav"><img src="../html/html/img/111.png" alt=" " width="100%"></div>

<!--End||nav-->
<!--Start||focus-->
<!--轮播窗-->
<div class="wrapper mbanner" id="banner">
    <div class="inner clearfix">
        <div class="artpic_banner" frag="窗口2">
            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div><img src="../html/html/image/1.jpg" alt=""></div>
                    <div><img src="../html/html/image/2.jpg" alt=""></div>
                    <div><img src="../html/html/image/3.jpg" alt=""></div>
                    <div><img src="../html/html/image/4.jpg" alt=""></div>
                    <div><img src="../html/html/image/5.jpg" alt=""></div>
                </div>
            </div>
            <script src="../pages/layui-v2.7.5/layui/layui.js"></script>
            <script>
                layui.use('carousel', function(){
                    var carousel = layui.carousel;
                    //建造实例
                    carousel.render({
                        elem: '#test1'
                        //原本是100%
                        ,width: '1400px' //设置容器宽度
                        ,height:'544.431px'
                        ,arrow: 'always' //始终显示箭头
                        // ,anim: 'updown' //切换动画方式
                    });
                });
            </script>


            <div class="asides">
                <div class="site-rale wcb" frag="窗口04">

                    <!--左侧导航-->
                    <ul class="clearfix" data-nav-aside='{"title":"快速通道","index":1}'  style="width: 150px">

                        <li class="links i1"><a href="" target="_blank">xxx</a></li>

                        <li class="links i2"><a href="" target="_self">xxx</a>
                        </li>

                        <li class="links i3"><a href="" target="_self">xxx</a></li>

                        <li class="links i4"><a href="" target="_self">xxx</a></li>

                        <li class="links i5"><a href="" target="_self">xxx</a></li>

                        <li class="links i6"><a href="" target="_blank">xxx</a></li>

                        <li class="links i7"><a href="" target="_self">xxx</a></li>

                    </ul>


                </div>
                <div class="asides-sharebox">
                    <div class="asides-share wcb" frag="窗口106">
                        <div class="shares clearfix">

                            <ul>

                                <li class="i1">
                                    <a href="https://weixin.qq.com/" target="_blank"></a>
                                    <span><a href='https://weixin.qq.com/' target='_blank' title='微信'>微信</a></span>
                                    <div class="con"><img
                                            src='微信二维码图片'
                                            width='90'/></div>
                                </li>

                                <li class="i2">
                                    <a href="https://weibo.com/zjnugfwb" target="_blank"></a>
                                    <span><a href='https://weibo.com/zjnugfwb' target='_blank' title='微博'>微博</a></span>
                                    <div class="con"></div>
                                </li>

                                <li class="i3">
                                    <a href="https://www.douyin.com/" target="_blank"></a>
                                    <span><a href='https://www.douyin.com/' target='_blank' title='抖音'>抖音</a></span>
                                    <div class="con"><img
                                            src='/_upload/article/images/9e/53/d3fe76c743e39931cf233cb82e7c/6539e26e-7e6d-4ff4-8f61-ca06f5149f3f_s.jpg'
                                            width='90'/></div>
                                </li>

                            </ul>

                        </div>
                    </div>
                </div>
            </div>


            <div class="banner_nav2"><img src="../html/html/img/222.png" width="100%"></div>
            <div class="search_box">
                <div class="searchbox m wcb" frag="窗口03" portletmode="search">
                    <!--                搜索组件-->
                    <div class="wp-search clearfix">
                        <form action="${pageContext.request.contextPath}/jsp/search.jsp"
                              method="post" target="_blank">
                            <div class="search-input">
                                <input name="keyword" class="search-title" type="text" placeholder="请输入关键词..."/>
                            </div>
                            <div class="search-btn">
                                <input name="submit" class="search-submit m" type="submit" value="Search"/>
                            </div>
                        </form>
                    </div>
                    <!--                //复制以上代码到自定义搜索-->

                </div>
            </div>
        </div>
    </div>

    <!--End||focus-->
    <!--Start||content-->

    <div class="wrapper main1" id="container-1">
        <div class="inner">
            <div class="mod clearfix">
                <div class="post post3 post-11 mbox" frag="窗口11">
                    <div class="tt">
                        <h3 class="tit"><span class="title" frag="标题">新闻聚焦</span></h3>
                    </div>
                    <div class="con news_tu">
                        <div class="listTable">
                            <ul class="news_list clearfix">
                                <li class="news n1 none show" style="display:list-item">
                                    <div class="news_box clearfix"
                                         href="doc/story1.jsp" target="_blank">
                                        <div class="news_imgs">
                                            <a class="imgs" href="doc/story1.jsp"
                                               target="_blank"><img
                                                    src="../html/html/image/1.jpg"
                                                    width="320"/></a>
                                        </div>
                                        <div class="news_wz">
                                            <div class="news_con">
                                                <div class="news_title">
                                                    <a href='doc/story1.jsp'
                                                       target='_blank'
                                                       title='张启山'>张启山烈士</a>
                                                </div>
                                                <div class="news_text">
                                                    曹宅镇，坐落于金华市金东区东北部，临近山区。1945年5月2日，抗日战争末期...
                                                </div>
                                                <div class="news_time">
                                                    <span class="times">2022-08-01</span><span class="views">(12)</span>
                                                </div>
                                                <span  class="share-box" data-id="132085"
                                                       data-title="建军95周年！复旦征兵20年，别样青春出列！"
                                                       data-summary="今天（8月1日），中国人民解放军迎来建军95周年，让我们向最可爱的人致敬！今年，是复旦开展大学生征兵工作..."
                                                       data-pic="/_upload/article/images/14/bb/a4469149447580be50711ad8e056/d7ce4e60-4bba-4007-8cb2-eeae16349171.jpg"
                                                       data-url="http://news.fudan.edu.cn/2022/0802/c5a132085/page.htm"
                                                       style="display: none;">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="news n2 none show" style="display:list-item">
                                    <div class="news_box clearfix"
                                         href="doc/story2.jsp" target="_blank">
                                        <div class="news_imgs">
                                            <a class="imgs" href="doc/story2.jsp"
                                               target="_blank"><img
                                                    src="../html/html/image/浙武文物%20(1).jpg"
                                                    width="320"/></a>
                                        </div>
                                        <div class="news_wz">
                                            <div class="news_con">
                                                <div class="news_title">
                                                    <a href='doc/story2.jsp'
                                                       target='_blank'
                                                       title='空中神炮手'>空中神炮手</a>
                                                </div>
                                                <div class="news_text">
                                                    位于浙江金华兰溪的石渠村，拥有悠久的历史，其村中最大姓氏为鲍氏，还有吕，徐，王，方等50余个姓氏...
                                                </div>
                                                <div class="news_time">
                                                    <span class="times">2022-08-01</span><span class="views">(12)</span>
                                                </div>
<%--&lt;%&ndash;                                                <span  class="share-box" data-id="132085"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                       data-title="别样青春出列！"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                       data-summary="位于浙江金华兰溪的石渠村，拥有悠久的历史，其村中最大姓氏为鲍氏，还有吕，徐，王，方等50余个姓氏..."&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                       data-pic="/_upload/article/images/14/bb/a4469149447580be50711ad8e056/d7ce4e60-4bba-4007-8cb2-eeae16349171.jpg"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                       data-url="http://news.fudan.edu.cn/2022/0802/c5a132085/page.htm"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                       style="display: none;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </span>&ndash;%&gt;--%>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="news n3 none show" style="display:list-item">
                                    <div class="news_box clearfix"
                                         href="" target="_blank">
                                        <div class="news_imgs">
                                            <a class="imgs" href=""
                                               target="_blank"><img
                                                    src="../html/html/image/浙武文物%20(4).jpg"
                                                    width="320"/></a>
                                        </div>
                                        <div class="news_wz">
                                            <div class="news_con">
                                                <div class="news_title">
                                                    <a href=''
                                                       target='_blank'
                                                       title=''>...</a>
                                                </div>
                                                <div class="news_text">
                                                   ...
                                                </div>
                                                <div class="news_time">
                                                    <span class="times">2022-08-01</span><span class="views">(12)</span>
                                                </div>
                                                <span  class="share-box" data-id="132085"
                                                       data-title="..."
                                                       data-summary="..."
                                                       data-pic="/_upload/article/images/14/bb/a4469149447580be50711ad8e056/d7ce4e60-4bba-4007-8cb2-eeae16349171.jpg"
                                                       data-url=""
                                                       style="display: none;">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <div class="more_btn" frag="按钮" type="更多" link="https://news.fudan.edu.cn/"><a
                                    href="https://news.fudan.edu.cn/" class="w11_more"><span class="more_text"
                                                                                             frag="按钮内容">查看更多</span></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="wrapper main2" id="container-2">
        <div class="inner">
            <div class="mod clearfix">
                <div class="post post3 post-21 mbox" frag="窗口21">
                    <div class="tt">
                        <h3 class="tit"><span class="title" frag="标题">文化日历</span></h3>
                    </div>
                    <div class="con rili">
                        <!--                        这里原本是rili1-->
                        <ul class="news_list clearfix">

                            <li class="news topic-news n1">
                                <div class="news_box clearfix">
                                    <div class="news_date" data-times="2022-06-16">
                                        <div class="news_year">2022</div>
                                        <div class="news_days">7.16</div>
                                        <div class="news_pre">精彩</div>
                                    </div>
                                    <div class="news_wz">
                                        <div class="news_con">
                                            <div class="news_title"><a href="">鲍寿根事迹终</a></div>
                                            <div class="news_text">
                                                <p class="t1"><i></i>1931</p>
                                                <p class="t2"><i></i>”空中神炮手“</p>
                                                <p class="t3"><i></i>烈士暮年，壮心不已</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class="news topic-news n2">
                                <div class="news_box clearfix">

                                    <div class="news_date" data-times="2022-04-28">
                                        <div class="news_year">2022</div>
                                        <div class="news_days">7.21</div>
                                        <div class="news_pre">精彩</div>
                                    </div>
                                    <div class="news_wz">
                                        <div class="news_con">
                                            <div class="news_title"> <a href="">张达文终</a>
                                            </div>
                                            <div class="news_text">
                                                <p class="t1"><i></i>兰溪区守护神</p>
                                                <p class="t2"><i></i>1905</p>
                                                <p class="t3"><i></i>舍小家为大家</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class="news topic-news n3">
                                <div class="news_box clearfix">
                                    <div class="news_date" data-times="2022-04-27">
                                        <div class="news_year"></div>
                                        <div class="news_days"></div>
                                        <div class="news_pre">讲座</div>
                                    </div>
                                    <div class="news_wz">
                                        <div class="news_con">

                                            <div class="news_title"><a
                                                    href=''
                                                    target='_blank' title=''></a></div>
                                            <div class="news_text">
                                                <p class="t1"><i></i>19:00-20:00</p>
                                                <p class="t2"><i></i></p>
                                                <p class="t3"><i></i></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>

                        <ul class="news_list clearfix">

                            <li class="news topic-news n1">
                                <div class="news_box clearfix">
                                    <div class="news_date" data-times="2022-06-16">
                                        <div class="news_year">2022</div>
                                        <div class="news_days">7.16</div>
                                        <div class="news_pre">精彩</div>
                                    </div>
                                    <div class="news_wz">
                                        <div class="news_con">
                                            <div class="news_title"><a href="doc/ppt/鲍寿根事迹终.pptx">鲍寿根事迹终</a></div>
                                            <div class="news_text">
                                                <p class="t1"><i></i>1931</p>
                                                <p class="t2"><i></i>”空中神炮手“</p>
                                                <p class="t3"><i></i>烈士暮年，壮心不已</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class="news topic-news n2">
                                <div class="news_box clearfix">

                                    <div class="news_date" data-times="2022-04-28">
                                        <div class="news_year">2022</div>
                                        <div class="news_days">7.21</div>
                                        <div class="news_pre">精彩</div>
                                    </div>
                                    <div class="news_wz">
                                        <div class="news_con">
                                            <div class="news_title"> <a href="doc/ppt/张文达终.pptx">张达文终</a>
                                            </div>
                                            <div class="news_text">
                                                <p class="t1"><i></i>兰溪区守护神</p>
                                                <p class="t2"><i></i>1905</p>
                                                <p class="t3"><i></i>舍小家为大家</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class="news topic-news n3">
                                <div class="news_box clearfix">
                                    <div class="news_date" data-times="2022-04-27">
                                        <div class="news_year">2022</div>
                                        <div class="news_days">8.1</div>
                                        <div class="news_pre">...</div>
                                    </div>
                                    <div class="news_wz">
                                        <div class="news_con">

                                            <div class="news_title"><a
                                                    href='http://news.fudan.edu.cn/2022/0428/c236a131090/page.htm'
                                                    target='_blank' title='...'>...</a></div>
                                            <div class="news_text">
                                                <p class="t1"><i></i>...</p>
                                                <p class="t2"><i></i>...</p>
                                                <p class="t3"><i></i>...</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>


                        <div class="more_btn">

                            <span class="more_text" frag="窗口422" portletmode="windowMore"><span class="more"><a
                                    class="more-link" href="/427/list.htm" title="显示更多"><span class="moretext"><font
                                    style='color: #000000;font-family: 宋体;font-size: 10px;'>查看更多</font></span></a></span></span>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="wrapper main5" id="container-5">
            <div class="inner">
                <div class="mod clearfix">
                    <div class="links_boxs">
                        <div class="news_title">
                            <div class="news_titlecon">百年征程波澜壮阔，百年初心历久弥坚</div>
                        </div>
                        <div class="news_links"><a href="http://lib.zjnu.edu.cn/" target="_blank">点击进入图书馆</a></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="wrapper main6" id="container-6">
            <div class="inner">
                <div class="mod clearfix">
                    <div class="post post3 post-61 mbox" frag="窗口61">
                        <div class="tt">
                            <h3 class="tit"><span class="title" frag="标题" style="color: black">精彩时刻</span></h3>
                        </div>
                        <div class="con">
                            <ul class="news_list clearfix">
                                <li class="news n1 clearfix">
                                    <a class="news_box clearfix video_link"
                                       href="">
                                        <div class="news_imgs">
                                            <div class="news_imgsbox">
                                                <div class="news_bg"></div>
                                                <img src='../html/html/image/8.jpg'
                                                     width='320' height="120"/>
                                            </div>
                                        </div>
                                        <div class="news_wz">
                                            <div class="news_con">
                                                <div class="news_pre"></div>
                                                <div class="news_title">浙师晨光</div>
                                                <div class="news_text">散在光华大道的第一缕阳光，为你唤醒此刻浙师，拥抱新的一天和忙碌的自己，我们在复旦等你。</div>
                                                <!--<div class="news_meta">作者：-</div>-->
                                            </div>
                                        </div>
                                    </a>
                                </li>

                                <li class="news n2 clearfix">
                                    <a class="news_box clearfix video_link"
                                       href="doc/vedio/上课视频.MTS">
                                        <div class="news_imgs">
                                            <div class="news_imgsbox">
                                                <div class="news_bg"></div>
                                                <img src='../html/html/image/金华烈士文物%20%20(12).jpg'
                                                     width='320' />
                                            </div>
                                        </div>
                                        <div class="news_wz">
                                            <div class="news_con">
                                                <div class="news_pre"></div>
                                                <div class="news_title">你的选择</div>
                                                <div class="news_text">你的选择，就是国家和世界的未来。</div>
                                                <!--<div class="news_meta">作者：-</div>-->
                                            </div>
                                        </div>
                                    </a>
                                </li>

                                <li class="news n3 clearfix">
                                    <a class="news_box clearfix video_link"
                                       href="">
                                        <div class="news_imgs">
                                            <div class="news_imgsbox">
                                                <div class="news_bg"></div>
                                                <img src='../html/html/image/陈双田05.JPG'
                                                     width='320'/>
                                            </div>
                                        </div>
                                        <div class="news_wz">
                                            <div class="news_con">
                                                <div class="news_pre"></div>
                                                <div class="news_title">青春为祖国歌唱</div>
                                                <div class="news_text">
                                                    今天历史的接力棒已经交到了我们手中，我们这一代青年要接过前辈老师的接力棒，努力追梦、努力奔跑，为建设一个更强大、更美好的国家贡献青春力...
                                                </div>
                                                <!--<div class="news_meta">作者：-</div>-->
                                            </div>
                                        </div>
                                    </a>
                                </li>

                                <li class="news n4 clearfix">
                                    <a class="news_box clearfix video_link"
                                       href="">
                                        <div class="news_imgs">
                                            <div class="news_imgsbox">
                                                <div class="news_bg"></div>
                                                <img src='../html/html/image/金华烈士文物%20%20(16).jpg'
                                                     width='320'/>
                                            </div>
                                        </div>
                                        <div class="news_wz">
                                            <div class="news_con">
                                                <div class="news_pre"></div>
                                                <div class="news_title">平凡又不平凡的一天</div>
                                                <div class="news_text">
                                                    这是平凡的一天。这也是浙师人勇于追梦、拼搏奋斗的一天又一天。这是平凡的一年。这也是复旦人心怀家国、服务奉献的一年又一年。日继一日，初心方得始终，旦复旦...
                                                </div>
                                                <!--<div class="news_meta">作者：-</div>-->
                                            </div>
                                        </div>
                                    </a>
                                </li>

                            </ul>

                        </div>
                        <div class="more_btn" frag="按钮" type="更多" link="https://news.fudan.edu.cn/44/main.htm"><a
                                href="https://news.fudan.edu.cn/44/main.htm" class="w61_more"><span class="more_text"
                                                                                                    frag="按钮内容">查看更多</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%--在主页中写评论感觉有点突兀了--%>
<%--<section style="margin-left: 20px">--%>
<%--    <h3 class="tit"><span class="title" frag="标题">评论区</span></h3>--%>
<%--    &lt;%&ndash;//写一级评论&ndash;%&gt;--%>
<%--    <div>--%>
<%--        <form action="${pageContext.request.contextPath}/comment.do" method="get">--%>
<%--            <input type="hidden" name="method" value="writeComment">--%>
<%--            <input type="hidden" name="parent" value="0">--%>
<%--            <details class="comment-button" style="width: 40px;height: 20px;background: dodgerblue;font-size: 10px;border-radius: 20px;margin: 6px;text-align: center;">--%>
<%--                <summary >评论</summary>--%>
<%--                <textarea name="content" class="text" cols="30" rows="10" placeholder="请输入评论"></textarea>--%>
<%--                <button  class="comment-button" type="submit" style="width: 40px;height: 20px;background: dodgerblue;font-size: 10px;border-radius: 20px;margin: 6px;text-align: center;" >提交</button>--%>
<%--                <button  class="comment-button" type="reset" style="width: 40px;height: 20px;background: dodgerblue;font-size: 10px;border-radius: 20px;margin: 6px;text-align: center;">清空</button>--%>
<%--            </details>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--    <%CommentService commentService = new CommentServiceImpl();%>--%>
<%--    <%List<Comment> firstcomments = new ArrayList<>();%>--%>
<%--    <% firstcomments = commentService.readFirstComment();%>--%>
<%--    <%for(Comment firstcomment:firstcomments){%>--%>
<%--    <%int firstcomment_id = firstcomment.getComment_id();%>--%>
<%--    <div><%=firstcomment.getComment_name()+":"+firstcomment.getContent()%>--%>
<%--        <form action="${pageContext.request.contextPath}/comment.do" method="get" style="z-index: 100">--%>
<%--            <input type="hidden" name="method" value="writeComment">--%>
<%--            &lt;%&ndash; 回复评论的姓名&ndash;%&gt;--%>
<%--            <input type="hidden" name="parentid" value="<%=firstcomment_id%>">--%>
<%--            <details class="comment-button" style="width: 40px;height: 20px;background: dodgerblue;font-size: 10px;border-radius: 20px;margin: 6px;text-align: center;">--%>
<%--                <summary >回复</summary>--%>
<%--                <textarea name="content" class="text" cols="30" rows="10" placeholder="请输入评论"></textarea>--%>
<%--                <button  class="comment-button" type="submit" style="width: 40px;height: 20px;background: dodgerblue;font-size: 10px;border-radius: 20px;margin: 6px;text-align: center;">提交</button>--%>
<%--                <button  class="comment-button" type="reset" style="width: 40px;height: 20px;background: dodgerblue;font-size: 10px;border-radius: 20px;margin: 6px;text-align: center;">清空</button>--%>
<%--            </details>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--    <% List<Comment> secondcomments = new ArrayList<>();%>--%>
<%--    <% secondcomments = commentService.readSecondComment(firstcomment.getComment_id());%>--%>
<%--    <%for(Comment secondcomment:secondcomments){%>--%>
<%--    <div>&nbsp;&nbsp;&nbsp;&nbsp;<%=secondcomment.getComment_name()+"@"+firstcomment.getComment_name()+":"+secondcomment.getContent()%></div>--%>
<%--    <%}%>--%>
<%--    <%}%>--%>
<%--    </section>--%>
    <div id="pst" style="width:100px;height:150px;border-radius:10px;background-color:dodgerblue;position:fixed;z-index: 2000"><a href="#top">回到顶部</a></div>
<%--    //已经把评论写进数据库了--%>
<%--<div>--%>
<%--    <form action="${pageContext.request.contextPath}/comment.do" method="get">--%>
<%--&lt;%&ndash;        //评论展示&ndash;%&gt;--%>
<%--     <c:if test="${firstcomments}">--%>
<%--        <c:forEach var="firstcomment" items="${firstcomments}">--%>
<%--            <div class="firstcomment">--%>
<%--                    <span>${firstcomment.comment_name}:${firstcomment.content}</span>--%>
<%--&lt;%&ndash;                一级评论&ndash;%&gt;--%>
<%--                    <details>--%>
<%--                        <summary>回复</summary>--%>
<%--                        <textarea name="content" class="text" cols="30" rows="10" placeholder="请输入评论"></textarea>--%>
<%--                        <input type="hidden" name="parent" value="0">--%>
<%--                        <input  class="button" type="submit" value="提交">--%>
<%--                    </details>--%>
<%--                <span>--%>
<%--                    <c:forEach var="secondcomment" items="${secondcomments}">--%>
<%--                        <span>${secondcomment.comment_name}@${firstcomment.comment_name}:--%>
<%--                           ${firstcomment.content}</span>--%>
<%--                        <details>--%>
<%--                        <summary>回复</summary>--%>
<%--                        <textarea name="content" class="text" cols="30" rows="10" placeholder="请输入评论"></textarea>--%>
<%--                        <input type="hidden" name="parent" value="${firstcomment.comment_id}">--%>
<%--                        <input  class="button" type="submit" value="提交">--%>
<%--                        </details>--%>
<%--                    </c:forEach>--%>
<%--                </span>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--     </c:if>--%>
<%--    </form>--%>
<%--</div>--%>


<%--    <div>--%>
<%--        <input type="text" name="content" placeholder="我要评论">--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <button type="submit">comment</button>--%>
<%--    </div>--%>

<%--    <div id="ccomment">--%>
<%--        <input type="text" name="content" placeholder="请输入评论">--%>

<%--    </div>--%>
<%--    <input type="reset" value="重置" id="button">--%>
<%--    <input type="submit" value="评论" id="button">--%>
<%--</div>--%>
</body>
</html>

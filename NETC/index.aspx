<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" Debug="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>NETC</title>
    <link rel="stylesheet" type="text/css" href="css/headandfooter.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
    <div id="header">
        <div class="title">
        </div>
        <div class="nav">
            <ul>
                <li class="first"><a href="http://www.sgu.edu.cn/#">学校主页</a></li>
                <li><a href="index.aspx">部门主页</a></li>
                <li><a href="content.aspx?id=1">中心介绍</a></li>
                <li><a href="column.aspx?item=部门信息">部门信息</a></li>
                <li><a href="column.aspx?item=党支部专栏">党支部专栏</a></li>
                <li><a href="content.aspx?id=2">规章制度</a></li>
                <li><a href="service.aspx">服务公告</a></li>
                <li class="last"><a href="lose.aspx">失物招领</a></li>
            </ul>
        </div>
    </div>
    <div id="banner">
        <object width="1100" height="300">
            <param name="movie" value="banner.swf">
            <embed src="banner.swf" width="1100" height="300"></embed>
        </object>
    </div>
    <div id="contents">
        <div class="introduce">
            <div class="intleft">
            </div>
            <div class="intmid">
                <h3>
                    网络与教育技术中心简介</h3>
                <p>
                    韶关学院网络与教育技术中心于2008年7月成立，由原来的网络中心、现代教育技术 中心和外语学院的语言中心合并组成。网络与教育技术中心下设有办公室、网络部、教 育技术部、技术服务部和实验室等5个部门。
                </p>
                <p>
                    韶关学院网络与教育技术中心是学校的教辅部门。主要负责校园网的规划、建设、运 行和管理；负责现代教育技术和信息技术的培训工作，开展信息网络技术理论和应用方 面的研究，为学校信息化建设提供技术支持；负责学校多媒体教学建设的规划、组织、
                    实施，现代教育技术的推广、应用、培训，教育技术科研、教研项目的组织、实施与管 理，教学软件设计、制作以及教学资源建设的技术... <a href="content.aspx?id=1">
                        more</a>
                </p>
            </div>
            <div class="intright">
            </div>
        </div>
        <div class="news">
            <div class="newsleft">
            </div>
            <div class="news1">
                <h2>
                    部门信息<a href="column.aspx?item=部门信息">more</a></h2>
                <asp:Repeater ID="repSection" runat="server">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li><a href="content.aspx?id=<%#Eval("n_ID") %>"><span class="date"><%#Convert.ToDateTime(Eval("n_addTime")).ToString("yy-M-d") %></span><%#Eval("n_title").ToString().Length>12? Eval("n_title").ToString().Substring(0,12)+"...":Eval("n_title") %><span
                            class="tu"></span></a></li></ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="news2">
                <h2>
                    应用指南<a href="column.aspx?item=应用指南">more</a></h2>
                <asp:Repeater ID="repApply" runat="server">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li><a href="content.aspx?id=<%#Eval("n_ID") %>"><span class="date"><%#Convert.ToDateTime(Eval("n_addTime")).ToString("yy-M-d") %></span><%#Eval("n_title").ToString().Length>12? Eval("n_title").ToString().Substring(0,12)+"...":Eval("n_title") %><span
                            class="tu"></span></a></li></ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="news3">
                <h2>
                    党支部专栏<a href="column.aspx?item=党支部专栏">more</a></h2>
                <asp:Repeater ID="repParty" runat="server">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li><a href="content.aspx?id=<%#Eval("n_ID") %>"><span class="date"><%#Convert.ToDateTime(Eval("n_addTime")).ToString("yy-M-d") %></span><%#Eval("n_title").ToString().Length>12? Eval("n_title").ToString().Substring(0,12)+"...":Eval("n_title") %><span
                            class="tu"></span></a></li></ItemTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="newsright">
            </div>
        </div>
        <div class="service">
            <div class="guide">
                <div class="ser1">
                </div>
                <div class="ser1body">
                    <ul>
                        <li><a href="#">实验室办事指南</a></li>
                        <li><a href="#">有线电视服务指南</a></li>
                        <li><a href="#">多媒体课室服务指南</a></li>
                        <li><a href="#">网络服务办事指南</a></li>
                    </ul>
                </div>
            </div>
            <div class="apply">
                <div class="ser2">
                </div>
                <div class="ser2body">
                    <ul>
                        <li><a href="#">校园网邮箱申请</a></li>
                        <li><a href="#">教职工个人入网申请</a></li>
                        <li><a href="#">单位用户入网申请</a></li>
                        <li><a href="#">校园网退网申请</a></li>
                        <li><a href="#">网站空间申请</a></li>
                        <li><a href="#">音响设备使用申请表</a></li>
                    </ul>
                </div>
            </div>
            <div class="phone">
                <div class="ser3">
                </div>
                <div class="ser3body">
                    <ul>
                        <li><a href="#">办公室 8120034</a></li>
                        <li><a href="#">网络服务 8120197</a></li>
                        <li><a href="#">有线电视 8120124</a></li>
                        <li><a href="#">多媒体课室 8120034</a></li>
                    </ul>
                </div>
            </div>
            <div class="table">
                <div class="ser4">
                </div>
                <div class="ser4body">
                    <a href="#">
                        <img alt="" src="images/table1.jpg"></a> <a href="#">
                            <img alt="" src="images/table2.jpg"></a>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <ul>
            <li>中心简介 | 机构设置 | 岗位职责 | 规章制度 | 服务指南</li>
            <li>版权所有 <a href="Admin/admin.aspx">网络与教育技术中心</a> </li>
        </ul>
    </div>
</body>
</html>

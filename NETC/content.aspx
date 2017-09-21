<%@ Page Language="C#" AutoEventWireup="true" CodeFile="content.aspx.cs" Inherits="content" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>中心介绍</title>
    <link rel="stylesheet" type="text/css" href="css/headandfooter.css" />
    <link rel="stylesheet" type="text/css" href="css/introduce.css" />
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
    <div class="contents">
        <div class="main">
            <div class="top">
            </div>
            <div class="middle">
                <h2>
                    <asp:Literal ID="ltelTitle" runat="server"></asp:Literal></h2>
                <h4>
                    时间：<asp:Literal ID="ltelTime" runat="server"></asp:Literal>
                    作者:<span><asp:Literal ID="ltelAuthor" runat="server"></asp:Literal></span> 
                    部门：<span><asp:Literal ID="ltelSection" runat="server"></asp:Literal></span> 
                    栏目：<span><asp:Literal ID="ltelItem" runat="server"></asp:Literal></span> 
                    浏览次数：<asp:Literal ID="ltelViewCount" runat="server"></asp:Literal></h4>
                <asp:Literal ID="ltelContent" runat="server"></asp:Literal>
            </div>
            <div class="bottom">
            </div>
        </div>
    </div>
    <div id="footer">
        <ul>
            <li>中心简介 | 机构设置 | 岗位职责 | 规章制度 | 服务指南</li>
            <li>版权所有 网络与教育技术中心</li>
        </ul>
    </div>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="column.aspx.cs" Inherits="column"
    Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>部门信息</title>
    <link rel="stylesheet" type="text/css" href="css/headandfooter.css" />
    <link rel="stylesheet" type="text/css" href="css/message.css" />
    <style type="text/css">
        <!--
            .rightside div.list
            {
                height:580px;
                width:100%;
                }
            .rightside div.btn
            {
                height:20px;
                width:100%; 
                }
        -->
    </style>
</head>
<body>
    <form runat="server">
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
                <div class="leftside">
                    <div class="sidetop">
                    </div>
                    <div class="sidemid">
                        <ul>
                            <li><a href="http://www.sgu.edu.cn/#">韶关学院</a></li>
                            <li><a href="index.aspx">部门主页</a></li>
                            <li><a href="http://mis.sgu.edu.cn/">MIS系统</a></li>
                            <li><a href="http://jpkc.sgu.edu.cn/index/index.aspx">网络教学平台</a></li>
                            <li><a href="http://net.sgu.edu.cn/netdom/">宿舍网上服务</a></li>
                        </ul>
                    </div>
                    <div class="sidebottom">
                    </div>
                </div>
                <div class="rightside">
                    <div class="list">
                        <h2>
                            <asp:Label ID="lalItem" runat="server" Text="Label"></asp:Label></h2>
                        <asp:Repeater ID="repItem" runat="server">
                            <HeaderTemplate>
                                <ul>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li><a href="content.aspx?id=<%#Eval("n_ID") %>"><span class="date"><%#Convert.ToDateTime(Eval("n_addTime")).ToString("yy-M-d") %></span><%#Convert.ToString(Eval("n_title")).Length>20?Eval("n_title").ToString().Substring(0,20):Eval("n_title") %><span
                                    class="tu"></span></a></li></ItemTemplate>
                            <FooterTemplate>
                                </ul></FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="btn" align="center">
                        第 <span id="lblpage" class="numpage">
                            <asp:Literal ID="lblcurpage" runat="server"></asp:Literal></span> 页 / 共 <span id="lblpagetotal"
                                class="numpage">
                                <asp:Literal ID="lblpagecount" runat="server"></asp:Literal>&nbsp;</span>页
                        <asp:LinkButton ID="cmdfirstpage" runat="server" CommandName="page" CommandArgument="first"
                            OnCommand="linkbutton_command">首页</asp:LinkButton>
                        <asp:LinkButton ID="cmdpreview" runat="server" CommandName="page" CommandArgument="prev"
                            OnCommand="linkbutton_command">上一页</asp:LinkButton>
                        <asp:LinkButton ID="cmdnext" runat="server" CommandName="page" CommandArgument="next"
                            OnCommand="linkbutton_command">下一页</asp:LinkButton>
                        <asp:LinkButton ID="cmdlastpage" runat="server" CommandName="page" CommandArgument="last"
                            OnCommand="linkbutton_command">末页</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;转到&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlgotopage" runat="server" OnSelectedIndexChanged="ddlgorochanged"
                            AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="bottom"> 
            </div>
        </div>
    </div>
    <div id="footer">
        <ul>
            <li>中心简介 | 机构设置 | 岗位职责 | 规章制度 | 服务指南</li>
            <li>版权所有 网络与教育技术中心 </li>
        </ul>
    </div>
    </form>
</body>
</html>

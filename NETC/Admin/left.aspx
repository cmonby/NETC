<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="Admin_left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left</title>
<link href="css/left.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div class="left">
    <div class="title">
    </div>
    <div class="menu">
      <ul>
        <li class="li1"><a target="mainFrame" href="right.aspx">发布新闻</a></li>
        <li runat="server" id="lipow1" class="li2"><a target="mainFrame" href="right1.aspx">审核新闻</a></li>
        <li runat="server" id="lipow2" class="li3"><a target="mainFrame" href="right2.aspx">设置管理员</a></li><%--
        <li runat="server" id="lipow3" class="li4"><a target="mainFrame" href="right3.aspx">图片替换</a></li>--%>
      </ul>
    </div>
  </div>
</body>
</html>

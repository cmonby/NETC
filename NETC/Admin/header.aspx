<%@ Page Language="C#" AutoEventWireup="true" CodeFile="header.aspx.cs" Inherits="Admin_header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>header</title>
    <link href="css/header.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form runat="server">
    <div class="header">
        <div class="center">
        </div>
        <div class="safeout">
            <p>
                <asp:Label ID="lalName" runat="server" Text=""></asp:Label>在线
                <button type="button" runat="server" id="btnexit" onserverclick="btnexit_OnClick">
                </button>
            </p>
        </div>
    </div>
    </form>
</body>
</html>

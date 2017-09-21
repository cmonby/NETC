<%@ Page Language="C#" AutoEventWireup="true" CodeFile="right.aspx.cs" Inherits="Admin_right"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>发布新闻</title>
    <link href="css/right.css" rel="stylesheet" type="text/css" />
    <script src="../kindeditor/lang/zh_CN.js" type="text/javascript"></script>
    <script src="../kindeditor/kindeditor.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        KindEditor.ready(function (K) {
            window.editor = K.create('#txtContent');

        });
//        window.onload = function () {
//            html = editor.html();

//            // 同步数据后可以直接取得textarea的value
//            editor.sync();
//            html = document.getElementById('txtContent').value; // 原生API
//            html = K('#txtContent').val(); // KindEditor Node API
//            html = $('#txtContent').val(); // jQuery
//            editor.html('HTML内容');
//        }

        function btnSub_OnClick() {
            
            var title = document.getElementById("txtTitle");
            var section = document.getElementById("ddlSection");
            var item = document.getElementById("ddlItem");
            var author = document.getElementById("txtAuthor");
            var content = document.getElementById("txtContent");
            if (title.value == "" || title.value.trim().length == 0) {
                alert('题目不能为空');
                return false;
            }
            else if (section.value == "0") {
                alert('请选择所属部门');
                return false;
            }
            else if (item.value == "0") {
                alert('请选择所属栏目');
                return false;
            }
            else if (author.value == "" || author.value.trim().length == 0) {
                alert('作者不能为空');
                return false;
            }
//            else if (editor.html()) {
//                alert('文章内容不能为空！');
//                return false;
//            }
            else {
                return true;
            }
        }
    </script>
</head>
<body runat="server">
    <div class="main">
        <form id="form1" runat="server" name="form1">
        <div class="top1">
        </div>
        <div runat="server" class="message">
            <div runat="server" class="top2">
                <p>
                    发布新闻</p>
            </div>
            <div runat="server" class="message1">
                <p>
                    文章题目：<input type="text" id="txtTitle" maxlength="50" runat="server" /></p>
                <%--<p class="sp1">
                    发布时间：<input type="text" /></p>--%>
                <p>
                    所属部门：<asp:DropDownList ID="ddlSection" runat="server" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                    </asp:DropDownList>
                </p>
                <%--<p class="sp1">
                    浏览次数：<input type="text" /></p>--%>
                <p>
                    所属栏目：<asp:DropDownList ID="ddlItem" runat="server" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged">
                    </asp:DropDownList>
                </p>
                <p>
                    作者署名：<input type="text" id="txtAuthor" maxlength="15" runat="server" /></p>
            </div>
        </div>
        <div runat="server" class="bjtext">
            <div runat="server" class="bjt">
                <p>
                    发表文章</p>
            </div>
            <div>
                <table runat="server">
                    <tr>
                        <td width="75px">
                        </td>
                        <td colspan="2">
                            <textarea id="txtContent" name="content" runat="server" style="width: 700px; height: 300px;"></textarea>
                        </td>
                    </tr>
                    <tr height="20px">
                    </tr>
                    <tr>
                    </tr>
                    <tr align="center">
                        <td>
                        </td>
                        <td>
                            <asp:ImageButton ID="btnSub" runat="server" OnClick="BtnSub_OnClientClick" ImageUrl="~/images/后台界面_19.png" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        </form>
    </div>
</body>
</html>

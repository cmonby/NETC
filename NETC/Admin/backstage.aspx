<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backstage.aspx.cs" Inherits="backstage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="css/backstage.css" />
    <script language="javascript" type="text/javascript">
        //        window.onload = function () {
        //            document.getElementById("txtName").focus();
        //     //       document.getElementById("txtVer").value = "";
        //        }                                                                                                                                      
        //        function startCheckA(oInput) {
        //            if (!oInput.value) {
        //                oInput.focus();
        ////                oInput.value = "用户名不能为空！";
        //         //       alert('用户名不能为空！');
        //                return;
        //            }
        //        }                                                                                                                                     
        //        function startCheckB(oInput) {
        //            if (!oInput.value) {
        //                oInput.focus();
        ////                oInput.value="密码不能为空！";
        //       //         alert('密码不能为空！');
        //                return;
        //            }
        //            else {
        //                var k = document.getElementById("txtVer").value = " ";
        //            }
        //        }
        function btnclick(obtn) {
            var name = document.getElementById("txtName");
            var pwd = document.getElementById("txtPwd");
            var ver = document.getElementById("txtVer");
            if (name.value == "") {
                alert('账号不能为空！');
                return false;
            }
            else if (pwd.value == "") {
                alert('密码不能为空！');
                return false;
            }
            else if (ver.value == "") {
                alert("验证码不能为空！");
                return false;
            }
            else {
                return true;
            }
           
        }                                                                                                                   
    </script>
</head>
<body>
    <form runat="server">
    <div id="login">
        <div class="write">
            <div class="user">
                <%--<asp:TextBox ID="txtName" runat="server"  CssClass="field" ></asp:TextBox>--%>
                <input class="field" runat="server" type="text" maxlength="20" name="textfield" id="txtName" />
                <%-- onblur="startCheckA(this)"--%>
            </div>
            <div class="password">
                <input class="field1" type="password" runat="server" name="textfield2" maxlength="12"
                    id="txtPwd" />
                <%--onblur="startCheckB(this)"  --%>
            </div>
            <div class="yzpassword">
                <input class="yz" type="text" maxlength="5" name="textfield3" runat="server" value=" 验证码"
                    id="txtVer" onblur="" />
                <div class="number">
                    <div class="img">
                        <img src="Verification.aspx" alt='看不清楚，双击图片换一张。' ondblclick="this.src= 'Verification.aspx?flag=' + Math.random() "
                            border="0" height="38" />
                    </div>
                </div>
            </div>
            <div class="bt">

               <%-- <input type="button" runat="server" id="btnlogin" />--%>
                 <asp:Button ID="btnlogin" runat="server" Text=""  OnClick="btnLogin_Click"/>  
            </div>
        </div>
    </div>
    </form>
</body>
</html>

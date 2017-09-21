<%@ Page Language="C#" AutoEventWireup="true" CodeFile="right2.aspx.cs" Inherits="Admin_right2" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设置管理员</title>
    <link href="css/right1.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="http://sandbox.runjs.cn/uploads/rs/55/sjckzedf/lanrenzhijia.css">
    <script type="text/javascript" src="http://sandbox.runjs.cn/uploads/rs/55/sjckzedf/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" language="javascript">
        jQuery(document).ready(function ($) {
            $('.theme-login').click(function () {
                $('.theme-popover-mask').fadeIn(100);
                $('.theme-popover').slideDown(200);
            })
            $('.theme-poptit .close').click(function () {
                $('.theme-popover-mask').fadeOut(100);
                $('.theme-popover').slideUp(200);
            })

        })
    </script>
</head>
<body>
    <form runat="server">
    <div class="main">
        <div class="top1">
        </div>
        <div class="message2">
            <div class="top2">
                <p>
                    设置管理员</p>
            </div>
        </div>
        <div class="bjtext">
            <div class="theme-popover-mask">
            </div>
            <div class="bjt">
                <a class="btn btn-primary btn-large theme-login" href="javascript:;">新增管理员</a>
            </div>
            <%--<div class="bjt">
                <p>
                    新增管理员</p>
            </div>--%>
            <div>
                <br />
                <asp:GridView ID="gvAdmin" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    Font-Names="Monaco" Font-Size="Large" ForeColor="#000000" GridLines="Horizontal"
                    BackColor="White" Width="900px" BorderColor="#6ca9dc" OnRowDeleting="gvAdmin_RowDeleting"
                    OnRowUpdating="gvAdmin_RowUpdating" OnRowEditing="gvAdmin_RowEditing" OnRowCancelingEdit="gvAdmin_RowCancelingEdit"
                    BorderStyle="Dashed" BorderWidth="1px" EnableModelValidation="True">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField HeaderText="用户ID" DataField="a_id" ItemStyle-HorizontalAlign="Center"
                            ReadOnly="true" />
                        <asp:BoundField HeaderText="账号" DataField="a_name" ItemStyle-HorizontalAlign="Center"
                            ReadOnly="true" />
                        <asp:BoundField HeaderText="密码" DataField="a_pwd" ItemStyle-HorizontalAlign="Center" />
                        <asp:CheckBoxField HeaderText="审核权利" DataField="a_pow" ItemStyle-HorizontalAlign="Center" />
                        <asp:CommandField HeaderText="编辑" ShowEditButton="true" />
                        <asp:CommandField HeaderText="删除" ShowDeleteButton="true" />
                    </Columns>
                    <RowStyle Width="100%" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="Black" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#6ca9dc" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <webdiyer:AspNetPager ID="AspNetAdmin" runat="server" PageSize="15" OnPageChanging="AspNetAdmin_PageChanged">
                </webdiyer:AspNetPager>
            </div>
        </div>
    </div>
    <div class="theme-popover">
        <div class="theme-poptit">
            <a href="javascript:;" title="关闭" class="close">×</a>
            <h3>
                欢迎添加新用户</h3>
        </div>
        <div class="theme-popbod dform">
            <form class="theme-signin" name="loginform" action="" method="post">
            <ol>
                <li>
                    <h4>
                       请填写必要信息</h4>
                </li>
                <li><strong>用户名：</strong><asp:TextBox ID="txtName" class="ipt" MaxLength="20" runat="server"></asp:TextBox></li>
                <li><strong>&nbsp;&nbsp;&nbsp;密码：</strong><asp:TextBox ID="txtPwd" class="ipt" MaxLength="12" TextMode="Password" runat="server"></asp:TextBox></li>
                <li ><strong>审核权限：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
                <input type="radio" name="Audit" runat="server" id="radioAudit" />是
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="Audit" runat="server"  id="radioAuditNo" checked="true"  />否
                </li>
                <li>
                    <asp:Button ID="btnRes" class="btn btn-primary" runat="server" Text=" 新 增 " 
                        onclick="btnRes_Click" /></li>
            </ol>
            </form>
        </div>
    </div>
    </form>
</body>
</html>

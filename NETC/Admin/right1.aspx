<%@ Page Language="C#" AutoEventWireup="true" CodeFile="right1.aspx.cs" Inherits="Admin_right1" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>审核新闻</title>
    <link href="css/right1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        a
        {
            text-decoration: none;
            font-family: Monaco;
            color: Black;
        }
        a:active, a:hover
        {
            color: Green;
        }
        body
        {
            font-family: Monaco;
        }
    </style>
</head>
<body>
    <form runat="server">
    <div class="main">
        <div class="top1">
        </div>
        <div class="message">
            <div class="top2">
                <p style="color: White;">
                    审核新闻</p>
            </div>
            <div class="message1">
                <form>
                <ul>
                    <li>可审核栏目：
                        <asp:DropDownList ID="ddlSection" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                        </asp:DropDownList>
                    </li>
                    <li>是否已审核：
                        <asp:DropDownList ID="ddlAudit" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAudit_SelectedIndexChanged">
                        </asp:DropDownList>
                        <%--</li>
                    <li>起始日期：
                        <input type="text" />
                    </li>
                    <li>截止日期：
                        <input type="text" />
                    </li>--%>
                </ul>
                </form>
            </div>
        </div>
        <div class="bjtext">
            <div class="bjt">
                <p style="color: Black;">
                    新闻审核</p>
            </div>
            <div>
                <br />
                <asp:GridView ID="gvNews" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    OnRowCommand="gvNews_RowCommand" ForeColor="#000000" GridLines="Horizontal" BackColor="White"
                    Width="900px" BorderColor="#6ca9dc" BorderStyle="Dashed" BorderWidth="1px" EnableModelValidation="True">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField HeaderText="文章ID" DataField="n_ID" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Center" />
                        <asp:TemplateField HeaderText="文章题目" ItemStyle-Width="25%" ItemStyle-Height="25px"
                            ItemStyle-HorizontalAlign="left">
                            <ItemTemplate>
                                <a href="../content.aspx?id=<%#Eval("n_ID") %>">
                                    <%#Eval("n_title").ToString().Length>18? Eval("n_title").ToString().Substring(0,18)+"...":Eval("n_title") %></a></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="时间" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%#Convert.ToDateTime(Eval("n_addTime").ToString()).ToString("yy-M-d") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="n_author" HeaderText="作者" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="n_addID" HeaderText="发表人ID" ItemStyle-Width="7%" ItemStyle-HorizontalAlign="Center" />
                        <asp:ButtonField HeaderText="操作" ButtonType="Button" Text="审核" ShowHeader="true"
                            ItemStyle-Width="15%" ControlStyle-BorderStyle="None" ControlStyle-BackColor="White"
                            ControlStyle-ForeColor="Green" ControlStyle-Font-Size="Medium" ControlStyle-Width="50px"
                            ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Names="萝莉体" CommandName="AuditCommand" />
                        <asp:ButtonField HeaderText="操作" ButtonType="Button" Text="取消审核" ShowHeader="true"
                            ItemStyle-Width="15%" ControlStyle-BorderStyle="None" ControlStyle-BackColor="White"
                            ControlStyle-ForeColor="Green" ControlStyle-Font-Size="Medium" ControlStyle-Width="80px"
                            ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Names="萝莉体" CommandName="CancelAuditCommand" />
                        <asp:ButtonField HeaderText="删除" ButtonType="Button" Text="Del" ShowHeader="true"
                            ItemStyle-Width="15%" ControlStyle-BorderStyle="None" ControlStyle-BackColor="White"
                            ControlStyle-ForeColor="#400080" ControlStyle-Font-Size="Medium" ControlStyle-Width="50px"
                            ControlStyle-Font-Names="Monaco" ItemStyle-HorizontalAlign="Center" CommandName="DelCommand" />
                    </Columns>
                    <RowStyle Width="100%" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="Black" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#6ca9dc" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <webdiyer:AspNetPager ID="AspNetNews" runat="server" PageSize="20" OnPageChanging="AspNetNews_PageChanged">
                </webdiyer:AspNetPager>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

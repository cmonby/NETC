using System;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI.WebControls;

public partial class Admin_right : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSub.Attributes.Add("OnClick", "return btnSub_OnClick()");
        if (!IsPostBack)
        {
            ddlSectionBind();
            ddlItemBind();
        }
    }

    private void ddlSectionBind()
    {
        ddlSection.Items.Add(new ListItem("请选择--", "0"));
        ddlSection.Items.Add(new ListItem("网络与教育技术中心", "1"));
        ddlSection.SelectedValue = "1";
    }
    protected void BtnSub_OnClientClick(object sender, EventArgs e)
    {
        if (txtTitle.Value.Trim().ToString() == "")
        {
            Response.Write("<script>alert('请输入标题！')</script>");
        }
        else if(ddlSection.SelectedIndex==0)
        {
            Response.Write("<script>alert('请选择相关部门')</script>");
        }
        else if (ddlItem.SelectedIndex == 0)
        {
            Response.Write("<script>alert('请选择相关栏目')</script>");
        }
        else if (txtAuthor.Value.Trim().ToString() == "")
        {
            Response.Write("<script>alert('请输入作者！')</script>");
        }
        else if (txtContent.Value.ToString() == "")
        {
            Response.Write("<script>alert('请输入内容！')</script>");
        }
        else
        {
            string connstr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString + Server.MapPath("../" + ConfigurationManager.ConnectionStrings["DBPath"].ConnectionString);
            OleDbConnection conn = new OleDbConnection(connstr);
            string addnewstr = "insert into tb_news(n_title,n_author,n_content,n_addID,n_section,n_item) values (@title,@author,@content,@addID,@section,@item)";
            OleDbParameter[] paras ={
                                       new OleDbParameter("@title",txtTitle.Value.Trim().ToString()),
                                       new OleDbParameter("@author",txtAuthor.Value.Trim().ToString()),
                                       new OleDbParameter("@content",txtContent.Value.ToString()),
                                       new OleDbParameter("@addID",Session["a_id"].ToString()),
                                       new OleDbParameter("@section",ddlSection.SelectedItem.Text.ToString()),
                                       new OleDbParameter("@section",ddlItem.SelectedItem.Text.ToString())
                                   };
            OleDbCommand addnewcmd = new OleDbCommand(addnewstr, conn);
            addnewcmd.Parameters.AddRange(paras);
            conn.Open();
            int row = addnewcmd.ExecuteNonQuery();
            conn.Close();
            if (row > 0)
            {
                Response.Write("<script>alert('添加成功')</script>");
                txtTitle.Value = "";
                txtContent.Value = "";
                txtAuthor.Value = "";
                return;
            }
            else
            {
                Response.Write("<script>alert('添加失败')</script>");
                return;
            }
        }
    }
    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    private void ddlItemBind()
    {
        ddlItem.Items.Add(new ListItem("请选择--", "0"));
        ddlItem.Items.Add(new ListItem("部门信息", "1"));
        ddlItem.Items.Add(new ListItem("应用指南", "2"));
        ddlItem.Items.Add(new ListItem("党支部专栏", "3"));
        ddlItem.SelectedValue = "1";
    }
    protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
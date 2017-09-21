using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;
using Wuqi.Webdiyer;

public partial class Admin_right1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlbind();
            DisplayData(1, AspNetNews.PageSize);
            ddlSection.SelectedValue = "0";
            ddlAudit.SelectedValue = "0";
        }
        if (ddlAudit.SelectedIndex == 0)
        {
            gvNews.Columns[5].Visible = true;
            gvNews.Columns[6].Visible = false;
        }
        else
        {
            gvNews.Columns[5].Visible = false;
            gvNews.Columns[6].Visible = true;
        }
    }
    private void DisplayData(int pageIndex, int pageSize)
    {
        OleDbConnection conn = GetOleDbConnection();
        OleDbCommand md = conn.CreateCommand();
        if (ddlSection.SelectedValue == "0")
        {
            md.CommandText = "select count(*) from tb_news where n_audit=0";
        }
        else
        {
            md.CommandText = "select count(*) from tb_news where n_audit=0 and n_item='" + ddlSection.SelectedItem.Text.ToString() + "'";
        }
        conn.Open();
        AspNetNews.RecordCount = (int)md.ExecuteScalar();
        conn.Close();
        string selcmdstr;
        if (ddlSection.SelectedValue == "0")
        {
            if (pageIndex == 1)
                selcmdstr = "select top " + pageSize + " * from tb_news where n_audit=" + ddlAudit.SelectedIndex + " order by n_ID desc";
            else
                selcmdstr = "select top " + pageSize + " * from tb_news where n_audit=" + ddlAudit.SelectedIndex + " and n_ID not in (select top " + pageSize * (pageIndex - 1) + " n_ID from tb_news where n_audit=" + ddlAudit.SelectedIndex + " order by n_id desc) order by n_id desc";
        }
        else
        {
            if (pageIndex == 1)
                selcmdstr = "select top " + pageSize + " * from tb_news where n_audit=" + ddlAudit.SelectedIndex + " and n_item='" + ddlSection.SelectedItem.Text.ToString() + "' order by n_ID desc";
            else
                selcmdstr = "select top " + pageSize + " * from tb_news where n_audit=" + ddlAudit.SelectedIndex + " and n_item='" + ddlSection.SelectedItem.Text.ToString() + "' and n_ID not in (select top " + pageSize * (pageIndex - 1) + " n_ID from tb_news where n_audit=" + ddlAudit.SelectedIndex + " and n_item='" + ddlSection.SelectedItem.Text.ToString() + "' order by n_id desc) order by n_id desc";
        }
        OleDbCommand selcmd = new OleDbCommand(selcmdstr, conn);
        OleDbDataAdapter oda = new OleDbDataAdapter(selcmd);
        DataTable dt = new DataTable();
        oda.Fill(dt);
        gvNews.DataSource = dt;
        gvNews.DataKeyNames = new string[] { "n_ID" };
        gvNews.DataBind();
    }

    private OleDbConnection GetOleDbConnection()
    {
        string connstr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString + Server.MapPath("../" + ConfigurationManager.ConnectionStrings["DBPath"].ConnectionString);
        OleDbConnection conn = new OleDbConnection(connstr);
        return conn;
    }

    protected void gvNews_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString() == "DelCommand")
        {
            int indes = (int)gvNews.DataKeys[Convert.ToInt16(e.CommandArgument)].Value;
            string delsqlstr = "delete from tb_news where n_ID=@id";
            OleDbConnection conn = GetOleDbConnection();
            OleDbCommand delcmd = new OleDbCommand(delsqlstr, conn);
            OleDbParameter para = new OleDbParameter("@id", indes);
            delcmd.Parameters.Add(para);
            conn.Open();
            int rows = delcmd.ExecuteNonQuery();
            conn.Close();
            if (rows > 0)
            {
                DisplayData(AspNetNews.CurrentPageIndex, AspNetNews.PageSize);
            }
            else
            {
                return;
            }
        }
        else if (e.CommandName.ToString() == "AuditCommand")
        {
            int indes = (int)gvNews.DataKeys[Convert.ToInt16(e.CommandArgument)].Value;
            string updatesqlstr = "update tb_news set n_audit=1 where n_id=@id";
            OleDbConnection conn = GetOleDbConnection();
            OleDbCommand updatecmd = new OleDbCommand(updatesqlstr, conn);
            OleDbParameter para = new OleDbParameter("@id", indes);
            updatecmd.Parameters.Add(para);
            conn.Open();
            int rows = updatecmd.ExecuteNonQuery();
            conn.Close();
            if (rows > 0)
            {
                DisplayData(AspNetNews.CurrentPageIndex, AspNetNews.PageSize);
            }
            else
            {
                return;
            }
        }
        else if (e.CommandName.ToString() == "CancelAuditCommand")
        {
            int indes = (int)gvNews.DataKeys[Convert.ToInt16(e.CommandArgument)].Value;
            string updatesqlstr = "update tb_news set n_audit=0 where n_id=@id";
            OleDbConnection conn = GetOleDbConnection();
            OleDbCommand updatecmd = new OleDbCommand(updatesqlstr, conn);
            OleDbParameter para = new OleDbParameter("@id", indes);
            updatecmd.Parameters.Add(para);
            conn.Open();
            int rows = updatecmd.ExecuteNonQuery();
            conn.Close();
            if (rows > 0)
            {
                DisplayData(AspNetNews.CurrentPageIndex, AspNetNews.PageSize);
            }
            else
            {
                return;
            }
        }
    }

    protected void AspNetNews_PageChanged(object sender, PageChangingEventArgs e)
    {
        DisplayData(e.NewPageIndex, AspNetNews.PageSize);
    }

    protected void ddlbind()
    {
        ddlSection.Items.Add(new ListItem("请选择", "0"));
        ddlSection.Items.Add(new ListItem("部门信息", "1"));
        ddlSection.Items.Add(new ListItem("应用指南", "2"));
        ddlSection.Items.Add(new ListItem("党支部专栏", "3"));
        ddlSection.Items.Add(new ListItem("服务通告", "4"));
        ddlSection.Items.Add(new ListItem("失物招领", "5"));
        ddlAudit.Items.Add(new ListItem("未审核", "0"));
        ddlAudit.Items.Add(new ListItem("已审核", "1"));
    }
    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        DisplayData(AspNetNews.CurrentPageIndex, AspNetNews.PageSize);
    }
    protected void ddlAudit_SelectedIndexChanged(object sender, EventArgs e)
    {
        DisplayData(AspNetNews.CurrentPageIndex, AspNetNews.PageSize);
    }
}
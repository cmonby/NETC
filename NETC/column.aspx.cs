using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;

public partial class column : System.Web.UI.Page
{
    static int pagging;
    static int pagesize = 25;
    static int current;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            current = 0;
            if (Request.QueryString["item"] == null)
            {
                Response.Redirect("index.aspx");
            }
            else
            {
                string item = Request.QueryString["item"].ToString();
                OleDbConnection conn = GetDbConnection();
                GetPagging(item,conn);
                GetDdl();
                GetTable();
                lblpagecount.Text =Convert.ToString(pagging);
                lalItem.Text = item;
            }

        }
    }

    //绑定下拉框
    private void GetDdl()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("text", Type.GetType("System.String")));
        dt.Columns.Add(new DataColumn("value", Type.GetType("System.Int32")));
        for (int i = 1; i <= pagging; i++)
        {
            DataRow dr = dt.NewRow();
            dr["text"] = "第" + i + "页";
            dr["value"] = i;
            dt.Rows.Add(dr);
        }
        ddlgotopage.DataTextField = "text";
        ddlgotopage.DataValueField = "value";
        ddlgotopage.DataSource = dt;
        ddlgotopage.DataBind();
    }

    //绑定数据
    private void GetTable()
    {
        string repcmdstr;
        string item = Request.QueryString["item"].ToString();
        OleDbConnection conn = GetDbConnection();
        if (current == 0)
            repcmdstr = "select top " + pagesize + " n_title,n_addTime,n_ID from tb_news where n_audit=1 and n_item='" + item + "'";
        else
            repcmdstr = "select top " + pagesize + " n_title,n_addTime,n_ID from tb_news where n_audit=1 and n_item='" + item + "' and n_ID not in (select top " + current * pagesize + " n_id from tb_news where n_audit=1 and n_item='" + item + "' order by n_ID desc) order by n_ID desc";
        OleDbCommand repcmd = new OleDbCommand(repcmdstr, conn);
        OleDbDataAdapter oda = new OleDbDataAdapter(repcmd);
        DataTable dt = new DataTable();
        oda.Fill(dt);
        if (dt.Rows.Count == 0)
            Response.Redirect("index.aspx");
        repItem.DataSource = dt;
        repItem.DataBind();
        lblcurpage.Text = Convert.ToString(current + 1);
        LinkBtnEnabled();
    }

    //获取页数
    private static void GetPagging(string item,OleDbConnection conn)
    {
        string selcmdstr = "select count(*) from tb_news where n_audit=1 and n_item='" + item + "'";
        OleDbCommand selcmd = new OleDbCommand(selcmdstr, conn);
        conn.Open();
        int counts = (int)selcmd.ExecuteScalar();
        conn.Close();
        pagging = counts / pagesize;
        if (counts % pagesize != 0)
            pagging++;
    }

    //获取数据库连接
    private OleDbConnection GetDbConnection()
    {
        string connstr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString + Server.MapPath(ConfigurationManager.ConnectionStrings["DBPath"].ConnectionString);
        OleDbConnection conn = new OleDbConnection(connstr);
        return conn;
    }

    //按钮命令
    protected void linkbutton_command(object sender, CommandEventArgs e)
    {
        switch (e.CommandArgument.ToString())
        {
            case "first":
                ddlgotopage.SelectedIndex = 0;
                current = ddlgotopage.SelectedIndex;
                GetTable();
                break;
            case "prev":
                ddlgotopage.SelectedIndex--;
                current = ddlgotopage.SelectedIndex;
                GetTable();
                break;
            case "next":
                ddlgotopage.SelectedIndex++;
                current = ddlgotopage.SelectedIndex;
                GetTable();
                break;
            case "last":
                ddlgotopage.SelectedIndex = pagging-1;
                current = ddlgotopage.SelectedIndex;
                GetTable();
                break;
        }
    }

    //判断按钮可用
    private void LinkBtnEnabled()
    {
        if (ddlgotopage.SelectedIndex == 0 && pagging > 1)
        {
            cmdfirstpage.Visible = false;
            cmdpreview.Visible = false;
            cmdnext.Visible = true;
            cmdnext.Enabled = true;
            cmdlastpage.Visible = true;
            cmdlastpage.Enabled = true;
        }
        else if (ddlgotopage.SelectedIndex == pagging - 1 && pagging > 1)
        {
            cmdfirstpage.Visible = true;
            cmdfirstpage.Enabled = true;
            cmdpreview.Visible = true;
            cmdpreview.Enabled = true;
            cmdnext.Visible = false;
            cmdlastpage.Visible = false;
        }
        else if (pagging == 1)
        {
            cmdfirstpage.Visible = false;
            cmdpreview.Visible = false;
            cmdnext.Visible = false;
            cmdlastpage.Visible = false;
            ddlgotopage.Visible = false;
        }
        else
        {
            cmdfirstpage.Visible = true;
            cmdpreview.Visible = true;
            cmdnext.Visible = true;
            cmdlastpage.Visible = true;
            ddlgotopage.Visible = true;
            cmdfirstpage.Enabled = true;
            cmdpreview.Enabled = true;
            cmdnext.Enabled = true;
            cmdlastpage.Enabled = true;
        }
    }

    //下拉框选择事件
    protected void ddlgorochanged(object sender, EventArgs e)
    {
        current = ddlgotopage.SelectedIndex;
        GetTable();
    }
}
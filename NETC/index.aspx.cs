using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetOleDbBind("部门信息",repSection);
        GetOleDbBind("应用指南", repApply);
        GetOleDbBind("党支部专栏", repParty);
    }

    //绑定数据源
    private void GetOleDbBind(string item, Repeater rep)
    {
        OleDbConnection conn = GetOleDbConnection();
        string selcmdstr = "select top 8 n_ID,n_title,n_addTime from tb_news where n_audit=1 and n_item='" + item + "'";
        OleDbCommand selcmd = conn.CreateCommand();
        selcmd.CommandText = selcmdstr;
        OleDbDataAdapter oda = new OleDbDataAdapter(selcmd);
        DataTable dt = new DataTable();
        oda.Fill(dt);
        rep.DataSource = dt;
        rep.DataBind();
    }

    //连接数据库
    private OleDbConnection GetOleDbConnection()
    {
        string connstr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString + Server.MapPath(ConfigurationManager.ConnectionStrings["DBPath"].ConnectionString);
        OleDbConnection conn = new OleDbConnection(connstr);
        return conn;
    }
}
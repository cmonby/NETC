using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            bind();
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }

    //绑定数据
    private void bind()
    {
        OleDbConnection conn = GetOleDbConnection();
        string id = Request.QueryString["id"].ToString();
        string selcmdstr = "select * from tb_news where n_ID=" + id;
        DataTable dt = GetDataTable(conn, selcmdstr);
        if (dt.Rows.Count == 0)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            ltelTitle.Text = dt.Rows[0]["n_title"].ToString();
            ltelAuthor.Text = dt.Rows[0]["n_author"].ToString();
            ltelTime.Text = Convert.ToDateTime(dt.Rows[0]["n_addTime"]).ToString("yyyy-M-d");
            ltelSection.Text = dt.Rows[0]["n_section"].ToString();
            ltelItem.Text = dt.Rows[0]["n_item"].ToString();
            ltelViewCount.Text = dt.Rows[0]["n_viewCount"].ToString();
            ltelContent.Text = dt.Rows[0]["n_Content"].ToString();
            string updsqlstr = "update tb_news set n_viewCount=" + (Convert.ToInt32(ltelViewCount.Text)+1) + " where n_ID=" + id;
            OleDbCommand updcmd = new OleDbCommand(updsqlstr, conn);
            conn.Open();
            updcmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    //获取数据表
    private static DataTable GetDataTable(OleDbConnection conn, string selcmdstr)
    {
        OleDbCommand selcmd = new OleDbCommand(selcmdstr, conn);
        OleDbDataAdapter oda = new OleDbDataAdapter(selcmd);
        DataTable dt = new DataTable();
        oda.Fill(dt);
        return dt;
    }

    //获取数据连接
    private OleDbConnection GetOleDbConnection()
    {
        string connstr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString + Server.MapPath(ConfigurationManager.ConnectionStrings["DBPath"].ConnectionString);
        OleDbConnection conn = new OleDbConnection(connstr);
        return conn;
    }
}
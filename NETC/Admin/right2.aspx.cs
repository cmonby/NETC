using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;
using Wuqi.Webdiyer;

public partial class Admin_right2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DisplayData(1, AspNetAdmin.PageSize);
        }
    }

    //绑定数据
    private void DisplayData(int pageIndex, int pageSize)
    {
        OleDbConnection conn = GetOleDbConnection();
        string countstr = "select count(*) from tb_admin";
        OleDbCommand countcmd = new OleDbCommand(countstr, conn);
        conn.Open();
        AspNetAdmin.RecordCount = (int)countcmd.ExecuteScalar();
        conn.Close();
        string selcmdstr;
        if (pageIndex == 1)
            selcmdstr = "select top " + pageSize + " * from tb_admin";
        else
            selcmdstr = "select top " + pageSize + " * from tb_admin where a_ID not in (select top " + pageSize * (pageIndex - 1) + " a_ID from tb_admin)";
        OleDbCommand selcmd = new OleDbCommand(selcmdstr, conn);
        OleDbDataAdapter oda = new OleDbDataAdapter(selcmd);
        DataTable dt = new DataTable();
        oda.Fill(dt);
        gvAdmin.DataSource = dt;
        gvAdmin.DataKeyNames = new string[] { "a_ID" };
        gvAdmin.DataBind();
    }

    //
    protected void AspNetAdmin_PageChanged(object sender,PageChangingEventArgs e)
    {
        DisplayData(e.NewPageIndex, AspNetAdmin.PageSize);
    }
    //连接数据库
    private OleDbConnection GetOleDbConnection()
    {
        string connstr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString + Server.MapPath("../" + ConfigurationManager.ConnectionStrings["DBPath"].ConnectionString);
        OleDbConnection conn = new OleDbConnection(connstr);
        return conn;
    }

    //行删除操作
    protected void gvAdmin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string delstr = "delete from tb_admin where a_ID=" + gvAdmin.DataKeys[e.RowIndex].Value.ToString();
        OleDbConnection conn = GetOleDbConnection();
        OleDbCommand delcmd = new OleDbCommand(delstr, conn);
        conn.Open();
        int rows = (int)delcmd.ExecuteNonQuery();
        conn.Close();
        if (rows > 0)
        {
            Response.Write("<script>alert('删除成功！')</script>");
            DisplayData(AspNetAdmin.CurrentPageIndex, AspNetAdmin.PageSize);
            return;
        }
        else return;
    }

    //行更新操作
    protected void gvAdmin_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (((TextBox)(gvAdmin.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim().Length > 12)
        {
            Response.Write("<script>alert('密码不能超过12位')</script>");
            return;
        }
        string updatestr = "update tb_admin set a_pwd='" + ((TextBox)(gvAdmin.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim()
            + "',a_pow=" + (((CheckBox)gvAdmin.Rows[e.RowIndex].Cells[3].Controls[0]).Checked).ToString() + " where a_ID=" + gvAdmin.DataKeys[e.RowIndex].Value.ToString();
        OleDbConnection conn = GetOleDbConnection();
        OleDbCommand updatecmd = new OleDbCommand(updatestr, conn);
        conn.Open();
        int rows = (int)updatecmd.ExecuteNonQuery();
        conn.Close();
        if (rows > 0)
        {
            gvAdmin.EditIndex = -1;
            DisplayData(AspNetAdmin.CurrentPageIndex, AspNetAdmin.PageSize);
        }
        else
        {
            Response.Write("<script>alert('更新失败！')</script>");
            return;
        }
    }

    //行编辑操作
    protected void gvAdmin_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvAdmin.EditIndex = e.NewEditIndex;
        DisplayData(AspNetAdmin.CurrentPageIndex, AspNetAdmin.PageSize);
    }

    //行取消编辑操作
    protected void gvAdmin_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvAdmin.EditIndex = -1;
        DisplayData(AspNetAdmin.CurrentPageIndex, AspNetAdmin.PageSize);
    }
    protected void btnRes_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim().ToString() == "")
        {
            Response.Write("<script>alert('账号不能为空')</script>");
        }
        else if (txtPwd.Text.Trim().ToString() == "")
        {
            Response.Write("<script>alert('密码不能为空')</script>");
        }
        else
        {
            OleDbConnection conn = GetOleDbConnection();
            string countstr = "select count(*) from tb_admin where a_name=@name";
            OleDbCommand countcmd = new OleDbCommand(countstr, conn);
            countcmd.Parameters.Add(new OleDbParameter("@name", txtName.Text.Trim().ToString()));
            conn.Open();
            int count = (int)countcmd.ExecuteScalar();
            conn.Close();
            if (count > 0)
            {
                Response.Write("<script>alert('该账户已存在，请重新输入！')</script>");
                return;
            }
            else
            {
                string addsqlstr = "insert into tb_admin (a_name,a_pwd,a_pow) values (@name,@pwd," + radioAudit.Checked.ToString() + ")";
                OleDbCommand addcmd = new OleDbCommand(addsqlstr, conn);
                OleDbParameter[] paras = {
                                         new OleDbParameter("@name",txtName.Text.Trim().ToString()),
                                         new OleDbParameter("@pwd",txtPwd.Text.Trim().ToString())
                                     };
                addcmd.Parameters.AddRange(paras);
                conn.Open();
                int rows = (int)addcmd.ExecuteNonQuery();
                conn.Close();
                if (rows > 0)
                {
                    Response.Write("<script>alert('添加成功！')</script>");
                    txtName.Text = "";
                    txtPwd.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('添加失败！')</script>");
                }
            }
        }
    }
}
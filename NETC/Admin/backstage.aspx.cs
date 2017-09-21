using System;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class backstage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        btnlogin.Attributes.Add("OnClick", "return btnclick(this)");
        if (!IsPostBack)
        {
            Session["a_id"]="";
            Session["a_pow"] = "";
        }
    }
    public void btnLogin_Click(object sender,EventArgs e)
    {
        if (txtName.Value.Trim().ToString() == "" || txtPwd.Value.Trim().ToString() == "" || txtVer.Value.Trim().ToString() == "")
        {
            Response.Write("<script>alert('请填写必要内容！')</script>");
            return;
        }
        string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString + Server.MapPath("../" + ConfigurationManager.ConnectionStrings["DBPath"].ConnectionString);
        OleDbConnection conn = new OleDbConnection(constr);
        string selcmdstr = "select * from tb_admin where a_name=@name";
        OleDbCommand cmd = new OleDbCommand(selcmdstr, conn);
        OleDbParameter para = new OleDbParameter("@name", txtName.Value.Trim().ToString());
        cmd.Parameters.Add(para);
        DataTable dt = new DataTable();
        OleDbDataAdapter oda = new OleDbDataAdapter(cmd);
        oda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            if (txtPwd.Value.Trim().ToString() == dt.Rows[0]["a_pwd"].ToString())
            {
                if (Session["check"] == null)
                    return;
                if (txtVer.Value.Trim().ToString() == Session["check"].ToString())
                {
                    Session["a_id"] = dt.Rows[0]["a_ID"].ToString();
                    Session["a_name"] = dt.Rows[0]["a_name"].ToString();
                    Session["a_pow"] = dt.Rows[0]["a_pow"].ToString();
                    Response.Redirect("admin.aspx");
                }
                else
                {
                    Response.Write("<script>alert('验证码错误')</script>");
                    return;
                }
            }
            else
            {
                Response.Write("<script>alert('密码错误！')</script>");
                return;
            }
        }
        else
        {
            Response.Write("<script>alert('不存在此用户')</script>");
            return;
        }
    }

    public string on111()
    {
        return "niahoi";
    }
}   
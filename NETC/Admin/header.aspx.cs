using System;

public partial class Admin_header : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["a_name"] != null)
        {
            lalName.Text = Session["a_name"].ToString();
        }
    }
    protected void btnexit_OnClick(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Write("<script type='text/javascript'>window.parent.location.href='backstage.aspx';</script>");
    }
}
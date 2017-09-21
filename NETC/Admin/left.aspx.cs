using System;

public partial class Admin_left : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Session["a_id"].ToString();
        string name = Session["a_name"].ToString();
        string pow = Session["a_pow"].ToString();
        if (pow.ToString() == "False")
        {
            lipow1.Visible = false;
            lipow2.Visible = false;
        }
        else
        {
            lipow1.Visible = true;
            lipow2.Visible = true;
        }
    }
}
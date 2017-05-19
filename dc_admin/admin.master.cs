using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["LoginKey"].Value.ToString() == PrivateKey.adminKey)
        {
            lbl_username.Text = "" + Request.Cookies["UserName"].Value.ToString();
        }
        else
        {
            Response.Redirect("../");
        }
    }

    protected void btn_logoff_Click(object sender, EventArgs e)
    {
        Response.Cookies["UserName"].Value = null;
        Response.Cookies["LoginKey"].Value = null;
        Response.Redirect("../Default.aspx");
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_debug : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null && Request.Cookies["UserPassword"] != null)
        {
            String name = Request.Cookies["UserName"].Value.ToString();
            String pswd = Request.Cookies["UserPassword"].Value.ToString();
            lbl_info.Text = name + "\n" + pswd;
            if (!RSA.CheckIfLogin(name, pswd))
            {
                lbl_info.Text += "\n !!";
            }
        }
        else
        {
            lbl_info.Text += "no cookie";
        }
    }
}
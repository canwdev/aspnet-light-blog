using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //Page.Header.Title = LoadSettings.loadTitle();
            if (Request.Cookies["UserName"] != null && Request.Cookies["UserPassword"] != null)
            {
                String name = Request.Cookies["UserName"].Value.ToString();
                String pswd = Request.Cookies["UserPassword"].Value.ToString();
                
                if (RSA.CheckIfLogin(name, pswd))
                {
                    lbl_username.Text = "" + name;
                    lbl_mgr.Text = "管理";
                } else
                {

                }
            }
            else
            {
                Response.Cookies["UserName"].Value = null;
                Response.Cookies["UserPassword"].Value = null;
            }
        }
        catch (Exception exc)
        {
            Console.WriteLine(exc.Message.ToString());
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_user_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        admin_info_show_load();
    }

    protected void admin_info_show_load()
    {
        try
        {
            String name = Request.Cookies["UserName"].Value.ToString();
            if (dcSettings.LoadUserHeadImg(name) != null)
            {
                img_headimg1.ImageUrl = dcSettings.LoadUserHeadImg(name);
            }
            else
            {
                img_headimg1.ImageUrl = "../res/head.png";
            }
        }
        catch
        {

        }
    }
}
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
            img_headimg.ImageUrl = "./res/head.png";
            //Page.Header.Title = dcSettings.loadTitle();
            if (Request.Cookies["UserName"] != null && Request.Cookies["UserPassword"] != null)
            {
                String name = Request.Cookies["UserName"].Value.ToString();
                String pswd = Request.Cookies["UserPassword"].Value.ToString();

                if (RSA.CheckIfLogin(name, pswd))
                {
                    lbl_username.Text = "" + dcSettings.LoadUserName(name); ;
                    lbl_mgr.Text = "管理";
                    btn_logoff.Visible = true;
                    if (dcSettings.LoadUserHeadImg(name) != null)
                    {
                        img_headimg.ImageUrl = dcSettings.LoadUserHeadImg(name);
                    }



                }
                else
                {

                }
            }
            else
            {

            }
        }
        catch (Exception exc)
        {
            Console.WriteLine(exc.Message.ToString());
        }
    }

    //注销按钮
    protected void btn_logoff_Click(object sender, EventArgs e)
    {
        Response.Cookies["UserName"].Value = null;
        Response.Cookies["UserPassword"].Value = null;
        Response.Redirect("./");
    }
}

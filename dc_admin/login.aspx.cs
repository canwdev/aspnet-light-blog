using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_login : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_err.Text = "";
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        String username = txt_username.Text;
        String password = txt_password.Text;

        try
        {
             var results = from r in db.dc_user
                           where r.uname.ToString() == username
                           select r;
             foreach (dc_user r in results)
             {
                 if (password == r.upassword.ToString())
                 {

                     Response.Cookies["UserName"].Value = username;
                     Response.Cookies["LoginKey"].Value = PrivateKey.adminKey;
                     Response.Redirect("../dc_admin");

                 }
                 else
                 {
                     lbl_err.Text = "登陆失败：用户名或密码错误";
                 }
             }

        }
        catch (Exception exc)
        {
            lbl_err.Text = exc.Message.ToString();
        }
        finally
        {
            
        }
    }
}
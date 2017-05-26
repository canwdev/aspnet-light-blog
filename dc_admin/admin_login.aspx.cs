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
        //若已登录，直接跳转
        try
        {
            if (Request.Cookies["UserName"] != null && Request.Cookies["UserPassword"] != null)
            {
                String name = Request.Cookies["UserName"].Value.ToString();
                String pswd = Request.Cookies["UserPassword"].Value.ToString();
                if (RSA.CheckIfLogin(name, pswd))
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
        catch (Exception exc)
        {
            lbl_err.Text = exc.Message.ToString();
        }

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        String username = txt_username.Text;
        String password = txt_password.Text;
        String encPassword = RSA.Encrypt(password);
        
        try
        {
            var results = from r in db.dc_user
                          where r.uname.ToString() == username
                          select r;
            String decDbPassword = RSA.Decrypt(results.First().upassword.ToString());
            if (results.First() != null && password == decDbPassword)
            {

                Response.Cookies["UserName"].Value = username;
                
                Response.Cookies["UserPassword"].Value = encPassword; // 加密存储为密码
                
                Response.Redirect("../dc_admin");

            }
            else
            {
                lbl_err.Text = "登陆失败：用户名或密码错误";
            }

        }
        catch (Exception exc)
        {
            lbl_err.Text = "登陆失败：" + exc.Message.ToString();
        }
        finally
        {

        }
    }
}
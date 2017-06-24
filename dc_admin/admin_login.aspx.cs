using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

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

        
        if (!this.IsPostBack)
        {
            lbl_err.Text = "";
            lbl_ok.Text = "";
            Js.SetCssClass(this, "a", "id_tab_login", "tab-pane fade active in");
            Js.SetCssClass(this, "b", "login_tab_login_active", "active");
        }
        

        // 判断是否允许注册
        if (dcSettings.LoadValue("set_regist_enabled") != "yes")
        {
            panel_register.Visible = false;
            panel_register_disabled.Visible = true;
        }
    }

    protected void Page_Error(object sender, EventArgs e)
    {
        Exception ex = Server.GetLastError();
        if (ex is HttpRequestValidationException)
        {
            Response.Write("从客户端中检测到有潜在危险的 Request.Form 值请您输入合法字符串。");
            Server.ClearError(); // 如果不ClearError()这个异常会继续传到Application_Error()。
        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Js.SetCssClass(this, "a", "id_tab_login", "tab-pane fade active in");
        Js.SetCssClass(this, "b", "login_tab_login_active", "active");

        string username = txt_username.Text;
        string password = txt_password.Text;
        string encPassword = RSA.Encrypt(password);

        if (Page.IsValid)
        {
            try
            {
                var result = (from r in db.dc_user
                              where r.uname == username
                              select r).First();
                if (result != null)
                {
                    string decDbPassword = RSA.Decrypt(result.upassword);

                    if (password == decDbPassword)
                    {
                        Response.Cookies["UserName"].Value = username;
                        Response.Cookies["UserPassword"].Value = encPassword; // 加密存储为密码
                        Response.Redirect("../dc_admin");
                    }
                    else
                    {
                        lbl_err.Text = "登陆失败：密码错误";
                    }
                }
                else
                {
                    lbl_err.Text = "登陆失败：用户名不存在";
                }
            }
            catch (Exception exc)
            {
                lbl_err.Text = "登陆失败：" + exc.Message.ToString();
            }
        }

    }

    protected void btn_regist_Click(object sender, EventArgs e)
    {
        Js.SetCssClass(this, "a", "id_tab_register", "tab-pane fade active in");
        Js.SetCssClass(this, "b", "login_tab_register_active", "active");

        string username = txt_reg_username.Text;
        string password = txt_reg_password_confirm.Text;
        string encPassword = RSA.Encrypt(password);

        if (Page.IsValid)
        {
            try
            {
                var results = from r in db.dc_user
                              where r.uname == username
                              select r;
                if (results.Count() > 0)
                {
                    lbl_err.Text = "注册失败：用户已存在";
                }
                else if (dcSettings.LoadValue("set_regist_enabled") != "yes")
                {
                    lbl_err.Text = "注册功能已关闭";
                }
                else
                {
                    dc_user newuser = new dc_user();
                    newuser.uname = txt_reg_username.Text;
                    newuser.upassword = RSA.Encrypt(txt_reg_password_confirm.Text);
                    newuser.gid = 1;
                    db.dc_user.InsertOnSubmit(newuser);
                    db.SubmitChanges();

                    lbl_ok.Text = "注册成功，请登录";
                }
            }
            catch (Exception exc)
            {
                lbl_err.Text = "注册失败：" + exc.Message.ToString();
            }
            finally
            {

            }
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_admin_modify_info : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();

    int id = -1;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            lbl_modpwd_ok.Visible = false;
            lbl_modpwd_error.Visible = false;
            Page.Header.Title = "修改资料";
            if (Request.QueryString["id"] != null && dcSettings.IsAdmin())
            {
                id = int.Parse(Request.QueryString["id"]);
                Session["new_uid"] = id;

                Page.Header.Title = "修改资料: " + id;

                Panel_mod_pswd.Visible = false;
                Panel_mod_pswd_disabled.Visible = true;
                Js.SetCssClass(this, "admin_info_mod", "tab-pane fade active in");
                ScriptManager.RegisterStartupScript(this, GetType(), "aa",
                "document.getElementById('userinfo_frame').src=\"user_info.aspx?id="+ Request.QueryString["id"] + "\"", true);


                UinfoLoad(id);
            }
            else
            {
                Js.SetCssClass(this, "admin_info_show", "tab-pane fade active in");
                id = dcSettings.LoadUserUid();
                Session["new_uid"] = id;
                UinfoLoad(id);
            }
        }

        id = int.Parse(Session["new_uid"].ToString());
    }

    /// 加载用户信息
    protected void UinfoLoad(int id)
    {
        UimageLoad(id);
        var result = (from r in db.dc_user
                      where r.uid == id
                      select r).First();
        txt_user_uname.Text = result.uname;
        txt_user_nickname.Text = result.nickname;
        txt_user_intro.Text = result.intro;
        txt_user_uid.Text = result.uid.ToString();
        txt_user_gid.Text = result.gid.ToString();

        if (dcSettings.IsAdmin())
        {
            txt_user_uname.ReadOnly = false;
            txt_user_gid.ReadOnly = false;
        }

    }

    /// 加载用户头像
    protected void UimageLoad(int id)
    {
        try
        {
            if (dcSettings.LoadUserHeadImg(id) != null)
            {
                img_headimg1.ImageUrl = dcSettings.LoadUserHeadImg(id);
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

    //上传头像按钮
    protected void btn_UpImg_Click(object sender, EventArgs e)
    {
        Js.SetCssClass(this, "admin_info_mod", "tab-pane fade active in");
        dcSettings.UploadHeadImg(FileUpload1, id, img_headimg1);
    }

    /// 修改信息按钮
    protected void btn_UpUinfo_Click(object sender, EventArgs e)
    {
        Js.SetCssClass(this, "admin_info_mod", "tab-pane fade active in");
        if (Page.IsValid)
        {
            try
            {
                var result = (from r in db.dc_user
                              where r.uid == id
                              select r).First();

                result.nickname = txt_user_nickname.Text;
                result.intro = txt_user_intro.Text;
                if (dcSettings.IsAdmin())
                {
                    result.uname = txt_user_uname.Text;
                    result.gid = int.Parse(txt_user_gid.Text);
                }
                db.SubmitChanges();
                if (FileUpload1.HasFile)
                {
                    dcSettings.UploadHeadImg(FileUpload1, id, img_headimg1);
                }
                lbl_ok.Text = "修改成功";
                lbl_ok.Visible = true;
            }
            catch (Exception ex)
            {
                lbl_error.Text = ex.Message;
                lbl_error.Visible = true;
            }
        }
    }

    /// 修改密码按钮
    protected void btn_modpwd_Click(object sender, EventArgs e)
    {
        Js.SetCssClass(this, "admin_pwd_mod", "tab-pane fade active in");
        try
        {
            String username = Request.Cookies["UserName"].Value.ToString();
            String origin_enc_password = RSA.Encrypt(txt_origin_password.Text);
            String new_enc_password = RSA.Encrypt(txt_new_password.Text);

            if (RSA.CheckIfLogin(username, origin_enc_password))
            {
                var results = from r in db.dc_user
                              where r.uname == username
                              select r;
                if (results != null)
                {
                    var result = results.First();
                    result.upassword = new_enc_password;
                    db.SubmitChanges();
                    lbl_modpwd_ok.Text = "修改成功,请<a href=\"admin_login.aspx\">重新登录</a>";
                    lbl_modpwd_ok.Visible = true;
                }

            }
            else
            {
                lbl_modpwd_error.Text = "原始密码错误";
                lbl_modpwd_error.Visible = true;
            }
        }
        catch (Exception ex)
        {
            lbl_modpwd_error.Text = ex.Message;
            lbl_modpwd_error.Visible = true;
        }
    }
}
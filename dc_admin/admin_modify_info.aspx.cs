using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_admin_modify_info : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_modpwd_ok.Visible = false;
        lbl_modpwd_error.Visible = false;
        Page.Header.Title = "修改管理员资料";
        if (!this.IsPostBack)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "new", "document.getElementById('admin_info_show').className = 'tab-pane fade active in';", true);
            UimageLoad();
            UinfoLoad();
        }
        
    }

    protected void UimageLoad()
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

    protected void UinfoLoad()
    {
        String name = Request.Cookies["UserName"].Value.ToString();
        String pswd = Request.Cookies["UserPassword"].Value.ToString();
        var result = (from r in db.dc_user
                      where r.uid == dcSettings.LoadUserUid(name, pswd)
                      select r).First();
        txt_user_uname.Text = result.uname;
        txt_user_nickname.Text = result.nickname;
        txt_user_intro.Text = result.intro;
        txt_user_uid.Text = result.uid.ToString();
        txt_user_gid.Text = result.gid.ToString();
    }

    protected void btn_UpImg_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "new", "document.getElementById('admin_info_mod').className = 'tab-pane fade active in';", true);
            string fname = FileUpload1.FileName;        // 获取文件名
            string fext = fname.Substring(fname.LastIndexOf("."));      // 获取文件格式

            if (fext == ".jpg" || fext == ".png" || fext == ".gif")
            {
                String imageBase64 = "";
                fext = fext.Replace(".", "");
                imageBase64 = "data:image/" + fext + ";base64," + Convert.ToBase64String(FileUpload1.FileBytes);
                img_headimg1.ImageUrl = imageBase64;

                String name = Request.Cookies["UserName"].Value.ToString();
                String pswd = Request.Cookies["UserPassword"].Value.ToString();
                var result = (from r in db.dc_user
                              where r.uid == dcSettings.LoadUserUid(name, pswd)
                              select r).First();

                result.headimg = imageBase64;
                db.SubmitChanges();
            }
            else
            {
                //上传失败
            }
        }
        else
        {
            //没有选择图片
        }
    }

    protected void btn_UpUinfo_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "new", "document.getElementById('admin_info_mod').className = 'tab-pane fade active in';", true);
        String name = Request.Cookies["UserName"].Value.ToString();
        String pswd = Request.Cookies["UserPassword"].Value.ToString();
        var result = (from r in db.dc_user
                      where r.uid == dcSettings.LoadUserUid(name, pswd)
                      select r).First();

        result.nickname = txt_user_nickname.Text;
        result.intro = txt_user_intro.Text;
        db.SubmitChanges();
    }

    protected void btn_modpwd_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "new", "document.getElementById('admin_pwd_mod').className = 'tab-pane fade active in';", true);
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class debug : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            //if (Request.Cookies["UserName"] != null && Request.Cookies["UserPassword"] != null)
            //{
            //    String name = Request.Cookies["UserName"].Value.ToString();
            //    String pswd = Request.Cookies["UserPassword"].Value.ToString();
            //    lbl_info.Text += name + "<br/>" + pswd;
            //    if (!RSA.CheckIfLogin(name, pswd))
            //    {
            //        lbl_info.Text += "<br/>登录失败";
            //    }
            //    else
            //    {
            //        lbl_info.Text += "<br/>登录ok";
            //    }
            //}
            //else
            //{
            //    lbl_info.Text += "no cookie";
            //}
        }
    }

    protected void btn_enc_Click(object sender, EventArgs e)
    {
        try
        {
            txt_enced.Text = RSA.Encrypt(txt_origin.Text);
            txt_enced.ForeColor = System.Drawing.Color.Black;
        }
        catch (Exception exc)
        {
            txt_enced.Text = exc.Message;
            txt_enced.ForeColor = System.Drawing.Color.Red;
        }

    }

    protected void btn_dec_Click(object sender, EventArgs e)
    {
        try
        {
            txt_deced.Text = RSA.Decrypt(txt_enced.Text);
            txt_deced.ForeColor = System.Drawing.Color.Black;
        }
        catch (Exception exc)
        {
            txt_deced.Text = exc.Message;
            txt_deced.ForeColor = System.Drawing.Color.Red;
        }

    }

    protected void btn_genKey_Click(object sender, EventArgs e)
    {
        string privateKey;
        string publicKey;
        RSA.Generator(out privateKey, out publicKey, 512);
        txt_privateKey.Text = privateKey;
        txt_publicKey.Text = publicKey;
    }
}
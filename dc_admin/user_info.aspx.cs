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
        
        if (Request.QueryString["id"] != null)
        {
            admin_info_show_load(int.Parse(Request.QueryString["id"]));
        }
        else
        {
            admin_info_show_load(dcSettings.LoadUserUid());
        }
    }

    protected void admin_info_show_load(int id)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_user
                      where r.uid == id
                      select r).First();
        lbl_nickname.Text = result.nickname;
        lbl_intro.Text = result.intro;
        lbl_uname.Text = result.uname;
        lbl_gid.Text = result.gid.ToString();
        lbl_uid.Text = result.uid.ToString();

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
}
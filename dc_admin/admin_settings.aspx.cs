using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_admin_settings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            Js.SetCssById(this, "settings_home", "tab-pane fade active in");
            LoadWebsiteSettings();
        }
    }

    protected void LoadWebsiteSettings()
    {
        txt_site_title.Text = dcSettings.LoadValue("site_title");
        txt_hreo_title.Text = dcSettings.LoadValue("hero_title");
        txt_hreo_context.Text = dcSettings.LoadValue("hero_context");
        txt_hero_link_id.Text = dcSettings.LoadValue("hero_link_id");

        if (dcSettings.LoadValue("set_regist_enabled") == "yes")
        {
            chk_set_regist_enabled.Checked = true;
        }
        else
        {
            chk_set_regist_enabled.Checked = false;
        }
    }

    protected void btn_UpHomeBg_Click(object sender, EventArgs e)
    {
        Js.SetCssById(this, "settings_home", "tab-pane fade active in");
        dcSettings.UploadFileToPath(FileUpload1, "../res/");
    }

        protected void btn_SaveWebSet_Click(object sender, EventArgs e)
    {
        Js.SetCssById(this, "settings_home", "tab-pane fade active in");
        dcSettings.SaveValue("site_title", txt_site_title.Text);
        dcSettings.SaveValue("hero_title", txt_hreo_title.Text);
        dcSettings.SaveValue("hero_context", txt_hreo_context.Text);
        dcSettings.SaveValue("hero_link_id", txt_hero_link_id.Text);
    }

    protected void chk_SetRegEna_Changed(object sender, EventArgs e)
    {
        Js.SetCssById(this, "settings_1", "tab-pane fade active in");
        if (chk_set_regist_enabled.Checked == true)
        {
            dcSettings.SaveValue("set_regist_enabled", "yes");
        }
        else
        {
            dcSettings.SaveValue("set_regist_enabled", "no");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_admin_users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!dcSettings.IsAdmin())
        {
            Response.Redirect("error.aspx?code=403");
        }

        if (!this.IsPostBack)
        {
            if (dcSettings.LoadValue("set_regist_enabled") == "yes")
            {
                chk_set_regist_enabled.Checked = true;
            }
            else
            {
                chk_set_regist_enabled.Checked = false;
            }
        }
    }

    protected void chk_SetRegEna_Changed(object sender, EventArgs e)
    {
        Js.SetCssClass(this, "settings_1", "tab-pane fade active in");
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
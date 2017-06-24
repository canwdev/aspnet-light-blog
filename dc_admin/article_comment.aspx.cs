using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class article_comment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!dcSettings.IsAdmin())
        {
            Response.Redirect("error.aspx?code=403");
        }
        if (!this.IsPostBack)
        {
            switch (dcSettings.LoadValue("set_comment_enabled"))
            {
                case "yes":
                    chk_set_comment_enabled.Checked = true;
                    break;
                default:
                    chk_set_comment_enabled.Checked = false;
                    break;
            }
        }
    }

    protected void chk_SetCommEna_Changed(object sender, EventArgs e)
    {
        Js.SetCssClass(this, "settings_1", "tab-pane fade active in");
        if (chk_set_comment_enabled.Checked == true)
        {
            dcSettings.SaveValue("set_comment_enabled", "yes");
        }
        else
        {
            dcSettings.SaveValue("set_comment_enabled", "no");
        }
    }
}
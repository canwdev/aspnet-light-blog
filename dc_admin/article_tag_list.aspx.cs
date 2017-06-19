using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_article_tag_mgr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!dcSettings.IsRoot(dcSettings.LoadUserUid()))
        {
            Response.Redirect("Default.aspx");
        }
        Page.Header.Title = "文章标签管理";
    }
}
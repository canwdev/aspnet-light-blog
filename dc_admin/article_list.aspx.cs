using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_article_list : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!dcSettings.IsAdmin())
        {
            Response.Redirect("error.aspx?code=403");
        }

        Page.Header.Title = "文章管理";
    }
}
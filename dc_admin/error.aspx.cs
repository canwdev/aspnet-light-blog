using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string error = "";
        if (Request.QueryString["code"] != null)
        {
            error = Request.QueryString["code"];
        }

        switch (error)
        {
            case "404":
                lbl_error_title.Text = "404 Not Found —— 未找到  ";
                break;
            case "403":
                lbl_error_title.Text = "403 Forbidden —— 禁止访问";
                break;
            default:
                lbl_error_title.Text = "501 Not Implemented —— 未实现  ";
                break;
        }
    }
}
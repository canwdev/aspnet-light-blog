using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
///Js 的摘要说明
///这个库用来快速调用JavaScript代码
/// </summary>
public class Js
{
    /// <summary>
    /// 弹出JavaScript对话框
    /// </summary>
    /// <param name="message"></param>
    public static void Alert(string message)
    {
        string js = @"<Script language='JavaScript'>
                alert('" + message + "');</Script>";
        HttpContext.Current.Response.Write(js);
    }

    /// <summary>
    /// 返回上一个页面
    /// </summary>
    public static void HistoryBack()
    {
        string js = @"<Script language='JavaScript'>
        window.history.back(-1); </Script>";
        HttpContext.Current.Response.Write(js);
    }

    /// <summary>
    /// 跳转页面
    /// </summary>
    /// <param name="page">页面</param>
    public static void self_location(String page)
    {
        string js = @"<Script language='JavaScript'>
        self.location='"+page+"'; </Script>";
        HttpContext.Current.Response.Write(js);
    }

    public static void top_location(String page)
    {
        string js = @"<Script language='JavaScript'>
        top.location='" + page + "'; </Script>";
        HttpContext.Current.Response.Write(js);
    }

    // 通过ScriptManager设置id的css_class样式
    public static void SetCssClass(Page page, string id, string css_class)
    {

        ScriptManager.RegisterStartupScript(page, page.GetType(), "new",
            "document.getElementById('"+id+"').className = '"+css_class+"';", true);
    }

    // 通过ScriptManager设置id的背景图片样式
    public static void SetBackgroundImage(Page page, string id, string src)
    {
        ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "new",
            "document.getElementById('" + id + "').style.backgroundImage=\"url("+ src + ")\";", true);
    }

    // 通过ScriptManager设置id的css_class样式2
    public static void SetCssClass(Page page, string name, string id, string css_class)
    {

        ScriptManager.RegisterStartupScript(page, page.GetType(), name,
            "document.getElementById('" + id + "').className = '" + css_class + "';", true);
    }

    // 通过ScriptManager设置id的背景图片样式2
    public static void SetBackgroundImage(Page page, string name, string id, string src)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), name,
            "document.getElementById('" + id + "').style.backgroundImage=\"url(" + src + ")\";", true);
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Detail : System.Web.UI.Page
{
    public DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            String name="null", pswd="null";

            if (Request.Cookies["UserName"] != null)
            {
                name = Request.Cookies["UserName"].Value.ToString();
                pswd = Request.Cookies["UserPassword"].Value.ToString();
            }

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                LoadArticle(id);

                //如果管理员登录则显示编辑链接
                if (RSA.CheckIfLogin(name, pswd))
                {
                    lbl_edit.Visible = true;
                    lbl_edit.Text = "<span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span>";
                    lbl_edit.Text += "<a href=\"./dc_admin/article_addmod.aspx?id=" + id + "\">编辑文章</a>";
                }
            }
            else if (Request.QueryString["tagid"] != null)
            {
                int tagid = int.Parse(Request.QueryString["tagid"]);
                LoadTag(tagid);

                //如果管理员登录则显示编辑链接
                if (RSA.CheckIfLogin(name, pswd))
                {
                    lbl_edit.Visible = true;
                    lbl_edit.Text = "<span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span>";
                    lbl_edit.Text += "<a href=\"./dc_admin/article_tag_addmod.aspx?id=" + tagid + "\">编辑标签</a>";
                }
            }
            else
            {
                Page.Header.Title = "未找到文章 - "+ dcSettings.LoadValue("site_title");
                lbl_title.Text = "404 Page Not Found";

            }

            
        }
    }

    public void LoadArticle(int id)
    {
        try
        {
            var result = (from r in db.dc_article
                          where r.id == id
                          select r).First();
            

            Page.Header.Title = result.title + " - " + dcSettings.LoadValue("site_title");
            lbl_title.Text = "<a href=\"Detail.aspx?id=" + result.id + "\">" + result.title + "</a>";

            //加载文章所属标签
            var tag = (from r in db.dc_article_tag
                       where r.id == result.article_tag_id
                       select r).First();
            String tagid = (tag.id).ToString();
            if (tagid != "" && tag != null)
            {
                lbl_tag.Text = "<a href=\"Detail.aspx?tagid=" + tagid + "\">" + tag.article_tag_name + "</a>";
            }

            lbl_author.Text = result.author;
            if (result.time_update.ToString() != "")
            {
                lbl_time_update.Text = result.time_update.ToString();
            }
            else
            {
                lbl_time_update.Text = result.time_commit.ToString();
            }

            lbl_article_context.Text = result.article_context;
        }
        catch (Exception exc)
        {
            Page.Header.Title = "未找到文章 - " + dcSettings.LoadValue("site_title");
            lbl_title.Text = "404 Page Not Found";
            //lbl_edit.Visible = false;
            lbl_article_context.Text = exc.Message.ToString();
        }
    }

    public void LoadTag(int tagid)
    {
        var res = (from r in db.dc_article_tag
                   where r.id == tagid
                   select r).First();

        Page.Header.Title = "“" + res.article_tag_name + "”的标签 - " + dcSettings.LoadValue("site_title");
        lbl_title.Text = "“" + res.article_tag_name + "”的标签";
        lbl_tag.Visible = false;
        lbl_time_update.Text = "";
        lbl_author.Text = "";

        String htmlstring = "";

        htmlstring += "<div class=\"alert alert-info\" role=\"alert\">标签简介：" + res.article_tag_intro+"</div>";
        htmlstring += "<ul>";
        var article = from r in db.dc_article
                      where r.article_tag_id == tagid
                      select r;
        foreach (var r in article)
        {
            htmlstring += "<li><a href=\"Detail.aspx?id=" + r.id + "\">" + r.title + "</a></li>";
        }
        htmlstring += "</ul>";
        lbl_article_context.Text = htmlstring;
    }
}
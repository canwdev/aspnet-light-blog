using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dc_admin_article_addmod : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                lbl_head_title.Text = "编辑文章";
                btn_submit.Text = "修改";
                Page.Header.Title = "编辑文章";

                int id = int.Parse(Request.QueryString["id"]);
                ArticleLoad(id);
            }
            else
            {
                lbl_head_title.Text = "写文章";
                btn_submit.Text = "提交";
                Page.Header.Title = "写文章";

                txt_author.Text = Request.Cookies["UserName"].Value.ToString();
            }
        }
    }

    public void ArticleLoad(int id)
    {
        var result = (from r in db.dc_article
                      where r.id == id
                      select r).First();
        if (result != null)
        {
            txt_title.Text = result.title;
            txt_author.Text = result.author;
            txt_intro.Text = result.article_intro;
            txt_context.Text = result.article_context;
        }
        
    }

    public void ArticleMod(int id)
    {
        try
        {
            var result = (from r in db.dc_article
                          where r.id == id
                          select r).First();

            if (result != null)
            {
                result.title = txt_title.Text;
                if (result.time_commit != null)
                {
                    result.time_update = DateTime.Now;
                }
                else
                {
                    result.time_commit = DateTime.Now;
                }
                result.author = txt_author.Text;
                result.article_intro = txt_intro.Text + "...<a href=\"Detail.aspx?id=" + id + "\">查看更多</a>";
                //result.article_intro = (txt_context.Text).Substring(0, 200);
                result.article_context = txt_context.Text;
                db.SubmitChanges();
                lbl_modpwd_ok.Text = "修改成功，点击<a href=\"../Detail.aspx?id=" + id + "\">查看</a>";
                lbl_modpwd_ok.Visible = true;
            }
            else
            {
                lbl_modpwd_error.Text = "文章未找到";
                lbl_modpwd_error.Visible = true;
            }
        }
        catch (Exception ex)
        {
            lbl_modpwd_error.Text = ex.Message;
            lbl_modpwd_error.Visible = true;
        }
        
    }

    public void ArticleAdd()
    {
        dc_article article = new dc_article();
        article.title = txt_title.Text;
        article.time_commit = DateTime.Now;
        article.author = txt_author.Text;
        article.article_intro = txt_intro.Text + "...";
        article.article_context = txt_context.Text;

        db.dc_article.InsertOnSubmit(article);
        db.SubmitChanges();
        lbl_modpwd_ok.Text = "添加成功，回到<a href=\"../Default.aspx\">首页</a>";
        lbl_modpwd_ok.Visible = true;
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if (btn_submit.Text == "修改")
        {
            ArticleMod(int.Parse(Request.QueryString["id"]));
        }
        else if (btn_submit.Text == "提交")
        {
            ArticleAdd();
        }
    }
}
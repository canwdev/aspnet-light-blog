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
            Bind_ddlTag();
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);

                Page.Header.Title = "编辑文章";
                lbl_head_title.Text = "<a href=\"../Detail.aspx?id=" + id + "\">编辑文章</a>";
                btn_submit.Text = "修改";
                btn_cancel.Visible = true;

                ArticleLoad(id);
            }
            else
            {
                lbl_head_title.Text = "写文章";
                btn_submit.Text = "提交";
                btn_delete.Visible = false;
                Page.Header.Title = "写文章";

                txt_author.Text = dcSettings.LoadUserName(Request.Cookies["UserName"].Value.ToString()); ;
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

            //匹配tag下拉数据源
            String tagid = (result.article_tag_id).ToString();
            var data = (from r in db.dc_article_tag
                        where r.id == int.Parse(tagid)
                        select r).First();

            if (tagid != "" && data != null)
            {
                ddl_article_tag.Items.FindByValue(tagid).Selected = true;
            }
            else
            {
                ddl_article_tag.Items.FindByValue("1").Selected = true;
            }

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
                result.time_update = DateTime.Now;
                result.author = txt_author.Text;
                result.article_tag_id = int.Parse(ddl_article_tag.SelectedValue);
                result.article_intro = txt_intro.Text;
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
        DateTime time = DateTime.Now;
        article.time_commit = time;
        article.time_update = time;
        article.author = txt_author.Text;
        article.article_tag_id = int.Parse(ddl_article_tag.SelectedValue);
        article.article_intro = txt_intro.Text + "...";
        article.article_context = txt_context.Text;

        db.dc_article.InsertOnSubmit(article);
        db.SubmitChanges();

        txt_title.Text = "";
        txt_intro.Text = "";
        txt_context.Text = "";

        lbl_modpwd_ok.Text = "添加成功，回到<a href=\"../Default.aspx\">首页</a>";
        lbl_modpwd_ok.Visible = true;

    }

    //绑定tag下拉数据源
    protected void Bind_ddlTag()
    {
        var tag = from r in db.dc_article_tag select r;
        ddl_article_tag.DataSource = tag;
        ddl_article_tag.DataTextField = "article_tag_name";
        ddl_article_tag.DataValueField = "id";
        ddl_article_tag.DataBind();
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

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("article_list.aspx");
    }

    protected void btn_delete_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"]);
        var result = (from r in db.dc_article
                      where r.id == id
                      select r).First();

        db.dc_article.DeleteOnSubmit(result);
        db.SubmitChanges();
        Js.Alert("已删除");
        Response.Redirect("Default.aspx");
    }

    protected void btn_SetTitleImg_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"]);
        dcSettings.UploadTitleImg(FileUpload1, id);
    }
}
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
                if (!dcSettings.IsAdmin())
                {
                    Response.Redirect("article_addmod.aspx");
                }

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
                btn_set_title_img_real.Visible = false;
                Page.Header.Title = "写文章";

                txt_author.Text = dcSettings.LoadUserName(Request.Cookies["UserName"].Value.ToString()); ;
            }
        }
    }

    public void ArticleLoad(int id)
    {
        try
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
        catch (Exception ex)
        {
            lbl_error.Text = ex.Message;
            lbl_error.Visible = true;
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
                lbl_ok.Text = "修改成功，点击<a href=\"../Detail.aspx?id=" + id + "\">查看</a>";
                lbl_ok.Visible = true;
            }
            else
            {
                lbl_error.Text = "文章未找到";
                lbl_error.Visible = true;
            }
        }
        catch (Exception ex)
        {
            lbl_error.Text = ex.Message;
            lbl_error.Visible = true;
        }

    }

    public void ArticleAdd()
    {
        if (Page.IsValid)
        {
            try
            {
                dc_article article = new dc_article();
                article.title = txt_title.Text;
                DateTime time = DateTime.Now;
                article.time_commit = time;
                article.time_update = time;
                article.author = txt_author.Text;
                article.article_tag_id = int.Parse(ddl_article_tag.SelectedValue);
                article.article_intro = txt_intro.Text;
                article.article_context = txt_context.Text;

                if (FileUpload1.HasFile)
                {
                    string fname = FileUpload1.FileName;        // 获取文件全名
                    string fext = System.IO.Path.GetExtension(fname).ToLower();      // 获取文件扩展名

                    if (fext == ".jpg" || fext == ".png" || fext == ".gif")
                    {
                        string spath = HttpContext.Current.Server.MapPath("~/res/upload/");   // 存放路径
                        string ffname = "timg" + DateTime.Now.ToString("yyyyddhhmmss") + fext;
                        string imgUrl = "./res/upload/" + ffname;

                        FileUpload1.SaveAs(spath + ffname);

                        article.title_img = imgUrl;
                        db.SubmitChanges();
                    }
                    else
                    {
                        lbl_error.Text = "图片上传失败：格式错误。";
                        lbl_error.Visible = true;
                    }
                }

                    db.dc_article.InsertOnSubmit(article);
                db.SubmitChanges();

                txt_title.Text = "";
                txt_intro.Text = "";
                txt_context.Text = "";

                lbl_ok.Text = "添加成功，回到<a href=\"../Default.aspx\">首页</a>";
                lbl_ok.Visible = true;
            }
            catch (Exception ex)
            {
                lbl_error.Text = ex.Message;
                lbl_error.Visible = true;
            }
        }
    }

    //绑定tag下拉数据源
    protected void Bind_ddlTag()
    {
        try
        {
            var tag = from r in db.dc_article_tag select r;
            ddl_article_tag.DataSource = tag;
            ddl_article_tag.DataTextField = "article_tag_name";
            ddl_article_tag.DataValueField = "id";
            ddl_article_tag.DataBind();
        }
        catch (Exception ex)
        {
            lbl_error.Text = ex.Message;
            lbl_error.Visible = true;
        }


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
        try
        {
            int id = int.Parse(Request.QueryString["id"]);
            var result = (from r in db.dc_article
                          where r.id == id
                          select r).First();

            db.dc_article.DeleteOnSubmit(result);
            db.SubmitChanges();
            Response.Redirect("article_list.aspx");
        }
        catch (Exception ex)
        {
            lbl_error.Text = ex.Message;
            lbl_error.Visible = true;
        }

    }

    protected void btn_SetTitleImg_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"]);
        SetTitleImage(id);

    }

    protected void SetTitleImage(int id)
    {
        try
        {
            dcSettings.UploadTitleImg(FileUpload1, id);
            lbl_ok.Text = "修改成功，点击<a href=\"../Detail.aspx?id=" + id + "\">查看</a>";
            lbl_ok.Visible = true;
        }
        catch (Exception ex)
        {
            lbl_error.Text = ex.Message;
            lbl_error.Visible = true;
        }
    }
}
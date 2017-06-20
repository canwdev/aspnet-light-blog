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
        if (!dcSettings.IsAdmin())
        {
            Response.Redirect("error.aspx?code=403");
        }

        if (!this.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                lbl_head_title.Text = "编辑标签";
                btn_submit.Text = "修改";
                
                btn_cancel.Visible = true;
                Page.Header.Title = "编辑标签";

                int id = int.Parse(Request.QueryString["id"]);
                LoadToWebPage(id);
            }
            else
            {
                lbl_head_title.Text = "写标签";
                btn_submit.Text = "提交";
                Page.Header.Title = "写标签";
            }
        }
    }

    public void LoadToWebPage(int id)
    {
        var result = (from r in db.dc_article_tag
                      where r.id == id
                      select r).First();
        if (result != null)
        {
            txt_name.Text = result.article_tag_name;
            txt_context.Text = result.article_tag_intro;

            
        }

    }

    public void Mod(int id)
    {
        try
        {
            var data = (from r in db.dc_article_tag
                        where r.id == id
                          select r).First();

            if (data != null)
            {




                data.article_tag_name = txt_name.Text;
                data.article_tag_intro = txt_context.Text;
                db.SubmitChanges();
                lbl_modpwd_ok.Text = "修改成功，点击<a href=\"article_tag_list.aspx\">查看</a>";
                lbl_modpwd_ok.Visible = true;
            }
            else
            {
                lbl_modpwd_error.Text = "标签未找到";
                lbl_modpwd_error.Visible = true;
            }
        }
        catch (Exception ex)
        {
            lbl_modpwd_error.Text = ex.Message;
            lbl_modpwd_error.Visible = true;
        }
        
    }

    public void Add()
    {
        dc_article_tag data = new dc_article_tag();

        DateTime time = DateTime.Now;


        data.article_tag_name = txt_name.Text;
        data.article_tag_intro = txt_context.Text;

        db.dc_article_tag.InsertOnSubmit(data);
        db.SubmitChanges();

        txt_context.Text = "";
        txt_name.Text = "";

        lbl_modpwd_ok.Text = "添加成功，回到<a href=\"../Default.aspx\">首页</a>";
        lbl_modpwd_ok.Visible = true;
        
    }



    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if (btn_submit.Text == "修改")
        {
            Mod(int.Parse(Request.QueryString["id"]));
        }
        else if (btn_submit.Text == "提交")
        {
            Add();
        }
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("article_tag_list.aspx");
    }
}
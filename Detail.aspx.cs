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
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                LoadArticle(id);
            }
            else
            {

                lbl_title.Text = "404 Page Not Found";

            }
        }
    }

    public void LoadArticle(int id)
    {
        var results = from r in db.dc_article
                      where r.id == id
                      select r;
        var result = results.First();

        lbl_title.Text = result.title;
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
}
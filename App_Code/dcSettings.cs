using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// 此类为加载设置
/// </summary>
public class dcSettings
{
    public dcSettings()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 加载设置
    /// </summary>
    /// <param name="set_title1">设置字段标题</param>
    /// <returns></returns>
    public static string LoadValue(string set_title1)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_settings
                      where r.set_title == set_title1
                      select r).First();
        return result.set_value;
    }

    /// <summary>
    /// 保存设置
    /// </summary>
    /// <param name="set_title1">设置字段标题</param>
    /// <param name="set_value1">设置字段内容</param>
    public static void SaveValue(string set_title1, string set_value1)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_settings
                      where r.set_title == set_title1
                      select r).First();
        result.set_value = set_value1;
        db.SubmitChanges();
    }

    /// 按用户id加载用户头像
    public static string LoadUserHeadImg(int uid1)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_user
                      where r.uid == uid1
                      select r).First();
        return result.headimg;
    }

    /// 按用户名加载用户头像
    public static string LoadUserHeadImg(string username)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_user
                      where r.uname == username
                      select r).First();
        return result.headimg;
    }

    /// 如果没有昵称则加载用户名
    public static string LoadUserName(string username)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_user
                      where r.uname == username
                      select r).First();
        if (result.nickname != null)
        {
            return result.nickname;
        }
        else
        {
            return result.uname;
        }
    }

    /// 验证登录并返回用户id
    public static int LoadUserUid(string name, string pswd)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var results = from r in db.dc_user
                      where r.uname.ToString() == name
                      select r;
        String decDbPassword = RSA.Decrypt(results.First().upassword.ToString());
        if (name == null || pswd == null)
        {
            return -1;
        }
        if (RSA.Decrypt(pswd) == decDbPassword)
        {
            return results.First().uid;
        }
        else
        {
            return -1;
        }
    }

    public static int LoadUserUid()
    {
        String name = HttpContext.Current.Request.Cookies["UserName"].Value.ToString();
        String pswd = HttpContext.Current.Request.Cookies["UserPassword"].Value.ToString();

        DataClassesDataContext db = new DataClassesDataContext();
        var results = from r in db.dc_user
                      where r.uname.ToString() == name
                      select r;
        String decDbPassword = RSA.Decrypt(results.First().upassword.ToString());
        if (name == null || pswd == null)
        {
            return -1;
        }
        if (RSA.Decrypt(pswd) == decDbPassword)
        {
            return results.First().uid;
        }
        else
        {
            return -1;
        }
    }

    /// 上传jpg文件至指定文件夹
    public static void UploadFileToPath(FileUpload FileUpload1, string fpath)
    {
        if (FileUpload1.HasFile)
        {
            string fname = FileUpload1.FileName;        // 获取文件名
            string fext = fname.Substring(fname.LastIndexOf("."));      // 获取文件格式

            if (fext == ".jpg")
            {
                var path = HttpContext.Current.Server.MapPath(fpath);   // 存放路径
                FileUpload1.SaveAs(path + "homepage_background" + fext);
            }
            else
            {
                Js.Alert("上传失败：格式错误。");
            }
        }
        else
        {
            Js.Alert("未选择文件");
        }
    }

    public static void UploadHeadImg(FileUpload FileUpload1, int id, Image imgshow)
    {
        if (FileUpload1.HasFile)
        {
            string fname = FileUpload1.FileName;        // 获取文件名
            string fext = fname.Substring(fname.LastIndexOf("."));      // 获取文件格式

            if (fext == ".jpg" || fext == ".png" || fext == ".gif")
            {
                String imageBase64 = "";
                fext = fext.Replace(".", "");
                imageBase64 = "data:image/" + fext + ";base64," + Convert.ToBase64String(FileUpload1.FileBytes);
                imgshow.ImageUrl = imageBase64;

                DataClassesDataContext db = new DataClassesDataContext();
                var result = (from r in db.dc_user
                              where r.uid == id
                              select r).First();

                result.headimg = imageBase64;
                db.SubmitChanges();
            }
            else
            {
                Js.Alert("上传失败：格式错误。");
            }
        }
        else
        {
            Js.Alert("未选择文件");
        }
    }

    public static void UploadTitleImg(FileUpload FileUpload1, int id1)
    {
        if (FileUpload1.HasFile)
        {
            string fname = FileUpload1.FileName;        // 获取文件名
            string fext = fname.Substring(fname.LastIndexOf("."));      // 获取文件格式

            if (fext == ".jpg" || fext == ".png" || fext == ".gif")
            {
                String imageBase64 = "";
                fext = fext.Replace(".", "");
                imageBase64 = "data:image/" + fext + ";base64," + Convert.ToBase64String(FileUpload1.FileBytes);

                DataClassesDataContext db = new DataClassesDataContext();
                var result = (from r in db.dc_article
                              where r.id == id1
                              select r).First();

                result.title_img = imageBase64;
                db.SubmitChanges();
            }
            else
            {
                Js.Alert("上传失败：格式错误。");
            }
        }
        else
        {
            Js.Alert("未选择文件");
        }
    }
}
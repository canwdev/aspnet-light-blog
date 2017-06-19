<%@ WebHandler Language="C#" Class="upImage" %>
using System;
using System.Web;




public class upImage : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        var files = context.Request.Files;
        if (files.Count <= 0)
        {
            return;
        }

        HttpPostedFile file = files[0];

        if (file == null)
        {
            context.Response.Write("error|file is null");
            return;
        }
        else
        {
            string path = context.Server.MapPath("~/res/upload/");  //存储图片的文件夹
            string originalFileName = file.FileName;
            string fileExtension = originalFileName.Substring(originalFileName.LastIndexOf('.'), originalFileName.Length - originalFileName.LastIndexOf('.'));
            string currentFileName = DateTime.Now.ToString("yyyyddhhmmss") + fileExtension;
            //string currentFileName = (new Random()).Next() + fileExtension;  //文件名中不要带中文，否则会出错

            string imagePath = path + currentFileName;
            //保存文件
            file.SaveAs(imagePath);

            //获取图片url地址
            string imgUrl = "../res/upload/" + currentFileName;

            //返回图片url地址
            context.Response.Write(imgUrl);
            return;
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}

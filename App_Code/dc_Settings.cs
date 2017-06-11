using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// 此类为加载设置
/// </summary>
public class dc_Settings
{
    public dc_Settings()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }


    public static string LoadValue(string set_title1)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_settings
                      where r.set_title == set_title1
                      select r).First();
        return result.set_value;
    }

    public static string LoadUserHeadImg(int uid1)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_user
                      where r.uid == uid1
                      select r).First();
        return result.headimg;
    }

    public static string LoadUserHeadImg(string username)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var img = (from r in db.dc_user
                   where r.uname == username
                   select r).First();
        return img.headimg;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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


    public static string LoadValue(string set_title1)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_settings
                      where r.set_title == set_title1
                      select r).First();
        return result.set_value;
    }

    public static void SaveValue(string set_title1, string set_value1)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_settings
                      where r.set_title == set_title1
                      select r).First();
        result.set_value = set_value1;
        db.SubmitChanges();
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
        var result = (from r in db.dc_user
                   where r.uname == username
                   select r).First();
        return result.headimg;
    }

    public static string LoadUserName(string username)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        var result = (from r in db.dc_user
                   where r.uname == username
                   select r).First();
        if(result.nickname != null)
        {
            return result.nickname;
        } else
        {
            return result.uname;
        }
    }

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
}
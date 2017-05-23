using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// RSA秘钥算法
/// </summary>
public class RSA : PrivateKey
{
    // http://www.cnblogs.com/guohu/p/5562759.html
    //加密
    public static string Encrypt(string express)
    {
        CspParameters param = new CspParameters();
        param.KeyContainerName = PrivateKey.adminKey;//密匙容器的名称，保持加密解密一致才能解密成功
        using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(param))
        {
            byte[] plaindata = System.Text.Encoding.Default.GetBytes(express);//将要加密的字符串转换为字节数组
            byte[] encryptdata = rsa.Encrypt(plaindata, false);//将加密后的字节数据转换为新的加密字节数组
            return Convert.ToBase64String(encryptdata);//将加密后的字节数组转换为字符串
        }
    }

    //解密
    public static String Decrypt(string ciphertext)
    {

        CspParameters param = new CspParameters();
        param.KeyContainerName = PrivateKey.adminKey;
        using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(param))
        {
            byte[] encryptdata = Convert.FromBase64String(ciphertext);
            byte[] decryptdata = rsa.Decrypt(encryptdata, false);
            return Encoding.Default.GetString(decryptdata);
        }


    }
    /// <summary>
    /// 判断cookie是否匹配（是否成功登录）
    /// </summary>
    /// <param name="name">cookie中用户名</param>
    /// <param name="pswd">cookie中加密的密码</param>
    /// <returns></returns>
    public static Boolean CheckIfLogin(String name, String pswd)
    {
        try
        {
            DataClassesDataContext db = new DataClassesDataContext();
            var results = from r in db.dc_user
                          where r.uname.ToString() == name
                          select r;
            String decDbPassword = RSA.Decrypt(results.First().upassword.ToString());
            if (name == null || pswd == null)
            {
                return false;
            }
            if (RSA.Decrypt(pswd) == decDbPassword)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }


    }


}
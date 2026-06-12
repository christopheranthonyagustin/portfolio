using System;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Management;

namespace WlocateWeb
{
    public class Encryption
    {
        private static byte[] szIV = { 121, 241, 10, 1, 132, 74, 11, 39, 255, 91, 45, 78, 14, 211, 22, 62 };

        /// <summary>
        /// encrypts string using password key
        /// </summary>
        /// <param name="strText"></param>
        /// <param name="strKey"></param>
        /// <returns></returns>
        public static string Encrypt(string strText)
        {
            try
            {
                // format string
                byte[] szText = Encoding.ASCII.GetBytes(strText.ToCharArray());
                byte[] szKey = Encoding.ASCII.GetBytes(GetKey().ToCharArray());

                // create encryptor
                RijndaelManaged objRijndael = new RijndaelManaged();
                MemoryStream memStream = new MemoryStream();
                CryptoStream cryStream = new CryptoStream(memStream, objRijndael.CreateEncryptor(szKey, szIV), CryptoStreamMode.Write);
                cryStream.Write(szText, 0, szText.Length);
                cryStream.FlushFinalBlock();

                // close encryptor 
                byte[] szEncoded = memStream.ToArray();
                memStream.Close();
                cryStream.Close();

                // return encrypted string
                return Convert.ToBase64String(szEncoded);
            }
            catch {}
            return strText;
        }

        /// <summary>
        /// generates the encryption key
        /// </summary>
        /// <returns></returns>
        private static string GetKey()
        {
            // get encryption key
            byte[] szTemp = Convert.FromBase64String("UzBsdXQxMG4=");
            string strKey = Encoding.ASCII.GetString(szTemp, 0, szTemp.Length);

            // limit encryption key
            int iLen = strKey.Length;
            if (iLen >= 32) strKey = strKey.Substring(0, 32);
            else
            {
                // fill remaining characters
                for (int i = 0; i < 32 - iLen; i++)
                    strKey += "X";
            }
            return strKey;
        }

        /// <summary>
        /// decrypts an encrypted string using password key
        /// </summary>
        /// <param name="strText"></param>
        /// <param name="strKey"></param>
        /// <returns></returns>
        public static string Decrypt(string strText)
        {
            try
            {
                // create encryptor
                byte[] szEncoded = Convert.FromBase64String(strText);
                byte[] szKey = Encoding.ASCII.GetBytes(GetKey().ToCharArray());
                byte[] szText = new byte[szEncoded.Length];

                // create decryptor
                RijndaelManaged objRijndael = new RijndaelManaged();
                MemoryStream memStream = new MemoryStream(szEncoded);
                CryptoStream cryStream = new CryptoStream(memStream, objRijndael.CreateDecryptor(szKey, szIV), CryptoStreamMode.Read);
                int iLen = cryStream.Read(szText, 0, szText.Length);
                
                // close decryptor 
                memStream.Close();
                cryStream.Close();

                // return decrypted string
                return Encoding.UTF8.GetString(szText, 0, iLen);
            }
            catch { }
            return strText;
        }
    }
}

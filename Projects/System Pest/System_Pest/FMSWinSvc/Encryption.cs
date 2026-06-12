using System;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Management;

namespace FMSWinSvc
{
    public class Encryption
    {
        /// <summary>
        /// encrypts string using password key
        /// </summary>
        /// <param name="strText"></param>
        /// <param name="strKey"></param>
        /// <returns></returns>
        public static string Encrypt(string strText, string strKey)
        {
            try
            {
                // initialize password
                RijndaelManaged aes128 = new RijndaelManaged();
                aes128.KeySize = 128;
                aes128.BlockSize = 128;
                aes128.Padding = PaddingMode.None;
                aes128.Mode = CipherMode.ECB;

                // create encryptor
                ICryptoTransform encryptor = aes128.CreateEncryptor(Encoding.ASCII.GetBytes(strKey), null);
                MemoryStream memStream = new MemoryStream();
                CryptoStream cryStream = new CryptoStream(memStream, encryptor, CryptoStreamMode.Write);
                using (StreamWriter fWriter = new StreamWriter(cryStream))
                {
                    // encrypt text
                    fWriter.Write(strText);
                    fWriter.Flush();
                    cryStream.FlushFinalBlock();
                    byte[] szEncrypted = memStream.ToArray();
                    memStream.Close();
                    return Convert.ToBase64String(szEncrypted);
                }
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("Encryption.Encrypt", ex.Message);
            }
            return "";
        }
        
        /// <summary>
        /// decrypts string using password key
        /// </summary>
        /// <param name="szData"></param>
        /// <param name="strKey"></param>
        /// <returns></returns>
        public static string Decrypt(byte[] szData, string strKey, bool bHex)
        {
            try
            {
                // initialize decryptor
                RijndaelManaged aes128 = new RijndaelManaged();
                aes128.KeySize = 128;
                aes128.BlockSize = 128;
                aes128.Padding = PaddingMode.None;
                aes128.Mode = CipherMode.ECB;
                                
                // decrypt text
                ICryptoTransform transform = aes128.CreateDecryptor(Encoding.ASCII.GetBytes(strKey), null);
                byte[] szDecrypt = transform.TransformFinalBlock(szData, 0, szData.Length);
                return (bHex ? szDecrypt.ToHexString() : Encoding.ASCII.GetString(szDecrypt));
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("Encryption.Decrypt", ex.Message);
            }
            return "";
        }
    }

    /// <summary>
    /// class extensions
    /// </summary>
    static class Extensions
    {
        /// <summary>
        /// convert byte array to hex string
        /// </summary>
        /// <param name="szBuffer"></param>
        /// <returns></returns>
        public static string ToHexString(this byte[] szBuffer)
        {
            // convert bytes to hex string
            string strText = "";
            for (int i = 0; i < szBuffer.Length; i++)
                strText += String.Format("{0:X2}", szBuffer[i]);
            return strText;
        }
    }
}

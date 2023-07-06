using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PE2_Group_Assg.Database
{
    public class Database
    {
        public static string getConnectionString()
        {
            string ip_address = "192.168.0.179,49170";
            string connectionString = "Data Source=" + ip_address + "; Initial Catalog=CampusTrade; Integrated Security=True; User ID=admin; Password=admin";

            return connectionString;
        }

        public static string HashString(string text, string salt = "")
        {
            if (String.IsNullOrEmpty(text))
            {
                return String.Empty;
            }

            // Uses SHA256 to create the hash
            using (var sha = new System.Security.Cryptography.SHA256Managed())
            {
                // Convert the string to a byte array first, to be processed
                byte[] textBytes = System.Text.Encoding.UTF8.GetBytes(text + salt);
                byte[] hashBytes = sha.ComputeHash(textBytes);

                // Convert back to a string, removing the '-' that BitConverter adds
                string hash = BitConverter
                    .ToString(hashBytes)
                    .Replace("-", String.Empty);

                return hash;
            }
        }

        public static string Base64Encode (string text)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes (text);
            return System.Convert.ToBase64String(plainTextBytes);
        }

        public static string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }

    }

    
}
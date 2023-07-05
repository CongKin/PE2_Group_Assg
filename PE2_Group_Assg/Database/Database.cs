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
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PE2_Group_Assg.Database.Model
{
    public class model_user
    {
        public int userId { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public bool gender { get; set; } // false = female, true=male
        public DateTime date_of_birth { get; set; }


    }
}
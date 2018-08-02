using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

/*****************************************************************
 Purpose        :   To Create Connection String... its a singleton class
 *****************************************************************/

namespace Compass.DAL
{
    public class DBConnection
    {
        private static string ConStr = ConfigurationManager.AppSettings["sConn"];

        private DBConnection() { }

        public static string Connection
        {
            get { return ConStr; }
        }
    }
      

}







using Compass.DAL;
using CompassBE.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Compass.BAL
{
    public class UsersBAL
    {
        UserDAL userDAL;
        public UsersBAL()
        {
            userDAL = new UserDAL();
        }
        public DataSet UserLogins(UserLogin usr)
        {

            try
            {
                DataSet ds = userDAL.UserLogins(usr);
                return ds;
            }
            catch (Exception ex)
            {
                //   GeneralFuntions.WriteErrorToLog("Handler_SR_Presales", "InsertIntoSysRequests", DateTime.Now, 5, squery, ex.Message + "\n-------\n" + ex.StackTrace);
                return null;
            }
        }
    }
}

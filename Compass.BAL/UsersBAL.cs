using Compass.DAL;
using CompassBE.Models;
using CompassBE.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utility.Password;

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

                if (ds == null && ds.Tables.Count <= 0)
                    return null;

                //check password
                var chkPwd = PasswordManager.ValidatePassword(usr.Password, new HashObject { Hash = ds.Tables[0].Rows[0]["Hash"].ToString(), Salt = ds.Tables[0].Rows[0]["Salt"].ToString() });

                if (!chkPwd)
                    return null;
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

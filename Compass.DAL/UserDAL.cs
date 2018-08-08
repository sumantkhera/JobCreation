using CompassBE.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Compass.DAL
{
    public class UserDAL
    {
        public DataSet UserLogins(UserLogin usr)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlParameter[] param =
                            {     new SqlParameter("@username", usr.Username)
                            };

                 ds = SqlHelper.ExecuteDataset(DBConnection.Connection.ToString(), CommandType.StoredProcedure, "spLogin", param);
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

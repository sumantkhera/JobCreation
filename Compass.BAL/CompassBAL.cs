using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Compass.DAL;
using CompassBE;

namespace Compass.BAL
{
    public class CompassBAL
    {
        CompassDAL compassDAL;
        public CompassBAL()
        {
             compassDAL = new CompassDAL();
        }

        public DataTable GetJobTypeBAL()
        {
            DataTable dt = new DataTable();            
            try
            {
                dt = compassDAL.GetJobTypeDAL();
            }
            catch (Exception ex)
            {
               
            }
            return dt;
        }

        public DataTable GetPriorityBAL()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = compassDAL.GetPriorityDAL();
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        public List<JobTypeBE> GetJobDetailsBAL(JobTypeBE objJobTypeBE)
        {
            List<JobTypeBE> JobTypeBEList = new List<JobTypeBE>();

            try
            {
                CompassDAL objCompassDAL = new CompassDAL();

                JobTypeBEList = objCompassDAL.GetJobDetailsDAL(objJobTypeBE);

                objCompassDAL = null;
            }
            catch (Exception ex)
            {
                
            }
            finally { }
            return JobTypeBEList;
        }
    }
}

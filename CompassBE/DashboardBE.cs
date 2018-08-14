using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompassBE
{
    public class DashboardBE
    {
        public string Action { get; set; }
        public string Status { get; set; }
        public int PO { get; set; }
        public int MerchandiseTransfer { get; set; }
        public int WeekelyCashReport { get; set; }
        public int Other { get; set; }

        public string DepartmentName { get; set; }
        public int EmployeeHired { get; set; }

        public CompassBE.jobFiltersBE jobFilters { get; set; }
    }
}

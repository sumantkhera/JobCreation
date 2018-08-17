using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompassBE.ViewModel
{
    public class JobCountByType
    {
        public string Type { get; set; }
        public int TypeId { get; set; }
        public int Count { get; set; }
        public string Status { get; set; }
        public int StatusId { get; set; }
    }

    public class StatusCount {
        public string Status { get; set; }
        public int Count { get; set; }
    }

    public class JobStatusChart {
        public string Name { get; set; }
        public List<StatusCount> StatusCount { get; set; }
    }
}

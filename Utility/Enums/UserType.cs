using System;
using System.Collections.Generic;
using System.Linq;

namespace Utility.Enums
{
    public class UserType
    {
        public enum Enum
        {
            HO=1,
            BRANCH,
            DM,
            PM,
            QA,
            QAHEAD,
            MEMBER
        }

        public static string Name(int id)
        {
            return Name((Enum)id);
        }

        public static string Name(Enum id)
        {
            switch (id)
            {
                case Enum.HO:
                    return "Head Office";
                case Enum.BRANCH:
                    return "Branch";
                case Enum.DM:
                    return "DM";
                case Enum.PM:
                    return "PM";
                case Enum.QA:
                    return "QA";
                case Enum.QAHEAD:
                    return "QA Head";
                case Enum.MEMBER:
                    return "Team Member";                
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }        
    }
}

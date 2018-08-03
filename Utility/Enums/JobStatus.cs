using System;
namespace Utility.Enums
{
    public enum JobStatus
    {
        Received=1,
        InProgress,
        EntryComplete,
        QAInProgress,
        QAComplete,
        Complete,
        Waiting,
        CorrectionsNeeded,
        CorrectionInProgress,
        Created
    }
}

using FMSWebApi.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Services
{

    #region Queue Infrastructure
    public class PdfJob
    {
        public MaintenanceJobInfo JobInfo { get; set; }
    }

    public static class PdfJobQueue
    {
        private static readonly ConcurrentQueue<PdfJob> _queue = new ConcurrentQueue<PdfJob>();

        public static void Enqueue(PdfJob job) => _queue.Enqueue(job);

        public static bool TryDequeue(out PdfJob job) => _queue.TryDequeue(out job);

        public static int Count => _queue.Count;
    }
    #endregion
}

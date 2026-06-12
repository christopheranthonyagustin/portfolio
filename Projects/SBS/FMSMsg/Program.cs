using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;

namespace FMSMsg
{
    /// <summary>
    /// initialize program
    /// </summary>
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
#if DEBUG 
            // run service as executable
            Service1 svc1 = new Service1();
            svc1.RunService();
            Thread.Sleep(Timeout.Infinite);

#else

            // run windows service
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[] { new Service1() };
            ServiceBase.Run(ServicesToRun);
#endif
        }
    }
}

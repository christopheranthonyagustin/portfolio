using System;
using System.Collections.Generic;
using System.Text;

namespace ShopifyLarkTracker.Services;
public class LastSyncService
{
    private const string FileName =
        "lastsync.txt";

    public DateTime GetLastSync()
    {
        if (!File.Exists(FileName))
        {
            return DateTime.UtcNow
                .AddDays(-30);
        }

        var text =
            File.ReadAllText(FileName);

        if (DateTime.TryParse(
                text,
                out var result))
        {
            return result;
        }

        return DateTime.UtcNow
            .AddDays(-30);
    }

    public void SaveLastSync(
        DateTime date)
    {
        File.WriteAllText(
            FileName,
            date.ToString("O"));
    }
}

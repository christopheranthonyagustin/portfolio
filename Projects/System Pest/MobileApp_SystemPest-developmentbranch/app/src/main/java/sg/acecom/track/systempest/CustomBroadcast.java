package sg.acecom.track.systempest;


import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

public class CustomBroadcast extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Log.e("CustomBroadcast","In customBroadcast");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            context.startForegroundService(new Intent(context, CustomService.class));
        } else {
            context.startService(new Intent(context, CustomService.class));
        }
    }
}
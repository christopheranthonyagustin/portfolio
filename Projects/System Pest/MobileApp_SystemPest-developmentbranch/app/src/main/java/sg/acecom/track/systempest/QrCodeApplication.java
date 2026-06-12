package sg.acecom.track.systempest;

import android.app.Application;
import android.content.Context;

/**
 * Created by xingli on 02/07/2017.
 */

public class QrCodeApplication extends Application {

    public static Context sAppContext;

    @Override
    public void onCreate() {
        super.onCreate();
        sAppContext = this;
    }
}

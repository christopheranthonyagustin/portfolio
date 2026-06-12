package sg.acecom.track.systempest;

import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

/**
 * Created by jmingl on 5/3/18.
 */

public class SplashActivity extends AppCompatActivity{

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        initMainActivity();
    }

    private void initMainActivity(){
        Intent i = new Intent(SplashActivity.this, FirstTimeIMEIActivity.class);
        startActivity(i);
        // close this activity
        finish();
    }
}

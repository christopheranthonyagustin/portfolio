package sg.acecom.track.systempest;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import sg.acecom.track.systempest.util.MyPreferences;

import android.Manifest;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.text.Html;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class FirstTimeIMEIActivity extends AppCompatActivity implements View.OnClickListener {

    EditText txtIMEI;
    Button btnSubmit;


    MyPreferences pref;

    TextView lblversion;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        pref = new MyPreferences(this);
        setContentView(R.layout.activity_first_time_imei);
        if(pref.getPreferences("firsttimeimei","").length() > 0) {
            Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
            startActivity(intent);
            finish();
        } else {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {

                pref.removePreferences("firsttimeimei");

                txtIMEI = findViewById(R.id.etIMEI);
                btnSubmit = findViewById(R.id.buttonSubmit);
                lblversion = findViewById(R.id.textVersion);

                btnSubmit.setOnClickListener(this);

                lblversion.setText("Version : " + getVersionInfo());
            } else{
                if (ActivityCompat.checkSelfPermission(FirstTimeIMEIActivity.this, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED){
                    ActivityCompat.requestPermissions(FirstTimeIMEIActivity.this, new String[]{Manifest.permission.READ_PHONE_STATE},1);
                    //recreate();
                } else{
                    pref.savePreferences("firsttimeimei",getDeviceIMEI());
                    Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
                    startActivity(intent);
                    finish();
                }
            }

        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        if (requestCode == 1) {
            for (int i = 0; i < permissions.length; i++) {
                String permission = permissions[i];
                int grantResult = grantResults[i];

                if (permission.equals(Manifest.permission.READ_PHONE_STATE)) {
                    if (grantResult == PackageManager.PERMISSION_GRANTED) {
                        recreate();
                    } else {
                        requestPermissions(new String[]{Manifest.permission.READ_PHONE_STATE}, 1);
                    }
                }
            }
        }
    }

    @Override
    public void onClick(View v) {
        switch(v.getId())
        {
            case (R.id.buttonSubmit):
                AlertDialog.Builder alert_dialog = new AlertDialog.Builder(this);
                //alert_dialog.setCancelable(true);
                alert_dialog.setTitle("Submit");
                alert_dialog.setMessage("You are not able to edit IMEI after submit. Confirm to submit?");
                alert_dialog.setPositiveButton(Html.fromHtml("<font color='#106B88'>Yes</font>"), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        pref.savePreferences("firsttimeimei", txtIMEI.getText().toString());
                        Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
                        startActivity(intent);
                        finish();
                        dialog.dismiss();
                    }
                });
                alert_dialog.setNegativeButton(Html.fromHtml("<font color='#106B88'>No</font>"), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
                alert_dialog.show();
                break;

        }
    }

    public String getVersionInfo() {
        String strVersion = "";

        PackageInfo packageInfo;
        try {
            packageInfo = getApplicationContext()
                    .getPackageManager()
                    .getPackageInfo(
                            getApplicationContext().getPackageName(),
                            0
                    );
            strVersion += packageInfo.versionName;
        } catch (PackageManager.NameNotFoundException e) {
            strVersion += "Unknown ";
        }

        return strVersion;
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private String getDeviceIMEI() {
        TelephonyManager telephonyManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);

        return telephonyManager.getDeviceId();

    }

}

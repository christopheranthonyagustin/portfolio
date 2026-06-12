package sg.acecom.track.systempest;

import android.Manifest;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DownloadManager;
import android.app.PendingIntent;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.IntentSender;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.hardware.biometrics.BiometricManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.PowerManager;
import android.os.StrictMode;
import android.provider.Settings;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.text.Html;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.androidquery.AQuery;
import com.androidquery.callback.AjaxCallback;
import com.androidquery.callback.AjaxStatus;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResult;
import com.google.android.gms.location.LocationSettingsStatusCodes;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.MultiplePermissionsReport;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.multi.MultiplePermissionsListener;

import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.List;

import androidx.core.app.ActivityCompat;
import androidx.core.content.FileProvider;
import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.IMEI;
import sg.acecom.track.systempest.util.Keccak;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 5/3/18.
 */

public class LoginActivity extends AppCompatActivity implements View.OnClickListener{

    private static final String ACTION_INSTALL_COMPLETE = "sg.acecom.track.systempest.INSTALL_COMPLETE";
    MyPreferences pref = new MyPreferences(this);
    IMEI imei;
    EditText etUserName;
    EditText etUserPassword;
    TextView textVersion;
    CheckBox checkboxSaveLogin;
    Button buttonLogin;
    ProgressDialog nDialog;
    private Boolean saveLogin;
    AlertDialog.Builder alert_dialog;
    private static String file_url = AppConstant.download_endpoint_url + "app-debug.apk";
    public static final int progress_bar_type = 0;
    ProgressDialog pDialog;

    Integer selectedId;

    String selectedName;

    Spinner spinCompanyName;

    ArrayAdapter<String> adapter;

    List<Integer> companyId = new ArrayList();

    List<String> companyName = new ArrayList();

    Uri uri;

    protected static final int REQUEST_CHECK_SETTINGS = 0x1;
    private static final int PERMISSION_CALLBACK_CONSTANT = 100;
    private static final int REQUEST_PERMISSION_SETTING = 101;
    private static final int BATTERY_REQUEST = 1;

    public final Integer LOGIN_PASSWORD_SETUP_RESULT = 998;
    public final Integer LOGIN_PASSWORD_RESULT = 999;

    String[] permissionsRequired = new String[]{
            Manifest.permission.INTERNET,
            Manifest.permission.READ_PHONE_STATE,
            Manifest.permission.ACCESS_NETWORK_STATE,
            Manifest.permission.ACCESS_FINE_LOCATION,
            Manifest.permission.ACCESS_COARSE_LOCATION,
            Manifest.permission.WRITE_EXTERNAL_STORAGE,
            Manifest.permission.CAMERA,
            Manifest.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
            Manifest.permission.ACCESS_BACKGROUND_LOCATION
    };

    private SharedPreferences permissionStatus;
    private boolean sentToSettings = false;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if(Build.VERSION.SDK_INT>=24){
            try{
                Method m = StrictMode.class.getMethod("disableDeathOnFileUriExposure");
                m.invoke(null);
            }catch(Exception e){
                e.printStackTrace();
            }
        }

        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);

        setContentView(R.layout.activity_login);
        imei = new IMEI(this);
        nDialog = new ProgressDialog(LoginActivity.this);
        pDialog = new ProgressDialog(this);
        alert_dialog = new AlertDialog.Builder(this);
        etUserName = findViewById(R.id.etUserName);
        etUserPassword = findViewById(R.id.etUserPassword);
        checkboxSaveLogin = findViewById(R.id.checkboxSaveLogin);
        buttonLogin = findViewById(R.id.buttonLogin);
        textVersion = findViewById(R.id.textVersion);

        permissionStatus = getSharedPreferences("permissionStatus", MODE_PRIVATE);

        spinCompanyName = (Spinner) findViewById(R.id.spinCompanyName);
        buttonLogin.setOnClickListener(this);

        getCompanyName(AppConstant.endpoint_url + "companyinfo", 0);

        adapter = new ArrayAdapter<String>(getBaseContext(),android.R.layout.simple_spinner_dropdown_item,companyName);
        spinCompanyName.setAdapter(adapter);

        spinCompanyName.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String str = spinCompanyName.getItemAtPosition(position).toString();

                selectedId = Integer.valueOf(position);
                selectedName = str;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        Log.e("FILE FOLDER",getExternalFilesDir("apk") + "/SystemPest.apk");
        displayLocationSettingsRequest(LoginActivity.this);
        checkVersion();

        if(!pref.getPreferences("isRunInBackground","").equals("true")){
            dialogBatterySetting();
        } else{
        }

        ignoreBatteryOptimization();
        permissionCheck();

        textVersion.setText("Version : " + getVersionInfo());

        saveLogin = pref.getPreferencesBoolean("saveLogin", false);
        if (saveLogin == true) {
            etUserName.setText(pref.getPreferences("username",""));
            etUserPassword.setText(pref.getPreferences("password",""));
            checkboxSaveLogin.setChecked(true);
        }
    }

    public void dialogBatterySetting() {
        alert_dialog = new AlertDialog.Builder(this);
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle("Allow App Run In Background");
        alert_dialog.setMessage("Please allow app run in background.\nIf allowed, please select Already Enabled, else Go To Settings\nDisallow of app run in background might affect the performance of the app.");
        alert_dialog.setNegativeButton(Html.fromHtml("<font color='#106B88'>Already Enabled</font>"), new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                pref.savePreferences("isRunInBackground","true");
                dialog.dismiss();
            }
        });
        alert_dialog.setPositiveButton(Html.fromHtml("<font color='#106B88'>Go To Settings</font>"), new DialogInterface.OnClickListener() {
            @Override
            public void onClick(final DialogInterface dialog, int which) {
                pDialog.setMessage("Loading");
                //showDialog();
                goSettings();
                dialog.dismiss();
            }
        });
        alert_dialog.show();
    }



    private void showActivity(@NonNull String packageName, @NonNull String activityDir) {
        Intent intent = new Intent();
        intent.setComponent(new ComponentName(packageName, activityDir));
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(intent);
    }

    private void goSettings() {
        try {
            Intent intent = new Intent();
            String manufacturer = android.os.Build.MANUFACTURER;
            Toast.makeText(this,manufacturer,Toast.LENGTH_SHORT).show();
            if ("xiaomi".equalsIgnoreCase(manufacturer)) {
                try {
                    showActivity("com.miui.securitycenter",
                            "com.miui.permcenter.autostart.AutoStartManagementActivity");
                } catch (Exception e) {
                    Toast.makeText(this,"Please allow app to run in background manually", Toast.LENGTH_SHORT).show();
                }
            } else if ("oppo".equalsIgnoreCase(manufacturer)) {
                try {
                    showActivity("com.coloros.safecenter", "com.coloros.safecenter.startupapp.StartupAppListActivity");
                } catch (Exception e) {
                    Toast.makeText(this,"Please allow app to run in background manually", Toast.LENGTH_SHORT).show();
                }

            } else if ("vivo".equalsIgnoreCase(manufacturer)) {
                try {
                    showActivity("com.vivo.permissionmanager", "com.vivo.permissionmanager.activity.BgStartUpManagerActivity");
                } catch (Exception e) {
                    Toast.makeText(this,"Please allow app to run in background manually", Toast.LENGTH_SHORT).show();
                }
            } else if ("Letv".equalsIgnoreCase(manufacturer)) {
                try {
                    showActivity("com.letv.android.letvsafe", "com.letv.android.letvsafe.AutobootManageActivity");
                } catch (Exception e) {
                    Toast.makeText(this,"Please allow app to run in background manually", Toast.LENGTH_SHORT).show();
                }
            } else if ("Honor".equalsIgnoreCase(manufacturer)) {
                try {
                    showActivity("com.huawei.systemmanager",
                            "com.huawei.systemmanager.optimize.process.ProtectActivity");
                } catch (Exception e) {
                    Toast.makeText(this,"Please allow app to run in background manually", Toast.LENGTH_SHORT).show();
                    //showActivity("com.huawei.systemmanager","com.huawei.systemmanager.optimize.bootstart.BootStartActivity");
                }
            } else if ("Huawei".equalsIgnoreCase(manufacturer)){
                try {
                    showActivity("com.huawei.systemmanager",
                            "com.huawei.systemmanager.startupmgr.ui.StartupNormalAppListActivity");
                } catch (Exception e) {
                    Toast.makeText(this,"Please allow app to run in background manually", Toast.LENGTH_SHORT).show();
                    showActivity("com.huawei.systemmanager",
                            "com.huawei.systemmanager.optimize.bootstart.BootStartActivity");
                }
            }

//            List<ResolveInfo> list = getPackageManager().queryIntentActivities(intent, PackageManager.MATCH_DEFAULT_ONLY);
//            if  (list.size() > 0) {
//                startActivity(intent);
//            }
        } catch (Exception e) {
            Log.e("exc" , String.valueOf(e));
        }
    }


    private void displayLocationSettingsRequest(Context context) {
        GoogleApiClient googleApiClient = new GoogleApiClient.Builder(context)
                .addApi(LocationServices.API).build();
        googleApiClient.connect();

        LocationRequest locationRequest = LocationRequest.create();
        locationRequest.setPriority(LocationRequest.PRIORITY_HIGH_ACCURACY);
        locationRequest.setInterval(1000);
        locationRequest.setFastestInterval(1000 / 2);

        LocationSettingsRequest.Builder builder = new LocationSettingsRequest.Builder().addLocationRequest(locationRequest);
        builder.setAlwaysShow(true);

        PendingResult<LocationSettingsResult> result = LocationServices.SettingsApi.checkLocationSettings(googleApiClient, builder.build());
        result.setResultCallback(new ResultCallback<LocationSettingsResult>() {
            @Override
            public void onResult(LocationSettingsResult result) {
                final Status status = result.getStatus();
                switch (status.getStatusCode()) {
                    case LocationSettingsStatusCodes.SUCCESS:
                        break;
                    case LocationSettingsStatusCodes.RESOLUTION_REQUIRED:

                        try {
                            // Show the dialog by calling startResolutionForResult(), and check the result
                            // in onActivityResult().
                            status.startResolutionForResult(LoginActivity.this, REQUEST_CHECK_SETTINGS);
                        } catch (IntentSender.SendIntentException e) {
                        }
                        break;
                    case LocationSettingsStatusCodes.SETTINGS_CHANGE_UNAVAILABLE:
                        break;
                }
            }
        });
    }

    private void ignoreBatteryOptimization(){
        Intent intent = new Intent();
        String packageName = this.getPackageName();
        PowerManager pm = (PowerManager) this.getSystemService(Context.POWER_SERVICE);

        if (pm.isIgnoringBatteryOptimizations(packageName)) {
            intent.setClassName(
                    "com.huawei.systemmanager",
                    "com.huawei.systemmanager.optimize.process.ProtectActivity");
            //intent.setClassName("com.coloros.oppoguardelf", "com.coloros.powermanager.fuelgaue.PowerConsumptionActivity");
            //intent.setAction(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS);
            Log.e("PMHERE", "1");
            //startActivity(intent);


        } else {
            //intent.setClassName("com.coloros.oppoguardelf", "com.coloros.powermanager.fuelgaue.PowerConsumptionActivity");
            intent.setAction(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
            intent.setData(Uri.parse("package:" + packageName));
            Log.e("PMHERE","2");
            startActivityForResult(intent, BATTERY_REQUEST);
            //this.startActivity(intent);
        }
    }

    private void loginIgnoreBatteryOptimization(){
        Intent intent = new Intent();
        String packageName = this.getPackageName();
        PowerManager pm = (PowerManager) this.getSystemService(Context.POWER_SERVICE);

        if (pm.isIgnoringBatteryOptimizations(packageName)) {
            //intent.setClassName("com.coloros.oppoguardelf", "com.coloros.powermanager.fuelgaue.PowerConsumptionActivity");
            intent.setAction(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS);
            loginPermissionCheck();
            Log.e("PMHERE", "1");
        } else {
            //intent.setClassName("com.coloros.oppoguardelf", "com.coloros.powermanager.fuelgaue.PowerConsumptionActivity");
            intent.setAction(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
            intent.setData(Uri.parse("package:" + packageName));
            Log.e("PMHERE","2");
            startActivityForResult(intent, BATTERY_REQUEST);
            //this.startActivity(intent);
        }
    }

    private void permissionCheck() {
        if (ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[0]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[1]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[2]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[3]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[4]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[5]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[6]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[7]) != PackageManager.PERMISSION_GRANTED) {
            if (ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[0])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[1])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[2])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[3])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[4])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[5])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[6])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[7])) {
                //Show Information about why you need the permission
                AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
                builder.setTitle("Need Multiple Permissions");
                builder.setMessage("This app needs Camera and Location permissions.");
                builder.setPositiveButton("Grant", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                        ActivityCompat.requestPermissions(LoginActivity.this, permissionsRequired, PERMISSION_CALLBACK_CONSTANT);
                    }
                });
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });
                builder.show();
            } else if (permissionStatus.getBoolean(permissionsRequired[0], false)) {
                //Previously Permission Request was cancelled with 'Dont Ask Again',
                // Redirect to Settings after showing Information about why you need the permission
                AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
                builder.setTitle("Need Multiple Permissions");
                builder.setMessage("This app needs Camera and Location permissions.");
                builder.setPositiveButton("Grant", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                        sentToSettings = true;
                        Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
                        Uri uri = Uri.fromParts("package", getPackageName(), null);
                        intent.setData(uri);
                        startActivityForResult(intent, REQUEST_PERMISSION_SETTING);
                    }
                });
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });
                builder.show();
            } else {
                //just request the permission
                ActivityCompat.requestPermissions(LoginActivity.this, permissionsRequired, PERMISSION_CALLBACK_CONSTANT);
            }

            SharedPreferences.Editor editor = permissionStatus.edit();
            editor.putBoolean(permissionsRequired[0], true);
            editor.commit();
        } else {
            //You already have the permission, just go ahead.
        }
    }

    private void loginPermissionCheck() {
        if (ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[0]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[1]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[2]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[3]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[4]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[5]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[6]) != PackageManager.PERMISSION_GRANTED
                || ActivityCompat.checkSelfPermission(LoginActivity.this, permissionsRequired[7]) != PackageManager.PERMISSION_GRANTED) {
            if (ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[0])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[1])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[2])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[3])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[4])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[5])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[6])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[7])) {
                //Show Information about why you need the permission
                AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
                builder.setTitle("Need Multiple Permissions");
                builder.setMessage("This app needs Camera and Location permissions.");
                builder.setPositiveButton("Grant", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                        ActivityCompat.requestPermissions(LoginActivity.this, permissionsRequired, PERMISSION_CALLBACK_CONSTANT);
                    }
                });
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });
                builder.show();
            } else if (permissionStatus.getBoolean(permissionsRequired[0], false)) {
                //Previously Permission Request was cancelled with 'Dont Ask Again',
                // Redirect to Settings after showing Information about why you need the permission
                AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
                builder.setTitle("Need Multiple Permissions");
                builder.setMessage("This app needs Camera and Location permissions.");
                builder.setPositiveButton("Grant", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                        sentToSettings = true;
                        Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
                        Uri uri = Uri.fromParts("package", getPackageName(), null);
                        intent.setData(uri);
                        startActivityForResult(intent, REQUEST_PERMISSION_SETTING);
                    }
                });
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });
                builder.show();
            } else {
                //just request the permission
                ActivityCompat.requestPermissions(LoginActivity.this, permissionsRequired, PERMISSION_CALLBACK_CONSTANT);
            }

            SharedPreferences.Editor editor = permissionStatus.edit();
            editor.putBoolean(permissionsRequired[0], true);
            editor.commit();
        } else {
            //You already have the permission, just go ahead.
            pDialog.setMessage("Loading");
            showDialog();
            loginCheckVersion();
            //login();
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == PERMISSION_CALLBACK_CONSTANT) {
            //check if all permissions are granted
            boolean allgranted = false;
            for (int i = 0; i < grantResults.length; i++) {
                if (grantResults[i] == PackageManager.PERMISSION_GRANTED) {
                    allgranted = true;
                } else {
                    allgranted = false;
                    break;
                }
            }


            if (allgranted) {

            } else if (ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[0])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[1])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[2])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[3])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[4])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[5])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[6])
                    || ActivityCompat.shouldShowRequestPermissionRationale(LoginActivity.this, permissionsRequired[7])) {
                AlertDialog.Builder builder = new AlertDialog.Builder(LoginActivity.this);
                builder.setTitle("Multiple Permissions Needed");
                builder.setMessage("This app needs stated permissions.");
                builder.setPositiveButton("Grant", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                        ActivityCompat.requestPermissions(LoginActivity.this, permissionsRequired, PERMISSION_CALLBACK_CONSTANT);
                    }
                });
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });
                builder.show();
            } else {
                Toast.makeText(getBaseContext(), "Unable to get Permission", Toast.LENGTH_LONG).show();
            }
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

    @Override
    public void onClick(View v) {

        switch(v.getId()){
            case(R.id.buttonLogin):
                showDialog();
                if (etUserName.getText().length() <= 0 || etUserPassword.getText().length() <= 0) {
                    Toast.makeText(this,"Please fill in username/password and try again.",Toast.LENGTH_SHORT).show();
                } else{
                    loginIgnoreBatteryOptimization();
                    //loginCheckVersion();
                }
                //showDialog();
                //login();
                break;
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        requestPermissions();
    }

    private void getCompanyName(final String urlWebService, int paramInt){
        String url = urlWebService;
        AQuery aq = new AQuery(this);
        //Log.e("COMPANYNAME URL",urlWebService);
        aq.ajax(url, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                //System.out.println("Status = " + status.getMessage());
                if (status.getMessage().equals("OK")) {
                    try {
                        //System.out.println(response.toString());
                        JSONArray json = new JSONArray(response);
                        for(int i = 0; i < json.length();i++){
                            JSONObject jsonobj = json.getJSONObject(i);
                            companyName.add(jsonobj.getString("Name"));
                            companyId.add(jsonobj.getInt("CompanyID"));
                        }
                    } catch (JSONException e) {
                        Log.e("BoosterException :", String.valueOf(e));
                    }
                    adapter = new ArrayAdapter<String>(getBaseContext(),android.R.layout.simple_spinner_dropdown_item,companyName);
                    spinCompanyName.setAdapter(adapter);


                    //boosterPumpAdapter.notifyDataSetChanged();
                } else{
                    System.out.println("Nothing to do");
                }

            }
        }); //End of Aquery
    }

    private void login() {
        String url = AppConstant.endpoint_url + "app";
        JSONObject params = new JSONObject();
        try {
            params.put("Name", etUserName.getText().toString());
            //params.put("Password", sha3(etUserPassword.getText().toString()));
            params.put("Password", sha3(etUserPassword.getText().toString()));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Log.e("Login",params.toString());
        AQuery aq = new AQuery(this);
        aq.post(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                Log.e("LoginResponse",response);
                if (status.getMessage().equals("OK")) {
                    try
                    {
                        //Log.e("Response : ", response);
                        JSONObject json = new JSONObject(response);
                        String error_message = json.getString("ErrorMessage");
                        String driver_id = json.getString("DriverID");
                        String name = json.getString("Name");
                        String password = json.getString("Password");
                        String address = json.getString("Address");
                        String email = json.getString("Email");
                        String phone = json.getString("Phone");
                        String company_id = json.getString("CompanyID");
                        String company_name = json.getString("Company");
                        String reseller_id = json.getString("ResellerID");

                        if(error_message.equals("null"))
                        {
                            pref.savePreferences("driver_id",driver_id);
                            pref.savePreferences("driver_password",etUserPassword.getText().toString());
                            pref.savePreferences("driver_name",name);
                            pref.savePreferences("driver_address",address);
                            pref.savePreferences("driver_company",company_name);
                            pref.savePreferences("driver_email", email);
                            pref.savePreferences("driver_phone", phone);
                            pref.savePreferences("driver_reseller_id", reseller_id);

                            if(company_id == "2") {
                                pref.savePreferences("driver_company_id", company_id);
                                if (company_id == companyId.get(selectedId.intValue()).toString()) {
                                    getAsset();
                                } else {
                                    nDialog.dismiss();
                                    Toast.makeText(LoginActivity.this, "Wrong company selected", Toast.LENGTH_SHORT).show();
                                }
                            } else{
                                pref.savePreferences("driver_company_id", companyId.get(selectedId.intValue()).toString());
                                if(companyId.get(selectedId.intValue()).toString() == "2"){
                                    nDialog.dismiss();
                                    Toast.makeText(LoginActivity.this, "Wrong company selected", Toast.LENGTH_SHORT).show();
                                } else{
                                    getAsset();
                                }
                            }
                        }
                        else
                        {
                            nDialog.dismiss();
                            Toast.makeText(LoginActivity.this, "Invalid Username or Password", Toast.LENGTH_SHORT).show();
                        }

                    }
                    catch (JSONException e) {
                        //Failed login
                        nDialog.dismiss();
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        Log.e("Login Exception :", String.valueOf(e));
                    }
                } else {
                    nDialog.dismiss();
                    showErrorDialog("Login 1 Error : ", "No Internet Connection...");
                    //No Connection
                }
            }
        });
    }

    private void getAsset() {
        String getAssetUrl = AppConstant.endpoint_url + "getasset";
        JSONObject params = new JSONObject();
        try {
            params.put("Tag", getIMEI());
            params.put("DriverID", pref.getPreferences("driver_id", ""));
            params.put("CompanyID", pref.getPreferences("driver_company_id", ""));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Log.e("GETASSET",params.toString());
        AQuery aq = new AQuery(this);
        aq.post(getAssetUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                Log.e("response",params.toString());
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);
                        String assets_id = json.getString("AssetID");
                        String company_id = json.getString("CompanyID");
                        //pref.savePreferences("driver_company_id", company_id);

                        //Log.e("Company ID : ", pref.getPreferences("driver_company_id",""));

                        getAssetEx();

                    } catch (JSONException e) {
                        e.printStackTrace();
                        nDialog.dismiss();
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        Log.e("GetAsset Exception", String.valueOf(e));
                    }
                } else {
                    nDialog.dismiss();
                    //hideDialog();
                    showErrorDialog("Login 2 Error : ", "No Internet Connection...");
                    //Exit
                }
            }
        });
    }

    private void countDriver(){

        String getAssetUrl = AppConstant.endpoint_url + "countdriver";

        JSONObject params = new JSONObject();
        try {
            params.put("Name", etUserName.getText().toString());
            params.put("Password", sha3(etUserPassword.getText().toString()));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Log.e("COUNTDRIVER",params.toString());
        AQuery aq = new AQuery(this);
        aq.post(getAssetUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                Log.e("countdriverresponse",params.toString());
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);
                        String error_message = json.getString("ErrorMessage");
                        if (!error_message.equals("null")) {
                            nDialog.dismiss();
                            postDuplicatedAsset();
                            showErrorDialog("Login Error 2: ", error_message);
                            Log.e("Countdriver Error", error_message);
                        } else {
                            saveLoginEvents();
                        }
                    } catch (JSONException e) {
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        nDialog.dismiss();
                    }

                } else {
                    showErrorDialog("Login Error : ", "No Internet Connection...");
                    nDialog.dismiss();
                }
            }
        });
    }

    private void getAssetEx() {
        String getAssetExUrl = AppConstant.endpoint_url + "getassetex";
        JSONObject params = new JSONObject();
        try {
            params.put("Tag", getIMEI());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Log.e("GETASSETEX",params.toString());
        AQuery aq = new AQuery(this);
        aq.post(getAssetExUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                Log.e("Response",response.toString());
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);
                        String error_message = json.getString("ErrorMessage");
                        String tag = json.getString("Tag");
                        if(error_message.equals("null")) {
                            if (tag.equals(getIMEI())) {
                                String assets_id = json.getString("AssetID");
                                pref.savePreferences("driver_assets_id", assets_id);
                                pref.savePreferences("driver_tag", getIMEI());

                                countDriver();
                            } else {
                                nDialog.dismiss();
                                showErrorDialog("Login Error : ", "The IMEI number can't be found, please try again. (Code-LGE002)");
                                Log.e("GetAssetEx", error_message);
                            }
                        } else{
                            nDialog.dismiss();
                            showErrorDialog("Login Error : ", "The IMEI number can't be found, please try again. (Code-LGE001)");
                            Log.e("GetAssetEx", error_message);
                        }

                    } catch (JSONException e) {
                        nDialog.dismiss();
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        Log.e("GetAssetEx Exception", String.valueOf(e));
                    }
                } else {
                    nDialog.dismiss();
                }
            }
        });
    }

    private void saveLoginEvents() {

        String apiEventsUrl = AppConstant.endpoint_url + "savelogin";

        JSONObject params = new JSONObject();
        try {
            params.put("Tag", getIMEI());
            params.put("DriverID", pref.getPreferences("driver_id", ""));
            params.put("Driver", pref.getPreferences("driver_name", ""));
        } catch (JSONException e) {
            e.printStackTrace();
        }

        AQuery aq = new AQuery(this);
        aq.post(apiEventsUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                System.out.println("Response = " + response);
                System.out.println("Status = " + status.getMessage());
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);

                        if (checkboxSaveLogin.isChecked()) {
                            pref.savePreferences("username", etUserName.getText().toString());
                            pref.savePreferences("password", etUserPassword.getText().toString());
                            pref.savePreferencesBoolean("saveLogin", true);
                        } else {
                            pref.removePreferences("username");
                            pref.removePreferences("password");
                            pref.removePreferences("saveLogin");
                        }

                        pref.savePreferences("session_login", "true");
                        pref.savePreferences("session_user_name", etUserName.getText().toString());
                        pref.savePreferences("session_user_password", etUserPassword.getText().toString());

                        nDialog.dismiss();

                        Intent intent = new Intent(LoginActivity.this,MainActivity.class);
                        startActivity(intent);
                        finish();

                    } catch (JSONException e) {
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        nDialog.dismiss();
                    }
                } else {
                    showErrorDialog("Login 5 Error : ", "No Internet Connection...");
                    nDialog.dismiss();
                }
            }
        });
    }

    private void sessionGetAsset() {
        String getAssetUrl = AppConstant.endpoint_url + "getasset";
        JSONObject params = new JSONObject();
        try {
            params.put("Tag", getIMEI());
            params.put("DriverID", pref.getPreferences("driver_id", ""));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        AQuery aq = new AQuery(this);
        aq.post(getAssetUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);
                        String assets_id = json.getString("AssetID");
                        String company_id = json.getString("CompanyID");
                        //pref.savePreferences("driver_company_id", company_id);

                        //Log.e("Company ID : ", pref.getPreferences("driver_company_id",""));

                        sessionGetAssetEx();

                    } catch (JSONException e) {
                        e.printStackTrace();
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        nDialog.dismiss();
                        Log.e("GetAsset Exception", String.valueOf(e));
                    }
                } else {
                    nDialog.dismiss();
                    showErrorDialog("Login Error : ", "No Internet Connection...");
                    //hideDialog();
                    //Exit
                }
            }
        });
    }

    private void sessionGetAssetEx() {
        String getAssetExUrl = AppConstant.endpoint_url + "getassetex";
        JSONObject params = new JSONObject();
        try {
            params.put("Tag", getIMEI());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Log.e("PARAMS",params.toString());
        AQuery aq = new AQuery(this);
        aq.post(getAssetExUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);
                        String error_message = json.getString("ErrorMessage");
                        String tag = json.getString("Tag");
                        if (tag.equals(getIMEI())) {
                            String assets_id = json.getString("AssetID");
                            String company_id = json.getString("CompanyID");
                            pref.savePreferences("driver_assets_id",assets_id);
                            //Log.e("Asset_id", assets_id);
                            //Log.e("Company_id", company_id);

                            sessionCountDriver();
                        } else {
                            nDialog.dismiss();
                            showErrorDialog("Login Error : ", error_message);
                            Log.e("GetAssetEx", error_message);
                        }

                    } catch (JSONException e) {
                        nDialog.dismiss();
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        Log.e("GetAssetEx Exception", String.valueOf(e));
                    }
                } else {
                    showErrorDialog("Login Error : ", "No Internet Connection...");
                    nDialog.dismiss();
                }
            }
        });
    }

    private void sessionLogin() {
        String url = AppConstant.endpoint_url + "app";
        JSONObject params = new JSONObject();
        try {
            params.put("Name", pref.getPreferences("session_user_name",""));
            params.put("Password", sha3(pref.getPreferences("session_user_password","")));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        AQuery aq = new AQuery(this);
        aq.post(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                if (status.getMessage().equals("OK")) {
                    try
                    {
                        JSONObject json = new JSONObject(response);
                        String error_message = json.getString("ErrorMessage");
                        String driver_id = json.getString("DriverID");
                        String name = json.getString("Name");
                        String password = json.getString("Password");
                        String address = json.getString("Address");
                        String email = json.getString("Email");
                        String phone = json.getString("Phone");
                        String company_id = json.getString("CompanyID");
                        String company_name = json.getString("Company");
                        String reseller_id = json.getString("ResellerID");

                        if(error_message.equals("null"))
                        {
                            pref.savePreferences("driver_id",driver_id);
                            pref.savePreferences("driver_password",etUserPassword.getText().toString());
                            pref.savePreferences("driver_name",name);
                            pref.savePreferences("driver_address",address);
                            pref.savePreferences("driver_company",company_name);
                            pref.savePreferences("driver_email", email);
                            pref.savePreferences("driver_phone", phone);
                            pref.savePreferences("driver_company_id", company_id);
                            pref.savePreferences("driver_reseller_id", reseller_id);

                            //pref.savePreferences("driver_company_id", String.valueOf(AppConstant.jds_company_id));
                            //Log.e("driver id", pref.getPreferences("driver_id",""));
                            sessionGetAsset();

                        }
                        else
                        {
                            nDialog.dismiss();
                            Toast.makeText(LoginActivity.this, "Invalid Username or Password", Toast.LENGTH_SHORT).show();
                        }

                    }
                    catch (JSONException e) {
                        //Failed login
                        nDialog.dismiss();
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        Log.e("Login Exception :", String.valueOf(e));
                    }
                } else {
                    nDialog.dismiss();
                    showErrorDialog("Auto Login Error : ", "No Internet Connection...");
                    //No Connection
                }
            }
        });
    }

    private void sessionCountDriver(){

        String getAssetUrl = AppConstant.endpoint_url + "countdriver";

        JSONObject params = new JSONObject();
        try {
            params.put("Name", pref.getPreferences("session_username",""));
            params.put("Password", sha3(pref.getPreferences("session_password","")));
        } catch (JSONException e) {
            e.printStackTrace();
        }

        AQuery aq = new AQuery(this);
        aq.post(getAssetUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);
                        String error_message = json.getString("ErrorMessage");
                        if (!error_message.equals("null")) {
                            nDialog.dismiss();
                            postDuplicatedAsset();
                            showErrorDialog("Login Error : ", error_message);
                            Log.e("Countdriver Error", error_message);
                        } else {
                            sessionSaveLoginEvents();
                        }
                    } catch (JSONException e) {
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        nDialog.dismiss();
                    }

                } else {
                    showErrorDialog("Login Error : ", "Unable to access to Server...");
                    nDialog.dismiss();
                }
            }
        });
    }

    private void sessionSaveLoginEvents() {

        String apiEventsUrl = AppConstant.endpoint_url + "savelogin";

        JSONObject params = new JSONObject();
        try {
            params.put("Tag", getIMEI());
            params.put("DriverID", pref.getPreferences("driver_id", ""));
            params.put("Driver", pref.getPreferences("driver_name", ""));
        } catch (JSONException e) {
            e.printStackTrace();
        }

        AQuery aq = new AQuery(this);
        aq.post(apiEventsUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);

                        Intent intent = new Intent(LoginActivity.this,MainActivity.class);
                        startActivity(intent);
                        finish();

                    } catch (JSONException e) {
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        nDialog.dismiss();
                    }
                } else {
                    showErrorDialog("Login Error : ", "No Internet Connection...");
                    nDialog.dismiss();
                }
            }
        });
    }

    private static String sha3(final String input) {
        byte[] b = input.getBytes();
        String s = getHexStringByByteArray(b);
        Keccak keccak = new Keccak(1600);
        return keccak.getHash(s, 1088, 32);
    }

    public static String getHexStringByByteArray(byte[] array) {
        if (array == null)
            return null;
        StringBuilder stringBuilder = new StringBuilder(array.length * 2);
        @SuppressWarnings("resource")
        Formatter formatter = new Formatter(stringBuilder);
        for (byte tempByte : array)
            formatter.format("%02x", tempByte);
        return stringBuilder.toString();
    }

    public static final String md5(final String s) {
        try {
            //create md5 has
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(s.getBytes());
            byte messageDigest[] = digest.digest();

            //create hex string
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < messageDigest.length; i++) {
                String h = Integer.toHexString(0xFF & messageDigest[i]);
                while (h.length() < 2)
                    h = "0" + h;
                hexString.append(h);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }

    private String getIMEI(){
        return pref.getPreferences("firsttimeimei","");
    }

    private void showDialog(){
        nDialog.setMessage("Loading..");
        nDialog.setTitle("Please Wait...");
        nDialog.setIndeterminate(false);
        nDialog.setCancelable(true);
        nDialog.show();
    }

    // navigating user to app settings
    private void openSettings() {
        Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
        Uri uri = Uri.fromParts("package", getPackageName(), null);
        intent.setData(uri);
        startActivityForResult(intent, 101);
    }

    private void requestPermissions(){
        Dexter.withActivity(this)
                .withPermissions(
                        Manifest.permission.INTERNET,
                        Manifest.permission.WRITE_EXTERNAL_STORAGE,
                        Manifest.permission.ACCESS_FINE_LOCATION,
                        Manifest.permission.ACCESS_COARSE_LOCATION,
                        Manifest.permission.READ_PHONE_STATE,
                        Manifest.permission.CAMERA,
                        Manifest.permission.READ_EXTERNAL_STORAGE,
                        Manifest.permission.VIBRATE)
                .withListener(new MultiplePermissionsListener() {
                    @Override
                    public void onPermissionsChecked(MultiplePermissionsReport report) {
                        // check if all permissions are granted
                        if (report.areAllPermissionsGranted()) {
                            // do you work now
                        }

                        // check for permanent denial of any permission
                        if (report.isAnyPermissionPermanentlyDenied()) {
                            openSettings();
                            // permission is denied permenantly, navigate user to app settings
                        }
                    }

                    @Override
                    public void onPermissionRationaleShouldBeShown(List<PermissionRequest> permissions, PermissionToken token) {
                        token.continuePermissionRequest();
                    }
                })
                .onSameThread()
                .check();
    }

    private void postDuplicatedAsset() {
        String getAssetUrl = AppConstant.endpoint_url + "getasset";
        JSONObject params = new JSONObject();
        try {
            params.put("Tag", imei.getDeviceID());
            params.put("DriverID", 0);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        AQuery aq = new AQuery(this);
        aq.post(getAssetUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);
                        String assets_id = json.getString("AssetID");
                        String company_id = json.getString("CompanyID");



                    } catch (JSONException e) {
                        e.printStackTrace();
                        showErrorDialog("Login Error : ", "Unable to access to Server...");
                        Log.e("GetAsset Exception", String.valueOf(e));
                    }
                } else {
                    //hideDialog();
                    showErrorDialog("Login 3 Error : ", "No Internet Connection...");
                    //Exit
                }
            }
        });
    }

    public void showErrorDialog(String title, String message) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle(title);
        alertDialog.setMessage(message);
        alertDialog.setButton(AlertDialog.BUTTON_NEGATIVE, "OK",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
        alertDialog.show();
    }

    private void checkVersion()
    {
        new Thread() {
            @Override
            public void run() {
                String path = AppConstant.download_endpoint_url + "version.txt";
                URL u = null;
                final ArrayList<String> al=new ArrayList<>();
                try {
                    u = new URL(path);
                    HttpURLConnection c = (HttpURLConnection) u.openConnection();
                    c.setRequestMethod("GET");
                    c.connect();
                    InputStream in = c.getInputStream();
                    BufferedReader r = new BufferedReader(new InputStreamReader(in));
                    String data;
                    while ((data= r.readLine()) != null) {
                        al.add(data);
                    }
                    final ByteArrayOutputStream bo = new ByteArrayOutputStream();
                    byte[] buffer = new byte[1024];
                    in.read(buffer); // Read from Buffer.
                    bo.write(buffer); // Write Into Buffer.
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            String getVersion = al.get(0);;
                            if (!getVersion.equals(getVersionInfo())) {
                                //startService(new Intent(Login.this, DownloadAPKService.class));
                                //showInstallUpdateDialog("Update Available : ", "Current Version : " + getVersionInfo() + "\nLatest Version : " + getVersion);
                                new DownloadFileFromURL().execute(file_url);
                            } else {
                                /*if(pref.getPreferences("session_login","").equals("true")){
                                    sessionLogin();
                                }*/
                                //dlg.showAlert(AppConstant.default_alert_title, "Check getVersionInfo is equal: " + getVersionInfo());
                                //Log.e("Version Check : ","Version is Up-To-Date");
                            }

                            try {

                                bo.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    });

                } catch (MalformedURLException e) {
                    e.printStackTrace();
                } catch (ProtocolException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }.start();
    }

    private void loginCheckVersion()
    {
        new Thread() {
            @Override
            public void run() {
                String path = AppConstant.download_endpoint_url + "version.txt";
                URL u = null;
                final ArrayList<String> al=new ArrayList<>();
                try {
                    u = new URL(path);
                    HttpURLConnection c = (HttpURLConnection) u.openConnection();
                    c.setRequestMethod("GET");
                    c.connect();
                    InputStream in = c.getInputStream();
                    BufferedReader r = new BufferedReader(new InputStreamReader(in));
                    String data;
                    while ((data= r.readLine()) != null) {
                        al.add(data);
                    }
                    final ByteArrayOutputStream bo = new ByteArrayOutputStream();
                    byte[] buffer = new byte[1024];
                    in.read(buffer); // Read from Buffer.
                    bo.write(buffer); // Write Into Buffer.
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            String getVersion = al.get(0);;
                            if (!getVersion.equals(getVersionInfo())) {
                                //startService(new Intent(Login.this, DownloadAPKService.class));
                                //showInstallUpdateDialog("Update Available : ", "Current Version : " + getVersionInfo() + "\nLatest Version : " + getVersion);
                                nDialog.dismiss();
                                new DownloadFileFromURL().execute(file_url);
                            } else {
                                login();
                                /*pDialog.setMessage(getResources().getString(R.string.jds_loading));
                                showDialog();
                                new Handler().postDelayed(new Runnable() {
                                    @Override
                                    public void run() {
                                        login();
                                    }
                                }, 3000);*/
                            }

                            try {

                                bo.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    });

                } catch (MalformedURLException e) {
                    e.printStackTrace();
                } catch (ProtocolException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }.start();
    }

    public void showInstallUpdateDialog(String title, String message) {
        alert_dialog.setCancelable(false);
        alert_dialog.setTitle(title);
        alert_dialog.setMessage(message);
        alert_dialog.setPositiveButton("Update", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                new DownloadFileFromURL().execute(file_url);
            }
        });
        /*alert_dialog.setNegativeButton("Later", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });*/
        alert_dialog.show();
    }

    /**
     * Showing Dialog
     * */
    @Override
    protected Dialog onCreateDialog(int id) {
        switch (id) {
            case progress_bar_type: // we set this to 0
                pDialog = new ProgressDialog(this);
                pDialog.setMessage("Updating Application. Please wait...");
                pDialog.setIndeterminate(false);
                pDialog.setMax(100);
                pDialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
                pDialog.setCancelable(false);
                pDialog.setCanceledOnTouchOutside(false);
                pDialog.show();
                return pDialog;
            default:
                return null;
        }
    }

    /**
     * Background Async Task to download file
     * */
    class DownloadFileFromURL extends AsyncTask<String, String, String> {

        /**
         * Before starting background thread
         * Show Progress Bar Dialog
         * */
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            showDialog(progress_bar_type);
        }

        /**
         * Downloading file in background thread
         * */
        @Override
        protected String doInBackground(String... f_url) {
            int count;
            try {
                URL url = new URL(f_url[0]);
                URLConnection conection = url.openConnection();
                conection.connect();
                // this will be useful so that you can show a tipical 0-100% progress bar
                int lengthOfFile = conection.getContentLength();

                // download the file
                InputStream input = new BufferedInputStream(url.openStream(), 8192);

                // Output stream
                OutputStream output = new FileOutputStream(getExternalFilesDir("apk") + "/SystemPest.apk");

                byte data[] = new byte[1024];

                long total = 0;

                while ((count = input.read(data)) != -1) {
                    total += count;
                    // publishing the progress....
                    // After this onProgressUpdate will be called
                    publishProgress(""+(int)((total*100)/lengthOfFile));

                    // writing data to file
                    output.write(data, 0, count);
                }

                // flushing output
                output.flush();

                // closing streams
                output.close();
                input.close();

            } catch (Exception e) {
                Log.e("Error: ", e.getMessage());
            }

            return null;
        }

        /**
         * Updating progress bar
         * */
        protected void onProgressUpdate(String... progress) {
            // setting progress percentage
            pDialog.setProgress(Integer.parseInt(progress[0]));
        }

        /**
         * After completing background task
         * Dismiss the progress dialog
         * **/
        @Override
        protected void onPostExecute(String file_url) {
            // dismiss the dialog after the file was downloaded
            dismissDialog(progress_bar_type);
            Log.e("DOWNLOADED","DONE");
            //installAPK();
            installAPK2();

        }

    }

    private void installAPK2(){
        uri = Uri.fromFile(new File(getExternalFilesDir("apk") + "/SystemPest.apk"));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            Uri contentUri = FileProvider.getUriForFile(
                    this,
                    BuildConfig.APPLICATION_ID + ".provider",
                    new File(getExternalFilesDir("apk") + "/SystemPest.apk")
            );
            Intent intent1 = new Intent(Intent.ACTION_VIEW);
            intent1.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            intent1.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            intent1.putExtra(Intent.EXTRA_NOT_UNKNOWN_SOURCE, true);
            intent1.setData(contentUri);
            startActivity(intent1);
            // finish()
        } else {
            Intent intent1 = new Intent(Intent.ACTION_VIEW);
            intent1.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            intent1.setDataAndType(uri, "application/vnd.android.package-archive");
            startActivity(intent1);
            // finish()
        }

    }


    private void installAPK()
    {
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setDataAndType(Uri.fromFile(new File(getExternalFilesDir("apk") + "/SystemPest.apk")), "application/vnd.android.package-archive");
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK); // without this flag android returned a intent error!
        getApplicationContext().startActivity(intent);
    }

    public static boolean installPackage(Context context, InputStream in, String packageName)
            throws IOException {
        PackageInstaller packageInstaller = context.getPackageManager().getPackageInstaller();
        PackageInstaller.SessionParams params = new PackageInstaller.SessionParams(
                PackageInstaller.SessionParams.MODE_FULL_INSTALL);
        params.setAppPackageName(packageName);
        // set params
        int sessionId = packageInstaller.createSession(params);
        PackageInstaller.Session session = packageInstaller.openSession(sessionId);
        OutputStream out = session.openWrite("COSU", 0, -1);
        byte[] buffer = new byte[65536];
        int c;
        while ((c = in.read(buffer)) != -1) {
            out.write(buffer, 0, c);
        }
        session.fsync(out);
        in.close();
        out.close();

        session.commit(createIntentSender(context, sessionId));
        return true;
    }

    private static IntentSender createIntentSender(Context context, int sessionId) {
        PendingIntent pendingIntent = PendingIntent.getBroadcast(
                context,
                sessionId,
                new Intent(ACTION_INSTALL_COMPLETE),
                0);
        return pendingIntent.getIntentSender();
    }
}

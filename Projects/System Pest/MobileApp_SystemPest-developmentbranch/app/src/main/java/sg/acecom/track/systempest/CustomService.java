package sg.acecom.track.systempest;

import android.Manifest;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.core.app.NotificationCompat;

import android.os.Looper;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.widget.Toast;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResponse;
import com.google.android.gms.location.SettingsClient;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.TimeZone;

import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.MyPreferences;

public class CustomService extends Service {

    private Handler handler;
    private Runnable runable;

    private MyPreferences pref;

    private FusedLocationProviderClient fusedLocationClient;

    private Location previousLocation;

    String longitude;
    String latitude;
    String speed;
    String miles;
    String direction;

    private SettingsClient mSettingsClient;
    private LocationRequest mLocationRequest;
    private LocationSettingsRequest mLocationSettingsRequest;
    private LocationCallback mLocationCallback;

    String currentAddress;

    int percentage;

    @Override
    public void onCreate() {
        reInit();
        pref = new MyPreferences(this);
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this);
        previousLocation = new Location("");
        mSettingsClient = LocationServices.getSettingsClient(this);
        mLocationCallback = new LocationCallback() {
            @Override
            public void onLocationResult(LocationResult locationResult) {
                super.onLocationResult(locationResult);
                // location is received
                //mCurrentLocation = locationResult.getLastLocation();
            }
        };

        mLocationRequest = new LocationRequest();
        mLocationRequest.setInterval(30000);
        mLocationRequest.setFastestInterval(20000);
        mLocationRequest.setPriority(LocationRequest.PRIORITY_HIGH_ACCURACY);

        LocationSettingsRequest.Builder builder = new LocationSettingsRequest.Builder();
        builder.addLocationRequest(mLocationRequest);
        mLocationSettingsRequest = builder.build();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startMyOwnForeground();
        }
    }

    @TargetApi(Build.VERSION_CODES.O)
    private void startMyOwnForeground() {
        String NOTIFICATION_CHANNEL_ID = "sg.acecom.track.systempest";
        String channelName = "Systempest Foreground Service";
        NotificationChannel chan = new NotificationChannel(NOTIFICATION_CHANNEL_ID, channelName, NotificationManager.IMPORTANCE_NONE);
        chan.setLightColor(Color.BLUE);
        chan.setLockscreenVisibility(Notification.VISIBILITY_PRIVATE);
        NotificationManager manager = getSystemService(NotificationManager.class);
        assert manager != null;
        manager.createNotificationChannel(chan);

        Intent notificationIntent = new Intent(this, MainActivity.class);

        PendingIntent intent = PendingIntent.getActivity(this, 1,
                notificationIntent, 0);

        NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(getApplicationContext(), NOTIFICATION_CHANNEL_ID);
        Notification notification = notificationBuilder.setOngoing(true)
                .setOngoing(true)
                .setContentTitle("Systempest Location Reporting")
                .setContentText("Systempest is keeping track of your location")
                .setSmallIcon(R.mipmap.ic_launcher)
                .setContentIntent(intent)
                .setTicker("TRACKING")
                .setPriority(NotificationManager.IMPORTANCE_DEFAULT)
                .setCategory(Notification.CATEGORY_SERVICE)
                .build();
        Random random = new Random();
        int m = random.nextInt(9999 - 1000) + 1000;
        startForeground(m, notification);
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private void reInit() {
        handler = new Handler();
        runable = new Runnable() {
            @Override
            public void run() {
                sendGPSData();
                rePost();
                // Doing something
                //Log.d("CustomServices", Calendar.getInstance().getTime().toString());
            }
        };
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        super.onStartCommand(intent, flags, startId);
        rePost();
        return START_STICKY;
    }

    private void rePost() {
        handler.postDelayed(runable, 5000);
    }

    @Override
    public void onDestroy() {
        stopForeground(true);
        stopSelf();
        super.onDestroy();
        if (isRestartService()) {
            Intent broadcastIntent = new Intent();
            broadcastIntent.setAction("restartservice");
            broadcastIntent.setClass(this, CustomBroadcast.class);
            this.sendBroadcast(broadcastIntent);
            handler.removeCallbacks(runable);
        }
    }

    // Condition restart service
    private boolean isRestartService() {
        return true;
    }

    private void startLocationUpdates() {
        mSettingsClient
                .checkLocationSettings(mLocationSettingsRequest)
                .addOnSuccessListener(new OnSuccessListener<LocationSettingsResponse>() {
                    @SuppressLint("MissingPermission")
                    @Override
                    public void onSuccess(LocationSettingsResponse locationSettingsResponse) {
                        //noinspection MissingPermission
                        fusedLocationClient.requestLocationUpdates(mLocationRequest,
                                mLocationCallback, Looper.myLooper());
                    }
                })
                .addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        Toast.makeText(getApplicationContext(),"Location Update failed", Toast.LENGTH_SHORT).show();
                    }
                });
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private void sendGPSData() {
        startLocationUpdates();

        fusedLocationClient.getLastLocation()
                .addOnSuccessListener(new OnSuccessListener<Location>() {
                    @RequiresApi(api = Build.VERSION_CODES.O)
                    @Override
                    public void onSuccess(Location location) {
                        // Got last known location. In some rare situations this can be null.
                        if (location != null) {
                            // Logic to handle location object
                            longitude = String.valueOf(location.getLongitude());
                            latitude = String.valueOf(location.getLatitude());
                            speed = String.valueOf(location.getSpeed());
                            direction = String.valueOf(location.getBearing());

                            if(previousLocation != null){
                                miles = String.valueOf(location.distanceTo(previousLocation));
                            } else{
                                miles = String.valueOf(0);
                            }

                            previousLocation.setLatitude(location.getLatitude());
                            previousLocation.setLongitude(location.getLongitude());

                        } else{
                            longitude = "0.0";
                            latitude = "0.0";
                            speed = "0.0";
                            direction = "0.0";
                            miles = "0.0";
                        }
                    }
                });

        Geocoder geocoder;
        List<Address> addresses;
        geocoder = new Geocoder(this, Locale.getDefault());

        Log.e("GEOCODER LATITUDE",latitude + " 12344");
        Log.e("GEOCODER LONGITUDE", longitude + " 12344");

        try {
            if(latitude != null && longitude != null && latitude != "0.0" && longitude != "0.0") {
                addresses = geocoder.getFromLocation(Double.parseDouble(latitude), Double.parseDouble(longitude), 1); // Here 1 represent max location result to returned, by documents it recommended 1 to 5
                currentAddress = addresses.get(0).getAddressLine(0);
                currentAddress = currentAddress.replace(",","");
            } else{
                currentAddress = "";
            }
        } catch (IOException e) {
            Log.e("NO ADDRESS", "CAN'T GET ADDESS");
            currentAddress = "";
        }

        pref.savePreferencesContext("current_address", currentAddress);

        final String gps_message = "$$JDS$," + getDeviceIMEI() + "," + getUTCDateAndTime() + "," + latitude +
                "," + longitude + "," + speed + "," + miles +
                "," + direction + "," + "1" + "," + getBatteryLevel() + "," + getVersionInfo() + "," + currentAddress;

        Log.e("GPS :", gps_message);

        latitude = "";
        longitude = "";
        speed = "";
        miles = "";
        direction = "";

        Thread thread = new Thread() {
            @Override
            public void run() {
                super.run();
                Socket socket = null;
                DataOutputStream dataOutputStream = null;
                DataInputStream dataInputStream = null;
                try {
                    socket = new Socket(AppConstant.ads_host, AppConstant.ads_port);
                    dataOutputStream = new DataOutputStream(socket.getOutputStream());
                    dataInputStream = new DataInputStream(socket.getInputStream());
                    System.out.println("sending data...");
                    byte[] buf = gps_message.getBytes("UTF-8");
                    dataOutputStream.write(buf, 0, buf.length);
                    System.out.println("data sent...");
                } catch (UnknownHostException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } finally {
                    if (socket != null) {
                        try {
                            socket.close();
                            System.out.println("socket closed...");
                        } catch (IOException e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                    }

                    if (dataOutputStream != null) {
                        try {
                            dataOutputStream.close();
                        } catch (IOException e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                    }

                    if (dataInputStream != null) {
                        try {
                            dataInputStream.close();
                        } catch (IOException e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                    }
                }
            }
        };
        thread.start();
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private String getDeviceIMEI() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            return pref.getPreferencesContext("loginIMEI","");
        } else {
            TelephonyManager telephonyManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);

            if (checkSelfPermission(Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {

            }

            return telephonyManager.getDeviceId();
        }
    }

    private String getUTCDateAndTime() {
        final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        final String utcTime = sdf.format(new Date());

        return utcTime;
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

        System.out.println("VERSION INFO = " + strVersion);
        return strVersion;
    }

    public String getBatteryLevel(){
        BatteryManager bm = (BatteryManager)getSystemService(BATTERY_SERVICE);
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
            percentage = bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        }
        return String.valueOf(percentage);
    }
}

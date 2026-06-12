package sg.acecom.track.systempest.fragment;

import android.app.AlertDialog;
import android.app.Fragment;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.core.content.ContextCompat;
import androidx.cardview.widget.CardView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.androidquery.AQuery;
import com.androidquery.callback.AjaxCallback;
import com.androidquery.callback.AjaxStatus;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import sg.acecom.track.systempest.HistoryActivity;
import sg.acecom.track.systempest.JobActivity;
import sg.acecom.track.systempest.LoginActivity;
import sg.acecom.track.systempest.MaintenanceActivity;
import sg.acecom.track.systempest.QrCodeActivity;
import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.AppController;
import sg.acecom.track.systempest.util.IMEI;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 5/3/18.
 */

public class MainFragment extends Fragment implements View.OnClickListener{

    View view;
    CardView cvInventory;
    CardView cvJob;
    CardView cvMaintenance;
    CardView cvHistory;
    TextView userName, dateToday, userCompany,numberOfJobs;
    EditText etTechnicianName;
    Button buttonLogout;
    MyPreferences pref;
    IMEI imei;
    LinearLayout layout_linear;
    AlertDialog.Builder alert_dialog;
    public static final int SNACKBAR_DURATION = 2000;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.layout_home, container, false);
        pref = new MyPreferences(getActivity());
        imei = new IMEI(getActivity());
        cvInventory = view.findViewById(R.id.cvInventory);
        layout_linear = view.findViewById(R.id.layout_linear);
        cvJob = view.findViewById(R.id.cvJob);
        cvMaintenance = view.findViewById(R.id.cvMaintenance);
        cvHistory = view.findViewById(R.id.cvHistory);
        numberOfJobs = view.findViewById(R.id.numberOfJobs);
        userName = view.findViewById(R.id.userName);
        etTechnicianName = view.findViewById(R.id.etTechnicianName);
        userCompany = view.findViewById(R.id.userCompany);
        dateToday = view.findViewById(R.id.dateToday);
        buttonLogout = view.findViewById(R.id.buttonLogout);

        buttonLogout.setOnClickListener(this);
        cvInventory.setOnClickListener(this);
        cvJob.setOnClickListener(this);
        cvMaintenance.setOnClickListener(this);
        cvHistory.setOnClickListener(this);

        initContent();
        return view;
    }

    @Override
    public void onClick(View v) {
        Intent intent;
        switch (v.getId()){

            case(R.id.cvInventory):
                intent = new Intent(getActivity(), QrCodeActivity.class);
                startActivity(intent);
                break;

            case(R.id.cvJob):
                pref.savePreferences("homeTechnicianName", etTechnicianName.getText().toString());
                intent = new Intent(getActivity(), JobActivity.class);
                startActivity(intent);
                break;

            case(R.id.cvMaintenance):


                intent = new Intent(getActivity(), MaintenanceActivity.class);
                startActivity(intent);
                break;

            case(R.id.cvHistory):
                intent = new Intent(getActivity(), HistoryActivity.class);
                startActivity(intent);


                break;

            case(R.id.buttonLogout):
                //timer.cancel();
                //timer2.cancel();
                logoutAlert();
                break;
        }
    }

    public void initContent(){

        SimpleDateFormat format= new SimpleDateFormat("d MMMM, yyyy", Locale.getDefault());
        String myDate = format.format(new Date());

        if(pref.checkPrefrences("homeTechnicianName")){
            Log.e("Test : ", "TRUE");
            etTechnicianName.setText(pref.getPreferences("homeTechnicianName",""));
        }else{
            etTechnicianName.setText("");
        }

        userName.setText(pref.getPreferences("driver_name",""));
        userCompany.setText(pref.getPreferences("driver_company",""));
        //userCompany.setText("AceCom Technologies Pte Ltd");
        dateToday.setText(myDate);
        getNumberOfJobs();
    }

    public void logoutAlert() {
        alert_dialog = new AlertDialog.Builder(getActivity());
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle("Log Out");
        alert_dialog.setMessage("Are you sure you want to log out?");
        alert_dialog.setNegativeButton("No", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alert_dialog.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(final DialogInterface dialog, int which) {

                pref.removePreferences("session_login");
                pref.removePreferences("session_user_name");
                pref.removePreferences("session_user_password");
                saveLogoutEvents();
            }
        });
        alert_dialog.show();
    }

    private void saveLogoutEvents() {

        String apiEventsUrl = AppConstant.endpoint_url + "savelogout";
        JSONObject params = new JSONObject();
        try {
            params.put("Tag", getIMEI());
            params.put("DriverID", pref.getPreferences("driver_id", ""));
            params.put("Driver", pref.getPreferences("driver_name", ""));
        } catch (JSONException e) {
            e.printStackTrace();
        }

        AQuery aq = new AQuery(getActivity());
        aq.post(apiEventsUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);
                        logoutDriver();
                    } catch (JSONException e) {
                    }
                } else {

                }
            }
        });
    }

    private void logoutDriver() {

        String getAssetUrl = AppConstant.endpoint_url + "logoutdriver";
        JSONObject params = new JSONObject();
        try {
            params.put("Tag", getIMEI());
            params.put("DriverID", pref.getPreferences("driver_id", ""));
        } catch (JSONException e) {
            e.printStackTrace();
        }

        AQuery aq = new AQuery(getActivity());
        aq.post(getAssetUrl, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject json = new JSONObject(response);
                        pref.removePreferences("homeTechnicianName");
                        Intent intent = new Intent(getActivity(), LoginActivity.class);
                        //intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                        startActivity(intent);
                        getActivity().finish();

                    } catch (JSONException e) {

                    }
                } else {

                }
            }
        });
    }

    private String getIMEI(){
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            return pref.getPreferences("loginIMEI","");
        } else {
            imei.setDeviceID("");
            return imei.getDeviceID();
        }
    }

    private void getNumberOfJobs(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        cal.add(Calendar.DATE, -3);
        cal.add(Calendar.HOUR, -8);
        Date eightHourBack = cal.getTime();
        String timestamp = new SimpleDateFormat("dd-MMM-yyyy", Locale.ENGLISH).format(eightHourBack);

        SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy",Locale.ENGLISH);
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, 4);
        c.add(Calendar.HOUR, -8);
        String rxtime = sdf.format(c.getTime());

        final String url = AppConstant.endpoint_url + "jobinfo?Timestamp=" + URLEncoder.encode(timestamp) +
                "&RxTime=" + URLEncoder.encode(rxtime);

        //Log.e("Job List API : ", url);

        // prepare the Request
        JsonArrayRequest getRequest = new JsonArrayRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONArray>()
                {
                    @Override
                    public void onResponse(JSONArray response) {
                        // display response
                        try{
                            numberOfJobs.setText(String.valueOf(response.length()));
                        }catch(Exception e){
                            Log.e("Response Exception :", String.valueOf(e));
                        }

                    }
                },
                new Response.ErrorListener()
                {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e("Error.Response", error.toString());
                    }
                }
        );

        // Access the RequestQueue through your singleton class.
        AppController.getInstance().addToRequestQueue(getRequest);
    }

    private void createPostInfo(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        cal.add(Calendar.HOUR, -8);
        cal.add(Calendar.MINUTE, -5);
        Date eightHourBack = cal.getTime();
        String timestamp = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss a", Locale.ENGLISH).format(eightHourBack);
        //Log.e("TIME : ", timestamp);
        JSONObject params = new JSONObject();
        try {
            params.put("Tag", "0863835025666855");
            params.put("FixID", 2);
            params.put("Satellites", 7);
            params.put("PosX", 103.907027);
            params.put("PosY", 1.334567);
            params.put("PosZ", 0);
            params.put("Speed", 0.5556);
            params.put("Course", 0);
            params.put("HDOP", 0);
            params.put("Ignition", 1);
            params.put("Engine", 2);
            params.put("Mileage", 2);
            params.put("Battery", 29444);
            params.put("Fuel", 0);
            params.put("ZoneID", 0);
            params.put("Timestamp", timestamp);
            params.put("RxTime", timestamp);
            params.put("Remarks", "test data");


        } catch (JSONException e) {
            e.printStackTrace();

        }

        final String url = "http://track-asia.com/tracksgwebapi/api/posinfo";

        //System.out.println(url);

        AQuery aq = new AQuery(getActivity());
        aq.post(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                //System.out.println(response);
                if (status.getMessage().equals("OK")) {

                    Toast.makeText(getActivity(), response, Toast.LENGTH_SHORT).show();

                }
            }
        }.header("Content-Type", "application/x-www-form-urlencoded")
                .header("_method", "POST"));
    }

}

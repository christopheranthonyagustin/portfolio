package sg.acecom.track.systempest.fragment;

import android.app.Fragment;
import android.os.Bundle;
import android.os.Handler;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.adapter.MaintenanceAdapter;
import sg.acecom.track.systempest.model.Maintenance;
import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.AppController;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 23/4/18.
 */

public class MaintenanceFragment extends Fragment implements SwipeRefreshLayout.OnRefreshListener{

    View view;
    MyPreferences pref;
    RecyclerView recyclerJob;
    private MaintenanceAdapter adapter;
    private List<Maintenance> maintenanceList;
    ProgressBar progressbar;
    SwipeRefreshLayout swipeContainer;

    private Handler handler = new Handler();
    boolean handlerIsRunning = false;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.layout_job, container, false);
        pref = new MyPreferences(getActivity());
        maintenanceList = new ArrayList<>();
        adapter = new MaintenanceAdapter(getActivity(), maintenanceList);
        swipeContainer = view.findViewById(R.id.swipeContainer);
        recyclerJob = view.findViewById(R.id.recyclerJob);
        recyclerJob.setLayoutManager(new LinearLayoutManager(getActivity()));
        recyclerJob.setItemAnimator(new DefaultItemAnimator());
        recyclerJob.setAdapter(adapter);
        progressbar = view.findViewById(R.id.progressbar);

        swipeContainer.setOnRefreshListener(this);
        swipeContainer.setColorSchemeResources(R.color.colorPrimaryDark,
                android.R.color.holo_green_dark,
                android.R.color.holo_red_dark,
                android.R.color.holo_blue_dark);

        /**
         * Showing Swipe Refresh animation on activity create
         * As animation won't start on onCreate, post runnable is used
         */
        swipeContainer.post(new Runnable() {

            @Override
            public void run() {

                swipeContainer.setRefreshing(true);

                // Fetching data from server
                getMaintenance();
            }
        });

        return view;
    }

    @Override
    public void onResume() {
        super.onResume();
        getMaintenance();
        if(!handlerIsRunning){
            handler.postDelayed(runnable, 1000);
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        handler.removeCallbacks(runnable);
    }

    private Runnable runnable = new Runnable() {
        @Override
        public void run() {
            try {
                handlerIsRunning = true;
                getMaintenance();

                handler.postDelayed(this, 10000);
            } catch (Exception e) {
                e.printStackTrace();
                handlerIsRunning = false;
            }
        }
    };



    @Override
    public void onRefresh() {
        getMaintenance();
    }

    private void getMaintenance(){

        final String url = AppConstant.endpoint_url + "nextmaintenance?CompanyID=" + pref.getPreferences("driver_company_id","");

        Log.e("Maintenance API : ", url);

        // prepare the Request
        JsonArrayRequest getRequest = new JsonArrayRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONArray>()
                {
                    @Override
                    public void onResponse(JSONArray response) {
                        // display response
                        maintenanceList.clear();
                        swipeContainer.setRefreshing(true);
                        try{
                            Log.e("Maintenance Response", String.valueOf(response));
                            for (int i = 0; i < response.length(); i++) {
                                JSONObject obj = response.getJSONObject(i);
                                Maintenance maintenance = new Maintenance();
                                maintenance.setMaintenanceID(obj.getInt("MaintenanceID"));
                                maintenance.setTimestamp(obj.getString("Timestamp"));
                                maintenance.setRxTime(obj.getString("RxTime"));
                                maintenance.setAddress(obj.getString("Address"));
                                maintenance.setPostal(obj.getString("Postal"));
                                maintenance.setUnit(obj.getString("Unit"));
                                maintenance.setPIC(obj.getString("PIC"));
                                maintenance.setPhone(obj.getString("Phone"));
                                maintenance.setEmail(obj.getString("Email"));
                                maintenance.setSite(obj.getString("Site"));
                                maintenance.setContractStart(obj.getString("ContractStart"));
                                maintenance.setContractEnd(obj.getString("ContractEnd"));
                                maintenance.setMaintenanceInterval(obj.getString("MaintenanceInterval"));
                                maintenance.setNotificationInterval(obj.getString("NotificationInterval"));
                                maintenance.setRemarks(obj.getString("Remarks"));
                                maintenance.setCompanyID(obj.getInt("CompanyID"));

                                JSONArray objArray = obj.getJSONArray("MaintenanceJob");
                                JSONObject maintenanceJob = objArray.getJSONObject(0);
                                maintenance.setNextJobDate(maintenanceJob.getString("Timestamp"));
                                maintenance.setMaintenanceJobID(maintenanceJob.getInt("MaintenanceJobID"));
                                maintenance.setReferenceNo(maintenanceJob.getString("ReferenceNo"));
                                maintenance.setTechnician(maintenanceJob.getString("Technician"));

                                //JSONObject objectAc = obj.getJSONObject("AcInfo");
                                //maintenance.setAreaCovered(objectAc.getString("GeneralLocation"));

                                if(maintenanceJob.getInt("Flag") != 0){
                                    if(maintenanceJob.getInt("DriverID") == Integer.parseInt(pref.getPreferences("driver_id",""))){
                                        maintenanceList.add(maintenance);
                                    }
                                }
                            }

                           // adapter.notifyDataSetChanged();
                        }catch(Exception e){
                            swipeContainer.setRefreshing(false);
                            Log.e("Response Exception :", String.valueOf(e));
                        }
                        swipeContainer.setRefreshing(false);

                        adapter.notifyDataSetChanged();

                    }
                },
                new Response.ErrorListener()
                {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        swipeContainer.setRefreshing(false);

                        Log.e("Error.Response", error.toString());
                    }
                }
        );

        // Access the RequestQueue through your singleton class.
        AppController.getInstance().addToRequestQueue(getRequest);
    }
}

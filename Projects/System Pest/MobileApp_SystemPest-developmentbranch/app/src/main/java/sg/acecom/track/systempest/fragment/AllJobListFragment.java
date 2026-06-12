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

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.adapter.AllJobAdapter;
import sg.acecom.track.systempest.model.Jobs;
import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.AppController;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 23/4/18.
 */

public class AllJobListFragment extends Fragment implements SwipeRefreshLayout.OnRefreshListener{

    View view;
    MyPreferences pref;
    RecyclerView recyclerJob;
    private AllJobAdapter adapter;
    private List<Jobs> jobsList;
    private List<Jobs> sort_jobsList;
    ProgressBar progressbar;
    SwipeRefreshLayout swipeContainer;

    private Handler handler = new Handler();
    boolean handlerIsRunning = false;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.layout_alljobs, container, false);
        pref = new MyPreferences(getActivity());
        jobsList = new ArrayList<>();
        adapter = new AllJobAdapter(getActivity(), jobsList);
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
                getJobs();
            }
        });

        return view;
    }

    @Override
    public void onResume() {
        super.onResume();
        getJobs();
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
                getJobs();

                handler.postDelayed(this, 10000);
            } catch (Exception e) {
                e.printStackTrace();
                handlerIsRunning = false;
            }
        }
    };

    @Override
    public void onRefresh() {
        getJobs();
    }

    private void getJobs(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        cal.add(Calendar.DATE, -1);
        cal.add(Calendar.HOUR, -8);
        Date eightHourBack = cal.getTime();
        String timestamp = new SimpleDateFormat("dd-MMM-yyyy", Locale.ENGLISH).format(eightHourBack);

        SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy",Locale.ENGLISH);
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, 2);
        c.add(Calendar.HOUR, -8);
        String rxtime = sdf.format(c.getTime());

        /*final String url = AppConstant.endpoint_url + "jobinfo?Timestamp=" + URLEncoder.encode(timestamp) +
            "&RxTime=" + URLEncoder.encode(rxtime) + "&AssetResellerID=" + pref.getPreferences("driver_reseller_id","") +
            "&AssetCompanyID=" + pref.getPreferences("driver_company_id","") + "&DriverID=" + pref.getPreferences("driver_id","");*/
        final String url = AppConstant.endpoint_url + "jobinfo?&AssetResellerID=" + pref.getPreferences("driver_reseller_id","") +
                "&AssetCompanyID=" + pref.getPreferences("driver_company_id","") + "&DriverID=" + pref.getPreferences("driver_id","");


        Log.e(" All Job List API : ", url);

        // prepare the Request
        JsonArrayRequest getRequest = new JsonArrayRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONArray>()
                {
                    @Override
                    public void onResponse(JSONArray response) {
                        // display response
                        jobsList.clear();
                        swipeContainer.setRefreshing(true);
                        try{

                            for (int i = 0; i < response.length(); i++) {
                                JSONObject obj = response.getJSONObject(i);
                                JSONArray jobsArray = obj.getJSONArray("Jobs");
                                for(int j = 0; j < jobsArray.length(); j++){
                                    JSONObject jobs = jobsArray.getJSONObject(j);
                                    if(jobs.getInt("Flag") != 0){
                                        Jobs job = new Jobs();
                                        job.setJobID(jobs.getInt("JobID"));
                                        job.setJobNumber(jobs.getString("JobNumber"));
                                        job.setFlag(jobs.getInt("Flag"));
                                        job.setFlagValue(jobs.getString("FlagValue"));
                                        job.setAssetCompanyID(jobs.getInt("AssetCompanyID"));
                                        job.setAssetCompany(jobs.getString("AssetCompany"));;
                                        job.setAssetResellerID(jobs.getInt("AssetResellerID"));
                                        job.setAssetReseller(jobs.getString("AssetReseller"));
                                        job.setUserID(jobs.getInt("UserID"));
                                        job.setUserName(jobs.getString("UserName"));
                                        job.setAssetID(jobs.getInt("AssetID"));
                                        job.setDriverID(jobs.getInt("DriverID"));
                                        job.setDriverName(jobs.getString("DriverName"));
                                        job.setTimestamp(jobs.getString("Timestamp"));
                                        job.setRxTime(jobs.getString("RxTime"));
                                        job.setCompany(jobs.getString("Company"));
                                        job.setDestination(jobs.getString("Destination"));
                                        job.setPostal(jobs.getString("Postal"));
                                        job.setUnit(jobs.getString("Unit"));
                                        job.setPIC(jobs.getString("PIC"));
                                        job.setPhone(jobs.getString("Phone"));
                                        job.setAmount(jobs.getDouble("Amount"));
                                        job.setCusEmail(jobs.getString("CusEmail"));
                                        job.setSite(jobs.getString("Site"));
                                        //job.setPest(jobs.getString("Pest"));
                                        job.setRemarks(jobs.getString("Remarks"));
                                        job.setJobAccepted(jobs.getString("JobAccepted"));
                                        job.setJobCompleted(jobs.getString("JobCompleted"));

                                        job.setReceipt(jobs.getString("Receipt"));
                                        //job.setImage(jobs.getString("Image"));
                                        //job.setImageFill(jobs.getString("ImageFill"));
                                        job.setReferenceNo(jobs.getString("ReferenceNo"));
                                        //job.setTechnician(jobs.getString("Technician"));
                                        job.setTechnician(pref.getPreferences("homeTechnicianName",""));
                                        job.setFormType(jobs.getInt("FormType"));

                                        JSONArray arrayPest = jobs.getJSONArray("Pest");
                                        StringBuilder pestBuilder = new StringBuilder();

                                        for(int p = 0; p < arrayPest.length(); p++){
                                            JSONObject pest = arrayPest.getJSONObject(p);
                                            if(arrayPest.length() == 1 || p + 1 == arrayPest.length()){
                                                pestBuilder.append(pest.getString("PestDesc"));
                                            }else{
                                                pestBuilder.append(pest.getString("PestDesc"));
                                                pestBuilder.append(", ");
                                            }

                                        }
                                        job.setPest(pestBuilder.toString());

                                        if(pref.getPreferences("driver_company_id","").equals("2")){
                                            JSONObject jobsectAc = jobs.getJSONObject("AcMyInfo");
                                            job.setAreaCovered(jobsectAc.getString("Groups"));
                                        }else{
                                            JSONObject jobsectAc = jobs.getJSONObject("AcInfo");
                                            job.setAreaCovered(jobsectAc.getString("GeneralLocation"));
                                        }

                                        job.setJobType(1);
                                        jobsList.add(job);
                                    }
                                }


                                JSONArray maintenanceArray = obj.getJSONArray("Maintenance");
                                if(maintenanceArray.length() != 0){
                                    for(int k = 0; k < maintenanceArray.length(); k++){
                                        JSONObject maintenance = maintenanceArray.getJSONObject(k);
                                        if(maintenance.getInt("Flag") != 0){
                                            Jobs job = new Jobs();
                                            job.setJobType(2);
                                            job.setJobID(maintenance.getInt("MaintenanceID"));
                                            job.setDestination(maintenance.getString("Address"));
                                            job.setPostal(maintenance.getString("Postal"));
                                            job.setUnit(maintenance.getString("Unit"));
                                            job.setCompany(maintenance.getString("CusCompany"));
                                            job.setPIC(maintenance.getString("PIC"));
                                            job.setPhone(maintenance.getString("Phone"));
                                            job.setCusEmail(maintenance.getString("Email"));
                                            job.setSite(maintenance.getString("Site"));
                                            job.setAssetCompanyID(maintenance.getInt("AssetCompanyID"));
                                            job.setFormType(maintenance.getInt("AssetCompanyID"));
                                            job.setRemarks(maintenance.getString("Remarks"));
                                            job.setReferenceNo(maintenance.getString("ReferenceNo"));

                                            job.setMaintenanceJobID(maintenance.getInt("MaintenanceJobID"));
                                            job.setTimestamp(maintenance.getString("Timestamp"));
                                            job.setRxTime(maintenance.getString("RxTime"));
                                            job.setDriverID(maintenance.getInt("DriverID"));
                                            //job.setTechnician(maintenanceJobsData.getString("Technician"));
                                            job.setTechnician(pref.getPreferences("homeTechnicianName",""));


                                            JSONArray arrayPest = maintenance.getJSONArray("Pest");
                                            StringBuilder pestBuilder = new StringBuilder();

                                            for(int p = 0; p < arrayPest.length(); p++){
                                                JSONObject pest = arrayPest.getJSONObject(p);
                                                if(arrayPest.length() == 1 || p + 1 == arrayPest.length()){
                                                    pestBuilder.append(pest.getString("PestDesc"));
                                                }else{
                                                    pestBuilder.append(pest.getString("PestDesc"));
                                                    pestBuilder.append(", ");
                                                }

                                            }
                                            job.setPest(pestBuilder.toString());

                                            jobsList.add(job);
                                        }


                                    }
                                }


                            }
                            Collections.sort(jobsList, new Comparator<Jobs>() {
                                @Override
                                public int compare(Jobs lhs, Jobs rhs) {
                                    return lhs.getTimestamp().compareTo(rhs.getTimestamp());
                                }
                            });

                            adapter.notifyDataSetChanged();
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

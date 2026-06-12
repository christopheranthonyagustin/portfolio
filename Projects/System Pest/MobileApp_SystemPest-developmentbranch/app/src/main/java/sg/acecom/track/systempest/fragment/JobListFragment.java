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

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.adapter.JobAdapter;
import sg.acecom.track.systempest.model.Jobs;
import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.AppController;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 23/4/18.
 */

public class JobListFragment extends Fragment implements SwipeRefreshLayout.OnRefreshListener{

    View view;
    MyPreferences pref;
    RecyclerView recyclerJob;
    private JobAdapter adapter;
    private List<Jobs> jobsList;
    ProgressBar progressbar;
    SwipeRefreshLayout swipeContainer;

    private Handler handler = new Handler();
    boolean handlerIsRunning = false;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.layout_job, container, false);
        pref = new MyPreferences(getActivity());
        jobsList = new ArrayList<>();
        adapter = new JobAdapter(getActivity(), jobsList);
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
                "&RxTime=" + URLEncoder.encode(rxtime) + "&AssetResellerID=" + pref.getPreferences("driver_reseller_id","") +
                "&AssetCompanyID=" + pref.getPreferences("driver_company_id","");

        Log.e("Job List API : ", url);

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
                                //Log.e("Flag ",obj.getString("FlagValue"));
                                if(obj.getInt("Flag") != 0){
                                    if(obj.getInt("DriverID") == Integer.parseInt(pref.getPreferences("driver_id",""))){
                                        Jobs job = new Jobs();
                                        job.setJobID(obj.getInt("JobID"));
                                        job.setJobNumber(obj.getString("JobNumber"));
                                        job.setFlag(obj.getInt("Flag"));
                                        job.setFlagValue(obj.getString("FlagValue"));
                                        job.setAssetCompanyID(obj.getInt("AssetCompanyID"));
                                        job.setAssetCompany(obj.getString("AssetCompany"));;
                                        job.setAssetResellerID(obj.getInt("AssetResellerID"));
                                        job.setAssetReseller(obj.getString("AssetReseller"));
                                        job.setUserID(obj.getInt("UserID"));
                                        job.setUserName(obj.getString("UserName"));
                                        job.setAssetID(obj.getInt("AssetID"));
                                        job.setDriverID(obj.getInt("DriverID"));
                                        job.setDriverName(obj.getString("DriverName"));
                                        job.setTimestamp(obj.getString("Timestamp"));
                                        job.setRxTime(obj.getString("RxTime"));
                                        job.setCompany(obj.getString("Company"));
                                        job.setDestination(obj.getString("Destination"));
                                        job.setPostal(obj.getString("Postal"));
                                        job.setUnit(obj.getString("Unit"));
                                        job.setPIC(obj.getString("PIC"));
                                        job.setPhone(obj.getString("Phone"));
                                        job.setAmount(obj.getDouble("Amount"));
                                        job.setCusEmail(obj.getString("CusEmail"));
                                        job.setSite(obj.getString("Site"));
                                        //job.setPest(obj.getString("Pest"));
                                        job.setRemarks(obj.getString("Remarks"));
                                        job.setJobAccepted(obj.getString("JobAccepted"));
                                        job.setJobCompleted(obj.getString("JobCompleted"));

                                        job.setReceipt(obj.getString("Receipt"));
                                        //job.setImage(obj.getString("Image"));
                                        //job.setImageFill(obj.getString("ImageFill"));
                                        job.setReferenceNo(obj.getString("ReferenceNo"));
                                        //job.setTechnician(obj.getString("Technician"));

                                        job.setTechnician(obj.getString(pref.getPreferences("homeTechnicianName","")));

                                        job.setFormType(obj.getInt("FormType"));

                                        JSONArray arrayPest = obj.getJSONArray("Pest");
                                        StringBuilder pestBuilder = new StringBuilder();
                                        StringBuilder treatmentBuilder = new StringBuilder();

                                        for(int j = 0; j < arrayPest.length(); j++){
                                            JSONObject pest = arrayPest.getJSONObject(j);
                                            if(arrayPest.length() == 1 || j + 1 == arrayPest.length()){
                                                pestBuilder.append(pest.getString("PestDesc"));
                                            }else{
                                                pestBuilder.append(pest.getString("PestDesc"));
                                                pestBuilder.append(", ");
                                            }

                                        }

                                        job.setPest(pestBuilder.toString());
                                        if(pref.getPreferences("driver_company_id","").equals("2")){
                                            JSONObject objectAc = obj.getJSONObject("AcMyInfo");
                                            job.setAreaCovered(objectAc.getString("Groups"));
                                        }else{
                                            JSONObject objectAc = obj.getJSONObject("AcInfo");
                                            job.setAreaCovered(objectAc.getString("GeneralLocation"));
                                        }


                                        jobsList.add(job);
                                    }

                                }
                            }

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

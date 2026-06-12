package sg.acecom.track.systempest;

import android.app.SearchManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.appcompat.widget.SearchView;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
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

import sg.acecom.track.systempest.adapter.HistoryJobAdapter;
import sg.acecom.track.systempest.model.Jobs;
import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.AppController;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 4/7/18.
 */

public class HistoryActivity extends AppCompatActivity implements HistoryJobAdapter.HistoryJobAdapterListenner, SwipeRefreshLayout.OnRefreshListener{

    MyPreferences pref;
    RecyclerView recyclerHistory;
    private HistoryJobAdapter adapter;
    private List<Jobs> jobsList;
    private SearchView searchView;
    ProgressBar progressbar;
    SwipeRefreshLayout swipeContainer;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_history);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setTitle("History");

        pref = new MyPreferences(this);
        jobsList = new ArrayList<>();
        adapter = new HistoryJobAdapter(this, jobsList, this);
        recyclerHistory = findViewById(R.id.recyclerHistory);
        // white background notification bar
        //whiteNotificationBar(recyclerHistory);
        swipeContainer = findViewById(R.id.swipeContainer);

        recyclerHistory.setLayoutManager(new LinearLayoutManager(this));
        recyclerHistory.setItemAnimator(new DefaultItemAnimator());
        //recyclerHistory.addItemDecoration(new MyDividerItemDecoration(this, DividerItemDecoration.VERTICAL, 36));
        recyclerHistory.setAdapter(adapter);

        progressbar = findViewById(R.id.progressbar);

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
    }

    @Override
    public void onResume() {
        super.onResume();
        getJobs();
    }

    @Override
    public void onRefresh() {
        getJobs();
    }

    private void getJobs(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        cal.add(Calendar.DATE, -3);
        cal.add(Calendar.HOUR, -8);
        cal.add(Calendar.MONTH, -2);
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
                                    if(jobs.getInt("Flag") == 0){
                                        if(jobs.getInt("DriverID") == Integer.parseInt(pref.getPreferences("driver_id",""))){
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
                                            job.setTechnician(jobs.getString("Technician"));
                                            job.setFormType(jobs.getInt("FormType"));

                                            JSONArray arrayPest = jobs.getJSONArray("Pest");
                                            StringBuilder pestBuilder = new StringBuilder();
                                            StringBuilder treatmentBuilder = new StringBuilder();

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
                                }

                                JSONArray maintenanceArray = obj.getJSONArray("Maintenance");
                                for(int k = 0; k < maintenanceArray.length(); k++){
                                    JSONObject maintenance = maintenanceArray.getJSONObject(k);

                                    JSONArray maintenanceJob = maintenance.getJSONArray("MaintenanceJob");
                                    JSONObject maintenanceJobsData = maintenanceJob.getJSONObject(0);

                                    if(maintenanceJobsData.getInt("Flag") == 0){
                                        if(maintenanceJobsData.getInt("DriverID") == Integer.parseInt(pref.getPreferences("driver_id",""))){
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
                                            job.setAssetCompanyID(maintenance.getInt("CompanyID"));
                                            job.setFormType(maintenance.getInt("CompanyID"));

                                            job.setMaintenanceJobID(maintenanceJobsData.getInt("MaintenanceJobID"));
                                            job.setTimestamp(maintenanceJobsData.getString("Timestamp"));
                                            job.setRxTime(maintenanceJobsData.getString("RxTime"));
                                            job.setDriverID(maintenanceJobsData.getInt("DriverID"));
                                            job.setTechnician(maintenanceJobsData.getString("Technician"));

                                            jobsList.add(job);
                                        }
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


    /*private void getJobs(){
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
                "&AssetCompanyID=" + pref.getPreferences("driver_company_id","") + "&DriverID=" + pref.getPreferences("driver_id","");

        Log.e("History List API : ", url);

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
                                if(obj.getInt("Flag") == 0){
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
                                    job.setTechnician(obj.getString("Technician"));
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
*/
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == android.R.id.home) {
            // finish the activity
            onBackPressed();
            return true;
        }

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_search) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);

        // Associate searchable configuration with the SearchView
        SearchManager searchManager = (SearchManager) getSystemService(Context.SEARCH_SERVICE);
        searchView = (SearchView) menu.findItem(R.id.action_search)
                .getActionView();
        searchView.setSearchableInfo(searchManager
                .getSearchableInfo(getComponentName()));
        searchView.setMaxWidth(Integer.MAX_VALUE);

        // listening to search query text change
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                // filter recycler view when query submitted
                adapter.getFilter().filter(query);
                return false;
            }

            @Override
            public boolean onQueryTextChange(String query) {
                // filter recycler view when text is changed
                adapter.getFilter().filter(query);
                return false;
            }
        });
        return true;
    }

    @Override
    public void onBackPressed() {
        // close search view on back button pressed
        if (!searchView.isIconified()) {
            searchView.setIconified(true);
            return;
        }
        super.onBackPressed();
    }

    private void whiteNotificationBar(View view) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            int flags = view.getSystemUiVisibility();
            flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            view.setSystemUiVisibility(flags);
            getWindow().setStatusBarColor(Color.WHITE);
        }
    }

    @Override
    public void onHistoryJobSelected(Jobs jobs) {

        pref.savePreferences("history_jobReference","");
        pref.savePreferences("history_jobID", String.valueOf(jobs.getJobID()));
        pref.savePreferences("history_jobType", String.valueOf(jobs.getJobType()));
        Intent intent = new Intent(this, HistoryDetailActivity.class);
        startActivity(intent);

        //Toast.makeText(getApplicationContext(), "Selected: " + jobs.getDestination() + ", " + jobs.getPIC(), Toast.LENGTH_LONG).show();
    }

}

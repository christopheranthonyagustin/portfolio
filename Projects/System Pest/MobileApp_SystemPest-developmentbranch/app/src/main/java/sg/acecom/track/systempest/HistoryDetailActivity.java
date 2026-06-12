package sg.acecom.track.systempest;

import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.bumptech.glide.Glide;

import org.json.JSONArray;
import org.json.JSONObject;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sg.acecom.track.systempest.adapter.HistoryFindingsAdapter;
import sg.acecom.track.systempest.adapter.PestAdapter;
import sg.acecom.track.systempest.adapter.RecommendationsAdapter;
import sg.acecom.track.systempest.model.Findings;
import sg.acecom.track.systempest.model.Pests;
import sg.acecom.track.systempest.model.Recommendations;
import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.AppController;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 4/7/18.
 */

public class HistoryDetailActivity extends AppCompatActivity implements View.OnClickListener{

    private TextView jobReference;
    private TextView cusName;
    private TextView cusEmail;
    private TextView jobDateTime;
    private TextView jobAreaCovered;
    private TextView jobDestination;
    private TextView jobPest;
    private TextView jobAmount;
    private TextView jobTechnician;
    private ImageView jobClientSignature;
    private ImageView jobTechSignature;
    private EditText jobNewAmount;
    private RecyclerView recyclerTreatment;
    private RecyclerView recyclerFindings;
    private TextView jobRemarks;
    private TextView jobRecommendation;
    private RadioGroup radioPayment;
    private RadioButton radioCash;
    private RadioButton radioCheque;
    private RadioButton radioIB;
    private RadioButton radioNone;
    private Button buttonBack;
    private Button jobServiceForm;
    private LinearLayout ll_areaCovered;

    private PestAdapter pestAdapter;
    private List<Pests> pestsList;

    private HistoryFindingsAdapter findingsAdapter;
    private List<Findings> findingsList;

    private RecommendationsAdapter recommendationsAdapter;
    private List<Recommendations> recFinalList;

    MyPreferences pref;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_historydetail);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        pref = new MyPreferences(this);
        jobReference = findViewById( R.id.jobReference );
        cusName = findViewById( R.id.cusName );
        cusEmail = findViewById( R.id.cusEmail );
        jobDateTime = findViewById( R.id.jobDateTime );
        jobAreaCovered = findViewById( R.id.jobAreaCovered );
        jobDestination = findViewById( R.id.jobDestination );
        jobPest = findViewById( R.id.jobPest );
        jobTechnician = findViewById( R.id.jobTechnician );
        jobAmount = findViewById( R.id.jobAmount );
        jobNewAmount = findViewById( R.id.jobNewAmount );
        recyclerTreatment = findViewById( R.id.recyclerTreatment );
        recyclerFindings = findViewById( R.id.recyclerFindings );
        jobRemarks = findViewById( R.id.jobRemarks );
        jobRecommendation = findViewById( R.id.jobRecommendation );
        radioPayment = findViewById( R.id.radioPayment );
        radioCash = findViewById( R.id.radioCash );
        radioCheque = findViewById( R.id.radioCheque );
        radioIB = findViewById( R.id.radioIB );
        radioNone = findViewById( R.id.radioNone );
        jobClientSignature = findViewById( R.id.jobClientSignature );
        jobTechSignature = findViewById( R.id.jobTechSignature );
        buttonBack = findViewById( R.id.buttonBack );
        jobServiceForm = findViewById( R.id.jobServiceForm );
        ll_areaCovered = findViewById( R.id.ll_areaCovered );

        pestsList = new ArrayList<>();
        pestAdapter = new PestAdapter(this, pestsList);
        recyclerTreatment.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        recyclerTreatment.setItemAnimator(new DefaultItemAnimator());
        recyclerTreatment.setAdapter(pestAdapter);

        findingsList = new ArrayList<>();
        findingsAdapter = new HistoryFindingsAdapter(this, findingsList);
        recyclerFindings.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        recyclerFindings.setItemAnimator(new DefaultItemAnimator());
        recyclerFindings.setAdapter(findingsAdapter);

        buttonBack.setOnClickListener(this);
        jobServiceForm.setOnClickListener(this);
    }

    @Override
    protected void onResume() {
        super.onResume();
        if(pref.getPreferences("history_jobType","").equals("1")){
            initContent();
        }else if(pref.getPreferences("history_jobType","").equals("2")){
            initContentMaintenance();
        }
    }

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

        return super.onOptionsItemSelected(item);
    }

    private String convertDate(String date)
    {
        // JMINGL 24 - Jan - 2017
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.ENGLISH);
        SimpleDateFormat output = new SimpleDateFormat("hh:mm aaa   dd MMM yyyy",Locale.ENGLISH);
        Date d = null;
        Date eightHourBack = null;
        try {
            d = sdf.parse(date);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(d);
            calendar.add(Calendar.HOUR, 8);
            eightHourBack = calendar.getTime();

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date = output.format(eightHourBack);
    }

    private void initContent(){

        final String url = AppConstant.endpoint_url + "jobinfo/" + pref.getPreferences("history_jobID","");

        Log.e("History Details API : ", url);

        // prepare the Request
        JsonObjectRequest getRequest = new JsonObjectRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONObject>()
                {
                    @Override
                    public void onResponse(JSONObject response) {
                        // display response
                        try{
                            JSONArray arrayPest = response.getJSONArray("Pest");
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

                            JSONObject objectAc = response.getJSONObject("AcInfo");

                            cusName.setText(response.getString("PIC"));
                            cusEmail.setText(response.getString("CusEmail"));
                            jobDateTime.setText(convertDate(response.getString("Timestamp")));
                            jobAreaCovered.setText(objectAc.getString("GeneralLocation"));
                            jobDestination.setText(response.getString("Unit") + ", " + response.getString("Destination")
                            + ", " + response.getString("Postal"));
                            jobPest.setText(pestBuilder.toString());
                            jobAmount.setText(response.getString("Amount"));
                            jobNewAmount.setText(response.getString("ReceivedAmount"));
                            jobRemarks.setText(response.getString("Remarks"));
                            jobRecommendation.setText(response.getString("Recommendations"));
                            jobReference.setText(response.getString("ReferenceNo"));
                            jobTechnician.setText(response.getString("Technician"));

                            Glide.with(HistoryDetailActivity.this)
                                    .load(response.getString("ClientSignatures"))
                                    .into(jobClientSignature);

                            Glide.with(HistoryDetailActivity.this)
                                    .load(response.getString("TechSignatures"))
                                    .into(jobTechSignature);

                            pref.savePreferences("jobServiceForm",response.getString("Forms"));

                            radioCash.setEnabled(false);
                            radioCheque.setEnabled(false);
                            radioIB.setEnabled(false);
                            radioNone.setEnabled(false);

                            if(response.getInt("PaymentType") == 1){
                                radioCash.setChecked(true);
                                radioCheque.setChecked(false);
                                radioIB.setChecked(false);
                                radioNone.setChecked(false);
                            }else if(response.getInt("PaymentType") == 2){
                                radioCash.setChecked(false);
                                radioCheque.setChecked(true);
                                radioIB.setChecked(false);
                                radioNone.setChecked(false);
                            }else if(response.getInt("PaymentType") == 3){
                                radioCash.setChecked(false);
                                radioCheque.setChecked(false);
                                radioIB.setChecked(true);
                                radioNone.setChecked(false);
                            }else if(response.getInt("PaymentType") == 4){
                                radioCash.setChecked(false);
                                radioCheque.setChecked(false);
                                radioIB.setChecked(false);
                                radioNone.setChecked(true);
                            }

                            if(response.getInt("AssetCompanyID") == 2){
                                ll_areaCovered.setVisibility(View.GONE);
                            }

                            pestsList.clear();
                            JSONArray pestArray = new JSONArray(response.getString("Pest"));
                            for(int j = 0; j < pestArray.length(); j++){
                                JSONObject pestInfo = pestArray.getJSONObject(j);
                                pestsList.add(new Pests(pestInfo.getInt("ItemNo"), pestInfo.getString("PestDesc"), pestInfo.getString("TreatmentDesc")));
                                pestAdapter.notifyDataSetChanged();
                            }

                            findingsList.clear();
                            JSONArray findingsArray = new JSONArray(response.getString("Findings"));
                            for(int k = 0; k < findingsArray.length(); k++){
                                JSONObject findingInfo = findingsArray.getJSONObject(k);
                                findingsList.add(new Findings(findingInfo.getString("PestDesc"), findingInfo.getString("AocDesc"), findingInfo.getString("Findings")));
                                findingsAdapter.notifyDataSetChanged();
                            }

                            // adapter.notifyDataSetChanged();
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

    private void initContentMaintenance(){

        final String url = AppConstant.endpoint_url + "maintenancejobinfo/" + pref.getPreferences("history_jobID","");

        Log.e("History Details API : ", url);

        // prepare the Request
        JsonObjectRequest getRequest = new JsonObjectRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONObject>()
                {
                    @Override
                    public void onResponse(JSONObject response) {
                        // display response
                        try{
                            JSONArray arrayPest = response.getJSONArray("Pest");
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

                            JSONObject objectAc = response.getJSONObject("AcInfo");

                            cusName.setText(response.getString("PIC"));
                            cusEmail.setText(response.getString("CusEmail"));
                            jobDateTime.setText(convertDate(response.getString("Timestamp")));
                            jobAreaCovered.setText(objectAc.getString("GeneralLocation"));
                            jobDestination.setText(response.getString("Unit") + ", " + response.getString("Destination")
                                    + ", " + response.getString("Postal"));
                            jobPest.setText(pestBuilder.toString());
                            jobAmount.setText(response.getString("Amount"));
                            jobNewAmount.setText(response.getString("ReceivedAmount"));
                            jobRemarks.setText(response.getString("Remarks"));
                            jobRecommendation.setText(response.getString("Recommendations"));
                            jobReference.setText(response.getString("ReferenceNo"));
                            jobTechnician.setText(response.getString("Technician"));

                            Glide.with(HistoryDetailActivity.this)
                                    .load(response.getString("ClientSignatures"))
                                    .into(jobClientSignature);

                            Glide.with(HistoryDetailActivity.this)
                                    .load(response.getString("TechSignatures"))
                                    .into(jobTechSignature);

                            pref.savePreferences("jobServiceForm",response.getString("Forms"));

                            radioCash.setEnabled(false);
                            radioCheque.setEnabled(false);
                            radioIB.setEnabled(false);

                            if(response.getInt("PaymentType") == 1){
                                radioCash.setChecked(true);
                                radioCheque.setChecked(false);
                                radioIB.setChecked(false);
                            }else if(response.getInt("PaymentType") == 2){
                                radioCash.setChecked(false);
                                radioCheque.setChecked(true);
                                radioIB.setChecked(false);
                            }else if(response.getInt("PaymentType") == 3){
                                radioCash.setChecked(false);
                                radioCheque.setChecked(false);
                                radioIB.setChecked(true);
                            }

                            if(response.getInt("AssetCompanyID") == 2){
                                ll_areaCovered.setVisibility(View.GONE);
                            }

                            pestsList.clear();
                            JSONArray pestArray = new JSONArray(response.getString("Pest"));
                            for(int j = 0; j < pestArray.length(); j++){
                                JSONObject pestInfo = pestArray.getJSONObject(j);
                                pestsList.add(new Pests(pestInfo.getInt("ItemNo"), pestInfo.getString("PestDesc"), pestInfo.getString("TreatmentDesc")));
                                pestAdapter.notifyDataSetChanged();
                            }

                            findingsList.clear();
                            JSONArray findingsArray = new JSONArray(response.getString("Findings"));
                            for(int k = 0; k < findingsArray.length(); k++){
                                JSONObject findingInfo = findingsArray.getJSONObject(k);
                                findingsList.add(new Findings(findingInfo.getString("PestDesc"), findingInfo.getString("AocDesc"), findingInfo.getString("Findings")));
                                findingsAdapter.notifyDataSetChanged();
                            }

                            // adapter.notifyDataSetChanged();
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

    @Override
    public void onClick(View v) {
        switch(v.getId()){
            case(R.id.buttonBack):
                pref.removePreferences("history_jobID");
                onBackPressed();
                break;

            case(R.id.jobServiceForm):
                Intent pdfIntent = new Intent(this, PDFActivity.class);
                startActivity(pdfIntent);
                break;
        }
    }
}

package sg.acecom.track.systempest.adapter;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sg.acecom.track.systempest.JobsDetailActivity;
import sg.acecom.track.systempest.MaintenanceDetailActivity;
import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.model.Jobs;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 17/4/18.
 */

public class AllHistoryJobAdapter extends RecyclerView.Adapter<AllHistoryJobAdapter.MyViewHolder>{

    private Activity mContext;
    private List<Jobs> jobsList;
    private MyPreferences pref;
    AlertDialog.Builder alert_dialog;
    private final static int FADE_DURATION = 100; //FADE_DURATION in milliseconds

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView jobDateTime, jobAddress, jobCustomer, jobPest, jobTechnician, jobFormType, jobType;
        public Button buttonView, buttonAccept, buttonRoute;
        public View jobView;
        public LinearLayout layout_formType;

        public MyViewHolder(View view) {
            super(view);
            jobView = view.findViewById(R.id.jobView);
            jobDateTime = view.findViewById(R.id.jobDateTime);
            jobAddress = view.findViewById(R.id.jobAddress);
            jobCustomer = view.findViewById(R.id.jobCustomer);
            jobPest = view.findViewById(R.id.jobPest);
            jobTechnician = view.findViewById(R.id.jobTechnician);
            jobFormType = view.findViewById(R.id.jobFormType);
            jobType = view.findViewById(R.id.jobType);
            layout_formType = view.findViewById(R.id.layout_formType);
            buttonView = view.findViewById(R.id.buttonView);
            buttonAccept = view.findViewById(R.id.buttonAccept);
            buttonRoute = view.findViewById(R.id.buttonRoute);
        }
    }


    public AllHistoryJobAdapter(Activity mContext, List<Jobs> jobsList) {
        this.mContext = mContext;
        this.jobsList = jobsList;
        pref = new MyPreferences(mContext);
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.cardview_alljob, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, final int position) {
        // Set the view to fade in
        setFadeAnimation(holder.itemView);
        final Jobs jobs = jobsList.get(position);

        holder.jobDateTime.setText(convertDate(jobs.getTimestamp()));
        holder.jobAddress.setText(jobs.getDestination() + ", " + jobs.getPostal());
        holder.jobCustomer.setText(jobs.getPIC());
        holder.jobPest.setText(jobs.getPest());
        holder.jobTechnician.setText(jobs.getTechnician());

        if(jobs.getJobType() == 1){
            holder.jobType.setText("Ad-Hoc");
            holder.jobView.setBackgroundResource(R.color.job_status_new);
            switch(jobs.getFormType()){
                case(1):
                    holder.jobFormType.setText("System Pest Singapore");
                    break;

                case(2):
                    holder.jobFormType.setText("System Pest Malaysia");
                    break;

                case(3):
                    holder.jobFormType.setText("Asia White Ants");
                    break;
            }


        }else if(jobs.getJobType() == 2){
            holder.jobView.setBackgroundResource(R.color.job_status_inprogress);

            switch(jobs.getAssetCompanyID()){
                case(1):
                    holder.jobFormType.setText("System Pest Singapore");
                    break;

                case(2):
                    holder.jobFormType.setText("System Pest Malaysia");
                    break;

                case(3):
                    holder.jobFormType.setText("Asia White Ants");
                    break;
            }

            holder.jobType.setText("Maintenance");
        }

        holder.buttonView.setVisibility(View.VISIBLE);

        holder.buttonAccept.setVisibility(View.GONE);
        holder.buttonRoute.setVisibility(View.GONE);


        holder.buttonAccept.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                acceptAlert(position);
            }
        });

        holder.buttonView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(jobs.getJobType() == 1){
                    pref.savePreferences("JobID", String.valueOf(jobs.getJobID()));
                    pref.savePreferences("JobNumber",jobs.getJobNumber());
                    pref.savePreferences("Flag", String.valueOf(jobs.getFlag()));
                    pref.savePreferences("FlagValue",jobs.getFlagValue());
                    pref.savePreferences("AssetCompanyID", String.valueOf(jobs.getAssetCompanyID()));
                    pref.savePreferences("AssetCompany",jobs.getAssetCompany());
                    pref.savePreferences("AssetResellerID", String.valueOf(jobs.getAssetResellerID()));
                    pref.savePreferences("AssetReseller",jobs.getAssetReseller());
                    pref.savePreferences("UserID", String.valueOf(jobs.getUserID()));
                    pref.savePreferences("UserName",jobs.getUserName());
                    pref.savePreferences("AssetID", String.valueOf(jobs.getAssetID()));
                    pref.savePreferences("DriverID", String.valueOf(jobs.getDriverID()));
                    pref.savePreferences("DriverName",jobs.getDriverName());
                    pref.savePreferences("Timestamp",jobs.getTimestamp());
                    pref.savePreferences("RxTime",jobs.getRxTime());
                    pref.savePreferences("Flag", String.valueOf(jobs.getFlag()));
                    pref.savePreferences("Company",jobs.getCompany());
                    pref.savePreferences("Destination",jobs.getDestination());
                    pref.savePreferences("Postal", String.valueOf(jobs.getPostal()));
                    pref.savePreferences("Unit",jobs.getUnit());
                    pref.savePreferences("PIC",jobs.getPIC());
                    pref.savePreferences("Phone",jobs.getPhone());
                    pref.savePreferences("Amount", String.valueOf(jobs.getAmount()));
                    pref.savePreferences("CusEmail",jobs.getCusEmail());
                    pref.savePreferences("Site",jobs.getSite());
                    pref.savePreferences("Pest",jobs.getPest());
                    pref.savePreferences("Remarks",jobs.getRemarks());
                    pref.savePreferences("JobAccepted",jobs.getJobAccepted());
                    pref.savePreferences("JobCompleted",jobs.getJobCompleted());
                    pref.savePreferences("Receipt",jobs.getReceipt());
                    pref.savePreferences("Image",jobs.getImage());
                    pref.savePreferences("ImageFill",jobs.getImageFill());
                    pref.savePreferences("jobPest",jobs.getPest());
                    pref.savePreferences("AreaCovered",jobs.getAreaCovered());
                    pref.savePreferences("jobReferenceNo",jobs.getReferenceNo());
                    pref.savePreferences("Technician",jobs.getTechnician());
                    pref.savePreferences("FormType", String.valueOf(jobs.getFormType()));

                    Intent intent = new Intent(mContext, JobsDetailActivity.class);
                    mContext.startActivity(intent);
                    mContext.finish();
                }else if(jobs.getJobType() == 2){
                    pref.savePreferences("maintenance_id", String.valueOf(jobs.getJobID()));
                    pref.savePreferences("maintenance_Address", jobs.getDestination());
                    pref.savePreferences("maintenance_Postal", jobs.getPostal());
                    pref.savePreferences("maintenance_Unit", jobs.getUnit());
                    pref.savePreferences("maintenance_PIC", jobs.getPIC());
                    pref.savePreferences("maintenance_Phone", jobs.getPhone());
                    pref.savePreferences("maintenance_Email", jobs.getCusEmail());
                    pref.savePreferences("maintenance_Site", jobs.getSite());
                    pref.savePreferences("maintenance_CompanyID", String.valueOf(jobs.getAssetCompanyID()));
                    pref.savePreferences("maintenance_NextJobDate", convertDate(jobs.getTimestamp()));
                    pref.savePreferences("maintenance_jobID", String.valueOf(jobs.getMaintenanceJobID()));
                    pref.savePreferences("maintenance_jobTechnician", String.valueOf(jobs.getTechnician()));


                    Intent intent = new Intent(mContext, MaintenanceDetailActivity.class);
                    mContext.startActivity(intent);
                    mContext.finish();
                }

            }
        });

        holder.buttonRoute.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW,
                        Uri.parse("google.navigation:q=" + jobs.getDestination()));
                mContext.startActivity(intent);
            }
        });

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

    @Override
    public int getItemCount() {
        return jobsList.size();
    }

    private void setFadeAnimation(View view) {
        AlphaAnimation anim = new AlphaAnimation(0.0f, 1.0f);
        anim.setDuration(FADE_DURATION);
        view.startAnimation(anim);
    }

    public void acceptAlert(final int position) {
        alert_dialog = new AlertDialog.Builder(mContext);
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle("Accept Job");
        alert_dialog.setMessage("Are you sure you want to Accept the job?");
        alert_dialog.setNegativeButton("No", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alert_dialog.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(final DialogInterface dialog, int which) {
                final Jobs jobs = jobsList.get(position);
                pref.savePreferences("JobID", String.valueOf(jobs.getJobID()));
                pref.savePreferences("JobNumber",jobs.getJobNumber());
                pref.savePreferences("Flag", String.valueOf(jobs.getFlag()));
                pref.savePreferences("FlagValue",jobs.getFlagValue());
                pref.savePreferences("AssetCompanyID", String.valueOf(jobs.getAssetCompanyID()));
                pref.savePreferences("AssetCompany",jobs.getAssetCompany());
                pref.savePreferences("AssetResellerID", String.valueOf(jobs.getAssetResellerID()));
                pref.savePreferences("AssetReseller",jobs.getAssetReseller());
                pref.savePreferences("UserID", String.valueOf(jobs.getUserID()));
                pref.savePreferences("UserName",jobs.getUserName());
                pref.savePreferences("AssetID", String.valueOf(jobs.getAssetID()));
                pref.savePreferences("DriverID", String.valueOf(jobs.getDriverID()));
                pref.savePreferences("DriverName",jobs.getDriverName());
                pref.savePreferences("Timestamp",jobs.getTimestamp());
                pref.savePreferences("RxTime",jobs.getRxTime());
                pref.savePreferences("Company",jobs.getCompany());
                pref.savePreferences("Destination",jobs.getDestination());
                pref.savePreferences("Postal", String.valueOf(jobs.getPostal()));
                pref.savePreferences("Unit",jobs.getUnit());
                pref.savePreferences("PIC",jobs.getPIC());
                pref.savePreferences("Phone",jobs.getPhone());
                pref.savePreferences("Amount", String.valueOf(jobs.getAmount()));
                pref.savePreferences("CusEmail",jobs.getCusEmail());
                pref.savePreferences("Site",jobs.getSite());
                pref.savePreferences("Pest",jobs.getPest());
                //pref.savePreferences("ReportingEmail",jobs.getReportingEmail());
                //pref.savePreferences("ContractStart",jobs.getContractStart());
                //pref.savePreferences("ContractEnd",jobs.getContractEnd());
                //pref.savePreferences("MaintenanceInterval",jobs.getMaintenanceInterval());
                //pref.savePreferences("NotificationInterval",jobs.getNotificationInterval());
                pref.savePreferences("Remarks",jobs.getRemarks());
                pref.savePreferences("JobAccepted",jobs.getJobAccepted());
                pref.savePreferences("JobCompleted",jobs.getJobCompleted());
                pref.savePreferences("Receipt",jobs.getReceipt());
                pref.savePreferences("Image",jobs.getImage());
                pref.savePreferences("ImageFill",jobs.getImageFill());

                Intent intent = new Intent(mContext, JobsDetailActivity.class);
                mContext.startActivity(intent);
            }
        });
        alert_dialog.show();
    }
}

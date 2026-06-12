package sg.acecom.track.systempest.adapter;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.widget.Button;
import android.widget.TextView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sg.acecom.track.systempest.MaintenanceDetailActivity;
import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.model.Maintenance;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 17/4/18.
 */

public class MaintenanceAdapter extends RecyclerView.Adapter<MaintenanceAdapter.MyViewHolder>{

    private Activity mContext;
    private List<Maintenance> maintenanceList;
    private MyPreferences pref;
    AlertDialog.Builder alert_dialog;
    private final static int FADE_DURATION = 100; //FADE_DURATION in milliseconds

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView jobAddress, jobCustomer, jobSite, jobNextMaintenance, jobTechnician;
        public Button buttonView;
        public View jobView;

        public MyViewHolder(View view) {
            super(view);
            jobView = view.findViewById(R.id.jobView);
            jobAddress = view.findViewById(R.id.jobAddress);
            jobSite = view.findViewById(R.id.jobSite);
            jobCustomer = view.findViewById(R.id.jobCustomer);
            jobNextMaintenance = view.findViewById(R.id.jobNextMaintenance);
            buttonView = view.findViewById(R.id.buttonView);
            jobTechnician = view.findViewById(R.id.jobTechnician);
        }
    }


    public MaintenanceAdapter(Activity mContext, List<Maintenance> maintenanceList) {
        this.mContext = mContext;
        this.maintenanceList = maintenanceList;
        pref = new MyPreferences(mContext);
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.cardview_maintenance, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, final int position) {
        // Set the view to fade in
        setFadeAnimation(holder.itemView);
        final Maintenance maintenance = maintenanceList.get(position);

        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        //Change Timestamp Timezone
        Date device_date = cal.getTime();
        String timestamp = new SimpleDateFormat("dd, MMM yyyy").format(device_date);

        // JMINGL 24 - Jan - 2017
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.ENGLISH);
        SimpleDateFormat output = new SimpleDateFormat("dd, MMM yyyy",Locale.ENGLISH);
        Date d = null;
        Date nextJobDate = null;
        try {
            d = sdf.parse(maintenance.getNextJobDate());
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(d);
            //calendar.add(Calendar.HOUR, 8);
            nextJobDate = calendar.getTime();

        } catch (ParseException e) {
            e.printStackTrace();
        }

        if(device_date.after(nextJobDate)){
            holder.jobView.setBackgroundResource(R.color.job_status_inprogress);
        }else{
            holder.jobView.setBackgroundResource(R.color.job_status_grey);
        }

        holder.jobSite.setText(maintenance.getSite());
        holder.jobAddress.setText(maintenance.getUnit() + ", " + maintenance.getAddress() + ", " + maintenance.getPostal());
        holder.jobCustomer.setText(maintenance.getPIC());
        holder.jobNextMaintenance.setText(convertDate(maintenance.getNextJobDate()));
        holder.jobTechnician.setText(maintenance.getTechnician());


        holder.buttonView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                pref.savePreferences("maintenance_id", String.valueOf(maintenance.getMaintenanceID()));
                pref.savePreferences("maintenance_Timestamp", maintenance.getTimestamp());
                pref.savePreferences("maintenance_RxTime", maintenance.getRxTime());
                pref.savePreferences("maintenance_Address", maintenance.getAddress());
                pref.savePreferences("maintenance_Postal", maintenance.getPostal());
                pref.savePreferences("maintenance_Unit", maintenance.getUnit());
                pref.savePreferences("maintenance_PIC", maintenance.getPIC());
                pref.savePreferences("maintenance_Phone", maintenance.getPhone());
                pref.savePreferences("maintenance_Email", maintenance.getEmail());
                pref.savePreferences("maintenance_Site", maintenance.getSite());
                pref.savePreferences("maintenance_ContractStart", maintenance.getContractStart());
                pref.savePreferences("maintenance_ContractEnd", maintenance.getContractEnd());
                pref.savePreferences("maintenance_MaintenanceInterval", maintenance.getMaintenanceInterval());
                pref.savePreferences("maintenance_NotificationInterval", maintenance.getNotificationInterval());
                pref.savePreferences("maintenance_Remarks", maintenance.getRemarks());
                pref.savePreferences("maintenance_CompanyID", String.valueOf(maintenance.getCompanyID()));
                pref.savePreferences("maintenance_NextJobDate", convertDate(maintenance.getNextJobDate()));
                pref.savePreferences("maintenance_jobID", String.valueOf(maintenance.getMaintenanceJobID()));
                pref.savePreferences("maintenance_AreaCovered", String.valueOf(maintenance.getAreaCovered()));
                pref.savePreferences("maintenance_jobReferenceNo", String.valueOf(maintenance.getReferenceNo()));
                pref.savePreferences("maintenance_jobTechnician", String.valueOf(maintenance.getTechnician()));


                Intent intent = new Intent(mContext, MaintenanceDetailActivity.class);
                mContext.startActivity(intent);
                mContext.finish();
            }
        });

    }

    private String convertDate(String date)
    {
        // JMINGL 24 - Jan - 2017
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.ENGLISH);
        SimpleDateFormat output = new SimpleDateFormat("dd, MMM yyyy",Locale.ENGLISH);
        Date d = null;
        Date eightHourBack = null;
        try {
            d = sdf.parse(date);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(d);
            //calendar.add(Calendar.HOUR, 8);
            eightHourBack = calendar.getTime();

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date = output.format(eightHourBack);
    }

    @Override
    public int getItemCount() {
        return maintenanceList.size();
    }

    private void setFadeAnimation(View view) {
        AlphaAnimation anim = new AlphaAnimation(0.0f, 1.0f);
        anim.setDuration(FADE_DURATION);
        view.startAnimation(anim);
    }

}

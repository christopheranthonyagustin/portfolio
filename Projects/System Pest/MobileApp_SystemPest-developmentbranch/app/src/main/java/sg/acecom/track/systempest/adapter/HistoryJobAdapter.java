package sg.acecom.track.systempest.adapter;

import android.app.Activity;

import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.TextView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.model.Jobs;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 17/4/18.
 */

public class HistoryJobAdapter extends RecyclerView.Adapter<HistoryJobAdapter.MyViewHolder> implements Filterable {

    private Activity mContext;
    private List<Jobs> jobsList;
    private List<Jobs> jobsListFiltered;
    private MyPreferences pref;
    private final static int FADE_DURATION = 100; //FADE_DURATION in milliseconds
    private HistoryJobAdapterListenner listener;

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView jobDateTime, jobAddress, jobCustomer, jobPest, jobTechnician, jobFormType, jobType;
        public View jobView;

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

            view.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    // send selected contact in callback

                    listener.onHistoryJobSelected(jobsListFiltered.get(getAdapterPosition()));
                }
            });
        }
    }


    public HistoryJobAdapter(Activity mContext, List<Jobs> jobsList, HistoryJobAdapterListenner listener) {
        this.mContext = mContext;
        this.jobsList = jobsList;
        this.jobsListFiltered = jobsList;
        this.listener = listener;
        pref = new MyPreferences(mContext);
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.cardview_historyjob, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, final int position) {
        // Set the view to fade in
        setFadeAnimation(holder.itemView);
        final Jobs jobs = jobsListFiltered.get(position);

        holder.jobDateTime.setText(convertDate(jobs.getTimestamp()));
        holder.jobAddress.setText(jobs.getUnit() + ", " + jobs.getDestination() + ", " + jobs.getPostal());
        holder.jobCustomer.setText(jobs.getPIC());
        holder.jobPest.setText(jobs.getPest());
        holder.jobView.setBackgroundResource(R.color.job_status_completed);
        holder.jobTechnician.setText(jobs.getTechnician());
        if(jobs.getJobType() == 1){
            holder.jobType.setText("Ad-Hoc");
        }else if(jobs.getJobType() == 2){
            holder.jobType.setText("Maintenance");
        }

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
        return jobsListFiltered.size();
    }

    @Override
    public Filter getFilter() {
        return new Filter() {
            @Override
            protected FilterResults performFiltering(CharSequence charSequence) {
                String charString = charSequence.toString();
                if (charString.isEmpty()) {
                    jobsListFiltered = jobsList;
                } else {
                    List<Jobs> filteredList = new ArrayList<>();
                    for (Jobs row : jobsList) {

                        // name match condition. this might differ depending on your requirement
                        // here we are looking for name or phone number match
                        if (row.getPIC().toLowerCase().contains(charString.toLowerCase()) || row.getDestination().contains(charSequence)) {
                            filteredList.add(row);
                        }
                    }

                    jobsListFiltered = filteredList;
                }

                FilterResults filterResults = new FilterResults();
                filterResults.values = jobsListFiltered;
                return filterResults;
            }

            @Override
            protected void publishResults(CharSequence charSequence, FilterResults filterResults) {
                jobsListFiltered = (ArrayList<Jobs>) filterResults.values;
                notifyDataSetChanged();
            }
        };
    }

    private void setFadeAnimation(View view) {
        AlphaAnimation anim = new AlphaAnimation(0.0f, 1.0f);
        anim.setDuration(FADE_DURATION);
        view.startAnimation(anim);
    }

    public interface HistoryJobAdapterListenner {
        void onHistoryJobSelected(Jobs jobs);
    }
}

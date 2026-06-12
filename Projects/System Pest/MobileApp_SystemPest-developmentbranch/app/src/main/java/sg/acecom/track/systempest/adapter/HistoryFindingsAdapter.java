package sg.acecom.track.systempest.adapter;

import android.app.Activity;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.widget.ImageView;
import android.widget.TextView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.model.Findings;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 17/4/18.
 */

public class HistoryFindingsAdapter extends RecyclerView.Adapter<HistoryFindingsAdapter.MyViewHolder>{

    private Activity mContext;
    private List<Findings> findingsList;
    private MyPreferences pref;
    private final static int FADE_DURATION = 1000; //FADE_DURATION in milliseconds

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView findingsDesc;
        public ImageView imgRemove;

        public MyViewHolder(View view) {
            super(view);
            findingsDesc = view.findViewById(R.id.findingsDesc);
            imgRemove = view.findViewById(R.id.imgRemove);
        }
    }


    public HistoryFindingsAdapter(Activity mContext, List<Findings> findingsList) {
        this.mContext = mContext;
        this.findingsList = findingsList;
        pref = new MyPreferences(mContext);
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.list_findings, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, final int position) {
        final Findings findings = findingsList.get(position);
        /*if(findings.getPestDesc().equals("NO SIGN OF ACTIVE PESTS ACTIVITY")){
            holder.findingsDesc.setText(findings.getPestDesc());
        }else if(findings.getPestDesc().equals("Others")){
            holder.findingsDesc.setText(findings.getAreaConcerned());
        }else{
            holder.findingsDesc.setText(findings.getPestDesc() + " FOUND AT " + findings.getAreaConcerned());
        }*/

        holder.findingsDesc.setText(findings.getFindings());
        holder.imgRemove.setVisibility(View.GONE);

        holder.imgRemove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                findingsList.remove(position);
                notifyDataSetChanged();
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
        return findingsList.size();
    }

    private void setFadeAnimation(View view) {
        AlphaAnimation anim = new AlphaAnimation(0.0f, 1.0f);
        anim.setDuration(FADE_DURATION);
        view.startAnimation(anim);
    }

}

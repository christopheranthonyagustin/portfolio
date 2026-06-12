package sg.acecom.track.systempest.adapter;

import android.app.Activity;

import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.widget.TextView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.model.Pests;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 17/4/18.
 */

public class PestAdapter extends RecyclerView.Adapter<PestAdapter.MyViewHolder>{

    private Activity mContext;
    private List<Pests> pestsList;
    private MyPreferences pref;
    private final static int FADE_DURATION = 1000; //FADE_DURATION in milliseconds

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView pestDesc;
        public TextView treatmentDesc;

        public MyViewHolder(View view) {
            super(view);
            pestDesc = view.findViewById(R.id.pestDesc);
            treatmentDesc = view.findViewById(R.id.treatmentDesc);
        }
    }


    public PestAdapter(Activity mContext, List<Pests> pestsList) {
        this.mContext = mContext;
        this.pestsList = pestsList;
        pref = new MyPreferences(mContext);
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.list_treatment_for, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, int position) {
        final Pests pests = pestsList.get(position);
        holder.pestDesc.setText(pests.getPestDesc());
        holder.treatmentDesc.setText(pests.getTreatmentDesc());

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
        return pestsList.size();
    }

    private void setFadeAnimation(View view) {
        AlphaAnimation anim = new AlphaAnimation(0.0f, 1.0f);
        anim.setDuration(FADE_DURATION);
        view.startAnimation(anim);
    }

}

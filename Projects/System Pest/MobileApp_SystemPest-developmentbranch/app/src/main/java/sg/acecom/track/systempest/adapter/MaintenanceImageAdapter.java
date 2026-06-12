package sg.acecom.track.systempest.adapter;

import android.app.Activity;
import android.app.Dialog;
import android.net.Uri;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.animation.AlphaAnimation;
import android.widget.Button;
import android.widget.ImageView;

import com.bumptech.glide.Glide;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import sg.acecom.track.systempest.MaintenanceDetailActivity;
import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.model.Images;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 17/4/18.
 */

public class MaintenanceImageAdapter extends RecyclerView.Adapter<MaintenanceImageAdapter.MyViewHolder>{

    private Activity mContext;
    private List<Images> imagesList;
    private MyPreferences pref;
    private final static int FADE_DURATION = 1000; //FADE_DURATION in milliseconds

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public ImageView jobImages;

        public MyViewHolder(View view) {
            super(view);
            jobImages = view.findViewById(R.id.jobImages);
        }
    }


    public MaintenanceImageAdapter(Activity mContext, List<Images> imagesList) {
        this.mContext = mContext;
        this.imagesList = imagesList;
        pref = new MyPreferences(mContext);
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.list_image, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, int position) {
        // Set the view to fade in
        setFadeAnimation(holder.itemView);
        final Images img = imagesList.get(position);

        File file = new File(img.getImage_url());
        final Uri imageUri = Uri.fromFile(file);
        Glide.with(mContext).load(imageUri).into(holder.jobImages);

        holder.jobImages.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDialog(mContext, imageUri, img.getImage_url());
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
        return imagesList.size();
    }

    private void setFadeAnimation(View view) {
        AlphaAnimation anim = new AlphaAnimation(0.0f, 1.0f);
        anim.setDuration(FADE_DURATION);
        view.startAnimation(anim);
    }

    public void showDialog(final Activity activity, final Uri imageUrl, final String file_path){
        final Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCancelable(false);
        dialog.setContentView(R.layout.custom_dialog_previmage);

        ImageView jobImages = dialog.findViewById(R.id.jobImages);
        Button buttonDelete = (Button) dialog.findViewById(R.id.buttonDelete);
        Button buttonClose = (Button) dialog.findViewById(R.id.buttonClose);

        Glide.with(activity).load(imageUrl).into(jobImages);

        buttonDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                File file = new File(file_path);
                file.delete();
                if(mContext instanceof MaintenanceDetailActivity){
                    ((MaintenanceDetailActivity)mContext).loadImages();
                }
                dialog.dismiss();
            }
        });

        buttonClose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });

        dialog.show();

    }
}

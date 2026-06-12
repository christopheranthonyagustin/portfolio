package sg.acecom.track.systempest;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import androidx.annotation.Nullable;
import com.google.android.material.snackbar.Snackbar;
import androidx.appcompat.app.AppCompatActivity;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.LinearLayout;

import sg.acecom.track.systempest.fragment.MaintenanceFragment;
import sg.acecom.track.systempest.util.SnackBarUtil;

import static sg.acecom.track.systempest.fragment.MainFragment.SNACKBAR_DURATION;

/**
 * Created by jmingl on 23/4/18.
 */

public class MaintenanceActivity extends AppCompatActivity {

    LinearLayout layout_linear;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_job);
        layout_linear = findViewById(R.id.layout_linear);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setTitle("Maintenance");
        loadFragment(new MaintenanceFragment());
    }

    public void loadFragment(Fragment fragment) {
        FragmentManager fm = getFragmentManager();
        FragmentTransaction fragmentTransaction = fm.beginTransaction();
        fragmentTransaction.replace(R.id.frameLayout, fragment);
        fragmentTransaction.commit(); // save the changes
    }

    @Override
    protected void onResume() {
        super.onResume();
        Bundle bundle = getIntent().getExtras();
        if(bundle != null){
            String job_status = getIntent().getExtras().getString("job_status");

            if(job_status.equals("Completed")){
                snackBarStatus();
            }
        }
    }

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

        return super.onOptionsItemSelected(item);
    }

    public void snackBarStatus(){
        Snackbar snackbar = Snackbar
                .make(layout_linear, "Job Completed...",SNACKBAR_DURATION)
                .setAction("UNDO", new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        Log.d("", " The contact is restored ");
                    }
                });
        // You can replace the above lines by using the below single line :)
        snackbar= SnackBarUtil.getColorfulSnackBar(snackbar,this,R.color.colorPrimaryDark,R.color.white,R.color.white);

        snackbar.show();
    }

}

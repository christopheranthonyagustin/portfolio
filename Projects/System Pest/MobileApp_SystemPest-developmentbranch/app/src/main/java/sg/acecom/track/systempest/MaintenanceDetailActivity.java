package sg.acecom.track.systempest;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.app.TimePickerDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.os.StrictMode;
import android.provider.MediaStore;
import androidx.annotation.Nullable;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.androidquery.AQuery;
import com.androidquery.callback.AjaxCallback;
import com.androidquery.callback.AjaxStatus;
import com.bumptech.glide.Glide;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;

import sg.acecom.track.systempest.adapter.AocAdapter;
import sg.acecom.track.systempest.adapter.FindingsAdapter;
import sg.acecom.track.systempest.adapter.MaintenanceImageAdapter;
import sg.acecom.track.systempest.adapter.PestAdapter;
import sg.acecom.track.systempest.adapter.RecommendationsAdapter;
import sg.acecom.track.systempest.forms.PageHeaderFooter;
import sg.acecom.track.systempest.forms.PageHeaderFooterMalaysia;
import sg.acecom.track.systempest.model.AreaConcerned;
import sg.acecom.track.systempest.model.Findings;
import sg.acecom.track.systempest.model.Images;
import sg.acecom.track.systempest.model.Mail;
import sg.acecom.track.systempest.model.Pests;
import sg.acecom.track.systempest.model.Recommendations;
import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.AppController;
import sg.acecom.track.systempest.util.MyPreferences;

import static android.provider.MediaStore.Files.FileColumns.MEDIA_TYPE_VIDEO;

/**
 * Created by jmingl on 23/4/18.
 */

public class MaintenanceDetailActivity extends AppCompatActivity implements View.OnClickListener{

    //MaintenanceJobInformation;
    int maintenancejob_MaintenanceJobID;
    int maintenancejob_MaintenanceID;
    String maintenancejob_AlertDate;
    String maintenancejob_Timestamp;
    String maintenancejob_RxTime;
    String maintenancejob_Flag;
    String maintenancejob_FlagValue;
    String maintenancejob_JobCancelled;
    String maintenancejob_CancelRemarks;
    String maintenancejob_ReferenceNo;
    int maintenancejob_isSent;

    int update_MaintenanceID;
    String update_Timestamp;
    String update_RxTime;
    String update_Address;
    String update_Postal;
    String update_Unit;
    String update_CusCompany;
    String update_PIC;
    String update_Phone;
    String update_Email;
    String update_Site;
    String update_ContractStart;
    String update_ContractEnd;
    String update_MaintenanceInterval;
    String update_NotificationInterval;
    String update_Remarks;
    int update_CompanyID;
    int update_UserID;

    private TextView jobReference;
    private TextView cusName;
    private EditText cusEmail;
    private TextView jobDateTime;
    private TextView jobAreaCovered;
    private TextView jobDestination;
    private TextView jobPest;
    private TextView jobTechnician;
    private TextView jobAmount;
    private Button buttonReschedule;
    private EditText jobNewAmount;
    private TextView jobAdminRemarks;
    private Button buttonCalender;
    private RecyclerView recyclerTreatment;
    private RecyclerView recyclerAreaConcerned;
    private FloatingActionButton fabAreaConcerned;
    private FloatingActionButton fabCamera;
    private RecyclerView recyclerFindings;
    private RecyclerView recyclerImages;
    private RecyclerView recyclerRecommandations;
    private FloatingActionButton fabFindings;
    private FloatingActionButton fabRecommendations;
    private EditText jobRemarks;
    private RadioGroup radioPayment;
    private RadioButton radioCash;
    private RadioButton radioCheque;
    private RadioButton radioIB;
    private RadioButton radioNone;
    private Button buttonBack;
    private Button buttonRoute;
    private Button buttonDone;
    private LinearLayout ll_amount;
    Calendar date;

    private MaintenanceImageAdapter img_adapter;
    private List<Images> imagesList;
    private PestAdapter pestAdapter;
    private List<Pests> pestsList;
    private AocAdapter aocAdapter;
    private List<AreaConcerned> aocFinalList;
    private FindingsAdapter findingsAdapter;
    private List<Findings> findingsList;
    private RecommendationsAdapter recommendationsAdapter;
    private List<Recommendations> recFinalList;
    //Area of Concerned
    final ArrayList<String> singlePestList = new ArrayList();
    final ArrayList<String> aocList = new ArrayList();
    final ArrayList<String> recList = new ArrayList();
    final ArrayList<String> selectedAoc = new ArrayList();
    final ArrayList<String> selectedRec = new ArrayList();

    ProgressDialog nDialog;

    MyPreferences pref;
    // Activity request codes
    private static final int CAMERA_CAPTURE_IMAGE_REQUEST_CODE = 100;
    public static final int MEDIA_TYPE_IMAGE = 1;

    // directory name to store captured images and videos
    private static final String IMAGE_DIRECTORY_NAME = "SystemPestCamera";

    private Uri fileUri; // file url to store image/video/

    // /creating a PdfWriter variable.
    private PdfWriter pdfWriter;
    private int PERMISSION_REQUEST_WRITE = 0;

    //Signatures
    final String DIRECTORY_CLIENT_SIGNATURE = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceClient/";
    final String DIRECTORY_TECHNICIAN_SIGNATURE = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceTechnician/";

    Bitmap bitmap;
    LinearLayout mContent;
    Button mGetSign;
    Button mClear;
    Button mCancel;
    TextView titleSignature;
    TextView labelTitle;
    File file;
    Dialog dialog;
    View view;
    signature mSignature;

    Bitmap bitmap_tech;
    LinearLayout mContent_tech;
    Button mGetSign_tech;
    Button mClear_tech;
    Button mCancel_tech;
    TextView titleSignature_tech;
    TextView labelTitle_tech;
    File file_tech;
    Dialog dialog_tech;
    View view_tech;
    signature_tech mSignature_tech;

    private int mYear, mMonth, mDay, mHour, mMinute;
    private String scheduledDate, scheduledTime;

    AlertDialog.Builder alert_dialog;

    ProgressDialog pDialog;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_detail);
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
        jobAdminRemarks = findViewById( R.id.jobAdminRemarks );
        jobNewAmount = findViewById( R.id.jobNewAmount );
        buttonCalender = findViewById( R.id.buttonCalender );
        buttonReschedule = findViewById( R.id.buttonReschedule );
        recyclerTreatment = findViewById( R.id.recyclerTreatment );
        recyclerAreaConcerned = findViewById( R.id.recyclerAreaConcerned );
        recyclerImages = findViewById( R.id.recyclerImages );
        fabAreaConcerned = findViewById( R.id.fabAreaConcerned );
        fabCamera = findViewById( R.id.fabCamera );
        recyclerFindings = findViewById( R.id.recyclerFindings );
        fabFindings = findViewById( R.id.fabFindings );
        recyclerRecommandations = findViewById( R.id.recyclerRecommandations );
        fabRecommendations = findViewById( R.id.fabRecommendations );
        jobRemarks = findViewById( R.id.jobRemarks );
        radioPayment = findViewById( R.id.radioPayment );
        radioCash = findViewById( R.id.radioCash );
        radioCheque = findViewById( R.id.radioCheque );
        radioIB = findViewById( R.id.radioIB );
        radioNone = findViewById( R.id.radioNone );
        buttonBack = findViewById( R.id.buttonBack );
        buttonRoute = findViewById( R.id.buttonRoute );
        buttonDone = findViewById( R.id.buttonDone );
        ll_amount = findViewById( R.id.ll_amount );

        imagesList = new ArrayList<>();
        img_adapter = new MaintenanceImageAdapter(this, imagesList);
        recyclerImages.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false));
        recyclerImages.setItemAnimator(new DefaultItemAnimator());
        recyclerImages.setAdapter(img_adapter);

        pestsList = new ArrayList<>();
        pestAdapter = new PestAdapter(this, pestsList);
        recyclerTreatment.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        recyclerTreatment.setItemAnimator(new DefaultItemAnimator());
        recyclerTreatment.setAdapter(pestAdapter);

        aocFinalList = new ArrayList<>();
        aocAdapter = new AocAdapter(this, aocFinalList);
        recyclerAreaConcerned.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        recyclerAreaConcerned.setItemAnimator(new DefaultItemAnimator());
        recyclerAreaConcerned.setAdapter(aocAdapter);

        findingsList = new ArrayList<>();
        findingsAdapter = new FindingsAdapter(this, findingsList);
        recyclerFindings.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        recyclerFindings.setItemAnimator(new DefaultItemAnimator());
        recyclerFindings.setAdapter(findingsAdapter);

        recFinalList = new ArrayList<>();
        recommendationsAdapter = new RecommendationsAdapter(this, recFinalList);
        recyclerRecommandations.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        recyclerRecommandations.setItemAnimator(new DefaultItemAnimator());
        recyclerRecommandations.setAdapter(recommendationsAdapter);

        buttonCalender.setOnClickListener( this );
        fabAreaConcerned.setOnClickListener( this );
        fabFindings.setOnClickListener( this );
        fabCamera.setOnClickListener( this );
        fabRecommendations.setOnClickListener( this );
        buttonBack.setOnClickListener( this );
        buttonRoute.setOnClickListener( this );
        buttonDone.setOnClickListener( this );
        buttonReschedule.setOnClickListener( this );

        radioNone.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked){
                    radioCheque.setChecked(false);
                    radioIB.setChecked(false);
                    radioCash.setChecked(false);
                }
            }
        });

        radioCash.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked){
                    radioCheque.setChecked(false);
                    radioIB.setChecked(false);
                    radioNone.setChecked(false);
                }
            }
        });

        radioCheque.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked){
                    radioCash.setChecked(false);
                    radioIB.setChecked(false);
                    radioNone.setChecked(false);
                }
            }
        });

        radioIB.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked){
                    radioCash.setChecked(false);
                    radioCheque.setChecked(false);
                    radioNone.setChecked(false);
                }
            }
        });

        initContent();

        // Checking camera availability
        if (!isDeviceSupportCamera()) {
            Toast.makeText(getApplicationContext(),
                    "Sorry! Your device doesn't support camera",
                    Toast.LENGTH_LONG).show();
            // will close the app if the device does't have camera
            finish();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        loadImages();
        loadMaintenanceJob();
        loadMaintenance();
        //loadPestList();
        loadPestInformation();
        loadAOC();
        loadRecommendations();
    }

    private void loadMaintenanceJob(){
        final String url = AppConstant.endpoint_url + "maintenancejobinfo/" + pref.getPreferences("maintenance_jobID","");
        //Log.e("MaintennceJob URL : ", url);
        // prepare the Request
        JsonObjectRequest getRequest = new JsonObjectRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONObject>()
                {
                    @Override
                    public void onResponse(JSONObject response) {
                        // display response
                        try{

                            maintenancejob_MaintenanceJobID = response.getInt("MaintenanceJobID");
                            maintenancejob_MaintenanceID = response.getInt("MaintenanceID");
                            maintenancejob_AlertDate = response.getString("AlertDate");
                            maintenancejob_Timestamp = response.getString("Timestamp");
                            maintenancejob_RxTime = response.getString("RxTime");
                            maintenancejob_Flag = response.getString("Flag");
                            maintenancejob_JobCancelled = response.getString("JobCancelled");
                            maintenancejob_CancelRemarks = response.getString("CancelRemarks");
                            maintenancejob_isSent = response.getInt("isSent");
                            maintenancejob_ReferenceNo = response.getString("ReferenceNo");
                            //JSONObject obj = response.getJSONObject(0);

                            //Log.e("Response : ", response.getString(""MaintenanceJobID));
                            //response.getString()


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
    public void onBackPressed() {
        //super.onBackPressed();
        backDialog("Alert", "Are you sure you want to exit the job?");

        //removePreferences();
    }

    @Override
    public void onClick(View v) {
        Intent intent;
        switch(v.getId()){
            case(R.id.buttonCalender):
                selectDatePicker();
                break;

            case(R.id.fabAreaConcerned):
                areaConcernedDialog();
                break;

            case(R.id.fabFindings):
                PestHeaderDialog();
                //PestDialog();
                break;

            case(R.id.fabCamera):
                captureImage();
                break;

            case(R.id.fabRecommendations):
                recommendationDialog();
                break;

            case(R.id.buttonBack):
                //onBackPressed();
                backDialog("Alert", "Are you sure you want to exit the job?");

                break;

            case(R.id.buttonReschedule):
                datePickerDialog();
                break;

            case(R.id.buttonRoute):
                intent = new Intent(Intent.ACTION_VIEW,
                        Uri.parse("google.navigation:q=" + "542275"));
                startActivity(intent);
                break;

            case(R.id.buttonDone):

                completeDialog("Alert", "Are you sure the job has completed?");

                //updateMaintenanceJob();
                break;
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

    public void selectDatePicker() {
        final Calendar currentDate = Calendar.getInstance();
        date = Calendar.getInstance();

        DatePickerDialog dpDialog = new DatePickerDialog(this, new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                date.set(year, monthOfYear, dayOfMonth);

                SimpleDateFormat format = new SimpleDateFormat("dd MMM yyyy",Locale.ENGLISH);
                String strDate = format.format(date.getTime());
                SimpleDateFormat formatTime = new SimpleDateFormat("dd-MMM-yyyy 00:00:00",Locale.ENGLISH);
                //Log.e("Date seelcted", formatTime.format(date.getTime()));
            }
        }, currentDate.get(Calendar.YEAR), currentDate.get(Calendar.MONTH), currentDate.get(Calendar.DATE));

        dpDialog.getDatePicker().setMinDate(System.currentTimeMillis() - 1000);
        dpDialog.show();
    }

    private boolean isDeviceSupportCamera() {
        if (getApplicationContext().getPackageManager().hasSystemFeature(
                PackageManager.FEATURE_CAMERA)) {
            // this device has a camera
            return true;
        } else {
            // no camera on this device
            return false;
        }
    }

    private void captureImage() {
        try{
            StrictMode.VmPolicy.Builder builder = new StrictMode.VmPolicy.Builder();
            StrictMode.setVmPolicy(builder.build());
            Intent intent = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
            fileUri = getOutputMediaFileUri(MEDIA_TYPE_IMAGE);
            intent.putExtra(MediaStore.EXTRA_OUTPUT, fileUri);
            // start the image capture Intent
            startActivityForResult(intent, CAMERA_CAPTURE_IMAGE_REQUEST_CODE);
        }catch(Exception e){
            Log.e("Exception IMage : ", String.valueOf(e));
        }
    }

    /*
	 * Here we store the file url as it will be null after returning from camera
	 * app
	 */
    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);

        // save file url in bundle as it will be null on scren orientation
        // changes
        outState.putParcelable("file_uri", fileUri);

    }

    @Override
    protected void onRestoreInstanceState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);

        // get the file url
        fileUri = savedInstanceState.getParcelable("file_uri");
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        // if the result is capturing Image
        if (requestCode == CAMERA_CAPTURE_IMAGE_REQUEST_CODE) {
            if (resultCode == RESULT_OK) {
                // successfully captured the image
                // display it in image view

                showImageDialog(MaintenanceDetailActivity.this, fileUri);

            } else if (resultCode == RESULT_CANCELED) {
                // user cancelled Image capture
                Toast.makeText(getApplicationContext(),
                        "User cancelled image capture", Toast.LENGTH_SHORT)
                        .show();
            } else {
                // failed to capture image
                Toast.makeText(getApplicationContext(),
                        "Sorry! Failed to capture image", Toast.LENGTH_SHORT)
                        .show();
            }
        }
    }

    public void showImageDialog(final Activity activity, final Uri imageUrl){
        final Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCancelable(false);
        dialog.setContentView(R.layout.custom_dialog_image);

        final ImageView jobImages = dialog.findViewById(R.id.jobImages);
        Button buttonDelete = (Button) dialog.findViewById(R.id.buttonDelete);
        Button buttonClose = (Button) dialog.findViewById(R.id.buttonClose);
        final Spinner spinnerPest = dialog.findViewById(R.id.spinnerPest);
        final EditText imageText = dialog.findViewById(R.id.imageText);
        final TextView imageDisplayText = dialog.findViewById(R.id.imageDisplayText);
        final LinearLayout layoutImage = dialog.findViewById(R.id.layoutImage);

       /* ArrayAdapter<String> adapter = new ArrayAdapter<String>(JobsDetailActivity.this,
                android.R.layout.simple_spinner_item, singlePestList);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerPest.setAdapter(adapter);*/

        Glide.with(activity).load(imageUrl).into(jobImages);

        imageText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                imageDisplayText.setText(imageText.getText().toString().toUpperCase());
            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });

        buttonClose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                /*Image image = new Image();
                image.setJobID(pref.getPreferences("JobID",""));
                image.setTitle(spinnerPest.getSelectedItem().toString());
                image.setImage(imageUrl);
                imageList.add(image);*/

                SaveImage(setViewToBitmapImage(layoutImage));

                loadImages();

                dialog.dismiss();
            }
        });

        dialog.show();

    }

    public static Bitmap setViewToBitmapImage(View view) {
        //Define a bitmap with the same size as the view
        Bitmap returnedBitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888);
        //Bind a canvas to it
        Canvas canvas = new Canvas(returnedBitmap);
        //Get the view's background
        Drawable bgDrawable = view.getBackground();
        if (bgDrawable != null)
            //has background drawable, then draw it on the canvas
            bgDrawable.draw(canvas);
        else
            //does not have background drawable, then draw white background on the canvas
            canvas.drawColor(Color.WHITE);
        // draw the view on the canvas
        view.draw(canvas);
        //return the bitmap
        return returnedBitmap;
    }

    public static void SaveImage(Bitmap finalBitmap) {
        String root = Environment.getExternalStorageDirectory().toString();
        File myDir = new File(root + "/saved_main_pests");
        if (!myDir.exists()) {
            myDir.mkdir();
        }
        Random generator = new Random();
        int n = 10000;
        n = generator.nextInt(n);
        String fname = "Image-" + n + ".jpg";
        File file = new File(myDir, fname);
        if (file.exists()) file.delete();
        try {
            FileOutputStream out = new FileOutputStream(file);
            finalBitmap.compress(Bitmap.CompressFormat.JPEG, 90, out);
            out.flush();
            out.close();

        } catch (Exception e) {
            Log.e("Error SaveImage ", String.valueOf(e));
            e.printStackTrace();
        }
    }


    public Bitmap drawTextToBitmap(Context mContext, String photoPath, String mText) {
        try {
            Resources resources = mContext.getResources();
            float scale = resources.getDisplayMetrics().density;
            /*Bitmap bitmap = BitmapFactory.decodeResource(resources, resourceId);

            android.graphics.Bitmap.Config bitmapConfig =   bitmap.getConfig();
            // set default bitmap config if none
            if(bitmapConfig == null) {
                bitmapConfig = android.graphics.Bitmap.Config.ARGB_8888;
            }*/

            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inPreferredConfig = Bitmap.Config.ARGB_8888;
            Bitmap bitmap = BitmapFactory.decodeFile(photoPath, options);
            //selected_photo.setImageBitmap(bitmap);

            // resource bitmaps are imutable,
            // so we need to convert it to mutable one
            //bitmap = bitmap.copy(bitmapConfig, true);

            Canvas canvas = new Canvas(bitmap);
            // new antialised Paint
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            // text color - #3D3D3D
            paint.setColor(Color.rgb(110,110, 110));
            // text size in pixels
            paint.setTextSize((int) (12 * scale));
            // text shadow
            paint.setShadowLayer(1f, 0f, 1f, Color.DKGRAY);

            // draw text to the Canvas center
            Rect bounds = new Rect();
            paint.getTextBounds(mText, 0, mText.length(), bounds);
            int x = (bitmap.getWidth() - bounds.width())/6;
            int y = (bitmap.getHeight() + bounds.height())/5;

            canvas.drawText(mText, x * scale, y * scale, paint);

            return bitmap;
        } catch (Exception e) {
            // TODO: handle exception



            return null;
        }

    }

    /**
     * ------------ Helper Methods ----------------------
     * */

	/*
	 * Creating file uri to store image/video
	 */
    public Uri getOutputMediaFileUri(int type) {
        return Uri.fromFile(getOutputMediaFile(type));
    }

    /*
     * returning image / video
     */
    private static File getOutputMediaFile(int type) {

        // External sdcard location
        File mediaStorageDir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES),
                IMAGE_DIRECTORY_NAME);

        // Create the storage directory if it does not exist
        if (!mediaStorageDir.exists()) {
            if (!mediaStorageDir.mkdirs()) {
                Log.d(IMAGE_DIRECTORY_NAME, "Oops! Failed create "
                        + IMAGE_DIRECTORY_NAME + " directory");
                return null;
            }
        }

        // Create a media file name
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss",
                Locale.getDefault()).format(new Date());
        File mediaFile;
        if (type == MEDIA_TYPE_IMAGE) {
            mediaFile = new File(mediaStorageDir.getPath() + File.separator
                    + "IMG_" + timeStamp + ".jpg");
        } else if (type == MEDIA_TYPE_VIDEO) {
            mediaFile = new File(mediaStorageDir.getPath() + File.separator
                    + "VID_" + timeStamp + ".mp4");
        } else {
            return null;
        }

        return mediaFile;
    }

    public void loadImages(){
        /*File img_Path = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)
                .getPath() + "/" + IMAGE_DIRECTORY_NAME);*/
        String root = Environment.getExternalStorageDirectory().toString();
        File img_Path = new File(root + "/saved_main_pests");
        if(img_Path.exists()){
            String[] fileNames = img_Path.list();
            int imageCount = img_Path.listFiles().length;
            imagesList.clear();
            for (int i = 0; i < imageCount; i++) {
                Bitmap mBitmap = BitmapFactory.decodeFile(img_Path.getPath()+"/"+ fileNames[i]);
                Images img = new Images();
                img.setImage_url(img_Path.getPath()+"/"+ fileNames[i]);
                imagesList.add(img);
            }

            img_adapter.notifyDataSetChanged();
        }
    }

    private void loadPestInformation(){
        final String url = AppConstant.endpoint_url + "maintenancejobinfo/" + pref.getPreferences("maintenance_jobID","");
        //Log.e("Pest URL : ", url);
        // prepare the Request
        JsonObjectRequest getRequest = new JsonObjectRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONObject>()
                {
                    @Override
                    public void onResponse(JSONObject response) {
                        // display response
                        try{
                            pestsList.clear();
                            singlePestList.clear();
                            StringBuilder pestBuilder = new StringBuilder();
                            JSONArray pestArray = new JSONArray(response.getString("Pest"));
                            for(int i = 0; i < pestArray.length(); i++){
                                JSONObject pestInfo = pestArray.getJSONObject(i);
                                singlePestList.add(pestInfo.getString("PestDesc"));
                                if(pestArray.length() == 1 || i + 1 == pestArray.length()){
                                    pestBuilder.append(pestInfo.getString("PestDesc"));
                                }else{
                                    pestBuilder.append(pestInfo.getString("PestDesc"));
                                    pestBuilder.append(", ");
                                }
                                pestsList.add(new Pests(pestInfo.getInt("ItemNo"), pestInfo.getString("PestDesc"), pestInfo.getString("TreatmentDesc")));
                                pestAdapter.notifyDataSetChanged();
                            }
                            //response.getString()

                            jobPest.setText(pestBuilder.toString());

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

    private void loadAOC(){
        final String url = AppConstant.endpoint_url + "aocinfo";
        //Log.e("Pest URL : ", url);
        // prepare the Request
        JsonArrayRequest getRequest = new JsonArrayRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONArray>()
                {
                    @Override
                    public void onResponse(JSONArray response) {
                        // display response
                        aocList.clear();
                        try{
                            for (int i = 0; i < response.length(); i++) {
                                JSONObject aocObj = response.getJSONObject(i);

                                aocList.add(aocObj.getString("AocDesc"));
                            }

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

    private void loadRecommendations(){
        final String url = AppConstant.endpoint_url + "recommendationsinfo";
        //Log.e("Pest URL : ", url);
        // prepare the Request
        JsonArrayRequest getRequest = new JsonArrayRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONArray>()
                {
                    @Override
                    public void onResponse(JSONArray response) {
                        // display response
                        recList.clear();
                        recFinalList.clear();
                        //recommendationsList.clear();
                        try{
                            for (int i = 0; i < response.length(); i++) {
                                Recommendations rec = new Recommendations();
                                JSONObject recObj = response.getJSONObject(i);
                                recList.add(recObj.getString("Recommendation"));
                                rec.setRecommendationDesc(recObj.getString("Recommendation"));
                                recFinalList.add(rec);
                                //recommendationsList.add(new Recommendations(recObj.getInt("RecommendationsID"), recObj.getString("Recommendation")));
                            }
                            recommendationsAdapter.notifyDataSetChanged();

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

    private void initContent(){
        /*Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        //Change Timestamp Timezone
        Date device_date = cal.getTime();
        String timestamp = new SimpleDateFormat("dd, MMM yyyy").format(device_date);

        // JMINGL 24 - Jan - 2017
        SimpleDateFormat sdf = new SimpleDateFormat("dd, MMM yyyy", Locale.ENGLISH);
        Date d = null;
        Date nextJobDate = null;
        try {
            d = sdf.parse(pref.getPreferences("maintenance_NextJobDate",""));
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(d);
            //calendar.add(Calendar.HOUR, 8);
            nextJobDate = calendar.getTime();

        } catch (ParseException e) {
            e.printStackTrace();
        }

        if(device_date.after(nextJobDate) || device_date.equals(nextJobDate)){
            buttonDone.setVisibility(View.VISIBLE);
        }else{
            buttonDone.setVisibility(View.GONE);
        }*/
        String destinationAddress;
        if(pref.getPreferences("maintenance_Unit","").equals("")){
            destinationAddress = pref.getPreferences("maintenance_Destination","") + ", " +
                    pref.getPreferences("maintenance_Postal","");
        }else{
            destinationAddress = pref.getPreferences("maintenance_Unit","") + ", " +
                    pref.getPreferences("maintenance_Destination","") + ", " +
                    pref.getPreferences("maintenance_Postal","");
        }



        cusName.setText(pref.getPreferences("maintenance_PIC",""));
        if(pref.getPreferences("maintenance_Email","").equals("")){
            cusEmail.setInputType(InputType.TYPE_CLASS_TEXT);
        }else{
            cusEmail.setText(pref.getPreferences("maintenance_Email",""));
            cusEmail.setInputType(0);
        }
        jobDateTime.setText(pref.getPreferences("maintenance_NextJobDate",""));
        jobDestination.setText(destinationAddress);
        jobAmount.setText(pref.getPreferences("maintenance_Amount",""));
        jobAreaCovered.setText(pref.getPreferences("maintenance_Site",""));
        jobReference.setText(pref.getPreferences("maintenance_ReferenceNo",""));
        jobTechnician.setText(pref.getPreferences("maintenance_jobTechnician",""));
        jobAdminRemarks.setText(pref.getPreferences("maintenance_Remarks",""));
        jobReference.setText(pref.getPreferences("maintenance_ReferenceNo",""));

        buttonReschedule.setVisibility(View.GONE);
        fabRecommendations.setVisibility(View.GONE);
        ll_amount.setVisibility(View.GONE);

        loadPestInformation();

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


    private void generatePDF()
    {

        showDialog();

        try{
            File directory = new File(Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceService");
            //String bpPath = Environment.getExternalStorageDirectory().getPath() + "/Calpeda-Project/" + pref.getPreferences("ProjectID","");

            if(!directory.exists()){
                directory.mkdirs();
            }
        }catch(Exception e){
            Log.e("Create Path : ",String.valueOf(e));
        }

        try {

            String clientPath = DIRECTORY_CLIENT_SIGNATURE + pref.getPreferences("maintenance_jobID","") + ".png";
            String techPath = DIRECTORY_TECHNICIAN_SIGNATURE + pref.getPreferences("maintenance_jobID","") + ".png";

            Calendar cal = Calendar.getInstance();
            cal.setTime(Calendar.getInstance().getTime());
            //Change Timestamp Timezone
            Date eightHourBack = cal.getTime();
            String timestamp = new SimpleDateFormat("ddMMMyyyy").format(eightHourBack);
            String filename = pref.getPreferences("maintenance_jobID","") + "-" + timestamp + ".pdf";

            String mPath = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceService/"  + "/" + filename;
            //getting the full path of the PDF report name
            //String mPath = Environment.getExternalStorageDirectory().toString() + "/One.pdf"; //reportName could be any name

            //constructing the PDF file
            File pdfFile = new File(mPath);

            //Creating a Document with size A4. Document class is available at  com.itextpdf.text.Document
            Document document;

            if(pref.getPreferences("maintenance_CompanyID","").equals("1")){
                document = new Document(PageSize.A4, 36, 36, 130, 180);
                pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
                //PageFooter is an inner class of this class which is responsible to create Header and Footer
                PageHeaderFooter event = new PageHeaderFooter(this, "SystemPest Service Order", clientPath, techPath, Integer.parseInt(pref.getPreferences("maintenance_CompanyID","")));
                pdfWriter.setPageEvent(event);
            }else if(pref.getPreferences("maintenance_CompanyID","").equals("2")){
                document = new Document(PageSize.A4, 36, 36, 130, 250);

                pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
                //PageFooter is an inner class of this class which is responsible to create Header and Footer
                PageHeaderFooterMalaysia event = new PageHeaderFooterMalaysia(this, "SystemPest Malaysia Service Order", clientPath, techPath);
                pdfWriter.setPageEvent(event);
            }else if(pref.getPreferences("maintenance_CompanyID","").equals("3")){
                document = new Document(PageSize.A4, 36, 36, 130, 180);
                pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
                //PageFooter is an inner class of this class which is responsible to create Header and Footer
                PageHeaderFooter event = new PageHeaderFooter(this, "Asia White Ant Service Order", clientPath, techPath, Integer.parseInt(pref.getPreferences("maintenance_CompanyID","")));
                pdfWriter.setPageEvent(event);
            }else{
                document = new Document(PageSize.A4, 36, 36, 130, 150);
                pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
                //PageFooter is an inner class of this class which is responsible to create Header and Footer
                PageHeaderFooter event = new PageHeaderFooter(this, "SystemPest Service Order", clientPath, techPath, Integer.parseInt(pref.getPreferences("maintenance_CompanyID","")));
                pdfWriter.setPageEvent(event);
            }


            //Before writing anything to a document it should be opened first
            document.open();

            //Adding meta-data to the document
            addMetaData(document);

            //Adding Title(s) of the document
            //addTitlePage(document);

            //Adding main contents of the document
            addContent(document);

            //Closing the document
            document.close();

            File job_pdf = new File(mPath);
            if(job_pdf.exists()){
                new MaintenanceDetailActivity.uploadClientSignatures().execute();
            }else{
                connectionFailedDialog("PDF generated not found.", "Please try again.");
            }


            //Log.e("PDF ", "Created...");
        } catch (Exception e) {
            e.printStackTrace();
            //Log.e("PDF ", String.valueOf(e));

        }
    }

    /**
     *  iText allows to add metadata to the PDF which can be viewed in your Adobe Reader. If you right click
     *  on the file and to to properties then you can see all these information.
     * @param document
     */
    private void addMetaData(Document document) {
        document.addTitle("SystemPest Service");
        document.addSubject("");
        document.addKeywords("Service");
        document.addAuthor("");
        document.addCreator("");
    }

    /**
     * This method is used to add empty lines in the document
     * @param paragraph
     * @param number
     */
    private void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }

    /**
     * In this method the main contents of the documents are added
     * @param document
     * @throws DocumentException
     */

    private void addContent(Document document) throws DocumentException {

        Paragraph reportBody = new Paragraph();


        createJobHeader(reportBody);

        try{
            createAreaConcerned(reportBody, 1);
            addEmptyLine(reportBody, 1);
            for(int i = 0; i < pestsList.size(); i ++){
                createInnerContents(reportBody, i);
                //addEmptyLine(reportBody, 1);
            }
        }catch(Exception e){
            Log.e("Error :", String.valueOf(e));
        }

        //document.newPage();
        createImages(reportBody);
        createRemarks(reportBody);

        addEmptyLine(reportBody, 1);

        //createSignatureArea(reportBody);


        // now add all this to the document
        document.add(reportBody);

    }

    /**
     * This method is responsible to add table using iText
     * @param reportBody
     * @throws BadElementException
     */
    private void createJobHeader(Paragraph reportBody)
            throws BadElementException {

        float[] columnWidths = {2,2,1,2,1}; //total 5 columns and their width. The first three columns will take the same width and the fourth one will be 5/2.
        PdfPTable table = new PdfPTable(columnWidths);

        table.setWidthPercentage(100); //set table with 100% (full page)
        table.getDefaultCell().setUseAscender(true);

        //First Line
        PdfPCell cell = new PdfPCell(new Phrase("SERVICE ADDRESS   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        String fullAddress = "";
        String unitNo = pref.getPreferences("maintenance_Unit","");
        if(unitNo == ""){
            fullAddress = unitNo + " " + jobDestination.getText().toString();
        }else{
            fullAddress = jobDestination.getText().toString();
        }


        cell = new PdfPCell(new Phrase(jobDestination.getText().toString().toUpperCase(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(2);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //REPORT NO
        cell = new PdfPCell(new Phrase("REPORT NO   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase( pref.getPreferences("maintenance_jobID",""), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);

        //Second Line
        /*cell = new PdfPCell(new Phrase("AREA COVERED   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);*/

        cell = new PdfPCell(new Phrase("                ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(pref.getPreferences("maintenance_Site","").toUpperCase(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(2);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("REFERENCE NO   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(pref.getPreferences("maintenance_ReferenceNo",""), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);

        //Third Line
        cell = new PdfPCell(new Phrase("PAYMENT   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);


        if(radioCash.isChecked()){
            cell = new PdfPCell(new Phrase("CASH : $" + jobNewAmount.getText().toString(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
            //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setColspan(2);
            //cell.setFixedHeight(30); //cell height
            table.addCell(cell);
        }else if(radioCheque.isChecked()){
            cell = new PdfPCell(new Phrase("CHEQUE : $" + jobNewAmount.getText().toString(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
            //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setColspan(2);
            //cell.setFixedHeight(30); //cell height
            table.addCell(cell);
        }else if(radioIB.isChecked()){
            cell = new PdfPCell(new Phrase("INTERNET BANKING : $" + jobNewAmount.getText().toString(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
            //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setColspan(2);
            //cell.setFixedHeight(30); //cell height
            table.addCell(cell);
        }else if(radioNone.isChecked()){
            cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
            //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setColspan(2);
            //cell.setFixedHeight(30); //cell height
            table.addCell(cell);
        }

        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        //Change Timestamp Timezone
        Date eightHourBack = cal.getTime();
        String timestamp = new SimpleDateFormat("dd - MMM - yyyy").format(eightHourBack);

        cell = new PdfPCell(new Phrase("DATE   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(timestamp, FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);

        String technician = pref.getPreferences("maintenance_jobTechnician","");
        String driver_text = "";
        if(technician.equals("")){
            driver_text = pref.getPreferences("driver_name","");
        }else{
            driver_text = pref.getPreferences("driver_name","") + ", " + technician;
        }


        //Add Driver and Techinician
        cell = new PdfPCell(new Phrase("TECHNICIAN   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(driver_text.toUpperCase(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);



        cell = new PdfPCell(new Phrase("  ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);


        cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        //cell.setFixedHeight(10); //cell height
        table.addCell(cell);


       /* //Second Line
        cell = new PdfPCell(new Phrase("TYPE OF PESTS   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(pestsList.get(i).getPestDesc(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("AREA CONCERNED   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        StringBuilder areaConcernedBuilder = new StringBuilder();
        for(int j = 0; j < selectedAoc.size(); j++){
            if(selectedAoc.size() == 1 || i + 1 == selectedAoc.size()){
                areaConcernedBuilder.append(selectedAoc.get(i).toString());
            }else{
                areaConcernedBuilder.append(selectedAoc.get(i).toString());
                areaConcernedBuilder.append(", ");
            }
        }

        cell = new PdfPCell(new Phrase(areaConcernedBuilder.toString(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("TREATMENTS   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(pestsList.get(i).getTreatmentDesc(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("FINDING   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        StringBuilder findingsBuilder = new StringBuilder();
        for(int k = 0; k < findingsList.size(); k ++){
            if(findingsList.get(k).getPestDesc().equals(pestsList.get(i).getPestDesc())){
                if(findingsList.size() == 1 || i + 1 == findingsList.size()){
                    findingsBuilder.append(findingsList.get(i).getFindings().toString());
                }else{
                    findingsBuilder.append(findingsList.get(i).getFindings().toString());
                    findingsBuilder.append(", ");
                }
            }

        }

        cell = new PdfPCell(new Phrase(findingsBuilder.toString(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        //cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("OTHERS   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("Bat is BIG and There is a man", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("  ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(5);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("IMAGES   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);*/

        table.setKeepTogether(true);
        reportBody.add(table);
    }


    /**
     * This method is responsible to add table using iText
     * @param reportBody
     * @throws BadElementException
     */
    private void createAreaConcerned(Paragraph reportBody, int i)
            throws BadElementException {

        float[] columnWidths = {2,2,2,1,1}; //total 5 columns and their width. The first three columns will take the same width and the fourth one will be 5/2.
        PdfPTable table = new PdfPTable(columnWidths);

        table.setWidthPercentage(100); //set table with 100% (full page)
        table.getDefaultCell().setUseAscender(true);

        PdfPCell cell = new PdfPCell(new Phrase("AREAS OF CONCERNED   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        StringBuilder areaConcernedBuilder = new StringBuilder();
        for(int j = 0; j < selectedAoc.size(); j++){
            if(selectedAoc.size() == 1 || j + 1 == selectedAoc.size()){
                areaConcernedBuilder.append(selectedAoc.get(j).toString());
            }else{
                areaConcernedBuilder.append(selectedAoc.get(j).toString());
                areaConcernedBuilder.append(", ");
            }
        }

        cell = new PdfPCell(new Phrase(areaConcernedBuilder.toString().toUpperCase(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        table.setKeepTogether(true);
        reportBody.add(table);
    }

    /**
     * This method is responsible to add table using iText
     * @param reportBody
     * @throws BadElementException
     */
    private void createInnerContents(Paragraph reportBody, int i)
            throws BadElementException {

        float[] columnWidths = {2,2,2,1,1}; //total 5 columns and their width. The first three columns will take the same width and the fourth one will be 5/2.
        PdfPTable table = new PdfPTable(columnWidths);

        table.setWidthPercentage(100); //set table with 100% (full page)
        table.getDefaultCell().setUseAscender(true);

        //Second Line
        PdfPCell cell = new PdfPCell(new Phrase("TYPE OF PESTS   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(pestsList.get(i).getPestDesc().toUpperCase(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("TREATMENTS   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(pestsList.get(i).getTreatmentDesc().toUpperCase(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("ACTIONS & FINDINGS   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        StringBuilder findingsBuilder = new StringBuilder();
        /*StringBuilder othersBuilder = new StringBuilder();
        for(int k = 0; k < findingsList.size(); k++){
            if(findingsList.get(k).getPestDesc().equals(pestsList.get(i).getPestDesc())){
                if(!findingsList.get(k).getAreaConcerned().equals("Others")){
                    findingsBuilder.append(findingsList.get(k).getFindings().toString());
                    //findingsBuilder.append("\n");
                    findingsBuilder.append(",  ");

                }else{
                    othersBuilder.append(findingsList.get(k).getFindings().toString());
                    //othersBuilder.append("\n");
                    findingsBuilder.append(",  ");
                }

            }

        }*/

        for(int k = 0; k < findingsList.size(); k++){
            if(findingsList.get(k).getPestDesc().equals(pestsList.get(i).getPestDesc())){
                findingsBuilder.append(findingsList.get(k).getFinalFindings().toString());
                findingsBuilder.append("\n");
            }

        }

        cell = new PdfPCell(new Phrase(findingsBuilder.toString().toUpperCase(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        /*//Second Line
        cell = new PdfPCell(new Phrase("OTHERS   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(othersBuilder.toString(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        table.addCell(cell);*/

        /*//Second Line
        cell = new PdfPCell(new Phrase("IMAGES   : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);*/

        //Second Line
        cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        table.setKeepTogether(true);
        reportBody.add(table);
    }

    /**
     * This method is responsible to add table using iText
     * @param reportBody
     * @throws BadElementException
     */
    private void createImages(Paragraph reportBody)
            throws BadElementException {

        /*File img_Path = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)
                .getPath() + "/" + IMAGE_DIRECTORY_NAME);*/

        String root = Environment.getExternalStorageDirectory().toString();
        File img_Path = new File(root + "/saved_main_pests");

        float[] columnWidths = {1}; //total 4 columns and their width. The first three columns will take the same width and the fourth one will be 5/2.
        PdfPTable table = new PdfPTable(columnWidths);

        table.setWidthPercentage(100); //set table with 100% (full page)
        table.getDefaultCell().setUseAscender(true);


        buildNestedTables(table);

        table.setKeepTogether(true);
        table.isExtendLastRow(true);
        reportBody.add(table);
    }

    private void buildNestedTables(PdfPTable outerTable) {

        String root = Environment.getExternalStorageDirectory().toString();
        File img_Path = new File(root + "/saved_main_pests");
        PdfPTable innerTable2 = new PdfPTable(3);
        outerTable.getDefaultCell().setBorder(0);
        innerTable2.getDefaultCell().setBorder(0);
        innerTable2.setWidthPercentage(100);
        PdfPCell cell;
        cell = new PdfPCell();
        //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        if(img_Path.exists()){
            String[] fileNames = img_Path.list();
            int imageCount = img_Path.listFiles().length;
            try {
                for (int i = 0; i < imageCount; i++) {
                    Log.e("Image : ", img_Path.getPath()+"/"+ fileNames[i]);
                    Image p_img = Image.getInstance(img_Path.getPath()+"/"+ fileNames[i]);
                    //cell.addElement(p_img);
                    p_img.setWidthPercentage(100);
                    innerTable2.addCell(p_img);
                    //img_Path.getPath()+"/"+ fileNames[i]
                }

            } catch (IOException e) {
                e.printStackTrace();
                Log.e("Error PDF : ", String.valueOf(e));
            } catch (BadElementException e) {
                e.printStackTrace();
            }
            while(imageCount % 3 != 0){
                imageCount++;
                innerTable2.addCell(" ");
            }


        }

        outerTable.addCell(innerTable2);
    }



    /**
     * This method is responsible to add table using iText
     * @param reportBody
     * @throws BadElementException
     */
    private void createRemarks(Paragraph reportBody)
            throws BadElementException {

        /*File img_Path = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)
                .getPath() + "/" + IMAGE_DIRECTORY_NAME);*/

        String root = Environment.getExternalStorageDirectory().toString();
        File img_Path = new File(root + "/saved_main_pests");

        float[] columnWidths = {2,2,2,1,1}; //total 4 columns and their width. The first three columns will take the same width and the fourth one will be 5/2.
        PdfPTable table = new PdfPTable(columnWidths);

        table.setWidthPercentage(100); //set table with 100% (full page)
        table.getDefaultCell().setUseAscender(true);

        //Second Line
        PdfPCell cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("  ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(5);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("REMARKS : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(jobRemarks.getText().toString().toUpperCase(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("PEST PREVENTION TIPS : ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        StringBuilder recBuilder = new StringBuilder();
        for(int k = 0; k < recFinalList.size(); k++){
            recBuilder.append(recFinalList.get(k).getRecommendationDesc().toString());
            recBuilder.append("\n");
        }

        cell = new PdfPCell(new Phrase(recBuilder.toString().toUpperCase(), FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(4);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);


        //table.setKeepTogether(true);
        //table.isExtendLastRow(true);
        reportBody.add(table);
    }

    /**
     * This method is responsible to add table using iText
     * @param reportBody
     * @throws BadElementException
     */
    private void createSignatureArea(Paragraph reportBody)
            throws BadElementException {

        String clientPath = DIRECTORY_CLIENT_SIGNATURE + pref.getPreferences("maintenance_jobID","") + ".png";
        String techPath = DIRECTORY_TECHNICIAN_SIGNATURE + pref.getPreferences("maintenance_jobID","") + ".png";

        float[] columnWidths = {2,2,1,2,2}; //total 4 columns and their width. The first three columns will take the same width and the fourth one will be 5/2.
        PdfPTable table = new PdfPTable(columnWidths);

        table.setWidthPercentage(100); //set table with 100% (full page)
        table.getDefaultCell().setUseAscender(true);

        //Second Line

        PdfPCell cell = new PdfPCell(); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        try{
            Image p_img = Image.getInstance(clientPath);
            p_img.setWidthPercentage(40);
            p_img.setAlignment(Element.ALIGN_CENTER);
            cell.addElement(p_img);
            cell.setColspan(2);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
            cell.setBorder(Rectangle.BOTTOM);
            cell.setPaddingTop(5);
            //cell.setFixedHeight(30); //cell height
            table.addCell(cell);
        }catch(IOException e){

        }


        //Second Line
        cell = new PdfPCell(new Phrase("  ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(1);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);


        cell = new PdfPCell(); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        try{
            Image p_img = Image.getInstance(techPath);
            p_img.setWidthPercentage(40);
            p_img.setAlignment(Element.ALIGN_CENTER);
            cell.addElement(p_img);
            cell.setColspan(2);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
            cell.setBorder(Rectangle.BOTTOM);
            cell.setPaddingTop(5);
            //cell.setFixedHeight(30); //cell height
            table.addCell(cell);
        }catch(IOException e){

        }

        cell = new PdfPCell(new Phrase("CLIENT NAME / SIGNATURE", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(2);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("  ", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(1);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("TECHNICIAN NAME / SIGNATURE", FontFactory.getFont(FontFactory.HELVETICA,7, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(2);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        table.addCell(cell);

        //table.setKeepTogether(true);
        //table.isExtendLastRow(true);
        reportBody.add(table);
    }

    private void areaConcernedDialog(){

        final CharSequence[] dialogList = aocList.toArray(new CharSequence[aocList.size()]);
        final AlertDialog.Builder builderDialog = new AlertDialog.Builder(this);
        builderDialog.setTitle("AREAS OF CONCERNED");
        final int count = dialogList.length;
        final boolean[] is_checked = new boolean[count];

        aocFinalList.clear();

        for(int i = 0; i < count; i++){
            for(int j = 0; j < selectedAoc.size(); j++){
                if(selectedAoc.get(j).equals(dialogList[i].toString())){
                    is_checked[i] = true;
                }
            }
        }

        // Creating multiple selection by using setMutliChoiceItem method
        builderDialog.setMultiChoiceItems(dialogList, is_checked,
                new DialogInterface.OnMultiChoiceClickListener() {
                    public void onClick(DialogInterface dialog,
                                        int whichButton, boolean isChecked) {
                        /*if (isChecked) {
                            selectedAoc.add(aocList.get(whichButton));
                        } else if (selectedAoc.contains(whichButton)) {
                            selectedAoc.remove(Integer.valueOf(whichButton));
                        }*/

                        // Notify the current action
                        //Toast.makeText(getApplicationContext(), aocList.get(whichButton) + " " + isChecked, Toast.LENGTH_SHORT).show();
                    }
                });

        builderDialog.setPositiveButton("OK",
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        selectedAoc.clear();
                        for(int i = 0; i < count; i++){
                            if(is_checked[i]){
                                selectedAoc.add(dialogList[i].toString());
                            }
                        }

                        for(int j = 0; j < selectedAoc.size(); j++){
                            AreaConcerned aoc = new AreaConcerned();
                            aoc.setAocDesc(selectedAoc.get(j));
                            aocFinalList.add(aoc);
                        }

                        aocAdapter.notifyDataSetChanged();

                        //PestDialog();
                        //ListView has boolean array like {1=true, 3=true}, that shows checked items
                    }
                });

        builderDialog.setNegativeButton("Cancel",
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        aocAdapter.notifyDataSetChanged();
                        //((TextView) JobsDetailActivity.this.findViewById(R.id.text)).setText("Click here to open Dialog");
                    }
                });
        AlertDialog alert = builderDialog.create();
        alert.show();
    }

    private void recommendationDialog(){

        final CharSequence[] dialogList = recList.toArray(new CharSequence[recList.size()]);
        final AlertDialog.Builder builderDialog = new AlertDialog.Builder(this);
        builderDialog.setTitle("RECOMMENDATIONS");
        final int count = dialogList.length;
        final boolean[] is_checked = new boolean[count];

        recFinalList.clear();

        for(int i = 0; i < count; i++){
            for(int j = 0; j < selectedRec.size(); j++){
                if(selectedRec.get(j).equals(dialogList[i].toString())){
                    is_checked[i] = true;
                }
            }
        }

        // Creating multiple selection by using setMutliChoiceItem method
        builderDialog.setMultiChoiceItems(dialogList, is_checked,
                new DialogInterface.OnMultiChoiceClickListener() {
                    public void onClick(DialogInterface dialog,
                                        int whichButton, boolean isChecked) {
                        /*if (isChecked) {
                            selectedAoc.add(aocList.get(whichButton));
                        } else if (selectedAoc.contains(whichButton)) {
                            selectedAoc.remove(Integer.valueOf(whichButton));
                        }*/

                        // Notify the current action
                        //Toast.makeText(getApplicationContext(), aocList.get(whichButton) + " " + isChecked, Toast.LENGTH_SHORT).show();
                    }
                });

        builderDialog.setPositiveButton("OK",
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        selectedRec.clear();
                        for(int i = 0; i < count; i++){
                            if(is_checked[i]){
                                selectedRec.add(dialogList[i].toString());
                            }
                        }

                        for(int j = 0; j < selectedRec.size(); j++){
                            Recommendations rec = new Recommendations();
                            rec.setRecommendationDesc(selectedRec.get(j));
                            recFinalList.add(rec);
                        }

                        recommendationsAdapter.notifyDataSetChanged();

                        //PestDialog();
                        //ListView has boolean array like {1=true, 3=true}, that shows checked items
                    }
                });

        builderDialog.setNegativeButton("Cancel",
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        aocAdapter.notifyDataSetChanged();
                        //((TextView) JobsDetailActivity.this.findViewById(R.id.text)).setText("Click here to open Dialog");
                    }
                });
        AlertDialog alert = builderDialog.create();
        alert.show();
    }

    private void PestHeaderDialog(){

        final List<String> headerPestList = new ArrayList<>(singlePestList);
        //newPestList.add("Others");
        final CharSequence[] dialogList = headerPestList.toArray(new CharSequence[headerPestList.size()]);

        AlertDialog.Builder mBuilder = new AlertDialog.Builder(MaintenanceDetailActivity.this);
        mBuilder.setTitle("Choose Pest");
        mBuilder.setSingleChoiceItems(dialogList, -1, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {

                //Toast.makeText(JobsDetailActivity.this, "Found : " + singlePestList.get(i), Toast.LENGTH_SHORT).show();
                /*if(i + 1 == newPestList.size()){
                    //findingsList.add(new Findings(newPestList.get(i), ""));
                    //findingsList.add(new Findings(newPestList.get(i)));
                    //findingsList.add(new Findings("None", "", newPestList.get(i)));
                    //findingsAdapter.notifyDataSetChanged();
                    othersDialog(newPestList.get(i));
                }else{
                    FindingDialog(newPestList.get(i));
                }*/


                PestDialog(headerPestList.get(i));
                dialogInterface.dismiss();

            }
        });

        AlertDialog mDialog = mBuilder.create();
        mDialog.show();
    }

    private void PestDialog(final String header){

        final List<String> newPestList = new ArrayList<>(singlePestList);
        newPestList.add("Breeding");
        newPestList.add("Burrows(s)");
        newPestList.add("Cage");
        newPestList.add("Dried Leaves");
        newPestList.add("Dropping(s)");
        newPestList.add("Food Waste");
        newPestList.add("Glueboard");
        newPestList.add("Hives");
        newPestList.add("Hole(s)");
        newPestList.add("Infestation");
        newPestList.add("Rubbish");
        newPestList.add("Stagnant Water");
        newPestList.add("Termite Trails");
        newPestList.add("Treatment");
        newPestList.add("No Sign of Active Pest Activity");
        newPestList.add("Others");
        final CharSequence[] dialogList = newPestList.toArray(new CharSequence[newPestList.size()]);

        AlertDialog.Builder mBuilder = new AlertDialog.Builder(MaintenanceDetailActivity.this);
        mBuilder.setTitle("Choose Finding");
        mBuilder.setSingleChoiceItems(dialogList, -1, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {

                if(i + 1 == newPestList.size()){
                    otherPestDialog(header);
                }else if(i + 2 == newPestList.size()){
                    findingsList.add(new Findings(header,newPestList.get(i), header + " : " + newPestList.get(i), newPestList.get(i)));
                    findingsAdapter.notifyDataSetChanged();
                }else{
                    ActionDialog(header,newPestList.get(i));
                }

                dialogInterface.dismiss();

            }
        });

        AlertDialog mDialog = mBuilder.create();
        mDialog.show();
    }

    private void otherPestDialog(final String header){
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Others Pests");

        final EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        builder.setView(input);

        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                //dismissKeyboard(JobsDetailActivity.this);

                ActionDialog(header,input.getText().toString());
            }
        });
        builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dismissKeyboard(MaintenanceDetailActivity.this);
                dialog.cancel();
            }
        });

        builder.show();
    }

    private void ActionDialog(final String header, final String pest){
        final List<String> newActionList = new ArrayList<>();
        newActionList.add("Applied");
        newActionList.add("Found");
        newActionList.add("Caught");
        newActionList.add("Destroyed");
        newActionList.add("Discarded");
        newActionList.add("Found & Treated");
        newActionList.add("Placed");
        newActionList.add("Properly Disposed");
        newActionList.add("Removed");
        newActionList.add("Sealed");
        newActionList.add("Treated");
        final CharSequence[] dialogList = newActionList.toArray(new CharSequence[newActionList.size()]);
        AlertDialog.Builder mBuilder = new AlertDialog.Builder(MaintenanceDetailActivity.this);
        mBuilder.setTitle("Choose Action");
        mBuilder.setSingleChoiceItems(dialogList, -1, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {


                /*if(i + 1 == newActionList.size()){
                    findingsList.add(new Findings(header,newActionList.get(i), header + " : " + newActionList.get(i), newActionList.get(i)));
                    findingsAdapter.notifyDataSetChanged();
                }else{
                    FindingDialog(header,pest, newActionList.get(i));
                }*/
                FindingDialog(header,pest, newActionList.get(i));

                //Toast.makeText(JobsDetailActivity.this, "In " + selectedAoc.get(i) + " ", Toast.LENGTH_SHORT).show();
                dialogInterface.dismiss();
            }
        });

        AlertDialog mDialog = mBuilder.create();
        mDialog.show();
    }

    private void FindingDialog(final String header,final String pest,final String action){
        final List<String> newFindingList = new ArrayList<>(selectedAoc);
        newFindingList.add("Others");
        final CharSequence[] dialogList = newFindingList.toArray(new CharSequence[newFindingList.size()]);
        AlertDialog.Builder mBuilder = new AlertDialog.Builder(MaintenanceDetailActivity.this);
        mBuilder.setTitle("Choose Location");
        mBuilder.setSingleChoiceItems(dialogList, -1, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {

                if(i + 1 == newFindingList.size()){
                    othersFindingDialog(header,pest, action);
                }else{
                    findingsList.add(new Findings(header, newFindingList.get(i), header + " : " + pest + " " + action + " at " + newFindingList.get(i), pest + " " + action + " at " + newFindingList.get(i)));
                    findingsAdapter.notifyDataSetChanged();
                }

                //Toast.makeText(JobsDetailActivity.this, "In " + selectedAoc.get(i) + " ", Toast.LENGTH_SHORT).show();
                dialogInterface.dismiss();
            }
        });

        AlertDialog mDialog = mBuilder.create();
        mDialog.show();
    }

    private void othersFindingDialog(final String header,final String pest, final String action){
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Others Findings");

        final EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        builder.setView(input);

        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                //dismissKeyboard(JobsDetailActivity.this);

                //findingsList.add(new Findings(pest ,input.getText().toString()));
                //findingsList.add(new Findings(input.getText().toString()));
                findingsList.add(new Findings(header, "Others", header + " : " + pest + " " + action + " at " + input.getText().toString(), pest + " " + action + " at " + input.getText().toString()));
                findingsAdapter.notifyDataSetChanged();
            }
        });
        builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dismissKeyboard(MaintenanceDetailActivity.this);
                dialog.cancel();
            }
        });

        builder.show();
    }


    private void othersDialog(final String pest){
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Others");

        final EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        builder.setView(input);

        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dismissKeyboard(MaintenanceDetailActivity.this);

                //findingsList.add(new Findings(pest ,input.getText().toString()));
                //findingsList.add(new Findings(input.getText().toString()));
                findingsList.add(new Findings(pest,"Others",pest + " : " + input.getText().toString()));
                findingsAdapter.notifyDataSetChanged();
            }
        });
        builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dismissKeyboard(MaintenanceDetailActivity.this);
                dialog.cancel();
            }
        });

        builder.show();
    }

    public void dismissKeyboard(Activity activity) {
        InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
        if (null != activity.getCurrentFocus())
            imm.hideSoftInputFromWindow(activity.getCurrentFocus()
                    .getApplicationWindowToken(), 0);
    }

    /*private void updateJob(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        cal.add(Calendar.HOUR, -8);
        Date eightHourBack = cal.getTime();
        String timestamp = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss", Locale.ENGLISH).format(eightHourBack);

        JSONObject params = new JSONObject();
        try {
            params.put("JobID", pref.getPreferences("JobID",""));
            params.put("JobNumber", pref.getPreferences("JobNumber",""));
            params.put("Company", pref.getPreferences("Company",""));
            params.put("AssetID", pref.getPreferences("driver_assets_id",""));
            params.put("AssetCompanyID", pref.getPreferences("AssetCompanyID",""));
            params.put("AssetResellerID", pref.getPreferences("AssetResellerID",""));
            params.put("Timestamp", pref.getPreferences("Timestamp",""));
            params.put("RxTime", timestamp);
            params.put("Amount", pref.getPreferences("Amount",""));
            params.put("PIC", pref.getPreferences("PIC",""));
            params.put("Destination", pref.getPreferences("Destination",""));
            params.put("Phone", pref.getPreferences("Phone",""));
            params.put("Unit", pref.getPreferences("Unit",""));
            params.put("Flag", 0);
            params.put("Remarks", pref.getPreferences("Remarks",""));
            params.put("Receipt", pref.getPreferences("Receipt",""));
            params.put("UserID", pref.getPreferences("UserID",""));
            params.put("DriverID", pref.getPreferences("driver_id",""));
            params.put("Postal", pref.getPreferences("Postal",""));
            params.put("JobAccepted", pref.getPreferences("JobAccepted",""));
            params.put("JobCompleted", timestamp);
            params.put("CusEmail", pref.getPreferences("CusEmail",""));
            params.put("Site", pref.getPreferences("Site",""));

            StringBuilder recommendationBuilder = new StringBuilder();

            for(int j = 0; j < recFinalList.size(); j++){
                if(recFinalList.size() == 1 || j + 1 == recFinalList.size()){
                    recommendationBuilder.append(recFinalList.get(j).getRecommendationDesc());
                }else{
                    recommendationBuilder.append(recFinalList.get(j).getRecommendationDesc());
                    recommendationBuilder.append(", ");
                }
            }

            params.put("Recommendations", recommendationBuilder.toString());
            params.put("ReceivedAmount", jobNewAmount.getText().toString());
            if(radioCash.isChecked()){
                params.put("PaymentType", 1);
            }else if(radioCheque.isChecked()){
                params.put("PaymentType", 2);
            }


        } catch (JSONException e) {
            e.printStackTrace();

        }

        final String url = AppConstant.endpoint_url + "jobinfo?ID=" + pref.getPreferences("JobID","");

        System.out.println(url);

        AQuery aq = new AQuery(this);
        aq.put(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                System.out.println(response);
                if (status.getMessage().equals("OK")) {
                    postFindings();
                }
            }
        }.header("Content-Type", "application/x-www-form-urlencoded")
                .header("_method", "PUT"));
    }*/

    private void postFindings(){
        int j = 1;
        if(findingsList.size() != 0 ){
            for(int i = 0; i < findingsList.size(); i++){
                JSONObject params = new JSONObject();
                try {
                    params.put("MaintenanceJobID", pref.getPreferences("maintenance_jobID",""));
                    params.put("PestDesc", findingsList.get(i).getPestDesc());
                    params.put("AocDesc", findingsList.get(i).getAreaConcerned());
                    params.put("Findings", findingsList.get(i).getFindings());
                    params.put("ItemNo", j);

                } catch (JSONException e) {
                    e.printStackTrace();

                }

                final String url = AppConstant.endpoint_url + "findingsmaintenanceinfo";

                //System.out.println(url);

                AQuery aq = new AQuery(this);
                aq.post(url, params, String.class, new AjaxCallback<String>() {
                    @Override
                    public void callback(String url, String response, AjaxStatus status) {
                        //System.out.println(response);
                        if (status.getMessage().equals("OK")) {

                        }
                    }
                }.header("Content-Type", "application/x-www-form-urlencoded")
                        .header("_method", "POST"));

                j++;

                if(i + 1 == findingsList.size()){
                    hideDialog();
                    if(imagesList.size() != 0){
                        for(int k = 0; k < imagesList.size(); k++){
                            File file = new File(imagesList.get(k).getImage_url());
                            file.delete();

                            if(k+1 == imagesList.size()){
                                removePreferences();
                                Intent intent = new Intent(this, JobActivity.class);
                                startActivity(intent);
                                finish();

                                //onBackPressed();
                            }
                        }
                    }else{
                        removePreferences();
                        Intent intent = new Intent(this, JobActivity.class);
                        startActivity(intent);
                        finish();
                    }

                }
            }
        }else{
            hideDialog();
            if(imagesList.size() != 0){
                for(int k = 0; k < imagesList.size(); k++){
                    File file = new File(imagesList.get(k).getImage_url());
                    file.delete();

                    if(k+1 == imagesList.size()){
                        removePreferences();
                        Intent intent = new Intent(this, JobActivity.class);
                        startActivity(intent);
                        finish();

                        //onBackPressed();
                    }
                }
            }else{
                removePreferences();
                Intent intent = new Intent(this, JobActivity.class);
                startActivity(intent);
                finish();
            }
        }

    }

    private void removePreferences(){
        //pref.removePreferences("JobID");
        pref.removePreferences("maintenance_JobNumber");
        pref.removePreferences("maintenance_Flag");
        pref.removePreferences("maintenance_FlagValue");
        pref.removePreferences("maintenance_AssetCompanyID");
        pref.removePreferences("maintenance_AssetCompany");
        pref.removePreferences("maintenance_AssetResellerID");
        pref.removePreferences("maintenance_AssetReseller");
        pref.removePreferences("maintenance_UserID");
        pref.removePreferences("maintenance_UserName");
        pref.removePreferences("maintenance_AssetID");
        pref.removePreferences("maintenance_DriverID");
        pref.removePreferences("maintenance_DriverName");
        pref.removePreferences("maintenance_Timestamp");
        pref.removePreferences("maintenance_RxTime");
        pref.removePreferences("maintenance_Company");
        pref.removePreferences("maintenance_Destination");
        pref.removePreferences("maintenance_Postal");
        pref.removePreferences("maintenance_Unit");
        pref.removePreferences("maintenance_PIC");
        pref.removePreferences("maintenance_Phone");
        pref.removePreferences("maintenance_Amount");
        pref.removePreferences("maintenance_CusEmail");
        pref.removePreferences("maintenance_Site");
        pref.removePreferences("maintenance_Pest");
        pref.removePreferences("maintenance_Remarks");
        pref.removePreferences("maintenance_JobAccepted");
        pref.removePreferences("maintenance_JobCompleted");
        pref.removePreferences("maintenance_Receipt");
        pref.removePreferences("maintenance_Image");
        pref.removePreferences("maintenance_ImageFill");
        pref.removePreferences("maintenance_jobPest");
        pref.removePreferences("maintenance_AreaCovered");
        pref.removePreferences("maintenance_jobTechnician");
    }

    public class signature extends View {

        private static final float STROKE_WIDTH = 5f;
        private static final float HALF_STROKE_WIDTH = STROKE_WIDTH / 2;
        private Paint paint = new Paint();
        private Path path = new Path();

        private float lastTouchX;
        private float lastTouchY;
        private final RectF dirtyRect = new RectF();

        public signature(Context context, AttributeSet attrs) {
            super(context, attrs);
            paint.setAntiAlias(true);
            paint.setColor(Color.BLACK);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStrokeWidth(STROKE_WIDTH);
        }

        public void save(View v, String StoredPath) {
            //Log.v("log_tag", "Width: " + v.getWidth());
            //Log.v("log_tag", "Height: " + v.getHeight());
            if (bitmap == null) {
                bitmap = Bitmap.createBitmap(mContent.getWidth(), mContent.getHeight(), Bitmap.Config.RGB_565);
            }
            Canvas canvas = new Canvas(bitmap);
            try {
                // Output the file
                FileOutputStream mFileOutStream = new FileOutputStream(StoredPath);
                v.draw(canvas);

                // Convert the output file to Image such as .png
                bitmap.compress(Bitmap.CompressFormat.PNG, 90, mFileOutStream);
                mFileOutStream.flush();
                mFileOutStream.close();

            } catch (Exception e) {
                Log.v("log_tag", e.toString());
            }
        }

        public void clear() {
            path.reset();
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            canvas.drawPath(path, paint);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            float eventX = event.getX();
            float eventY = event.getY();
            mGetSign.setEnabled(true);

            switch (event.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    path.moveTo(eventX, eventY);
                    lastTouchX = eventX;
                    lastTouchY = eventY;
                    return true;

                case MotionEvent.ACTION_MOVE:

                case MotionEvent.ACTION_UP:

                    resetDirtyRect(eventX, eventY);
                    int historySize = event.getHistorySize();
                    for (int i = 0; i < historySize; i++) {
                        float historicalX = event.getHistoricalX(i);
                        float historicalY = event.getHistoricalY(i);
                        expandDirtyRect(historicalX, historicalY);
                        path.lineTo(historicalX, historicalY);
                    }
                    path.lineTo(eventX, eventY);
                    break;

                default:
                    debug("Ignored touch event: " + event.toString());
                    return false;
            }

            invalidate((int) (dirtyRect.left - HALF_STROKE_WIDTH),
                    (int) (dirtyRect.top - HALF_STROKE_WIDTH),
                    (int) (dirtyRect.right + HALF_STROKE_WIDTH),
                    (int) (dirtyRect.bottom + HALF_STROKE_WIDTH));

            lastTouchX = eventX;
            lastTouchY = eventY;

            return true;
        }

        private void debug(String string) {

            Log.v("log_tag", string);

        }

        private void expandDirtyRect(float historicalX, float historicalY) {
            if (historicalX < dirtyRect.left) {
                dirtyRect.left = historicalX;
            } else if (historicalX > dirtyRect.right) {
                dirtyRect.right = historicalX;
            }

            if (historicalY < dirtyRect.top) {
                dirtyRect.top = historicalY;
            } else if (historicalY > dirtyRect.bottom) {
                dirtyRect.bottom = historicalY;
            }
        }

        private void resetDirtyRect(float eventX, float eventY) {
            dirtyRect.left = Math.min(lastTouchX, eventX);
            dirtyRect.right = Math.max(lastTouchX, eventX);
            dirtyRect.top = Math.min(lastTouchY, eventY);
            dirtyRect.bottom = Math.max(lastTouchY, eventY);
        }
    }

    // Function for Digital Signature
    public void dialogSignature(String signature_title, final String Signature_StoredPath, String DIRECTORY) {

        // Dialog Function
        dialog = new Dialog(MaintenanceDetailActivity.this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_signature);
        dialog.setCancelable(true);
        // Method to create Directory, if the Directory doesn't exists
        file = new File(DIRECTORY);
        if (!file.exists()) {
            file.mkdir();
        }

        mContent = (LinearLayout) dialog.findViewById(R.id.linearLayoutSign);
        mSignature = new signature(getApplicationContext(), null);
        mSignature.setBackgroundColor(Color.WHITE);
        // Dynamically generating Layout through java code
        mContent.addView(mSignature, ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        mClear = (Button) dialog.findViewById(R.id.clear);
        mGetSign = (Button) dialog.findViewById(R.id.getsign);
        titleSignature = (TextView) dialog.findViewById(R.id.titleSignature);
        labelTitle = (TextView) dialog.findViewById(R.id.labelTitle);
        mGetSign.setEnabled(false);
        mCancel = (Button) dialog.findViewById(R.id.cancel);
        view = mContent;

        titleSignature.setText(signature_title);
        labelTitle.setText(signature_title);

        mClear.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                mSignature.clear();
                mGetSign.setEnabled(false);
            }
        });

        mGetSign.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                view.setDrawingCacheEnabled(true);
                mSignature.save(view, Signature_StoredPath);
                dialog.dismiss();
                Calendar cal = Calendar.getInstance();
                cal.setTime(Calendar.getInstance().getTime());
                Date eightHourBack = cal.getTime();
                String date = new SimpleDateFormat("yyyyMMdd", Locale.ENGLISH).format(eightHourBack);
                String time = new SimpleDateFormat("HHmmss", Locale.ENGLISH).format(eightHourBack);
                String signature_name = "SIGNATURE_"+ pref.getPreferences("maintenance_jobID","") + "_" + date + "_" + time;
                final String Signature_Technician_StoredPath = DIRECTORY_TECHNICIAN_SIGNATURE + pref.getPreferences("maintenance_jobID","") + ".png";

                dialogSecondSignature("Technician Signature", Signature_Technician_StoredPath, DIRECTORY_TECHNICIAN_SIGNATURE);

            }
        });

        mCancel.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                // Calling the same class
                mSignature.clear();
                mGetSign.setEnabled(true);
                dialog.dismiss();
            }
        });
        dialog.show();
    }

    public class signature_tech extends View {

        private static final float STROKE_WIDTH = 5f;
        private static final float HALF_STROKE_WIDTH = STROKE_WIDTH / 2;
        private Paint paint = new Paint();
        private Path path = new Path();

        private float lastTouchX;
        private float lastTouchY;
        private final RectF dirtyRect = new RectF();

        public signature_tech(Context context, AttributeSet attrs) {
            super(context, attrs);
            paint.setAntiAlias(true);
            paint.setColor(Color.BLACK);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStrokeWidth(STROKE_WIDTH);
        }

        public void save(View v, String StoredPath) {
            //Log.v("log_tag", "Width: " + v.getWidth());
            //Log.v("log_tag", "Height: " + v.getHeight());
            if (bitmap_tech == null) {
                bitmap_tech = Bitmap.createBitmap(mContent_tech.getWidth(), mContent_tech.getHeight(), Bitmap.Config.RGB_565);
            }
            Canvas canvas = new Canvas(bitmap_tech);
            try {
                // Output the file
                FileOutputStream mFileOutStream = new FileOutputStream(StoredPath);
                v.draw(canvas);

                // Convert the output file to Image such as .png
                bitmap_tech.compress(Bitmap.CompressFormat.PNG, 90, mFileOutStream);
                mFileOutStream.flush();
                mFileOutStream.close();

            } catch (Exception e) {
                Log.v("log_tag", e.toString());
            }
        }

        public void clear() {
            path.reset();
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            canvas.drawPath(path, paint);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            float eventX = event.getX();
            float eventY = event.getY();
            mGetSign_tech.setEnabled(true);

            switch (event.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    path.moveTo(eventX, eventY);
                    lastTouchX = eventX;
                    lastTouchY = eventY;
                    return true;

                case MotionEvent.ACTION_MOVE:

                case MotionEvent.ACTION_UP:

                    resetDirtyRect(eventX, eventY);
                    int historySize = event.getHistorySize();
                    for (int i = 0; i < historySize; i++) {
                        float historicalX = event.getHistoricalX(i);
                        float historicalY = event.getHistoricalY(i);
                        expandDirtyRect(historicalX, historicalY);
                        path.lineTo(historicalX, historicalY);
                    }
                    path.lineTo(eventX, eventY);
                    break;

                default:
                    debug("Ignored touch event: " + event.toString());
                    return false;
            }

            invalidate((int) (dirtyRect.left - HALF_STROKE_WIDTH),
                    (int) (dirtyRect.top - HALF_STROKE_WIDTH),
                    (int) (dirtyRect.right + HALF_STROKE_WIDTH),
                    (int) (dirtyRect.bottom + HALF_STROKE_WIDTH));

            lastTouchX = eventX;
            lastTouchY = eventY;

            return true;
        }

        private void debug(String string) {

            Log.v("log_tag", string);

        }

        private void expandDirtyRect(float historicalX, float historicalY) {
            if (historicalX < dirtyRect.left) {
                dirtyRect.left = historicalX;
            } else if (historicalX > dirtyRect.right) {
                dirtyRect.right = historicalX;
            }

            if (historicalY < dirtyRect.top) {
                dirtyRect.top = historicalY;
            } else if (historicalY > dirtyRect.bottom) {
                dirtyRect.bottom = historicalY;
            }
        }

        private void resetDirtyRect(float eventX, float eventY) {
            dirtyRect.left = Math.min(lastTouchX, eventX);
            dirtyRect.right = Math.max(lastTouchX, eventX);
            dirtyRect.top = Math.min(lastTouchY, eventY);
            dirtyRect.bottom = Math.max(lastTouchY, eventY);
        }
    }

    // Function for Digital Signature
    public void dialogSecondSignature(String signature_title, final String Signature_StoredPath, String DIRECTORY) {

        // Dialog Function
        dialog_tech = new Dialog(MaintenanceDetailActivity.this);
        dialog_tech.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog_tech.setContentView(R.layout.dialog_signature);
        dialog_tech.setCancelable(true);

        // Method to create Directory, if the Directory doesn't exists
        file_tech = new File(DIRECTORY);
        if (!file_tech.exists()) {
            file_tech.mkdir();
        }

        mContent_tech = (LinearLayout) dialog_tech.findViewById(R.id.linearLayoutSign);
        mSignature_tech = new signature_tech(getApplicationContext(), null);
        mSignature_tech.setBackgroundColor(Color.WHITE);
        // Dynamically generating Layout through java code
        mContent_tech.addView(mSignature_tech, ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        mClear_tech = (Button) dialog_tech.findViewById(R.id.clear);
        mGetSign_tech = (Button) dialog_tech.findViewById(R.id.getsign);
        titleSignature_tech = (TextView) dialog_tech.findViewById(R.id.titleSignature);
        labelTitle_tech = (TextView) dialog_tech.findViewById(R.id.labelTitle);
        mGetSign_tech.setEnabled(false);
        mCancel_tech = (Button) dialog_tech.findViewById(R.id.cancel);
        view_tech = mContent_tech;

        titleSignature_tech.setText(signature_title);
        labelTitle_tech.setText(signature_title);

        mClear_tech.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                mSignature_tech.clear();
                mGetSign_tech.setEnabled(false);
            }
        });

        mGetSign_tech.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                view_tech.setDrawingCacheEnabled(true);
                mSignature_tech.save(view_tech, Signature_StoredPath);
                dialog_tech.dismiss();


                String client_path = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceClient/" + pref.getPreferences("maintenance_jobID","") + ".png";
                File client_file = new File(client_path);
                if(client_file.exists()){
                    String tech_path = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceTechnician/" + pref.getPreferences("maintenance_jobID","") + ".png";
                    File tech_file = new File(tech_path);
                    if(tech_file.exists()){
                        //Check Internet Connection
                        if(isNetworkAvailable()){
                            if(isServerAvailable()){
                                generatePDF();
                            }else{
                                connectionFailedDialog("Connection Failure", "Please try again.");
                            }
                        }else{
                            connectionFailedDialog("Connection Failure", "Please try again.");
                        }
                    }else{
                        connectionFailedDialog("Technician Signature not found.", "Please try again.");
                    }
                }else{
                    connectionFailedDialog("Client Signature not found.", "Please try again.");
                }

            }
        });

        mCancel_tech.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                mSignature_tech.clear();
                dialog_tech.dismiss();
                // Calling the same class
                //recreate();
            }
        });
        dialog_tech.show();
    }

    private void connectionFailedDialog(final String title, String message){
        alert_dialog = new AlertDialog.Builder(this);
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle(title);
        alert_dialog.setMessage(message);
        alert_dialog.setNegativeButton("Close", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alert_dialog.show();

    }

    public class uploadClientSignatures extends AsyncTask<String, Void, Long> {

        boolean isSentPDF = false;

        protected Long doInBackground(String... FULL_PATH_TO_LOCAL_FILE) {
            {
                FTPClient ftpClient = new FTPClient();
                int reply;

                String servername = AppConstant.ads_host;
                int port = 21;
                String user = "SystemPest_MaintenanceClientSignatures";
                String pass = "trackacecom";
                try {
                    //Log.e("START :", "UPLOADING");
                    //System.out.println("Entered Data Upload loop!");
                    ftpClient.connect(servername, 21);
                    ftpClient.login(user, pass);
                    ftpClient.sendCommand("Enter FTP Server");
                    ftpClient.changeWorkingDirectory("/");

                    reply = ftpClient.getReplyCode();

                    if (FTPReply.isPositiveCompletion(reply)) {
                       // System.out.println("Connected Success");
                    } else {
                        //System.out.println("Connection Failed");
                        ftpClient.disconnect();
                    }

                    try
                    {
                        //Log.e("PROCEEDING :", "UPLOADING");

                        ftpClient.enterLocalPassiveMode(); // important!
                        ftpClient.setFileType(ftpClient.BINARY_FILE_TYPE);
                        String path = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceClient/" + pref.getPreferences("maintenance_jobID","") + ".png";

                        FileInputStream in = new FileInputStream(new File(path));
                        boolean result = ftpClient.storeFile("/"+ pref.getPreferences("maintenance_jobID","") +".png", in);
                        in.close();
                        if (result) {
                            isSentPDF = true;
                        }
                        ftpClient.logout();
                        ftpClient.disconnect();
                        //File file = new File(path);
                        //boolean deleted = file.delete();
                    }
                    catch (Exception e)
                    {
                        Log.e("Upload Failed : ", String.valueOf(e));
                        e.printStackTrace();
                    }

                } catch (SocketException e) {
                    Log.e("FTP", e.getStackTrace().toString());
                    //System.out.println("Socket Exception!");
                } catch (UnknownHostException e) {
                    Log.e("FTP", e.getStackTrace().toString());
                } catch (IOException e) {
                    Log.e("FTP", e.getStackTrace().toString());
                    //System.out.println("IO Exception!");
                }
                return null;
            }
        }

        @Override
        protected void onPostExecute(Long aLong) {
            super.onPostExecute(aLong);
            if(!isSentPDF){
                hideDialog();
                connectionFailedDialog("Client Signature is not uploaded.","Please try again.");
            }else{
                new MaintenanceDetailActivity.uploadTechnicianSignatures().execute();
            }
        }
    }

    public class uploadTechnicianSignatures extends AsyncTask<String, Void, Long> {
        boolean isSentPDF = false;

        protected Long doInBackground(String... FULL_PATH_TO_LOCAL_FILE) {
            {
                FTPClient ftpClient = new FTPClient();
                int reply;

                String servername = AppConstant.ads_host;
                int port = 21;
                String user = "SystemPest_MaintenanceTechnicianSignatures";
                String pass = "trackacecom";
                try {
                    //Log.e("START :", "UPLOADING");
                    //System.out.println("Entered Data Upload loop!");
                    ftpClient.connect(servername, 21);
                    ftpClient.login(user, pass);
                    ftpClient.sendCommand("Enter FTP Server");
                    ftpClient.changeWorkingDirectory("/");

                    reply = ftpClient.getReplyCode();

                    if (FTPReply.isPositiveCompletion(reply)) {
                        //System.out.println("Connected Success");
                    } else {
                        //System.out.println("Connection Failed");
                        ftpClient.disconnect();
                    }

                    try
                    {
                        //Log.e("PROCEEDING :", "UPLOADING");

                        ftpClient.enterLocalPassiveMode(); // important!
                        ftpClient.setFileType(ftpClient.BINARY_FILE_TYPE);
                        String path = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceTechnician/" + pref.getPreferences("maintenance_jobID","") + ".png";

                        FileInputStream in = new FileInputStream(new File(path));
                        boolean result = ftpClient.storeFile("/"+ pref.getPreferences("maintenance_jobID","") +".png", in);
                        in.close();
                        if (result) isSentPDF = true;
                        ftpClient.logout();
                        ftpClient.disconnect();
                        //File file = new File(path);
                        //boolean deleted = file.delete();
                    }
                    catch (Exception e)
                    {
                        Log.e("Upload Failed : ", String.valueOf(e));
                        e.printStackTrace();
                    }

                } catch (SocketException e) {
                    Log.e("FTP", e.getStackTrace().toString());
                    //System.out.println("Socket Exception!");
                } catch (UnknownHostException e) {
                    Log.e("FTP", e.getStackTrace().toString());
                } catch (IOException e) {
                    Log.e("FTP", e.getStackTrace().toString());
                    //System.out.println("IO Exception!");
                }
                return null;
            }
        }

        @Override
        protected void onPostExecute(Long aLong) {
            super.onPostExecute(aLong);
            if(!isSentPDF){
                hideDialog();
                connectionFailedDialog("Technician Signature is not uploaded.","Please try again.");
            }else{
                new MaintenanceDetailActivity.uploadServiceForms().execute();
            }
        }
    }

    private void imagePestDialog(){

        final List<String> newPestList = new ArrayList<>(singlePestList);
        final CharSequence[] dialogList = newPestList.toArray(new CharSequence[newPestList.size()]);

        AlertDialog.Builder mBuilder = new AlertDialog.Builder(MaintenanceDetailActivity.this);
        mBuilder.setTitle("Choose Pest");
        mBuilder.setSingleChoiceItems(dialogList, -1, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {

                dialogInterface.dismiss();

            }
        });

        AlertDialog mDialog = mBuilder.create();
        mDialog.show();
    }

    private void loadMaintenance(){

        final String url = AppConstant.endpoint_url + "maintenanceinfo/" + pref.getPreferences("maintenance_id","");
        Log.e("Maintenance URL : ", url);
        // prepare the Request
        JsonObjectRequest getRequest = new JsonObjectRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONObject>()
                {
                    @Override
                    public void onResponse(JSONObject response) {
                        // display response
                        try{
                            update_MaintenanceID = response.getInt("MaintenanceID");
                            update_Timestamp = response.getString("Timestamp");
                            update_RxTime = response.getString("RxTime");
                            update_Address = response.getString("Address");
                            update_Postal = response.getString("Postal");
                            update_Unit = response.getString("Unit");
                            update_CusCompany = response.getString("CusCompany");
                            update_PIC = response.getString("PIC");
                            update_Phone = response.getString("Phone");
                            update_Email = response.getString("Email");
                            update_Site = response.getString("Site");
                            update_ContractStart = response.getString("ContractStart");
                            update_ContractEnd = response.getString("ContractEnd");
                            update_MaintenanceInterval = response.getString("MaintenanceInterval");
                            update_NotificationInterval = response.getString("NotificationInterval");
                            update_Remarks = response.getString("Remarks");
                            update_CompanyID = response.getInt("CompanyID");
                            update_UserID = response.getInt("UserID");
                            //String ReferenceNo = response.getString("ReferenceNo");
                            //int isSent = response.getInt("MaintenanceID");



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

    private void updateMaintenance(){
        JSONObject params = new JSONObject();

        try {

            params.put("MaintenanceID", update_MaintenanceID);
            params.put("CompanyID", update_CompanyID);
            params.put("Timestamp", update_Timestamp);
            params.put("RxTime", update_RxTime);
            params.put("UserID", update_UserID);
            params.put("Address", update_Address);
            params.put("Postal", update_Postal);
            params.put("Unit", update_Unit);
            params.put("CusCompany", update_CusCompany);
            params.put("PIC", update_PIC);
            params.put("Phone", update_Phone);
            params.put("Email", cusEmail.getText().toString());
            params.put("Site", update_Site);
            params.put("ContractStart", update_ContractStart);
            params.put("ContractEnd", update_ContractEnd);
            params.put("MaintenanceInterval", update_MaintenanceInterval);
            params.put("NotificationInterval", update_NotificationInterval);
            params.put("Remarks", update_Remarks);

        } catch (JSONException e) {
            e.printStackTrace();

        }

        final String url = AppConstant.endpoint_url + "maintenanceinfo?id=" + update_MaintenanceID;

        //System.out.println(url);

        AQuery aq = new AQuery(this);
        aq.put(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                //System.out.println(response);
                if (status.getMessage().equals("OK")) {
                    postFindings();
                }
            }
        }.header("Content-Type", "application/x-www-form-urlencoded")
                .header("_method", "PUT"));

    }

    private void updateMaintenanceJob(){
        JSONObject params = new JSONObject();
        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        cal.add(Calendar.HOUR, -8);
        Date eightHourBack = cal.getTime();
        String timestamp = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss", Locale.ENGLISH).format(eightHourBack);

        try {
            params.put("MaintenanceJobID", maintenancejob_MaintenanceJobID);
            params.put("MaintenanceID", maintenancejob_MaintenanceID);
            params.put("AlertDate", maintenancejob_AlertDate);
            params.put("Timestamp", maintenancejob_Timestamp);
            params.put("RxTime", timestamp);
            params.put("Flag", 0);
            params.put("JobCancelled", maintenancejob_JobCancelled);
            params.put("CancelRemarks", maintenancejob_CancelRemarks);
            params.put("isSent", maintenancejob_isSent);
            params.put("ReferenceNo", maintenancejob_ReferenceNo);
            try{
                params.put("DriverID", pref.getPreferences("driver_id",""));

            }catch(Exception e){

            }

        } catch (JSONException e) {
            e.printStackTrace();

        }

        final String url = AppConstant.endpoint_url + "maintenancejobinfo?ID=" + pref.getPreferences("maintenance_jobID","");

        //System.out.println(url);

        AQuery aq = new AQuery(this);
        aq.put(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                //System.out.println(response);
                if (status.getMessage().equals("OK")) {
                    postFindings();
                }
            }
        }.header("Content-Type", "application/x-www-form-urlencoded")
                .header("_method", "PUT"));
    }

    private void loadPestList(){
        final String url = AppConstant.endpoint_url + "pestinfo";
        Log.e("MaintennceJob URL : ", url);
        // prepare the Request
        JsonArrayRequest getRequest = new JsonArrayRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONArray>()
                {
                    @Override
                    public void onResponse(JSONArray response) {
                        // display response
                        try{

                            for(int i = 0; i < response.length(); i++){
                                JSONObject obj = response.getJSONObject(i);
                                singlePestList.add(obj.getString("PestDesc"));
                            }
                            //JSONObject obj = response.getJSONObject(0);

                            //Log.e("Response : ", response.getString(""MaintenanceJobID));
                            //response.getString()


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

    private void sendEmail(String attachment, String filename) {
        String sender_address = "";
        String sender_password = "";
        String[] recipients = cusEmail.getText().toString().split(",");
        SendMaintenanceEmailAsyncTask email = new SendMaintenanceEmailAsyncTask();
        email.activity = this;

        StringBuilder emailBody = new StringBuilder();

        if(pref.getPreferences("maintenance_CompanyID","").equals("1")){
            emailBody.append("Dear Customer, ");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("Pest control services has been rendered and completed. Service report as attached.");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("For any queries, please contact our office directly at 6748 8966.");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("This email is auto-generated. Do not reply.");

            sender_address = "system.sg.report@gmail.com";
            //sender_password = "qwepoi78";
            sender_password = "dfutjlmqsdidmmlj";
        }else if(pref.getPreferences("maintenance_CompanyID","").equals("2")){
            emailBody.append("Dear Customer, ");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("Pest control services has been rendered and completed. Service report as attached.");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("For any queries, please contact our office directly.");
            emailBody.append("\n");
            emailBody.append("- Selangor");
            emailBody.append("\n");
            emailBody.append("  Tel : 03 - 4142 4866");
            emailBody.append("\n");
            emailBody.append("  Email : kualalumpur@systempest.com");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("- Melaka");
            emailBody.append("\n");
            emailBody.append("  Tel : 06 - 336 7366");
            emailBody.append("\n");
            emailBody.append("  Email : melaka@systempest.com");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("- Johor Bahru");
            emailBody.append("\n");
            emailBody.append("  Tel : 07 - 353 326");
            emailBody.append("\n");
            emailBody.append("  Email : johor@systempest.com");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("- Perak");
            emailBody.append("\n");
            emailBody.append("  Tel : +605 - 312 6166");
            emailBody.append("\n");
            emailBody.append("  Email : perak@systempest.com");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("- Sarawak");
            emailBody.append("\n");
            emailBody.append("  Tel : +6082 - 371 366");
            emailBody.append("\n");
            emailBody.append("  Email : sarawak@systempest.com");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("This email is auto-generated. Please do not reply.");

            sender_address = "system.my.report@gmail.com";
            sender_password = "qwepoi78";
        }else if(pref.getPreferences("maintenance_CompanyID","").equals("3")){
            emailBody.append("Dear Customer, ");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("Pest control services has been rendered and completed. Service report as attached.");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("For any queries, please contact our office directly at 6841 2023.");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("This email is auto-generated. Do not reply.");

            sender_address = "asiawhiteant.report@gmail.com";
            sender_password = "qwepoi78";
        }else{
            emailBody.append("Dear Customer, ");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("Pest control services has been rendered and completed. Service report as attached.");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("For any queries, please contact our office directly at 6748 8966.");
            emailBody.append("\n");
            emailBody.append("\n");
            emailBody.append("This email is auto-generated. Do not reply.");


            sender_address = "system.sg.report@gmail.com";
            //sender_password = "qwepoi78";
            sender_password = "dfutjlmqsdidmmlj";
        }
        email.m = new Mail(sender_address, sender_password);
        email.m.set_from(sender_address);
        email.m.setBody(emailBody.toString());
        email.m.set_to(recipients);
        email.m.set_subject("Pest Control Service Report");
        try {
            email.m.addAttachment(attachment, filename);
        } catch (Exception e) {
            Log.e("Attachment Failed : ", String.valueOf(e));
            e.printStackTrace();
        }
        /*try {
            email.m.addAttachment(FILE);
        } catch (Exception e) {
            e.printStackTrace();
        }*/
        email.execute();
    }

    private void datePickerDialog(){
        // Get Current Date
        final Calendar c = Calendar.getInstance();
        mYear = c.get(Calendar.YEAR);
        mMonth = c.get(Calendar.MONTH);
        mDay = c.get(Calendar.DAY_OF_MONTH);

        DatePickerDialog datePickerDialog = new DatePickerDialog(this,
                new DatePickerDialog.OnDateSetListener() {

                    @Override
                    public void onDateSet(DatePicker view, int year,
                                          int monthOfYear, int dayOfMonth) {

                        scheduledDate = dayOfMonth + "-" + (monthOfYear + 1) + "-" + year;
                        //Log.e("Scheduled Date : ", scheduledDate);
                        timePickerDialog();

                    }
                }, mYear, mMonth, mDay);
        datePickerDialog.show();
    }

    private void timePickerDialog(){
        // Get Current Time
        final Calendar c = Calendar.getInstance();
        mHour = c.get(Calendar.HOUR_OF_DAY);
        mMinute = c.get(Calendar.MINUTE);

        // Launch Time Picker Dialog
        TimePickerDialog timePickerDialog = new TimePickerDialog(this,
                new TimePickerDialog.OnTimeSetListener() {

                    @Override
                    public void onTimeSet(TimePicker view, int hourOfDay,
                                          int minute) {

                        scheduledTime = hourOfDay + ":" + minute;
                        //Log.e("Scheduled Time : ", scheduledTime);


                        //Log.e("Scheduled Date Time : ", scheduledDate + " " + scheduledTime);
                        rescheduledDialog(scheduledDate + " " + scheduledTime);
                    }
                }, mHour, mMinute, false);
        timePickerDialog.show();
    }

    private void rescheduledDialog(final String rescheduledDateTime){
        alert_dialog = new AlertDialog.Builder(this);
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle("Reschedule Date");
        alert_dialog.setMessage("Date Selected : " + rescheduledDateTime);
        alert_dialog.setNegativeButton("No", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alert_dialog.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(final DialogInterface dialog, int which) {
                createNewScheduledJob(rescheduledDateTime);
                dialog.dismiss();
            }
        });
        alert_dialog.show();

    }

    private void createNewScheduledJob(String scheduledDate){

        //JN-270718-763
        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        cal.add(Calendar.HOUR, -8);
        Date eightHourBack = cal.getTime();
        String dateRange = new SimpleDateFormat("ddmmyy", Locale.ENGLISH).format(eightHourBack);

        Random random = new Random();
        int x = random.nextInt(900) + 100;
        String randomNumber = String.valueOf(x);
        if(randomNumber.length() == 1){
            randomNumber = "00" + randomNumber;
        }else if(randomNumber.length() == 2){
            randomNumber = "0" + randomNumber;
        }

        String jobnumber = "JN-" + dateRange + "-" + randomNumber;

        SimpleDateFormat sdf = new SimpleDateFormat("d-m-yyyy", Locale.ENGLISH);
        SimpleDateFormat output = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss",Locale.ENGLISH);
        Date d = null;
        Date utcDate = null;
        String finalDate = "";
        try {
            d = sdf.parse(scheduledDate);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(d);
            calendar.add(Calendar.HOUR, 8);
            utcDate = calendar.getTime();

        } catch (ParseException e) {
            e.printStackTrace();
        }

        finalDate = output.format(eightHourBack);

        JSONObject params = new JSONObject();
        try {
            params.put("JobNumber", jobnumber);
            params.put("Company", pref.getPreferences("Company",""));
            params.put("AssetID", pref.getPreferences("driver_assets_id",""));
            params.put("AssetCompanyID", pref.getPreferences("AssetCompanyID",""));
            params.put("AssetResellerID", pref.getPreferences("AssetResellerID",""));
            params.put("Timestamp", finalDate);
            params.put("RxTime", finalDate);
            params.put("Amount", pref.getPreferences("Amount",""));
            params.put("PIC", pref.getPreferences("PIC",""));
            params.put("Destination", pref.getPreferences("Destination",""));
            params.put("Phone", pref.getPreferences("Phone",""));
            params.put("Unit", pref.getPreferences("Unit",""));
            params.put("Flag", 2);
            params.put("Remarks", pref.getPreferences("Remarks",""));
            params.put("Receipt", pref.getPreferences("Receipt",""));
            params.put("UserID", 0);
            params.put("DriverID", pref.getPreferences("driver_id",""));
            params.put("Postal", pref.getPreferences("Postal",""));
            params.put("CusEmail", pref.getPreferences("CusEmail",""));
            params.put("Site", pref.getPreferences("Site",""));
            params.put("ReferenceNo", pref.getPreferences("maintenance_ReferenceNo",""));




        } catch (JSONException e) {
            e.printStackTrace();

        }

        final String url = AppConstant.endpoint_url + "jobinfo";

        //System.out.println(url);

        AQuery aq = new AQuery(this);
        aq.post(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                //System.out.println(response);
                if (status.getMessage().equals("OK")) {
                    try {
                        JSONObject obj = new JSONObject(response);

                        Log.e("Response : ", obj.getString("JobID"));
                        int item_no = 1;
                        for(int j = 0; j < pestsList.size(); j++){
                            uploadPestTreatment(obj.getInt("JobID"), item_no,
                                    pestsList.get(j).getPestDesc(), pestsList.get(j).getTreatmentDesc());

                            item_no++;
                        }


                    } catch (JSONException e) {
                        e.printStackTrace();
                    }

                }
            }
        }.header("Content-Type", "application/x-www-form-urlencoded")
                .header("_method", "POST"));
    }

    private void uploadPestTreatment(int jobID, int itemNo, String pestDesc, String treatmentDesc){
        JSONObject params = new JSONObject();
        try {
            params.put("JobID", jobID);
            params.put("ItemNo", itemNo);
            params.put("PestDesc", pestDesc);
            params.put("TreatmentDesc", treatmentDesc);

        } catch (JSONException e) {
            e.printStackTrace();

        }

        final String url = AppConstant.endpoint_url + "pesttreatmentinfo";

        //System.out.println(url);

        AQuery aq = new AQuery(this);
        aq.post(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                //System.out.println(response);
                if (status.getMessage().equals("OK")) {


                }
            }
        }.header("Content-Type", "application/x-www-form-urlencoded")
                .header("_method", "POST"));
    }

    public class uploadServiceForms extends AsyncTask<String, Void, Long> {
        boolean isSentPDF = false;

        protected Long doInBackground(String... FULL_PATH_TO_LOCAL_FILE) {
            {
                Calendar cal = Calendar.getInstance();
                cal.setTime(Calendar.getInstance().getTime());
                //Change Timestamp Timezone
                Date eightHourBack = cal.getTime();
                String timestamp = new SimpleDateFormat("ddMMMyyyy").format(eightHourBack);
                String filename = pref.getPreferences("maintenance_jobID","") + "-" + timestamp + ".pdf";
                String mPath = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceService/"  + "/" + filename;

                FTPClient ftpClient = new FTPClient();
                int reply;

                String servername = AppConstant.ads_host;
                int port = 21;
                String user = "SystemPest_MaintenanceForms";
                String pass = "trackacecom";
                try {
                    //System.out.println("Entered Data Upload loop!");
                    ftpClient.connect(servername, 21);
                    ftpClient.login(user, pass);
                    ftpClient.sendCommand("Enter FTP Server");
                    ftpClient.changeWorkingDirectory("/");

                    reply = ftpClient.getReplyCode();

                    if (FTPReply.isPositiveCompletion(reply)) {
                        //System.out.println("Connected Success");
                    } else {
                        //System.out.println("Connection Failed");
                        ftpClient.disconnect();
                    }

                    try
                    {

                        ftpClient.enterLocalPassiveMode(); // important!
                        ftpClient.setFileType(ftpClient.BINARY_FILE_TYPE);

                        FileInputStream in = new FileInputStream(new File(mPath));
                        boolean result = ftpClient.storeFile("/"+ pref.getPreferences("maintenance_jobID","") +".pdf", in);
                        in.close();
                        if (result) isSentPDF = true;
                        ftpClient.logout();
                        ftpClient.disconnect();
                        //File file = new File(path);
                        //boolean deleted = file.delete();
                    }
                    catch (Exception e)
                    {
                        Log.e("Upload Failed : ", String.valueOf(e));
                        e.printStackTrace();
                    }

                } catch (SocketException e) {
                    Log.e("FTP", e.getStackTrace().toString());
                    //System.out.println("Socket Exception!");
                } catch (UnknownHostException e) {
                    Log.e("FTP", e.getStackTrace().toString());
                } catch (IOException e) {
                    Log.e("FTP", e.getStackTrace().toString());
                    //System.out.println("IO Exception!");
                }
                return null;
            }
        }

        @Override
        protected void onPostExecute(Long aLong) {
            super.onPostExecute(aLong);

            if(!isSentPDF){
                hideDialog();
                connectionFailedDialog("PDF form is not uploaded.","Please try again.");
            }else{
                Calendar cal = Calendar.getInstance();
                cal.setTime(Calendar.getInstance().getTime());
                Date eightHourBack = cal.getTime();
                String timestamp = new SimpleDateFormat("ddMMMyyyy").format(eightHourBack);
                String filename = pref.getPreferences("maintenance_jobID","") + "-" + timestamp + ".pdf";
                String mPath = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-MaintenanceService/"  + "/" + filename;

                if(pref.getPreferences("maintenance_Email","").equals("")){
                    updateMaintenance();
                }

                if(!cusEmail.getText().toString().equals("")){
                    sendEmail(mPath, filename);

                }

                updateMaintenanceJob();


            }
        }
    }


    private void backDialog(final String title, String message){
        alert_dialog = new AlertDialog.Builder(this);
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle(title);
        alert_dialog.setMessage(message);
        alert_dialog.setNegativeButton("No", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alert_dialog.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(final DialogInterface dialog, int which) {
                dialog.dismiss();

                /*Intent intent = new Intent(MaintenanceDetailActivity.this, MaintenanceActivity.class);
                startActivity(intent);
                finish();*/

                Intent intent = new Intent(MaintenanceDetailActivity.this, JobActivity.class);
                startActivity(intent);
                finish();
            }
        });
        alert_dialog.show();

    }

    private void completeDialog(final String title, String message){
        alert_dialog = new AlertDialog.Builder(this);
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle(title);
        alert_dialog.setMessage(message);
        alert_dialog.setNegativeButton("No", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alert_dialog.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(final DialogInterface dialog, int which) {
                dialog.dismiss();
                Calendar cal = Calendar.getInstance();
                cal.setTime(Calendar.getInstance().getTime());
                Date eightHourBack = cal.getTime();
                String date = new SimpleDateFormat("yyyyMMdd", Locale.ENGLISH).format(eightHourBack);
                String time = new SimpleDateFormat("HHmmss", Locale.ENGLISH).format(eightHourBack);
                String signature_name = "SIGNATURE_"+ pref.getPreferences("maintenance_jobID","") + "_" + date + "_" + time;
                final String Signature_Client_StoredPath = DIRECTORY_CLIENT_SIGNATURE + pref.getPreferences("maintenance_jobID","") + ".png";

                dialogSignature("Client Signature", Signature_Client_StoredPath, DIRECTORY_CLIENT_SIGNATURE);
                //onBackPressed();
            }
        });
        alert_dialog.show();

    }

    public boolean isInternetAvailable() {
        try {
            final InetAddress address = InetAddress.getByName("www.google.com");
            return !address.equals("");
        } catch (UnknownHostException e) {
            // Log error
            Log.e("Unknown Host : " , String.valueOf(e));
        }
        return false;
    }

    public boolean isServerAvailable() {
        try {
            InetAddress ipAddr = InetAddress.getByName("117.120.7.120");
            //You can replace it with your name
            return !ipAddr.equals("");

        } catch (Exception e) {
            return false;
        }
    }

    private boolean isNetworkAvailable() {
        ConnectivityManager connectivityManager
                = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();
    }

    private void showDialog(){
        nDialog = new ProgressDialog(MaintenanceDetailActivity.this);
        nDialog.setMessage("Loading..");
        nDialog.setTitle("Please Wait...");
        nDialog.setIndeterminate(false);
        nDialog.setCancelable(true);
        nDialog.show();
    }

    private void hideDialog(){
        if(nDialog != null){
            nDialog.dismiss();
        }
    }


}

class SendMaintenanceEmailAsyncTask extends AsyncTask<Void, Void, Boolean> {
    Mail m;
    MaintenanceDetailActivity activity;

    public SendMaintenanceEmailAsyncTask() {
    }

    @Override
    protected Boolean doInBackground(Void... params) {
        try {
            if (m.send()) {
                Log.e("Mail : ", "Email sent...");
            } else {
                Log.e("Mail : ", "Email failed to send...");
            }

            return true;
        } catch (AuthenticationFailedException e) {
            Log.e(SendEmailAsyncTask.class.getName(), "Bad account details");
            Log.e("Authentication", String.valueOf(e));
            e.printStackTrace();
            return false;
        } catch (MessagingException e) {
            Log.e("Messaging Exception", String.valueOf(e));
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            Log.e("Exception", String.valueOf(e));
            return false;
        }
    }

}
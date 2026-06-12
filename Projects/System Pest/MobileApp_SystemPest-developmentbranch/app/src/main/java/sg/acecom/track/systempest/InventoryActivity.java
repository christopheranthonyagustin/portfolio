package sg.acecom.track.systempest;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import androidx.annotation.Nullable;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.androidquery.AQuery;
import com.androidquery.callback.AjaxCallback;
import com.androidquery.callback.AjaxStatus;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import sg.acecom.track.systempest.adapter.InventoryAdapter;
import sg.acecom.track.systempest.adapter.RecyclerTouchListener;
import sg.acecom.track.systempest.database.DatabaseHelper;
import sg.acecom.track.systempest.model.Inventory;
import sg.acecom.track.systempest.util.AppConstant;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 23/4/18.
 */

public class InventoryActivity extends AppCompatActivity implements View.OnClickListener{

    Button buttonQrCode;
    Button buttonSubmit;
    FloatingActionButton fabAdd;
    RecyclerView recyclerInventory;
    private InventoryAdapter adapter;
    private List<Inventory> inventoryList;
    MyPreferences pref;

    private DatabaseHelper db;

    //Signature
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

    String date;
    String time;
    String signature_name;
    String final_signature_name;

    AlertDialog.Builder alert_dialog;

    Integer itemCount;


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_inventory);
        pref = new MyPreferences(this);
        db = new DatabaseHelper(this);



        inventoryList = new ArrayList<>();
        adapter = new InventoryAdapter(this, inventoryList);
        buttonQrCode = findViewById(R.id.buttonQrCode);
        buttonSubmit = findViewById(R.id.buttonSubmit);
        fabAdd = findViewById(R.id.fabAdd);
        recyclerInventory = findViewById(R.id.recyclerInventory);
        recyclerInventory.setLayoutManager(new LinearLayoutManager(this));
        recyclerInventory.setItemAnimator(new DefaultItemAnimator());
        recyclerInventory.setAdapter(adapter);

        itemCount = 0;

        buttonQrCode.setOnClickListener(this);
        buttonSubmit.setOnClickListener(this);
        fabAdd.setOnClickListener(this);

        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        Date eightHourBack = cal.getTime();
        date = new SimpleDateFormat("yyyyMMdd", Locale.ENGLISH).format(eightHourBack);
        time = new SimpleDateFormat("HHmmss", Locale.ENGLISH).format(eightHourBack);
        signature_name = "SIGNATURE_" + date + "_" + time;
        //String itemName = getIntent().getStringExtra("itemName");
        String itemName = pref.getPreferences("itemName","");
        if(!itemName.equals("")){
            Log.e("Item Name : ", itemName);
            loadInventoryItem(itemName);
            //loadItemInformation(itemName);
        }
        /**
         * On long press on RecyclerView item, open alert dialog
         * with options to choose
         * Edit and Delete
         * */
        recyclerInventory.addOnItemTouchListener(new RecyclerTouchListener(this,
                recyclerInventory, new RecyclerTouchListener.ClickListener() {
            @Override
            public void onClick(View view, final int position) {
            }

            @Override
            public void onLongClick(View view, int position) {

            }
        }));
    }

    @Override
    protected void onResume() {
        super.onResume();
        loadStorage();

    }

    public void loadStorage(){
        //Log.e("Inventory Storage : ", String.valueOf(db.getInventoryCount()));
        if(db.getInventoryCount() > 0){
            loadStorageItem();
        }else{
            inventoryList.clear();
            adapter.notifyDataSetChanged();
        }
    }

    @Override
    public void onClick(View v) {
        Intent intent;
        switch(v.getId()){
            case(R.id.buttonQrCode):
                intent = new Intent(InventoryActivity.this, QrCodeActivity.class);
                startActivity(intent);
                finish();
                break;

            case(R.id.buttonSubmit):

                boolean isEmpty = false;
                System.out.println("INVENTORY = "  + inventoryList.size());
                if(inventoryList.size() != 0) {
                    for (int i = 0; i < inventoryList.size(); i++) {
                        if (Integer.parseInt(inventoryList.get(i).getItemStockout()) == 0) {
                            isEmpty = true;
                        }
                    }

                    if (isEmpty == false) {
                        dialogSignature();
                    } else {
                        showDialog();
                        //Toast.makeText(InventoryActivity.this,"No item added!", Toast.LENGTH_SHORT).show();
                    }
                } else {
                    showDialog2();
                }

                break;

            case(R.id.fabAdd):
                manualAddInventory();

                break;
        }
    }

    private void loadStorageItem(){
        inventoryList.clear();
        for(int i = 0; i < db.getAllInventory().size(); i++){
            inventoryList.add(new Inventory(db.getAllInventory().get(i).getItemID(),
                    db.getAllInventory().get(i).getItemName(),
                    db.getAllInventory().get(i).getItemReference(),
                    db.getAllInventory().get(i).getItemQuantity(),
                    db.getAllInventory().get(i).getItemPrice(),
                    db.getAllInventory().get(i).getItemUnit(),
                    db.getAllInventory().get(i).getItemStockout()));

            Log.e("INVENTORY LIST",inventoryList.get(i).getItemName());
            Log.e("INVENTORY LIST",inventoryList.get(i).getItemReference());
            Log.e("INVENTORY LIST",inventoryList.get(i).getItemQuantity());
            Log.e("INVENTORY LIST",inventoryList.get(i).getItemPrice());
            Log.e("INVENTORY LIST",inventoryList.get(i).getItemStockout());
        }
        adapter.notifyDataSetChanged();
    }

    private void loadInventoryItem(String reference)
    {
        final String url = AppConstant.endpoint_url + "inventoryinfo?CompanyID=" + pref.getPreferences("driver_company_id","") + "&Reference=" + reference;
        AQuery aq = new AQuery(this);
        System.out.println("URL = " + url);
        aq.ajax(url, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                System.out.println("Response = " + response);
                System.out.println("Status = " + status.getMessage());
                if (status.getMessage().equals("OK")) {
                    boolean hasDuplicate = false;

                    try {
                        JSONArray ja = new JSONArray(response);
                        JSONObject obj = (JSONObject) ja.get(0);
                        Inventory inventory = new Inventory();
                        Log.e("Inventory Count : ", String.valueOf(db.getInventoryCount()));
                        if(db.getInventoryCount() <= 0){
                            int qtt = obj.getInt("Quantity");
                            if(qtt <= 0){
                                showDialogNoStock();
                            } else{
                                insertInventory(obj.getInt("InventoryID"),obj.getString("Name"), obj.getString("Reference")
                                        , obj.getString("Quantity"), obj.getString("Price"), obj.getString("Unit"), "0");
                            }
                        }else{
                            int i;
                            for(i = 0; i < db.getAllInventory().size(); i++){
                                if(db.getAllInventory().get(i).getItemName().equals(obj.getString("Name"))){
                                    hasDuplicate = true;
                                }

                                if(i+1 == db.getAllInventory().size()){
                                    if(!hasDuplicate){
                                        //Log.e("NO Duplicate","NO");
                                        int qtt = obj.getInt("Quantity");
                                        if(qtt <= 0){
                                            showDialogNoStock();
                                        } else{
                                            insertInventory(obj.getInt("InventoryID"),obj.getString("Name"), obj.getString("Reference")
                                                    , obj.getString("Quantity"), obj.getString("Price"), obj.getString("Unit"), "0");
                                        }
                                    }
                                }
                            }
                        }

                    } catch (JSONException e) {
                        Log.e("Error : ", String.valueOf(e));
                    }
                    pref.removePreferences("itemName");
                    adapter.notifyDataSetChanged();
                }

            }
        }); //End of Aquery
    }

    /*private void loadItemInformation(String reference){

        final String url = AppConstant.endpoint_url + "inventoryinfo?CompanyID=" + pref.getPreferences("driver_company_id","") + "&Reference=" + reference;
        //final String url = "http://track-asia.com" + "inventoryinfo?CompanyID=" + pref.getPreferences("driver_company_id","") + "&Reference=" + reference;
        //Log.e("Item URL : ", url);
        // prepare the Request
        JsonArrayRequest getRequest = new JsonArrayRequest(Request.Method.GET, url, null,
                new Response.Listener<JSONArray>()
                {
                    @Override
                    public void onResponse(JSONArray response) {
                        // display response
                        //inventoryList.clear();
                        try{
                            JSONObject obj = response.getJSONObject(0);
                            Inventory inventory = new Inventory();

                            if(db.getInventoryCount() <= 0){
                                insertInventory(obj.getInt("InventoryID"),obj.getString("Name"), obj.getString("Reference")
                                        , obj.getString("Quantity"), obj.getString("Price"), obj.getString("Unit"));
                            }else{
                                for(int i = 0; i < db.getAllInventory().size(); i++){
                                    if(db.getAllInventory().get(i).getItemName().equals(obj.getString("Name"))){
                                        hasDuplicate = true;
                                        //Log.e("Found Duplicate","YES");
                                        //i = db.getAllInventory().size();
                                    }

                                    if(i+1 == db.getAllInventory().size()){
                                        if(!hasDuplicate){
                                            //Log.e("NO Duplicate","NO");
                                            insertInventory(obj.getInt("InventoryID"),obj.getString("Name"), obj.getString("Reference")
                                                    , obj.getString("Quantity"), obj.getString("Price"), obj.getString("Unit"));

                                        }else{
                                            //Log.e("Has Duplicate","Yes");
                                            Toast.makeText(InventoryActivity.this,"Item already existed in the list...", Toast.LENGTH_SHORT).show();
                                        }
                                    }
                                }
                            }

                        }catch(Exception e){
                            Log.e("Response Exception :", String.valueOf(e));
                        }
                        pref.removePreferences("itemName");
                        adapter.notifyDataSetChanged();
                        //getIntent().removeExtra("itemName");
                    }
                },
                new Response.ErrorListener()
                {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e("InventoryActivity", "Error: " + error
                                + "\nStatus Code " + error.networkResponse.statusCode
                                + "\nResponse Data " + error.networkResponse.data.toString()
                                + "\nCause " + error.getCause()
                                + "\nmessage" + error.getMessage());
                    }
                }
        );

        // Access the RequestQueue through your singleton class.
        AppController.getInstance().addToRequestQueue(getRequest);
    }
*/
    private void insertInventory(int itemID, String itemName, String itemReference, String itemQuantity, String itemPrice, String itemUnit, String itemStockout){
        // inserting note in db and getting
        // newly inserted note id
        Log.e("INSERT",itemUnit);
        long id = db.insertNote(itemID,itemName, itemReference, itemQuantity, itemPrice,itemUnit, itemStockout);

        // get the newly inserted note from db
        Inventory n = db.getNote(id);

        if (n != null) {
            // adding new note to array list at 0 position
            inventoryList.add(0, n);

            // refreshing the list
            adapter.notifyDataSetChanged();
        }
    }

    private void updateInventory(final int itemID, final String itemName, final String itemReference, final String itemQuantity, final String itemPrice, final String itemUnit) {

        JSONObject params = new JSONObject();

        try {
            params.put("ItemID", String.valueOf(itemID));
            params.put("Name", itemName);
            params.put("Quantity", itemQuantity);
            params.put("Reference", itemReference);
            params.put("Unit", itemUnit);
            params.put("Price", itemPrice);
            params.put("CompanyID", pref.getPreferences("driver_company_id",""));
        } catch (JSONException e) {
            e.printStackTrace();

        }

        Log.e("PARAMS",params.toString());

        final String url = AppConstant.endpoint_url + "inventoryinfo?ID=" + itemID;

        //System.out.println(url);

        AQuery aq = new AQuery(this);
        aq.put(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                //System.out.println(response);
                if (status.getMessage().equals("OK")) {

                    }
                }
        }.header("Content-Type", "application/x-www-form-urlencoded")
                .header("_method", "PUT"));
    }

    public void updateItemCount(String action){
        if(action.equals("Add")){
            itemCount = itemCount + 1;
        } else {
            itemCount = itemCount - 1;
        }
    }

    private void postInventoryHistory(final int itemID, final String itemName, final String itemReference, final String itemPreviousQuantity,final String itemQuantity, final String itemStockOutQuantity) {

        String format = "dd-MMM-yyyy hh:mm:ss";
        final SimpleDateFormat sdf = new SimpleDateFormat(format);
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        String utcTime = sdf.format(new Date());

        Log.e("UTCTIME",utcTime);

        Calendar cal = Calendar.getInstance();
        cal.setTime(Calendar.getInstance().getTime());
        cal.add(Calendar.HOUR, -8);
        Date eightHourBack = cal.getTime();
        String timestamp = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss", Locale.ENGLISH).format(eightHourBack);

        Log.e("TIMESTAMP",timestamp);

        JSONObject params = new JSONObject();

        try {
            params.put("InventoryID", itemID);
            params.put("Name", itemName);
            params.put("PreviousQuantity", itemPreviousQuantity);
            params.put("Quantity", itemStockOutQuantity);
            params.put("TotalQuantity", itemQuantity);
            params.put("Timestamp", timestamp);
            params.put("RxTime", timestamp);
            params.put("DriverID", pref.getPreferences("driver_id",""));
            params.put("AssetID", pref.getPreferences("driver_assets_id",""));
            //params.put("JobID", itemReference);
            params.put("StockType", 3);
            params.put("Reference", itemReference);
            params.put("Platform", 2);
            params.put("CompanyID", pref.getPreferences("driver_company_id",""));

        } catch (JSONException e) {
            e.printStackTrace();

        }

        Log.e("PARAMSPOST",params.toString());

        final String url = AppConstant.endpoint_url + "inventoryhistoryinfo";

        //System.out.println(url);

        AQuery aq = new AQuery(this);
        aq.post(url, params, String.class, new AjaxCallback<String>() {
            @Override
            public void callback(String url, String response, AjaxStatus status) {
                //System.out.println(response);
                if (status.getMessage().equals("OK")) {
                    try{
                        JSONObject ja = new JSONObject(response);
                        final_signature_name = ja.getString("InventoryHistoryID");
                        new InventoryActivity.uploadSupervisorSignatureFTP(final_signature_name).execute();

                    }catch(Exception e){
                        Log.e("Error : ", String.valueOf(e));
                    }

                }
            }
        }.header("Content-Type", "application/x-www-form-urlencoded")
                .header("_method", "POST"));
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
    public void dialogSignature() {

        // Dialog Function
        dialog = new Dialog(InventoryActivity.this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_signature);
        dialog.setCancelable(true);

        String signature_title = "Supervisor Signature";
        // Creating Separate Directory for saving Generated Images
        final String DIRECTORY_SIGNATURE = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-InventorySignatures/";
        //String pic_name = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss", Locale.getDefault()).format(new Date());
        final String Signature_StoredPath = DIRECTORY_SIGNATURE + signature_name + ".png";

        // Method to create Directory, if the Directory doesn't exists
        file = new File(DIRECTORY_SIGNATURE);
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
                for(int i = 0; i < inventoryList.size(); i ++){
                    int final_quantity = 0;
                    final_quantity = Integer.parseInt(inventoryList.get(i).getItemQuantity()) - Integer.parseInt(inventoryList.get(i).getItemStockout()) ;
                    Log.e("Final Quantity",inventoryList.get(i).getItemQuantity() + "");
                    Log.e("Final Quantity",inventoryList.get(i).getItemStockout()+ "");
                    Log.e("Final Quantity",final_quantity + "");
                    Log.e("UNIT",inventoryList.get(i).getItemUnit());
                    updateInventory(inventoryList.get(i).getItemID(),
                            inventoryList.get(i).getItemName(),
                            inventoryList.get(i).getItemReference(),
                            String.valueOf(final_quantity), inventoryList.get(i).getItemPrice(), inventoryList.get(i).getItemUnit());

                    postInventoryHistory(inventoryList.get(i).getItemID(),
                            inventoryList.get(i).getItemName(),
                            inventoryList.get(i).getItemReference(),
                            String.valueOf(inventoryList.get(i).getItemQuantity()),
                            String.valueOf(final_quantity),
                            String.valueOf(inventoryList.get(i).getItemStockout()));

                    if(i+1 == inventoryList.size()){
                        db.deleteAll();
                        loadStorage();
                        Toast.makeText(InventoryActivity.this,"Stock History Updated...", Toast.LENGTH_SHORT).show();
                    }
                }
                //new newOrderActivity.uploadSignatureFTP().execute();

                dialog.dismiss();
            }
        });

        mCancel.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                dialog.dismiss();
                // Calling the same class
                recreate();
            }
        });
        dialog.show();
    }

    public class uploadSupervisorSignatureFTP extends AsyncTask<String, Void, Long> {

        String final_file_name;

        public uploadSupervisorSignatureFTP(String filename) {
                final_file_name = filename;
        }

        protected Long doInBackground(String... FULL_PATH_TO_LOCAL_FILE) {
            {
                FTPClient ftpClient = new FTPClient();
                int reply;

                String servername = AppConstant.ads_host;
                int port = 21;
                String user = "SystemPest_SupervisorSignatures";
                String pass = "trackacecom";
                try {
                    Log.e("START :", "UPLOADING");
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
                        String path = Environment.getExternalStorageDirectory().getPath() + "/SystemPest-InventorySignatures/" + signature_name + ".png";
                        FileInputStream in = new FileInputStream(new File(path));
                        boolean result = ftpClient.storeFile("/"+ final_file_name +".png", in);
                        in.close();
                        if (result) //Log.v("upload result", "succeeded");
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
    }

    private void manualAddInventory(){
        LayoutInflater layoutInflaterAndroid = LayoutInflater.from(this);
        View mView = layoutInflaterAndroid.inflate(R.layout.dialog_input_reference, null);
        AlertDialog.Builder alertDialogBuilderUserInput = new AlertDialog.Builder(this);
        alertDialogBuilderUserInput.setView(mView);

        final EditText userInputReference = (EditText) mView.findViewById(R.id.userInputReference);
        alertDialogBuilderUserInput
                .setCancelable(false)
                .setPositiveButton("Submit", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogBox, int id) {
                        // ToDo get user input here
                        loadInventoryItem(userInputReference.getText().toString());
                        //loadItemInformation(userInputReference.getText().toString());
                    }
                })

                .setNegativeButton("Cancel",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialogBox, int id) {
                                dialogBox.cancel();
                            }
                        });

        AlertDialog alertDialogAndroid = alertDialogBuilderUserInput.create();
        alertDialogAndroid.show();
    }

    public void showDialogNoStock() {
        alert_dialog = new AlertDialog.Builder(this);
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle("No stock");
        alert_dialog.setMessage("There is no stock for this item");
        alert_dialog.setNegativeButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alert_dialog.show();
    }

    public void showDialog2() {
        alert_dialog = new AlertDialog.Builder(this);
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle("No Item Added");
        alert_dialog.setMessage("Please add at least 1 item");
        alert_dialog.setNegativeButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alert_dialog.show();
    }

    public void showDialog() {
        alert_dialog = new AlertDialog.Builder(this);
        alert_dialog.setCancelable(true);
        alert_dialog.setTitle("No Quantity Added");
        alert_dialog.setMessage("Please add at least 1 quantity for each item");
        alert_dialog.setNegativeButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alert_dialog.show();
    }
}

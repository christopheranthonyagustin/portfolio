package sg.acecom.track.systempest;

import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;

import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by jmingl on 8/12/17.
 */

public class PDFActivity extends AppCompatActivity implements View.OnClickListener  {

    WebView webViewPDF;
    Button buttonBack;
    MyPreferences pref;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pdf);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        pref = new MyPreferences(this);
        webViewPDF = (WebView) findViewById(R.id.webPDF);
        buttonBack = (Button) findViewById(R.id.buttonBack);
        webViewPDF.getSettings().setJavaScriptEnabled(true);
        webViewPDF.getSettings().setBuiltInZoomControls(true);
        webViewPDF.getSettings().setDisplayZoomControls(false);
        webViewPDF.setWebViewClient(new MyWebViewClient());
        openURL();
        buttonBack.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch(v.getId())
        {
            case(R.id.buttonBack):
                onBackPressed();
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


    @Override
    public void onBackPressed() {
        super.onBackPressed();
        pref.removePreferences("jobServiceForm");
    }

    private class MyWebViewClient extends WebViewClient {
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            view.loadUrl(url);
            return true;
        }
    }

    private void openURL() {
        try{
            webViewPDF.loadUrl("https://drive.google.com/viewerng/viewer?embedded=true&url=" + pref.getPreferences("jobServiceForm",""));
            webViewPDF.requestFocus();
        }catch(Exception e){
            Log.e("Error Loading : ", String.valueOf(e));
        }

    }
}

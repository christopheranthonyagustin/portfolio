package sg.acecom.track.systempest.qrcode.decode;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;

import sg.acecom.track.systempest.InventoryActivity;
import sg.acecom.track.systempest.QrCodeActivity;
import sg.acecom.track.systempest.R;
import sg.acecom.track.systempest.util.MyPreferences;

/**
 * Created by xingli on 1/8/16.
 * <p/>
 * 二维码解析管理。
 */
public class DecodeManager {


    public void showPermissionDeniedDialog(final Context context) {
        // 权限在安装时被关闭了，如小米手机
        new AlertDialog.Builder(context).setTitle(R.string.qr_code_notification)
                .setMessage(R.string.qr_code_camera_not_open)
                .setPositiveButton(R.string.qr_code_positive_button_know, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                        if (context instanceof Activity) {
                            ((Activity) context).finish();
                        }
                    }
                })
                .show();
    }

    public void showResultDialog(final Activity activity, final String resultString, DialogInterface.OnClickListener listener) {
        new AlertDialog.Builder(activity).setTitle("Item Reference No")
                .setMessage(resultString)
                .setCancelable(false)
                .setPositiveButton(R.string.qr_code_positive_button_confirm, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        MyPreferences pref = new MyPreferences(activity);
                        Intent intent = new Intent(activity, InventoryActivity.class);
                        pref.savePreferences("itemName",resultString);
                        intent.putExtra("itemName",resultString);
                        activity.startActivity(intent);
                        activity.finish();
                    }
                })
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        Intent intent = new Intent(activity, QrCodeActivity.class);
                        //intent.putExtra("itemName",resultString);
                        activity.startActivity(intent);
                        activity.finish();
                    }
                })
                .show();
    }

    public void showCouldNotReadQrCodeFromScanner(Context context, final OnRefreshCameraListener listener) {
        new AlertDialog.Builder(context).setTitle(R.string.qr_code_notification)
                .setMessage(R.string.qr_code_could_not_read_qr_code_from_scanner)
                .setPositiveButton(R.string.qc_code_close, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                        if (listener != null) {
                            listener.refresh();
                        }
                    }
                })
                .show();
    }

    public void showCouldNotReadQrCodeFromPicture(Context context) {
        new AlertDialog.Builder(context).setTitle(R.string.qr_code_notification)
                .setMessage(R.string.qr_code_could_not_read_qr_code_from_picture)
                .setPositiveButton(R.string.qc_code_close, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                })
                .show();
    }

    public interface OnRefreshCameraListener {
        void refresh();
    }
}

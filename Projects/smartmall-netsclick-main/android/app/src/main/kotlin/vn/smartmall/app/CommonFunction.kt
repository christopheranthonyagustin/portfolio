package vn.smartmall.app

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.net.ConnectivityManager
import android.preference.PreferenceManager
import android.util.Log
import androidx.core.content.ContextCompat
import io.flutter.plugin.common.MethodChannel
import com.nets.nofsdk.exception.CardNotRegisteredException
import com.nets.nofsdk.exception.ServiceAlreadyInitializedException
import com.nets.nofsdk.exception.ServiceNotInitializedException
import com.nets.nofsdk.request.Debit
import com.nets.nofsdk.request.Deregistration
import com.nets.nofsdk.request.NofService
import com.nets.nofsdk.request.Registration
import com.nets.nofsdk.request.StatusCallback
import com.vkey.android.support.app.ActivityCompat
import java.text.DecimalFormat
import java.util.concurrent.atomic.AtomicBoolean
import vn.smartmall.app.NOFContext


public class CommonFunction(current: MainActivity) {
    protected var context: Context
    var registration: Registration? = null
    var deregistration: Deregistration? = null
    var debit: Debit? = null
    var registrationStatus: Boolean? = null
    var isInForeground = false
    private val isInitializing: AtomicBoolean = AtomicBoolean(false)

    init {
        context = current
    }

    val isNetworkConnected: Boolean
        get() {
            val cm: ConnectivityManager =
                context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            return cm.getActiveNetworkInfo() != null
        }

    fun doInitialization(callback: StatusCallback<String?, String?>?) {
        Log.d("+_", "====================doInitialization====================")
        if (isInitializing.get()) {
            Log.d("+_", "Is already initializing")
            return
        }
        isInitializing.set(true)
        try {
//            Environment environment = Environment.getInstance();
//            Log.w("+_", "################################");
//            Log.w("+_", "Environment details:\n" + environment.getEnvironmentDetails());
//            Log.w("+_", "################################");
            if (NofService.isInitialized()) {
                Log.d("+_", "isInitialized: true")
                isInitializing.set(false)
                return
            }
            Log.d("+_", "isInitialized: false")
            NofService.setSdkDebuggable(true)

            // TODO: Change according to Partner Merchant credentials
            NofService.initialize(
                this.context,
                "https://uatnetspay.nets.com.sg",  // map url
                "https://uat-api.nets.com.sg/uat",  // pn blocl url
                "00011000001",  // app id
                "B4C110917EABBF699F08C52AF3A7BF71B3E754C2687C8313C9198C31E8B62CAF",  // app secret
                NOFContext.appPublicKeySet,  // public keyset?
                caResource,  // ca resource -- "ca"
                callback
            )
            isInitializing.set(false)
        } catch (e: ServiceAlreadyInitializedException) {
            isInitializing.set(false)
            Log.d("_", "end")
        }
    }//"netspay_nets_com_sg",//"netspay_nets_com_sg",

    // Might need change when go into different version
    //        Environment environment = Environment.getInstance();
    private val caResource: Int
        private get() {
            Log.d("_", "getCaResource")
            //        Environment environment = Environment.getInstance();
            Log.d(
                "_", "environment " + context.getResources().getIdentifier(
                    "ca",  //"netspay_nets_com_sg",
                    "raw", context.getPackageName()
                )
            )
            // Might need change when go into different version
            return context.getResources().getIdentifier(
                "ca",  //"netspay_nets_com_sg",
                "raw", context.getPackageName()
            )
        }

    fun doRegistration(mid: String?, muid: String?, methodCallResult: MethodChannel.Result) {
        Log.d("_", "doRegistration")
        if (registration == null) {
            registration = Registration(mid, muid)
        }
        try {
            Log.d("_", "doRegistration_invoke")
            registration!!.invoke(object : StatusCallback<String?, String?> {
                override fun success(p0: String?) {
                    Log.d("+_", "result: $p0")
                    methodCallResult.success(p0)
                    if (isInForeground) {
                        // showDialog("Registration Status", "Success: " + result);
                    } else {
                        registrationStatus = true
                    }

                    // doGmt();
                    Log.d("+_", "Registration Was Success: $p0")
                }

                override fun failure(p0: String?) {
                    methodCallResult.error(p0!!, p0, p0)
                    // AnalyticsHandler.logEvent("doRegistration_invoke_failure");
                    PreferenceManager.getDefaultSharedPreferences(context)
                        .edit()
                        .putString(NOFContext.KEY_REGISTRATION_OK, "0")
                        .apply()
                    PreferenceManager.getDefaultSharedPreferences(context)
                        .edit()
                        .putString(NOFContext.KEY_GMT_OK, "0")
                        .apply()
                    if (isInForeground) {
                    } else {
                        registrationStatus = false
                    }
                    // showDialog("Registration Status", "Failure: " + result);
                    Log.d("+_", "Registration Was Failure: $p0")
                }

            })
        } catch (e: ServiceNotInitializedException) {
            e.printStackTrace()
        }
    }

    fun doDebit(amount: String, methodCallResult: MethodChannel.Result) {
        Log.d("_", "doDebit $amount")
        // amountInCents = formatAmountInCents(amountInCents);
        // amountInCents = "1000";
        NOFContext.instance!!.amountInCents = amount
        Log.d("+_", "Debit amountInCents: $amount")
        if (debit == null) {
            debit = Debit(amount)
        }
        try {
            debit!!.invoke(object : StatusCallback<String?, String?> {
                override fun success(p0: String?) {
                    Log.d("+_", "Debit Cryptogram Success: $p0")
                    methodCallResult.success(p0)
                }

                override fun failure(p0: String?) {
                    Log.d("+_", "Was Failure: $p0")
                    methodCallResult.error(p0!!, p0, p0)
                }

            })
        } catch (e: ServiceNotInitializedException) {
            e.printStackTrace()
            e.message?.let { methodCallResult.error(it, e.message, e) }
        }
        debit = null
        Log.d("+_", "Debit END")
    }

    fun doDebitWithPIN(
        amount: String, responseCode: String?, txnCryptogram: String?,
        methodCallResult: MethodChannel.Result
    ) {
        Log.d("_", "doDebitWithPIN")
        Log.d("_", responseCode!!)
        Log.d("_", txnCryptogram!!)
        Log.d("+_", "Debit amountInCents: $amount")
        if (debit == null) {
            debit = Debit(amount, responseCode, txnCryptogram)
        }
        try {
            debit!!.invoke(object : StatusCallback<String?, String?> {
                override fun success(p0: String?) {
                    Log.d("+_", "Debit WIth PIN Cryptogram Success: $p0")
                    methodCallResult.success(p0)
                }

                override fun failure(p0: String?) {
                    Log.d("+_", "Was Failure: $!p0")
                    methodCallResult.success(p0)
                }
            })
        } catch (e: ServiceNotInitializedException) {
            e.printStackTrace()
            e.message?.let { methodCallResult.error(it, e!!.message, e) }
        }
        debit = null
        Log.d("+_", "Debit WITH PIN END")
    }

    fun doDeregistration(methodCallResult: MethodChannel.Result) {
        Log.d("_", "doDeregistration")
        if (deregistration == null) {
            deregistration = Deregistration()
        }
        try {
            deregistration!!.invoke(object : StatusCallback<String?, String?>  {

                override fun success(p0: String?) {
                    methodCallResult.success(p0)
                }

                override fun failure(p0: String?) {
                    PreferenceManager.getDefaultSharedPreferences(context)
                        .edit()
                        .putString(NOFContext.KEY_DEREGISTRATION_OK, "0")
                        .apply()
                    methodCallResult.error(p0.toString(), p0.toString(), p0)                }
            })
        } catch (e: CardNotRegisteredException) {
            e.printStackTrace()
            e.message?.let { methodCallResult.error(it, e.message, e) }
        } catch (e: ServiceNotInitializedException) {
            e.printStackTrace()
            e.message?.let { methodCallResult.error(it, e.message, e) }
        }
    }

    private fun markRegistrationAsFailed() {
        PreferenceManager.getDefaultSharedPreferences(context)
            .edit()
            .putString(NOFContext.KEY_GMT_OK, "0")
            .apply()
        PreferenceManager.getDefaultSharedPreferences(context)
            .edit()
            .putString(NOFContext.KEY_REGISTRATION_OK, "0")
            .apply()
        PreferenceManager.getDefaultSharedPreferences(context)
            .edit()
            .putString(NOFContext.KEY_REGISTRATION_DATA, "")
            .apply()
    }

    private fun formatAmountInCents(amountStr: String): String {
        var amountStr = amountStr
        var amtInCents = ""
        val df2 = DecimalFormat("0.00")
        amountStr = df2.format(java.lang.Double.valueOf(amountStr))
        println("Format>>$amountStr")
        amountStr = amountStr.replace("\\.".toRegex(), "")
        amtInCents = "000000000000".substring(0, 12 - amountStr.length) + amountStr
        // amtInCents = amo2@untStr.replaceAll("\\.","");
        return amtInCents
    }

    fun setEnvironment(mid: String?, muid: String?) {
        NOFContext.instance!!.mid = mid
        NOFContext.instance!!.muid = muid
        Log.w("+_", "MID: " + NOFContext.instance!!.mid)
        Log.w("+_", "MUID: " + NOFContext.instance!!.muid)
    }

    protected fun askUserPermission() {
        val REQUIRED_SDK_PERMISSIONS = arrayOf<String>(
            Manifest.permission.READ_EXTERNAL_STORAGE,
            Manifest.permission.WRITE_EXTERNAL_STORAGE, Manifest.permission.READ_PHONE_STATE
        )
        val REQUEST_CODE_ASK_PERMISSIONS = 1
        val missingPermissions: MutableList<String> = java.util.ArrayList<String>()
        // check all required dynamic permissions
        for (permission in REQUIRED_SDK_PERMISSIONS) {
            val result: Int = ContextCompat.checkSelfPermission(context, permission)
            println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$permission")
            if (result != PackageManager.PERMISSION_GRANTED) {
                missingPermissions.add(permission)
            }
        }
        if (!missingPermissions.isEmpty()) {
            // request all missing permissions
            val permissions: Array<String> = missingPermissions
                .toTypedArray<String>()
            ActivityCompat.requestPermissions(
                context as Activity,
                permissions,
                REQUEST_CODE_ASK_PERMISSIONS
            )
        }
    }
}
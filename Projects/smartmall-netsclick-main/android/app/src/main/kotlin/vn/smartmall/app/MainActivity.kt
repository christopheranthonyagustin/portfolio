package vn.smartmall.app

import android.os.Bundle
import android.util.Log
import com.nets.nofsdk.request.NofService
import com.nets.nofsdk.request.StatusCallback
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val CHANNEL = "vn.smartmall.app"

    @Override
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
        val localAPI = CommonFunction(this@MainActivity)
        init(localAPI)
        MethodChannel(
            getFlutterView(),
            CHANNEL
        ).setMethodCallHandler { methodCall, result ->
            when (methodCall.method) {
                "init" -> init(localAPI)
                "registration" -> {
                    val mid: String? = methodCall.argument("mid")
                    val muid: String? = methodCall.argument("muid")
                    localAPI.setEnvironment(mid, muid)
                    if (mid != null && muid != null) {
                        doRegistration(localAPI, mid, muid, result)
                    }
                }
                "deregistration" -> doDeregistration(localAPI, result)
                "debit" -> doDebit(localAPI, methodCall.argument("amount"), result)
                "debitWithPin" -> {
                    Log.d("_", "debitWithPin")
                    doDebitWithPin(
                        localAPI,
                        methodCall.argument("amount"),
                        methodCall.argument("response_code"),
                        methodCall.argument("cryptogram"),
                        result
                    )
                }
                else -> result.success("default")
            }
        }
    }

    private fun init(localAPI: CommonFunction) {
        initNOFService(localAPI, object : StatusCallback<String?, String?> {
            @Override
            override fun success(result: String?) {
                Log.d("_", "init NOFService success in main")
            }

            @Override
            override fun failure(p0: String?) {
                Log.d("_", "init NOFService failure in main")
                Log.d("+_", "Init Failure: $p0")
                if (p0!!.contains("20051")) {
                    // Permission error.
                    finishAndRemoveTask()
                    System.exit(0)
                } else if (p0.contains("20035")) {
                    finish()
                    System.exit(1)
                } else {
                    System.exit(0)
                }
            }
        })
    }

    private fun initNOFService(localAPI: CommonFunction, callback: StatusCallback<String?, String?>) {
        if (!NofService.isInitialized()) {
            // ProgressDialog p = new ProgressDialog(this);
            // p.setMessage("Please wait...SDK Initialization..");
            // p.setIndeterminate(false);
            // p.setCancelable(false);
            // p.show();
            localAPI.doInitialization(
                callback
            )
        } else {
            // success
        }
    }

    private fun doRegistration(
        localAPI: CommonFunction, mid: String, muid: String,
        methodCallResult: MethodChannel.Result
    ) {
        Log.d("_", "doRegistration $mid $muid")
        if (NofService.isInitialized()) {
            Log.d("_", "NOFService is init")
            localAPI.doRegistration(mid, muid, methodCallResult)
            // methodCallResult.success(result);
        } else {
            Log.d("_", "NOFService is not init")
            initNOFService(localAPI, object : StatusCallback<String?, String?> {
                @Override
                override fun success(result: String?) {
                    Log.d("+_", "result")
                    Log.d("+_", "do registration")
                    localAPI.doRegistration(mid, muid, methodCallResult)
                    // methodCallResult.success(result);
                }

                @Override
                override fun failure(p0: String?) {
                    Log.d("+_", "Init Failure: $p0")
                    if (p0!!.contains("20051")) {
                        // Permission error.
                        finishAndRemoveTask()
                        System.exit(0)
                    } else if (p0.contains("20035")) {
                        // Vguard error.
                        // VGuardService.getINSTANCE().clearVos();
                        finish()
                        System.exit(1)
                    }
                }
            })
        }
    }

    private fun doDeregistration(
        localAPI: CommonFunction,
        methodCallResult: MethodChannel.Result
    ) {
        Log.d("_", "doDeregistration")
        if (NofService.isInitialized()) {
            Log.d("_", "NOFService is init")
            localAPI.doDeregistration(methodCallResult)
            // methodCallResult.success(result);
        } else {
            initNOFService(localAPI, object : StatusCallback<String?, String?> {
                @Override
                override fun success(result: String?) {
                    Log.d("+_", "result")
                    Log.d("+_", "do doDeregistration")
                    localAPI.doDeregistration(methodCallResult)
                    // methodCallResult.success(result);
                }

                @Override
                override fun failure(p0: String?) {
                    Log.d("+_", "Init Failure: $p0")
                    if (p0!!.contains("20051")) {
                        // Permission error.
                        finishAndRemoveTask()
                        System.exit(0)
                    } else if (p0.contains("20035")) {
                        // Vguard error.
                        // VGuardService.getINSTANCE().clearVos();
                        finish()
                        System.exit(1)
                    }
                }
            })
        }
    }

    private fun doDebit(
        localAPI: CommonFunction, amount: String?,
        methodCallResult: MethodChannel.Result
    ) {
        Log.d("_", "doDebit")
        if (NofService.isInitialized()) {
            Log.d("_", "NOFService is init")
            if (amount != null) {
                localAPI.doDebit(amount, methodCallResult)
            }
            // methodCallResult.success(result);
        } else {
            initNOFService(localAPI, object : StatusCallback<String?, String?> {
                @Override
                override fun success(result: String?) {
                    Log.d("+_", "result")
                    Log.d("+_", "do doDebit")
                    if (amount != null) {
                        localAPI.doDebit(amount, methodCallResult)
                    }
                    // methodCallResult.success(result);
                }

                override fun failure(p0: String?) {
                    Log.d("+_", "Init Failure: $p0")
                    if (p0!!.contains("20051")) {
                        // Permission error.
                        finishAndRemoveTask()
                        System.exit(0)
                    } else if (p0.contains("20035")) {
                        // Vguard error.
                        // VGuardService.getINSTANCE().clearVos();
                        finish()
                        System.exit(1)
                    }
                }
            })
        }
    }

    private fun doDebitWithPin(
        localAPI: CommonFunction, amount: String?, responseCode: String?, cryptogram: String?,
        methodCallResult: MethodChannel.Result
    ) {
        Log.d("_", "doDebitWithPin")
        if (NofService.isInitialized()) {
            Log.d("_", "NOFService is init")
            if (amount != null) {
                localAPI.doDebitWithPIN(amount, responseCode, cryptogram, methodCallResult)
            }
            // methodCallResult.success(result);
        } else {
            initNOFService(localAPI, object : StatusCallback<String?, String?> {
                @Override
                override fun success(result: String?) {
                    Log.d("+_", "result")
                    Log.d("+_", "do doDebit")
                    if (amount != null) {
                        localAPI.doDebitWithPIN(amount, responseCode, cryptogram, methodCallResult)
                    }
                    // methodCallResult.success(result);
                }

                @Override
                override fun failure(p0: String?) {
                    Log.d("+_", "Init Failure: $p0")
                    if (p0!!.contains("20051")) {
                        // Permission error.
                        finishAndRemoveTask()
                        System.exit(0)
                    } else if (p0.contains("20035")) {
                        // Vguard error.
                        // VGuardService.getINSTANCE().clearVos();
                        finish()
                        System.exit(1)
                    }
                }
            })
        }
    }

    fun getFlutterView(): BinaryMessenger {
        return flutterEngine!!.dartExecutor.binaryMessenger
    }
}

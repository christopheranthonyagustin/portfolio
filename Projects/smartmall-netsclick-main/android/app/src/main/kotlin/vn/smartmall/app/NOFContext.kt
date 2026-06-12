package vn.smartmall.app

import android.content.Context
import android.preference.PreferenceManager
import com.nets.nofsdk.model.PublicKeyComponent
import com.nets.nofsdk.model.PublicKeySet
import java.util.Locale
import java.util.UUID


class NOFContext {
    // added for API gateway
    var hostBaseType: String? = null

    private var instance: NOFContext? = null

    var mid: String? = null
    var tid: String? = null
    var muid: String? = null
    var muuid: String? = null
    var amountInCents: String? = null

//    fun setMid(mid: String?) {
//        this.mid = mid
//    }
//
//    fun getMid(): String? {
//        return mid
//    }
//
//    fun setMuid(muid: String?) {
//        this.muid = muid
//    }
//
//    fun getMuid(): String? {
//        return muid
//    }
//
//    fun setAmountInCents(amountInCents: String?) {
//        this.amountInCents = amountInCents
//    }
//
//    fun getAmountInCents(): String? {
//        return amountInCents
//    }

    companion object {

        const val KEY_APP_TITLE = "key_app_title"
        const val KEY_APP_TYPE = "key_app_type" // RIDE_HAILING, NON_RIDE_HAILING
        const val KEY_REGISTRATION_DATA = "key_registration_data"
        const val KEY_REGISTRATION_OK = "key_registration_ok"
        const val KEY_DEREGISTRATION_OK = "key_deregistration_ok"
        const val KEY_GMT_OK = "key_gmt_ok"

        @get:kotlin.jvm.Synchronized
        var instance: NOFContext? = null
            get() {
                if (field == null) {
                    field = NOFContext()
                }
                return field
            }
            private set

        //    private AppConfig appConfig;
        const val CURRENCY = "currency"
        const val DELIMITER = "delimiter"
        const val SPACING = "spacing"
        const val DECIMALS = "decimals"
        const val SEPARATOR = "separator"
        fun generateMUUID(): String {
            var uuid: String = UUID.randomUUID().toString()
            uuid = uuid.replace("-".toRegex(), "")
            uuid = uuid.uppercase(Locale.getDefault())
            return uuid
        }

        /**
         * 0 = DBS
         * 1 = UOB
         * 2 = OCBC
         */
        val appPublicKeySet: PublicKeySet
            //        PublicKeyComponent hppPubKeyOCBC = hppPubKey;
            //        pks.addHppPublicKey("0003", hppPubKeyOCBC);
            //        if(Environment.getInstance().getIS_DEMO())
            get() {
                val MAPModulus =
                    "cfbb65135256d4e525fc6aada10ff7a78e0f239d6f4ac7ed0ef2b883e1b4cba8ec1c49208142952cdc530380024d6ca7bae28f7d82a36e8b95baad64df079b368d17dce484e00e88ba008e41576da8e9aaa102d4287f07f0edd89a76df8eeb02e08498c01b6a9fd5014e3b73fd49b0c76ba32180894fe1da728c858bad96db9191e7c8244bf0649f09577ebe4bd1d0a1640dc2b8ad6f64b2a2f8715777b669703f3fcb8023dbe024fcb21ca0697044400dcdc288b335ccb254e8d98bb93eb4c71b84141467e35cb284d13c62099ba90367d490581dabdf33744898a54a81bf05451288ec4c1065df003efa51aab502acadba022ee6d48b91901140e00d5eb20b"
                val mapPubKey = PublicKeyComponent(
                    "2",
                    "03",
                    MAPModulus
                )
                val pks = PublicKeySet(mapPubKey)

                /**
                 * 0 = DBS
                 * 1 = UOB
                 * 2 = OCBC
                 */
                val HPPModulus =
                    "D031A01F005662CCE917C57C8FCC18BB934026DC0D02A0E865896077BBCB2760B05AB979A9253523B11573196465973566760B4F7AE0552349F826AB62A2D2E10B783A99D6668A643090E259ACB30BCD9B9C5A2BFED83A8011DFD79CE0C285E09CF183E31662908B1F5AA8043562DB4056B35876712787B373AED178F55EE860B252CEBD29721B97B84B17429EBE2EB6889F8487FD98EB5DA5477971AF85791B18C8F73CAF1706CC41C22F45F855FE197FCEE10ADB441DD84E92D61C51F23DBEDEFBF153ADA2BFD675FB5BF4ABC6B9E70DED677C8C9A85E189D73B3A287CE4B6B1310B284527A742BE39B47F7FC56022E0419B81113FF739324FCC348AECCED7"
                val hppPubKey = PublicKeyComponent(
                    "2",
                    "03",
                    HPPModulus
                )
                val hppPubKeyDBS: PublicKeyComponent = hppPubKey
                val hppPubKeyUOB: PublicKeyComponent = hppPubKey
                val hppPubKeyNOFOCBC: PublicKeyComponent = hppPubKey
                val hppPubKeySIM: PublicKeyComponent = hppPubKey

                pks.addHppPublicKey("0001", hppPubKeyDBS)
                pks.addHppPublicKey("0002", hppPubKeyUOB)
                //        pks.addHppPublicKey("0003", hppPubKeyOCBC);
                pks.addHppPublicKey("0004", hppPubKeyNOFOCBC)
                //        if(Environment.getInstance().getIS_DEMO())
                pks.addHppPublicKey("9999", hppPubKeySIM)
                return pks
            }

        fun getAppTitle(ctx: Context?): String? {
            return PreferenceManager.getDefaultSharedPreferences(ctx).getString(KEY_APP_TITLE, "")
        }

        fun getAppType(ctx: Context?): String? {
            return PreferenceManager.getDefaultSharedPreferences(ctx).getString(KEY_APP_TYPE, "")
        }
    }
}

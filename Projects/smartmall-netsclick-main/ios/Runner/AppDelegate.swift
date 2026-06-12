import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
//------------------ CREDENTIALS FOR NETS CLICK ------------------
    //    let HOST_URL                = "https://netspay.nets.com.sg" (PROD)
    let HOST_URL                = "https://uatnetspay.nets.com.sg"
    //    let API_GW_URL              = "https://api.nets.com.sg" (PROD)
    let API_GW_URL              = "https://uat-api.nets.com.sg/uat"
    
    let HPP_ISSUER_ID           = "0001"
    let HPP_ISSUER_ID_UOB       = "0002"
    let HPP_ISSUER_ID_OCBC      = "0003"
    let HPP_ISSUER_ID_SIM       = "9999"
    
    let APPLICATION_ID          = "00011000002"
    
    let APP_SECRET              = "6944DAE581D8EDA2C1B29C1888F4F398D9E4A63D3208FD5BF5291F6FA47E6136"
    
    let MAP_PUBLIC_KEY_ID       = "2"
    let MAP_PUBLIC_KEY_EXPONENT = "03"

    let MAP_PUBLIC_KEY_MODULUS  =
    "cfbb65135256d4e525fc6aada10ff7a78e0f239d6f4ac7ed0ef2b883e1b4cba8ec1c49208142952cdc530380024d6ca7bae28f7d82a36e8b95baad64df079b368d17dce484e00e88ba008e41576da8e9aaa102d4287f07f0edd89a76df8eeb02e08498c01b6a9fd5014e3b73fd49b0c76ba32180894fe1da728c858bad96db9191e7c8244bf0649f09577ebe4bd1d0a1640dc2b8ad6f64b2a2f8715777b669703f3fcb8023dbe024fcb21ca0697044400dcdc288b335ccb254e8d98bb93eb4c71b84141467e35cb284d13c62099ba90367d490581dabdf33744898a54a81bf05451288ec4c1065df003efa51aab502acadba022ee6d48b91901140e00d5eb20b"
    
    let HPP_PUBLIC_KEY_ID        = "2"
    let HPP_PUBLIC_KEY_EXPONENT  = "03"

    let HPP_PUBLIC_KEY_MODULUS   =
    "D031A01F005662CCE917C57C8FCC18BB934026DC0D02A0E865896077BBCB2760B05AB979A9253523B11573196465973566760B4F7AE0552349F826AB62A2D2E10B783A99D6668A643090E259ACB30BCD9B9C5A2BFED83A8011DFD79CE0C285E09CF183E31662908B1F5AA8043562DB4056B35876712787B373AED178F55EE860B252CEBD29721B97B84B17429EBE2EB6889F8487FD98EB5DA5477971AF85791B18C8F73CAF1706CC41C22F45F855FE197FCEE10ADB441DD84E92D61C51F23DBEDEFBF153ADA2BFD675FB5BF4ABC6B9E70DED677C8C9A85E189D73B3A287CE4B6B1310B284527A742BE39B47F7FC56022E0419B81113FF739324FCC348AECCED7"
    
    //      ------------------ CREDENTIALS FOR NETS CLICK END ---------------------------------
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      GeneratedPluginRegistrant.register(with: self)
      
    // Init NOFService
    self.doNOFServiceInit()
      
    //      ------------------ METHOD CHANNEL TO FLUTTER ---------------------------------
    let deviceChannel = FlutterMethodChannel(name: "vn.smartmall.app", binaryMessenger: controller.binaryMessenger)
    prepareMethodHandler(deviceChannel: deviceChannel, controller: controller)
    //      ------------------ METHOD CHANNEL TO FLUTTER END ---------------------------------
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    

    private func prepareMethodHandler(deviceChannel: FlutterMethodChannel, controller:FlutterViewController) {
        deviceChannel.setMethodCallHandler({
            (call: FlutterMethodCall, flutterResult: @escaping FlutterResult) -> Void in
            switch call.method {
            case "registration":
                guard let args = call.arguments as? [String : Any] else {return}
                self.doRegistration(mid: args["mid"] as! String, muid: args["muid"] as! String,flutterResult: flutterResult, controller: controller)
                
            case "deregistration":
                self.doDeregistration(flutterResult: flutterResult)
            case "debit":
                guard let args = call.arguments as? [String : Any] else {return}
                self.doDebit(amount: args["amount"] as! String, flutterResult: flutterResult)
            case "debitWithPin":
                guard let args = call.arguments as? [String : Any] else {return}
                self.doDebitwithPin(amount: args["amount"] as! String,
                                    responseCode: args["response_code"] as! String,
                                    cryptogram: args["cryptogram"] as! String,
                                    flutterResult: flutterResult,
                                    controller: controller)
            default:
                flutterResult(FlutterMethodNotImplemented)
            }
        })
    }
    
    private func doRegistration(mid: String, muid: String, flutterResult: @escaping FlutterResult, controller: FlutterViewController){
        var reg: Registration
        if #available(iOS 10.0, *) {
            reg = Registration(viewController:controller , withMuid: muid, andWithMid: mid, withNavigationBarColor: UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), withTitleBarColor: UIColor.white)
        } else {
            reg = Registration(viewController:controller, withMuid: muid, andWithMid: mid, withNavigationBarColor: UIColor.red, withTitleBarColor: UIColor.white)
        }
        
        DispatchQueue.global().async() {
            do {
                try ExceptionCatcher.catchException {
                    //                 self.showLoading()
                    reg.invoke({ (result) in
                        DispatchQueue.main.async() {
                            print("result success = \(result)")
                            flutterResult(result)
                        }
                    }, failure: { (error) in
                        DispatchQueue.main.async() {
                            print("failed responseCode = " + error)
                            flutterResult(error)
                        }
                    })
                }
            } catch {
                let err: NSError = error as NSError
                if error.localizedDescription == ServiceError.serviceNotInitializedException().name.rawValue {
                    print(error.localizedDescription)
                }
                if error.localizedDescription == ServiceError.missingServerCertException().name.rawValue {
                    print(error.localizedDescription)
                }
                if error.localizedDescription == ServiceError.missingDataException("").name.rawValue {
                    print(error.localizedDescription)
                }
                
                print("result failure = \(err)")
                flutterResult(err)
            }}}
    
    private func doDeregistration(flutterResult: @escaping FlutterResult){
        let dereg = Deregistration()
        
        DispatchQueue.global().async() {
            do {
                try ExceptionCatcher.catchException {
                    dereg.invoke({ (result) in
                        print("result success = \(result)")
                        DispatchQueue.main.async() {
                            print("result success = \(result)")
                            flutterResult(result)
                        }
                    }, failure: { (error) in
                        print("failed responseCode = " + error)
                        DispatchQueue.main.async() {
                            print("result failure = \(error)")
                            flutterResult(error)
                        }
                    })
                }
            } catch {
                DispatchQueue.main.async() {
                    let err: NSError = error as NSError
                    print("result failure = \(err)")
                    flutterResult(err)
                }
            }}}
    
    private func doDebit(amount: String, flutterResult: @escaping FlutterResult){
        print("amount in cents \(amount)")
        let debit = Debit(amount: amount)
        
        DispatchQueue.global().async() {
            do {
                try ExceptionCatcher.catchException {
                    debit.invoke({ (result) in
                        print("result success = \(result)")
                        flutterResult(result)
                    }, failure: { (error) in
                        DispatchQueue.main.async {
                            print("result failure = \(error)")
                            flutterResult(error)
                        }
                        print("failed responseCode = " + error)
                    })
                }
            } catch {
                print("result failure = \(error)")
                flutterResult(error)
                if error.localizedDescription == ServiceError.serviceNotInitializedException().name.rawValue {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func doDebitwithPin(amount: String, responseCode: String, cryptogram: String, flutterResult: @escaping FlutterResult, controller: FlutterViewController){
        print("ios doDebitwithPin")
        print(responseCode)
        print(cryptogram)
        let debit = Debit(amount: amount, withResponseCode: responseCode, withTransactionCryptogram: cryptogram, with: controller)
        DispatchQueue.global().async() {
            do {
                try ExceptionCatcher.catchException {
                    //                            self.showLoading()
                    debit.invoke({ (result) in
                        DispatchQueue.main.async() {
                            print("result success = \(result)")
                            flutterResult(result)
                        }
                    }, failure: { (error) in
                        DispatchQueue.main.async() {
                            print("failed responseCode = " + error)
                            flutterResult(error)
                        }
                    })
                }
            } catch {
                let err: NSError = error as NSError
                if error.localizedDescription == ServiceError.serviceNotInitializedException().name.rawValue {
                    print(error.localizedDescription)
                }
                if error.localizedDescription == ServiceError.missingServerCertException().name.rawValue {
                    print(error.localizedDescription)
                }
                if error.localizedDescription == ServiceError.missingDataException("").name.rawValue {
                    print(error.localizedDescription)
                }
                
                print("result failure = \(err)")
                flutterResult(err)
            }
        }
    }
    
    
    private func doNOFServiceInit(){
        let mapPubKey = PublicKeyComponent(MAP_PUBLIC_KEY_ID,
                                           withKeyModulus: MAP_PUBLIC_KEY_MODULUS,
                                           withKeyExponent: MAP_PUBLIC_KEY_EXPONENT)
        
        let hppPubKey = PublicKeyComponent(HPP_PUBLIC_KEY_ID,
                                           withKeyModulus: HPP_PUBLIC_KEY_MODULUS,
                                           withKeyExponent: HPP_PUBLIC_KEY_EXPONENT)
        
        let dic: NSMutableDictionary = [HPP_ISSUER_ID: hppPubKey, HPP_ISSUER_ID_SIM: hppPubKey, HPP_ISSUER_ID_UOB: hppPubKey, HPP_ISSUER_ID_OCBC: hppPubKey]
        
        let pks = PublicKeySet(mapPubKey, withHppPublicComponents: dic)
        
        let serverName:String = "netspayserver"

        DispatchQueue.global().async() {
            do {
                try ExceptionCatcher.catchException {
                    print("do doNOFServiceInit")
                    NofService.main().setSdkDebuggable(true)
                    NofService.main().initialize(withServerBaseUrl: self.HOST_URL, withApiGwBaseUrl: self.API_GW_URL, withAppId: self.APPLICATION_ID, withAppSecret: self.APP_SECRET, with: pks, withServerCertName: serverName, success: { (result) in
                        DispatchQueue.main.async() {
                            print("doNOFServiceInit: result success = \(result)")
                            
                        }
                    }, failure: { (errorCode) in
                        DispatchQueue.main.async() {
                            print("doNOFServiceInit: failed \(errorCode)")
                        }
                    })
                }
            } catch {
                print("doNOFServiceInit: ERROR = \(error)")
                let err: NSError = error as NSError
                if error.localizedDescription == ServiceError.serviceNotInitializedException().name.rawValue {
                    print(error.localizedDescription)
                }
                if error.localizedDescription == ServiceError.missingServerCertException().name.rawValue {
                    print(error.localizedDescription)
                }
                if error.localizedDescription == ServiceError.missingDataException("").name.rawValue {
                    print(error.localizedDescription)
                    if let missingFields: String = err.userInfo["NSLocalizedDescriptionKey"] as? String {
                        print(missingFields)
                    }
                }
                if error.localizedDescription == ServiceError.serviceNotInitializedException("").name.rawValue {
                    print(error.localizedDescription)
                    if let missingFields: String = err.userInfo["NSLocalizedDescriptionKey"] as? String {
                        print(missingFields)
                    }
                }
            }
        }
    }
}

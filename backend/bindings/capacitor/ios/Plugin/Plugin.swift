import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(WalletPlugin)
public class WalletPlugin: CAPPlugin {

    func load() {
        initialize()
    }
    
    @objc func sendMessage(_ call: CAPPluginCall) {
        do {
            let message = call.getObject("message")
            let jsonMessage = try JSONSerialization.data(withJSONObject: message, options: .prettyPrinted)
            let jsonMessageStr = String(decoding: jsonMessage, as: UTF8.self)
            let response = send_message(jsonMessage)
            call.success([
                "response": String(cString: response!)
            ])
        } catch {
            call.reject("failed to serialize message")
        }
    }
}
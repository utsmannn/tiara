//
// Created by Ruangguru on 13/12/21.
//

import Foundation
import WebKit

class WKWebViewWrapper: NSObject, WKScriptMessageHandler {
    @State var result: String = ""
    private let wkWebView: WKWebView

    init(forWebView webView: WKWebView) {
        wkWebView = webView
        super.init()
    }

    func setup() {
        wkWebView.configuration.userContentController.add(self, name: "scriptHandler")
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("Message received: \(message.name) with body: \(message.body)")
        result = "\(message.body)"
    }
}
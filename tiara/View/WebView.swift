//
// Created by Ruangguru on 07/12/21.
//

import Foundation
import SwiftUI
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

struct WebViewString: NSViewRepresentable {
    @Binding var text: String
    private let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "base-static")!

    func makeNSView(context: Context) -> WKWebView {

        let webView = WKWebView()
        let wrapper = WKWebViewWrapper(forWebView: webView)
        let controller = WKUserContentController()
        webView.configuration.userContentController = controller

        wrapper.setup()
        controller.add(wrapper, name: "tiara")
        webView.setValue(false, forKey: "drawsBackground")
        return webView
    }

    func updateNSView(_ webView: WKWebView, context: Context) {
        do {
            let content = try String(contentsOf: url, encoding: .utf8)
            webView.loadHTMLString(content, baseURL: url)
            evaluate(text: text, webView: webView)

        } catch {
            print(error)
        }

    }

    private func evaluate(text: String, webView: WKWebView) {
        webView.evaluateJavaScript("anuan('\(text)')") { (result, error) in
            if let result = result {
                print("Label is updated with message: \(result)")
            } else if let error = error {
                print("An error occurred: \(error)")
                evaluate(text: text, webView: webView)
            }
        }
    }
}

struct WebViewLocal: NSViewRepresentable {
    let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "static")!

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateNSView(_ uiView: WKWebView, context: Context) {
        uiView.loadFileURL(url, allowingReadAccessTo: url)
    }

}
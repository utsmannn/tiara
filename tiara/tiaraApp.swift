//
//  tiaraApp.swift
//  tiara
//
//  Created by Ruangguru on 04/12/21.
//
//

import SwiftUI

@main
struct tiaraApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @State var text = "<html><body><h1>Hello World</h1></body></html>"
    @State var html = TextContainer.html

    var body: some Scene {
        WindowGroup {
            //ContentView()
            /*EmptyView().onAppear {
                statusBarApplication.createMenu()
            }*/

            ZStack {
                WebViewLocal()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .onAppear {
                            // statusBarApplication.createMenu()
                            appDelegate.closeMe()
                        }
            }
        }
    }
}

//
// Created by Ruangguru on 07/12/21.
//

import Foundation
import SwiftUI

struct EditorView: View {
    @State var text = "<html><body><h1>Hello World</h1></body></html>"
    @State var html = "# woy jancuk"

    var body: some View {
        ZStack {
            WebViewString(text: $html)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .padding()
        }
    }
}
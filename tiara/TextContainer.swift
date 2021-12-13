//
// Created by Ruangguru on 12/12/21.
//

import Foundation

class TextContainer {
    static var html = """
                      <!DOCTYPE html>
                      <html>
                      <head>
                          <meta charset="UTF-8">
                          <!-- https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP -->
                          <style>
                          :root {
                                    color-scheme: light dark;
                                }
                          </style>
                          <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'">
                          <meta http-equiv="X-Content-Security-Policy" content="default-src 'self'; script-src 'self'">
                      </head>
                          <body>
                              <div class="container">
                                  <h1>Hello World!</h1>
                                  We are using Node.js <span id="node-version"></span>,
                                  hmmmmmmmm <span id="chrome-version"></span>,
                                  and Electron <span id="electron-version"></span>.
                              </div>
                          </body>
                      </html>
                      """

    static let monacoJs = """
                          require.config({ paths: { 'vs': 'https://unpkg.com/monaco-editor@latest/min/vs' }});
                          window.MonacoEnvironment = { getWorkerUrl: () => proxy };

                          require(["vs/editor/editor.main"], function () {
                              monaco.editor.defineTheme('nganu', {
                                  base: 'vs',
                                  inherit: false,
                                  rules: [],
                                  colors: {
                                      'editor.background': '#9f636300',
                                      'editor.selectionBackground': '#666666CB',
                                      'editor.lineHighlightBackground': '#00000000',
                                      'editor.lineHighlightBorder': '#00000000'
                                  },
                              });

                              let editor = monaco.editor.create(document.getElementById('container'), {
                                  value: [
                                      '# hallow'
                                  ].join('\\n'),
                                  theme: "nganu",
                                  language: 'markdown',
                                  minimap: {
                                      enabled: false
                                  },
                                  scrollbar: {
                                      vertical: 'hidden',
                                      verticalScrollbarSize: 0
                                  },
                                  fontSize: "12px",
                                  lineNumbers: "off",
                                  fontFamily: "Menlo",
                                  renderLineHighlight: 'gutter',
                                  glyphMargin: false,
                                  folding: false,
                                  selectionHighlight: false,
                                  lineDecorationsWidth: 0,
                                  lineNumbersMinChars: 0,
                                  hideCursorInOverviewRuler: true
                              });

                              let text = '';
                              editor.getModel().onDidChangeContent((event) => {
                                  text = text + event.changes[0].text
                                  console.log(text)
                                  window.webkit.messageHandlers["scriptHandler"].postMessage(text);
                              });
                          });

                          """
}
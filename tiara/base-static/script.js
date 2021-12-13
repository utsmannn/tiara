require.config({ paths: { 'vs': 'https://unpkg.com/monaco-editor@latest/min/vs' }});
window.MonacoEnvironment = { getWorkerUrl: () => proxy };

/*var textValue = '# lah iya';
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
            textValue
        ].join('\n'),
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
});*/

/**
 * trigger from swift
 * */
function anuan(hah) {
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
                hah
            ].join('\n'),
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

        editor.getModel().onDidChangeContent(() => {
            window.webkit.messageHandlers["scriptHandler"].postMessage(editor.getValue());
        });
    });
}

MiniLatex Reader
====================

MiniLatex Reade is a small app which can be
embedded in a web page and used to display
LaTeX as HTML.  Look at
the [MiniLatex Reader Demo](https://jxxcarlson.github.io/app/miniLatexReader/index.html)
and the instructions on that web page.  Here is how to
compile the source file, then to minify it.

```
   $ elm make src/Main.elm --output=Main.js
   $ uglifyjs Main.js -mc 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9"' -o Main.min.js
```

The files required for the app to work are

1. `index.Html`
2. `body.js`
3. `Main.min.js`

Run by clicking on `index.html`.  To use your own
content, replace the contents of the div in `index.html`
with id="source".

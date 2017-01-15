Infolingo
=========

Introduction
------------
InfoLingo is a small DSL allowing users to create their own wiki. It allows the
user to focus on the content, rather than the layout. A wiki is automatically
generated from the given articles.

How to build
------------
InfoLingo is build with the help of _stack_. So it used the standard conventions
of building the application

* `stack setup` to get all dependencies and make sure GHC is installed.
* `stack build` to create binaries.
* `stack test` to run all the tests.
* `stack ghci` launch a REPL to test code snippets
* `stack exec` to launch the application

More on stack can be found on [the stack homepage].

Some useful development options:

* `stack build --test --fast --file-watch` will execute the tests every time
  a file changes.
* `stack ghci --test` Load all files, including tests, so individual tests can
  also be executed.

How to use.
----------


Requirements
------------
The requirements can be broken down to into a few different topics. Foremost I
found the lack of a over-coupling application in which you can manage multiple
knowledge files - or _articles_ as I would like to name them. So the first topic
is concerned with the organization of multiple files, and mostly how to organize
it using other text files.

The second topic is related to the creation of individual files. How to
effectively write down the knowledge you want to save. Since a universal
language already exists to represent such files I decided to also go with
markdown. It is easy to read, universally accepted, and many parsers and
converters are already present. As a result [Pandoc] was chosen to parse the
individual files.

The third topic is mostly concerned with representing the created _articles_. As
pandoc is able to create HTML this is the primary format. On top of that some
web pages need to be present to navigate between different articles and search
for keywords among all of them.

### Organization of the whole
* Have a small DSL on top of markdown to organize articles.
* It should be possible to group different articles by categories/tags or
  something similar.
* Different files can be grouped as one article. This should effect how it will
  be displayed as well.
* It should be clear which directories will be parsed and how that will effect
  the organization.
* When parsing for an individual article failes it should not effect other
  articles.

### Organization of individual files
* Individual articles should follow the [Markdown] format so they can be easily
  parsed and converted to another format when required.

### Presentation of files
* Though Pandoc supports conversion from Markdown to numerous other formats, the
  main target is HTML.
* The main page should make it possible to show all articles and navigate to
  them.
* It should also be possible to find articles given a certain tag or category.
* The individual articles should remain visible close to the HTML counterpart,
  but some CSS and JavaScript is added to enrich the user experience. E.g.
  - Make it possible to expand collapse headers.
  - Provide a _table of contents_ from headers.
  - Separate contents of headers in different 'tabs' when required. For example
    when an article becomes to big.

### Possible future features
* An software architecture DSL to describe a software breakdown and a way to
  visualize the result.
* A mathematics DSL. Similar to the software arcitecture one but concerned
  with writing down and representing math.
* An editor usable from the web
  - With syntax highlighting.
  - Show error line.
  - On the fly compile.
* advanced search through different articles at once.
* Article history control to go back and forth between different versions of
  the same article.
* Different kind of HTML and CSS formatting.
* File normalization
  - Uppercase letters
  - Double spaces
  - Breakdown after 80 characters.
* Compile to
  - PDF
  - Epub
* Document composition (extend)

[the stack homepage]: https://docs.haskellstack.org/en/stable/GUIDE/
[Pandoc]: http://pandoc.org/
[Markdown]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

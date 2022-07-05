# Journal Template

## Example

![main](./img/main.png)

## Directory structure

```
.
├── 2022
│   ├── 07
│   │   ├── 01
│   │   │   ├── note.tex
│   │   │   └── note.xopp
│   │   ├── 02
│   │   │   ├── note.tex
│   │   │   └── note.xopp
│   │   ├── 03
│   │   │   ├── note.tex
│   │   │   └── note.xopp
│   │   └── ..
│   └── ...
├── ...
├── master.tex
└── tex-src
    ├── preamble.tex
    ├── references.tex
    └── theorems.tex
```

The `master.tex` file parses through all the directories for each year, then
each month, then each day, and if there is a `note.tex`, it will include it.

In that same directory, if there's a `note.xopp`, which is an
[xournal](https://xournalpp.github.io/) file, it will include it as well.

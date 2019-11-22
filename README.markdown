# vim-wordchipper

> Power tool for shredding text in Insert mode

# Features

* Conveniently delete words (and other text objects) in Insert mode
* Current paragraph reformatted automatically when Vim’s autoformat is
  active
* Useful when composing/editing text in code comments and with
  writing-oriented plug-ins like _pencil_
* Specify your own command, with the operation, text object, and motion
* Pure Vimscript with no dependencies

## Installation

Install using your favorite Vim package manager.

## Configuration

You must define the behavior of this plugin in your `.vimrc`. No keys are
mapped by default.

For example, to re-map the `Control-E` key to delete to the end of the
next _word_:

```vim
inoremap <expr> <C-e> wordchipper#chipWith('de')
```

where `de` deletes text forward to the end of the next _word_, preserving
any trailing space. (As an alternative, `dw` would consume the trailing
space.)

By default, `Control-W` will delete the _word_ before the cursor in Insert
mode. You can change this behavior to work with _WORDS_ instead:

```vim
inoremap <expr> <C-w> wordchipper#chipWith('dB')
```

where `dB` deletes backwards to the end of the previous _WORD_.

_wordchipper_ also can work with motions against non-word text objects,
such as remapping `Ctrl-y` to delete to the end of the sentence:

```vim
inoremap <expr> <C-y> wordchipper#chipWith('d)')
```

This will use Vim’s default sentence text object, or an alternative like
[vim-textobj-sentence][ts] if installed.

You can also specify a buffer-local mapping, such as which would be
initialized for the Markdown file type. For more details, see:

```vim
:help map-<buffer>
```

### Word motions

Vim’s standard word motions are available:

* `e` - forward to the end of _word_, inclusive
* `E` - forward to the end of _WORD_, inclusive
* `w` - _word_ forward, exclusive
* `W` - _WORD_ forward, exclusive
* `ge` - backward to the end of _word_, inclusive
* `gE` - backward to the end of _WORD_, inclusive
* `b` - _word_ backward, exclusive
* `B` - _WORD_ backward, exclusive

‘_word_’ is defined by `iskeyword` option, and generally consists of
letters, digits, and underscores. ‘_WORD_’ generally consists of non-blank
characters, including punctuation. For more details, consult the
documentation:

```vim
:help word-motions
```

## Recommended settings

In your `.vimrc`, ensure backspace can consume whatever text is in its
way:

```vim
set backspace=indent,eol,start
```

For more details, see:

```vim
:help 'backspace'
```

## Prevent autoformat

If Vim’s autoformat is active during the Insert, such as when using
_HardPencil_ mode in the _pencil_ plugin, _wordchipper_ will force
a format to the end of the paragraph when invoked.

You can disable this behavior in your `.vimrc` with

```vim
let g:wordchipper#autoformat = 0    " default is 1
```


## See also

If you find this plugin useful, check out these others by [@reedes][re]:

* [vim-colors-pencil][cp] - color scheme for Vim inspired by IA Writer
* [vim-lexical][lx] - building on Vim’s spell-check and thesaurus/dictionary completion
* [vim-litecorrect][lc] - lightweight auto-correction for Vim
* [vim-pencil][pn] - Rethinking Vim as a tool for writers
* [vim-textobj-quote][qu] - extends Vim to support typographic (‘curly’) quotes
* [vim-textobj-sentence][ts] - improving on Vim's native sentence motion command
* [vim-thematic][th] - modify Vim’s appearance to suit your task and environment
* [vim-wordy][wo] - uncovering usage problems in writing
* [vim-wheel][wh] - screen anchored cursor movement

[re]: http://github.com/reedes
[cp]: http://github.com/reedes/vim-colors-pencil
[pn]: http://github.com/reedes/vim-pencil
[lx]: http://github.com/reedes/vim-lexical
[lc]: http://github.com/reedes/vim-litecorrect
[qu]: http://github.com/reedes/vim-textobj-quote
[ts]: http://github.com/reedes/vim-textobj-sentence
[th]: http://github.com/reedes/vim-thematic
[wo]: http://github.com/reedes/vim-wordy
[wh]: http://github.com/reedes/vim-wheel

## Future development

If you’ve spotted a problem or have an idea on improving this plugin,
please post it to the github project issue page.

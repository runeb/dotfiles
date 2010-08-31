" Vim Syntax File
" Language:     Gemspec for Bundler, Ruby
" Creator:      Tatsuhiro Ujihisa <ujihisa at gmail com>
" Last Change:  2010 Jan 02
if version < 600
    syntax clear
endif

set ft=ruby
runtime syntax/ruby.vim
syntax case match
syntax keyword gemfileKeywords gem source bundle_path group path git
syntax keyword gemfileDeprecated only except disable_rubygems disable_system_gems clear_sources bundle_path bin_path
highlight link gemfileKeywords Define
highlight link gemfileDeprecated Error

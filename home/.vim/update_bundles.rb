#!/usr/bin/env ruby

git_bundles = %w{
  git://github.com/astashov/vim-ruby-debugger.git
  git://github.com/bronson/vim-trailing-whitespace.git
  git://github.com/chriskempson/base16-vim.git
  git://github.com/chriskempson/tomorrow-theme.git
  git://github.com/godlygeek/tabular.git
  git://github.com/pangloss/vim-javascript.git
  git://github.com/scrooloose/nerdtree.git
  git://github.com/terlar/base16-vim-powerline.git
  git://github.com/timcharper/textile.vim.git
  git://github.com/tomtom/tcomment_vim.git
  git://github.com/tpope/vim-afterimage.git
  git://github.com/tpope/vim-bundler.git
  git://github.com/tpope/vim-commentary.git
  git://github.com/tpope/vim-cucumber.git
  git://github.com/tpope/vim-endwise.git
  git://github.com/tpope/vim-eunuch.git
  git://github.com/tpope/vim-flatfoot.git
  git://github.com/tpope/vim-fugitive.git
  git://github.com/tpope/vim-git.git
  git://github.com/tpope/vim-haml.git
  git://github.com/tpope/vim-liquid.git
  git://github.com/tpope/vim-markdown.git
  git://github.com/tpope/vim-pastie.git
  git://github.com/tpope/vim-rails.git
  git://github.com/tpope/vim-ragtag.git
  git://github.com/tpope/vim-rake.git
  git://github.com/tpope/vim-repeat.git
  git://github.com/tpope/vim-rhubarb.git
  git://github.com/tpope/vim-speeddating.git
  git://github.com/tpope/vim-surround.git
  git://github.com/tpope/vim-unimpaired.git
  git://github.com/tpope/vim-vividchalk.git
  git://github.com/tsaleh/vim-matchit.git
  git://github.com/tsaleh/vim-shoulda.git
  git://github.com/tsaleh/vim-tmux.git
  git://github.com/vim-ruby/vim-ruby.git
  git://github.com/vim-scripts/Gist.vim.git
  git://github.com/vim-scripts/IndexedSearch.git
  git://github.com/vim-scripts/jQuery.git
  git://github.com/kana/vim-textobj-user.git
  git://github.com/nelstrom/vim-textobj-rubyblock.git
  git://github.com/jgdavey/vim-blockle.git
  git://github.com/Shougo/neocomplcache.git
  git://github.com/sickill/vim-pasta.git
  git://github.com/ecomba/vim-ruby-refactoring.git
  git://github.com/Lokaltog/vim-powerline.git
  git://github.com/airblade/vim-rooter.git
}

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.rm_rf(bundles_dir)
FileUtils.mkdir(bundles_dir)
FileUtils.cd(bundles_dir)

git_bundles.each do |url|
  puts url
  `git clone -q #{url}`
end

Dir["*/.git"].each {|f| FileUtils.rm_rf(f) }


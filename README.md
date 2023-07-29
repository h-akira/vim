# 導入
vimの場合
```
cd
git clone git@github.com:h-akira/vim.git .vim
ln -sf .vim/dot.vimrc .vimrc
```
neovimの場合
```
cd ~/.config
git clone git@github.com:h-akira/vim.git nvim
cd nvim
ln -sf dot.vimrc init.vim
```

## deno
[こちらを参照](https://yoshixmk.github.io/deno-manual-ja/getting_started/installation.html)
```
# Unix
curl -fsSL https://deno.land/x/install/install.sh | sh
# Mac
brew install deno
```
指示に従ってパスを通す．

## プラグイン
```
# vim
vim +PlugInstall +qall
# neovim
nvim +PlugInstall +qall
```
初回は順番の関係で二回必要．

## その他
- デフォルトのvimだと非対応な場合があるので対応しているvimを入れる．
```
# Ubuntu
sudo apt install vim-gtk
# Mac
brew install vim
```
- `vi`，`vim`コマンドで起動されるものを指定する場合は以下のコマンドの後に選択肢から選ぶ．
```
# vi
sudo update-alternatives --config vi
# vim
sudo update-alternatives --config vim
```
- Ubuntuで`apt`コマンドを利用した時に最新のバージョンが入らない場合は以下のように追加する．
```
# vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```

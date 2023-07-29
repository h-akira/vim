# 導入
```
cd
git clone git@github.com:h-akira/vim.git .vim
ln -sf .vim/dot.vimrc .vimrc
```
denoをインストールする（
[参考](https://yoshixmk.github.io/deno-manual-ja/getting_started/installation.html)
）．
```
# Unix
curl -fsSL https://deno.land/x/install/install.sh | sh
# Mac
brew install deno
```
指示に従ってパスを通す．その後，反映する．
```
vim +PlugInstall +qall
```
初回は順番の関係で二回必要．

デフォルトのvimだと非対応な場合があるので対応する．
```
# Ubuntu
sudo apt install vim-gtk
# Mac
brew install vim
```
Ubuntuで最新のvimが入らない場合:
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```


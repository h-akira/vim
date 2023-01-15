# 導入
```
cd
git clone --recursive git@github.com:h-akira/vim.git .vim
ln -sf .vim/.vimrc .vimrc
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



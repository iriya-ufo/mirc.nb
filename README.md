mirc.nb とは?

こちらを参照
http://d.hatena.ne.jp/masa_edw/20070616/1182023150

使い方

まずIRC Client Server である Nadoka をインストールします。

$ git clone https://github.com/nadoka/nadoka.git

mirc.nb をインストールします。

$ git clone https://github.com/iriya-ufo/mirc.nb.git

設定

nadokarc を環境に合うように編集します。

起動用スクリプトを作成します。

例:

#!/usr/local/bin/zsh
CONFIG=/home/hoge/nadoka/nadoka-0.8.0/nadoka.rc
ruby ./nadoka.rb --rc $CONFIG

mirc_plugins/pass.rb を環境に合わせて編集します。

wn2trrtext
==========

What's that?
-------------
A ruby script for generating [TRR22](http://code.google.com/p/trr22/) text from [WordNet](http://wordnet.princeton.edu/) db.

Environment
------------
* emacs 23 and over
* trr22
* ruby 1.9.3 and over

How to Use?
------------
    % mkdir workspace
    % cd workspace
    % wget http://wordnetcode.princeton.edu/3.0/WNdb-3.0.tar.gz
    % tar xvfz WNdb-3.0.tar.gz
    % git clone git@github.com:yuichigoto/wn2trrtext.git
    % cd wn2trrtext
    % ruby wn2trrtext.rb ../dict

If you've installed trr22 into /var/lib/trr22, then hit following commands.

    % sudo cp *.txt /var/lib/trr22/text
    % sudo chown root:root /var/lib/trr22/text/*.txt

And then, add floowing sentences into /var/lib/trr22/CONTENTS 

    base (asdfghjkl;)    easy  basic   Home.txt  HO
    low (zxcvbnm,./)    easy  basic   Lower.txt	LO
    Up (qwertyuiop) easy  basic   Upper.txt	UP
    base + up	    easy   basic		HomeAndUpper.txt	HP
    base + low	    easy   basic		HomeAndLower.txt	HL
    Alphabet	   easy		basic	WithoutNumber.txt		AL
    Number + Alphabet		   easy		basic		WithNumber.txt	WN

After that, make SCORE-XX files in /var/lib/trr22/record

    % sudo touch /var/lib/trr22/record/SCORES-HO
    % sudo touch /var/lib/trr22/record/SCORES-LO
    % sudo touch /var/lib/trr22/record/SCORES-UP
    % sudo touch /var/lib/trr22/record/SCORES-HP
    % sudo touch /var/lib/trr22/record/SCORES-HL
    % sudo touch /var/lib/trr22/record/SCORES-AL
    % sudo touch /var/lib/trr22/record/SCORES-WN

Finaly, check whether those files are read or not.

    % emacs &
    M-x trr


これは何？
-------------
Emacs 23上で動くタイピング練習ソフト [TRR22](http://code.google.com/p/trr22/)  のための練習用テキストを英語の概念辞書（意味辞書） [WordNet](http://wordnet.princeton.edu/) の語彙ファイルから生成する Ruby スクリプトです。

前提
------------
* Emacs 23 以上がインストールされていること
* Trr22 がインストールされていること （インストール方法は [こちら](http://www.aise.ics.saitama-u.ac.jp/~gotoh/TrrOnUbuntu.html) ）
* Ruby 1.9.3 以上がインストールされていること

インストール方法
-------------------------
必要なファイルを取得する。

    % mkdir workspace
    % cd workspace
    % wget http://wordnetcode.princeton.edu/3.0/WNdb-3.0.tar.gz
    % tar xvfz WNdb-3.0.tar.gz
    % git clone git@github.com:yuichigoto/wn2trrtext.git
    % cd wn2trrtext
    % ruby wn2trrtext.rb ../dict

Trr22 を /var/lib/trr22 にインストールしているとき、以下のように練習用テキストをコピーする。

    % sudo cp *.txt /var/lib/trr22/text
    % sudo chown root:root /var/lib/trr22/text/*.txt

/var/lib/trr22/CONTENTS を編集する。以下の記述を追加する。

    中段の練習    簡単  基本   Home.txt	HO
    下段の練習    簡単  基本   Lower.txt	LO
    上段の練習    簡単  基本   Upper.txt	UP
    上・中段の練習	    簡単   基本		HomeAndUpper.txt	HP
    下・中段の練習	    簡単   基本		HomeAndLower.txt	HL
    アルファベットの練習	   簡単		基本	WithoutNumber.txt		AL
    数字と文字		   簡単		基本		WithNumber.txt	WN

/var/lib/trr22/record に得点記録用のファイルを生成する。

    % sudo touch /var/lib/trr22/record/SCORES-HO
    % sudo touch /var/lib/trr22/record/SCORES-LO
    % sudo touch /var/lib/trr22/record/SCORES-UP
    % sudo touch /var/lib/trr22/record/SCORES-HP
    % sudo touch /var/lib/trr22/record/SCORES-HL
    % sudo touch /var/lib/trr22/record/SCORES-AL
    % sudo touch /var/lib/trr22/record/SCORES-WN

以上が終わったら、ちゃんとうごくかどうかを確かめる。

    % emacs &
    M-x trr


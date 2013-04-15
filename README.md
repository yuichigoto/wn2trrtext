wn2trrtext
==========

What's that?
-------------
A ruby script for generating [TRR22](http://code.google.com/p/trr22/) text from [WordNet](http://wordnet.princeton.edu/) db.

Environment
------------
* emacs 23 and over
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

And then, edit /var/lib/trr22/CONTENTS like as follows.

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

# Berkeley CS61A 2011: Structure and Interpretation of Computer Programs 
- [Course resources page](https://people.eecs.berkeley.edu/~bh/61a-pages/ "Course resources page")
- [Video lectures](https://archive.org/details/ucberkeley-webcast-PL3E89002AA9B9879E?sort=titleSorter "Video lectures")

## Install Scheme interpreter used in course ([STk](http://kaolin.unice.fr/STk/ "STk"))
[Instalation spteps for GNU/Linux](https://people.eecs.berkeley.edu/~bh/61a-pages/Scheme/source/linux.html "Instalation spteps for GNU/Linux")
```bash
wget http://inst.eecs.berkeley.edu/~scheme/precompiled/Linux/STk-4.0.1-ucb1.3.6.i386.rpm
sudo apt install alien lib32z1 libsm6:i386
sudo alien --scripts --to-tgz STk-4.0.1-ucb1.3.6.i386.rpm
sudo alien --scripts --to-deb STk-4.0.1.tgz
sudo apt install ./stk_4.0.1-2_all.deb
```

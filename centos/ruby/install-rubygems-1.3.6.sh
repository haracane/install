srcdir=~/src
if [ ! -d $srcdir ]; then mkdir -p $srcdir; fi
cd $srcdir

wget http://rubyforge.org/frs/download.php/69365/rubygems-1.3.6.tgz
tar xvfz rubygems-1.3.6.tgz 
cd rubygems-1.3.6
ruby setup.rb 
gem -v
# 1.3.6
which gem
# /usr/local/bin/gem

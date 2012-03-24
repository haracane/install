gem install -y jeweler rails rspec rcov ci_reporter

GITHUB_DIR=/var/github

if [ ! -d $GITHUB_DIR/kajax ]; then
	if [ ! -d $GITHUB_DIR ]; then mkdir -p $GITHUB_DIR; fi
	cd $GITHUB_DIR
	git clone git://github.com/haracane/kajax.git
fi

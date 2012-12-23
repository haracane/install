sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum --enablerepo=jenkins install jenkins
sudo chkconfig jenkins on
sudo chkconfig --list jenkins
sudo service jenkins start

####  yumレポジトリ設定
# インストール後には/etc/yum.repos.d/jenkins.repoで
# enable=0としておく

#### E-mail 通知設定
# SMTPサーバ, サフィックス(@mail.com),送信元アドレス(jenkins@mail.com)を
# 設定し、設定確認でメールが届くことを確認する

#### Railsプロジェクト用設定
# 以下のプラグインをインストール
#  - git plugin
#  - rake plugin
#  - ruby plugin
#  - ruby metrics plugin

#### Gemfileに以下を追加
# gem "rcov", "~> 1.0.0"
# gem 'ci_reporter', "~> 1.7.0"

#### Rakefileに以下を追加
# require 'ci/reporter/rake/rspec'

#### Jenkinsプロジェクト設定
# Rakeタスク設定: rake ci:setup:rspec spec rcov
# JUnitテスト結果の集計をチェック: spec/reports/*.xml
# Publish Rcov reportをチェック

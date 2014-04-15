#!/bin/bash

source /home/vagrant/.bashrc

export JAVA_HOME=/usr/local/jdk
export PATH=$PATH:$JAVA_HOME/bin

export GRADLE_HOME=/usr/local/gradle-1.9
export PATH=$PATH:/usr/local/bin:$GRADLE_HOME/bin

RUNFILE=/var/run/tournament

if [ ! -f $RUNFILE ]
then
touch $RUNFILE

echo "START"
cd /home/vagrant/poker-croupier/ && bundle exec ruby croupier/scripts/start_tournament.rb
echo "END"

rm $RUNFILE

fi

exit 0

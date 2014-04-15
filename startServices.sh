#!/bin/bash --login

CWD=`pwd`

cd /home/vagrant/poker-croupier

LOG_DIR=/var/log/poker
PID_DIR=/var/run

mkdir -p $LOG_DIR

exec 2> $LOG_DIR/ranking_service.log  # send stderr from your script to a log file
exec 1>&2                      # send stdout to the same log file

nohup bundle exec ruby ranking_service/ranking_service.rb &
echo $! > $PID_DIR/poker-ranking.pid

exec 2> $LOG_DIR/visual_spectator.log  # send stderr from your script to a log file
exec 1>&2                      # send stdout to the same log file

nohup bundle exec ruby visual_spectator/visual_spectator.rb -p 4567 &
echo $! > $PID_DIR/poker-spectator.pid

cd $CWD

exit 0

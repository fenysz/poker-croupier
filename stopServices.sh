#!/bin/bash --login

RANKING_PIDFILE=/var/run/poker-ranking.pid

if [ -f $RANKING_PIDFILE ]
then
    RANKING_PID=`cat $RANKING_PIDFILE`
    kill $RANKING_PID
fi

SPECTATOR_PIDFILE=/var/run/poker-spectator.pid

if [ -f $SPECTATOR_PIDFILE ]
then
    RANKING_PID=`cat $SPECTATOR_PIDFILE`
    kill $RANKING_PID
fi

exit 0

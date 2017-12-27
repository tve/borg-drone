# borg-drone - Borg Backup Runner

Simple bash script to run borg backups.
This is similar to borgmatic in some ways but keeps things much similar in one shell script.

A typical /etc/crontab entry might look like:
```
3 3  * * * root  /path/to/borg-drone/borg-drone -c /etc/borg-drone/config >>& /var/log/borg-drone
```

The output with the committed config looks as follows on my system:
```
# ./borg-drone -c config
BORG-DRONE starting at Sun Jun 5 23:54:05 PDT 2016
Sourcing config from config
Repositories found: home music photos

== Starting backup for repo home at 2016-06-05T23:54-0700
Archive: backup@backup:/big/h/home::home-2016-06-05T23:54-0700
borg create --show-rc -s -e .cache -n -C lzma backup@backup:/big/h/home::home-2016-06-05T23:54-0700 /big/home /etc /root /big/usr-local
== Starting check for repo home
Repository: backup@backup:/big/h/home
borg check --show-rc --last 3 backup@backup:/big/h/home
borg.repository Remote: Index object count mismatch. 349643 != 349645
borg.repository Remote: Completed repository check, errors found.
terminating with warning status, rc 1

== Starting backup for repo music at 2016-06-06T00:05-0700
Archive: backup@backup:/big/h/MusicFLAC::music-2016-06-06T00:05-0700
borg create --show-rc -s -e .cache -n -C none backup@backup:/big/h/MusicFLAC::music-2016-06-06T00:05-0700 /big/MusicFLAC
== Starting check for repo music
Repository: backup@backup:/big/h/MusicFLAC
borg check --show-rc --last 3 backup@backup:/big/h/MusicFLAC
== Starting pruning of repo music
borg prune --show-rc --keep-within 2d -n -d 1 -w 1 -m 2 -y 20 backup@backup:/big/h/MusicFLAC

== Starting backup for repo photos at 2016-06-06T00:05-0700
Archive: backup@backup:/big/h/photos::photos-2016-06-06T00:05-0700
borg create --show-rc -s -e .cache -n -C none backup@backup:/big/h/photos::photos-2016-06-06T00:05-0700 /soumak/photos
== Starting check for repo photos
Repository: backup@backup:/big/h/photos
borg check --show-rc --last 3 backup@backup:/big/h/photos
== Starting pruning of repo photos
borg prune --show-rc --keep-within 2d -n -d 7 -w 1 -m 6 -y 20 backup@backup:/big/h/photos
```

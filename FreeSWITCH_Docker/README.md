### FreeSWITCH with PostgreSQL in Docker Engine
This is the Cross-Platform solution for the VoIP Project.
We are able to install FreeSWITCH to other OS,however for that we spend a lot of time(Install Guide,troubleshooting and etc.)
Therefore we've prepaired VoIP environment in Docker Engine.Containers are able to start or repair automatically (on-failure,after restart)
FreeSWITCH v.1.10(Latest) - Debian 10
PostgreSQL - Alpine Linux


- Install Docker and Docker Compose on your system

- Prepare environment and start the containers :
```bash
$ mkdir -p /root/voip/fs/conf /root/voip/fs/records /root/voip/fs/scripts
$ mkdir -p /root/voip/fs/pg_data /root/voip/fs/logs
$ echo "alias voip_cli='docker exec -it freeswitch fs_cli'" >> $HOME/.bash_profile
$ echo "alias voip_bash='docker exec -it freeswitch bash'" >> $HOME/.bash_profile
$ source $HOME/.bash_profile
$ git clone https://progit.tk/devops/dockercodes.git
$ cd dockercodes/FreeSWITCH_Docker
$ docker-compose build
$ docker-compose up -d
```
- Check the VoIP environment:
```bash
# Check containers status
$ docker-compose ps
# Enter to fs_cli inside the FreeSWITCH container
$ voip_cli
# Enter to Bash inside the FreeSWITCH container
$ voip_bash 
```
- There are mointpoints to FreeSWITCH container:
  
| Host Machine | Docker Container |
| ------ | ----------- |
|* /root/voip/fs/conf/|/etc/freeswitch/|
|* /root/voip/fs/records/|/var/lib/freeswitch/recordings/|
|* /root/voip/fs/scripts/|/usr/share/freeswitch/scripts/|
|* /root/voip/fs/logs/|/var/log/freeswitch/|
- And for the PGSQL as well:

| Host Machine | Docker Container |
| ------ | ----------- |
|* /root/voip/fs/pg_data/|/var/lib/postgresql/data|

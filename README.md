### docker-base

A useful simple container running in alpine Linux that maps the user in the container with the user in the host.

[![DockerHub Badge](http://dockeri.co/image/lucasbasquerotto/base)](https://hub.docker.com/r/lucasbasquerotto/base/)

### Usage

    $ docker run -e HOST_USER_ID=$(id -u) -e HOST_USER_GID=$(id -g) lucasbasquerotto/base

## Demo

    $ docker run --name uid-map --rm -it -e HOST_USER_ID=$(id -u) -e HOST_USER_GID=$(id -g) -v ${HOME}/mydocker/out:/home/myuser/out lucasbasquerotto/base
    
Inside container run:

    container$ echo "test" >> ~/out/test.txt
    
Then see that the permissions in the container are correct:

    container$ ls -la ~/out
    total 12
    drwxr-xr-x    2 myuser   myuser        4096 Aug 25 20:31 .
    drwxr-sr-x    1 myuser   myuser        4096 Aug 25 20:31 ..
    -rw-r--r--    1 myuser   myuser           5 Aug 25 20:31 test.txt
    
Exit the container:

    container$ exit
    
Check for the permissions in the host:

    lucas@lucas-pc:~$ ls -la ~/mydocker/out/
    total 12
    drwxr-xr-x 2 lucas lucas 4096 Aug 25 17:31 .
    drwxr-xr-x 3 root  root  4096 Aug 25 17:14 ..
    -rw-r--r-- 1 lucas lucas    5 Aug 25 17:31 test.txt

(The mount point is owned by root tough)

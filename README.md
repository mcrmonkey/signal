# Signal

Signal-desktop in a container

Note: This isn't supported by whisper systems - use at your own risk etc


## Building

To build the container locally:

```
docker build -t signal .
```

## How to run


The application uses sandboxing to make it work so you'll need to add the
`sys_admin` capability to the container to make that go


```
docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=${DISPLAY}" -e USERID=${UID} --name=signal --cap-add sys_admin signal

```

If you dont want to do that adding `-e nosandbox=1` to the docker line will
enable the `--no-sandbox` option for the application negating the need for the
extra capability. Sandbox exists for a reason, use without it at own risk etc


Add extra volumes for downloads/uploads with extra docker volume options ( `-v` )

### USERID

Your user ID (UID) is needed so signal can talk to your display manager


### Persisting data

User profile data will be saved to /data/signal/.config/Signal within the
container and stopping the container will remove that data unless...

Map that to your host system by adding this to your docker line:

`-v ${HOME}/.config/Signal:/data/signal/.config/Signal`



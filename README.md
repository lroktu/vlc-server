# Docker container based VLC server
Docker container VLC server for video stream.

VLC media player version 3.0.9.2 Vetinari (revision 3.0.9.2-0-gd4c1aefe4d)

This VLC image can be found at:
* [Docker Hub](https://hub.docker.com/r/lroktu/vlc-server)

# Usage

## Image Pull

```bash
docker pull lroktu/vlc-server:latest
```

## Running the Image

```bash
docker run -d --name YOUR_CONTAINER_NAME lroktu/vlc-server YOUR_CVLC_ARGUMENTS
```

Note: cvlc is the command line program used to run VLC without GUI.

There are three ports being exposed on the Dockerfile:
* 8080
* 8554
* 554

# Basic Docker Run Examples

## VLC server

```bash
docker run -d --name vlc -p 8554:8554 lroktu/vlc-server big_buck_bunny.mp4 --loop :sout=#gather:rtp{sdp=rtsp://:8554/} :network-caching=1500 :sout-all :sout-keep
```

big_buck_bunny is a video example that exists inside the container for testing purpose. 

If you want, you can attach a volume on container run and specify another video to being executed.

You can also recompile the image to remove the video. 

Everything after lroktu/vlc-server is passed as argument to the container entrypoint, at run time. We use cvlc to process the input arguments and execute the video stream.

In this example, the video is started using the **RTSP** protocol and port **8554** to listen for connections. The **--loop** means that the video will loop infinitely while the container is alive. At the same time, the video stream keeps open even if the video stream ends, therefore allowing the clients consume the video stream without disconnections.


## VLC client

On another or on the same host, run the command below

```bash
vlc rtsp://@CONTAINER_HOST_IP:8554/

```

For this example, the client needs to have VLC installed to run this command or another program with support to **RTSP** protocol. 

This command will start VLC in client mode and connect to the specific host or container ip. 

After this, the vlc will open and show up the video being streamed. 

# VLC References

For more information about VLC, check the links below.
* https://wiki.videolan.org/Documentation:Streaming_HowTo_New/
* https://wiki.videolan.org/Documentation:Streaming_HowTo/Command_Line_Examples/



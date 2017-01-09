# e3-docker-image
Docker image for e3, euler2 and euler2-demos in a Debian OS

# Setup

1. Install docker specific to your OS

  1. Linux
 
    Refer to the [installation instructions for linux at docker.com](https://docs.docker.com/engine/installation/linux/)

  2. Mac
 
    Refer to the [installation instructions for mac at docker.com](https://docs.docker.com/docker-for-mac/)

  3. Windows
     
    To run Docker, your machine must have a 64-bit operating system running Windows 7 or higher. Additionally, you must make sure that virtualization is enabled on your machine. For details, see the Toolbox install instructions for Windows.

    Windows 7:
    You will install the [docker toolbox](https://www.docker.com/products/docker-toolbox) 

    Windows 10:
    You will install [docker for windows](https://docs.docker.com/docker-for-windows)

    For more, refer to the [installation instructions for windows at docker.com](https://docs.docker.com/engine/installation/windows/)

2. Get the docker image
   
   ```bash
   docker pull rodenhausen/eulerx
   ```

3. Run the image

   ```bash
   docker run -it rodenhausen/eulerx
   ```

4. For informations on how to use refer to their respective repositories
 * [e3](https://github.com/EulerProject/e3)
 * [euler2](https://github.com/EulerProject/EulerX)
 * [euler2-demos](https://github.com/EulerProject/euler2-demos)
 
5. Access files of the host system
 
   If you want to use files of your host system you can [mount them](https://docs.docker.com/engine/tutorials/dockervolumes/#mount-a-host-directory-as-a-data-volume) when running the image


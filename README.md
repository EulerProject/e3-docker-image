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

2. Startup docker if not done so automatically

3. Run the image

   ```bash
   docker run -it rodenhausen/e3-docker-image
   ```
   
   If you want to use files of your host system you can [mount them](https://docs.docker.com/engine/tutorials/dockervolumes/#mount-a-host-directory-as-a-data-volume) when running the image. If your host is a windows system you may for example do something like this.
   ```bash
   docker run -v C:\Users\user\e3-data:/e3-data -it rodenhausen/e3-docker-image
   ```
   
   Additionally, to automatically copy produced image files from e3 to your host you may want to configure e3 as follows.
   ```bash
   e3 set config imageViewer = cp {file} /e3-data
   ```
   * To maintain the e3 state between docker runs you can:
      * If you have not removed the container, you first have to know your the container name or id. You can find it from the following output
      
        ```bash
        docker ps -a
        ```
        Then you can restart and attach to it doing
        
        ```bash
        docker start <container-name-or-id>
        docker attach <container-name-or-id>
        ```
      running, you can choose to resume it where you left off
      * Use the docker volume option and bind it to your `.e3` directory. E.g. as follows
      
        ```bash
        docker run -v C:\Users\user\.e3:/root/.e3 -it rodenhausen/e3-docker-image
        ```  
      * Configure a git repository and use the commands `git push` and `git pull` to store the state between docker runs 
   
4. For informations on how to use e3, euler2 or euler2-demos please refer to their respective repositories
 * [e3](https://github.com/EulerProject/e3)
 * [euler2](https://github.com/EulerProject/EulerX)
 * [euler2-demos](https://github.com/EulerProject/euler2-demos)
 



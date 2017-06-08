Use a container
---------------

    sudo apt-get install lxc lxc-templates
    sudo lxc-create -t ubuntu -n my32bitbox -- --bindhome $LOGNAME -a i386 --release trusty
 ### Start the container
 
    sudo lxc-start -n my32bitbox
    
 #### login as yourself
 
    sudo lxc-console -n my32bitbox
    
 ### When you are in
 
    # sudo sh -c "sed s/deb/deb-src/ /etc/apt/sources.list >> /etc/apt/sources.list"
 
    sudo apt-get install autoconf
    sudo apt-get install devscripts
    sudo apt-get install libtool
    sudo apt-get install pkg-config
    sudo apt-get install libssl-dev
    sudo apt-get install libxml2-dev
    sudo apt-get install 

### Compile your stuff

    sudo apt-get build-dep wine1.7
    apt-get source wine1.7
    cd wine1.7-*
    debuild -eDEB_BUILD_OPTIONS="parallel=8" -i -us -uc -b

### Leave

    shutdown -h now   # to exit the container
  
  Use flags
  ---------
  
    export CFLAGS=-m32
    export CXXFLASGE=-m3



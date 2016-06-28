# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/madoka/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/madoka/.config/omf"
set -x SHELL /bin/bash
# set -x HTTP_PROXY 127.0.0.1:1080
# set -x HTTPS_PROXY 127.0.0.1:1080
set -x DOCKER_HOST tcp://172.17.6.242:2375
set -x GOPATH /Users/madoka/Workspace/github/go
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOBIN /usr/local/opt/go/libexec/bin /Users/madoka/Library/Android/sdk/platform-tools /opt/Sencha/Cmd
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export ANDROID_HOME=${HOME}/Android/Sdk
export ANDROID_NDK=/opt/android-ndk-r10e

export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:$(ruby -e 'print Gem.user_dir')/bin
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
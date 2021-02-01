## https://apple.stackexchange.com/a/271472
# X11 will look at your .bashrc while a "regular" Terminal will look at .bash_profile
# However, if you add the following to your .bash_profile, you can then move everything into your .bashrc file so as to consolidate everything into one place instead of two:


if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

export LANG="hr_HR.UTF-8"
#export LC_ALL="hr_HR.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

export GDAL_DRIVER_PATH=/usr/local/lib/gdalplugins

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

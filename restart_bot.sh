#!/bin/bash

# Kill the currently running process first and foremost. 
kill $(ps aux | grep 'jediforces_bot.rb') > /dev/null 2>&1

# Then update to the latest version of master
export UPDATE_TEXT=$(git pull origin master)

# If an update occurred, treat it like its never been installed before.
# So make sure the correct version of ruby is installed.
# Then make sure all the dependencies are up to date and installed
if ! grep -q "Already up to date." <<< $UPDATE_TEXT; then
    rbenv install -s && bundle install
fi

# Finally, start the bot back up as a process running in the background 
nohup bundle exec ruby jediforces_bot.rb &

# jediforces-info-retriever

## Prerequisites
* Install [rbenv](https://github.com/rbenv/rbenv) with [ruby-build](https://github.com/rbenv/ruby-build)

* Setup a discord bot for your own testing use. With instructions [here](https://discord.com/developers/docs/intro#bots-and-apps)

* Add your bot to your server

## Install
1. Make a local file in the root called `config.env.local`

2. In the `main.env` file, copy the top lines that have `NOT_SET_CORRECTLY` as their value and put them into `config.env.local`

3. From your bot previously setup. Enter in all the values from the bot info page. 
   1. NOTE: the `config.env.local` is not saved in your commits on purpose, since it includes sensitive information in this file. DO NOT, remove `config.env.local` from the `.gitignore`, your pull request will be rejected.

### For first time installers.

4. Run `rbenv install`

5. Run `gem install bundler`

6. Run `bundle install`


## Running

* When ready, from a terminal simply run the `restart_bot.sh` from the root of this repository.
   * The above script will check to make sure it has the latest version of master. If it does not, it will
      1. Check and if needed install the required ruby version
      2. Install any well as any dependencies. 
   * Regardless if it needs to install new versions or not, it will then run the bot in the background on your system.


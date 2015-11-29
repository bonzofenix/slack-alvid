
## Slack Alvid

[![Code Climate](https://codeclimate.com/github/bonzofenix/slack-alvid/badges/gpa.svg)](https://codeclimate.com/github/bonzofenix/slack-alvid)
[![Test Coverage](https://codeclimate.com/github/bonzofenix/slack-alvid/badges/coverage.svg)](https://codeclimate.com/github/bonzofenix/slack-alvid/coverage)
[![issue Count](https://codeclimate.com/github/bonzofenix/slack-alvid/badges/issue_count.svg)](https://codeclimate.com/github/bonzofenix/slack-alvid)
[![Build Status](https://travis-ci.org/bonzofenix/slack-alvid.svg)](https://travis-ci.org/bonzofenix/slack-alvid)

Slack Bot for [Alvid](https://github.com/bonzofenix/alvid/)

## Installation

Create a new Bot Integration under [services/new/bot](http://slack.com/services/new/bot).

![](https://raw.githubusercontent.com/dblock/slack-ruby-bot/master/screenshots/register-bot.png)

On the next screen, note the API token.

## Deploying to CF

    bundle package --all
    cf push slack-alvid --no-start
    # Slack's Alvid token
    cf set-env slack-alvid SLACK_API_TOKEN asas-12345678910-asdasdasdasdasdasdasdasd
    cf push slack-alvid 

Slack-alvid supports [MySql on CF.](http://docs.pivotal.io/p-mysql/#provision-and-bind)

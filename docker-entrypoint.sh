#!/usr/bin/env bash
echo "edit default settings from environment variables"

sed -i "s/TWITTER_ACCESS_TOKEN_SECRET/${TWITTER_ACCESS_TOKEN_SECRET}/" -i /code/src/config.json
sed -i "s/TWITTER_ACCESS_TOKEN/${TWITTER_ACCESS_TOKEN}/" -i /code/src/config.json
sed -i "s/TWITTER_CONSUMER_SECRET/${TWITTER_CONSUMER_SECRET}/" -i /code/src/config.json
sed -i "s/TWITTER_CONSUMER_KEY/${TWITTER_CONSUMER_KEY}/" -i /code/src/config.json
sed -i "s/VAPID_PRIVATE_KEY/${VAPID_PRIVATE_KEY}/" -i /code/src/config.json
sed -i "s/VAPID_PUBLIC_KEY/${VAPID_PUBLIC_KEY}/" -i /code/src/config.json

/usr/bin/supervisord

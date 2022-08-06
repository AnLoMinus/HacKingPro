#!/bin/bash
# Exchange "$$" with your API KEY
shodan="$$"
censys_id="$$"
censys_secret="$$"
virustotal="$$"
passivetotal_key=""
passivetotal_secret=""
riddler_username=""
riddler_password=""

#Aquatone API Location $HOME/aquatone/.keys.yml
echo """
shodan: $shodan
censys_id: $censys_id
censys_secret: $censys_secret
virustotal: $virustotal
passivetotal_key: $passivetotal_key
passivetotal_secret: $passivetotal_secret
riddler_username: $riddler_username
riddler_password: $riddler_password
""" > $HOME/aquatone/.keys.yml

#Telegram Bot API KEYS AND CHAT ID
telegram_api="$$"
chatID="$$"

#Knockpy Virustotal Api Key
echo """
{
	'virustotal': '$virustotal'
}
""" > $HOME/Desktop/101/tools/knock/knockpy/config.json

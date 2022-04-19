#!/bin/bash
uriformat='https://secure.runescape.com/m=%s/index_lite.ws?player=%s'
retrieval="$(date --utc --rfc-3339=seconds)"

if [ ! -s "$1" ]; then
	echo "must supply a character queue" 1>&2
	exit 1
fi

jq -r 'keys[]' "$1" | while IFS= read -r key; do
	jq -r '.[$key][]' "$1" --arg key "$key" | while IFS= read -r character; do
		mkdir -p "$key/$character"
		curl -s "$(printf "$uriformat" "$key" \
			"$(jq -rn '$x|@uri' --arg x "$character")")" \
			> "$key/$character/$retrieval.csv"
	done
done

#!/bin/bash
#
# by Sairon Istyar, 2012
# distributed under the GPLv3 license
# http://www.opensource.org/licenses/gpl-3.0.html
#

[ -f ~/.wolfram_api_key ] && . ~/.wolfram_api_key

# properly encode query
q=$(echo ${*} | sed 's/+/%2B/g' | tr '\ ' '\+')

# fetch and parse result
result=$(curl -s "http://api.wolframalpha.com/v2/query?input=${q}&appid=${API_KEY}&format=plaintext")

result=`echo "${result}" \
  | tr '\n' '\t' \
  | sed -e 's/<plaintext>/\'$'\n<plaintext>/g' \
  | grep -oE "<plaintext>.*</plaintext>|<pod title=.[^\']*" \
  | sed -e 's!<plaintext>!!g; \
    s!</plaintext>!!g; \
    s!<pod title=.*!\\\x1b[1;36m&\\\x1b[0m!g; \
    s!<pod title=.!!g; \
    s!\&amp;!\&!g; \
    s!\&lt;!<!g; \
    s!\&gt;!>!g; \
    s!\&quot;!"!g' \
    -e "s/\&apos;/'/g" \
  | tr '\t' '\n' \
  | sed  '/^$/d; \
    s/\ \ */\ /g; \
    s/\\\:/\\\u/g'`

# print result
echo "${result}"

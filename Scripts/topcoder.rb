require 'open-uri'

TEST_URL = "http://community.topcoder.com/tc?module=MatchList&sc=&sd=&nr=200&sr=801"

def test_topcoder
  open(TEST_URL) do |file|
    contents = file.read
    contents.scan(/(\/stat\?c[=&\w-]+)\">([\w \']+)</) do |match|
      p match
    end
  end
end

test_topcoder



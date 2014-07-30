require 'open-uri'

class TopcoderMatch
  attr_accessor :title
  attr_accessor :url
  attr_accessor :problem

  def initialize (title)
    @title = title
  end
end

class TopcoderProblem
  attr_accessor :title
  attr_accessor :url
  attr_accessor :difficulty
  attr_accessor :problem_statement

  def initialize (title)
    @title = title
  end
end

# TEST_URL = "http://community.topcoder.com/tc?module=MatchList&sc=&sd=&nr=200&sr=801"
TEST_URL = "http://community.topcoder.com/tc?module=MatchList&sc=&sd=&nr=200&sr=0"

def test_topcoder
  open(TEST_URL) do |file|
    contents = file.read
    contents.scan(/(\/stat\?c[=&\w-]+)\">([\w \']+)</) do |match|
      p match
    end
  end
end

test_topcoder



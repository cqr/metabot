# Metabot by chrisrhoden
#
# little library, handles grabbing parts of speech and
# does it's best to guess them based on previous messages

#require "rubygems"
#require "sqlite3"
require "logger"

# so maybe a basic app that uses this lib would be...
# bot = MetaBot.new :llevel => ERROR
# while m = gets
#   puts bot.tell(m).listen
# end

class MetaBot
  def initialize(arg = {})
    @name = arg[:name] || 'Charlie'
    @log = Logger.new(arg[:lout]||STDOUT)
    @log.level = Logger.const_get((arg[:llevel] || 'DEBUG').intern)
    @log.debug("Firing up a metabot named #{@name}...")
    # by default we are not waiting for a particular response.
    @waiting = false
    # let's do things the easy way for now, forget about
    # storing our results. keep everything in memory.
    @words = {}
    @parts_of_speech = [:verb, :noun, :adjective, :adverb, :pronoun,
                        :preposition, :conjunction, :interjection]
    @log.debug("#{@name} is all set up and reporting for duty.")
  end
  
  def tell(msg)
    @log.debug("#{@name} got the message '#{msg}'.")
    if @waiting
      @log.debug("#{@name} is waiting for a response, following up...")
      follow_up(msg)
    else
      @log.debug("#{@name} is not waiting for a response, reading message...")
      parse_message(msg)
    end
    self
  end
  
  def listen
    @response || "I have nothing to say."
  end
  
  private
  
  def follow_up(msg)
    
  end
  
  def parse_message(msg)
    tokens = msg.split(' ')
    
  end
end
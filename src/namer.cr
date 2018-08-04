require "stdimp/string/puts"
require "./words/*"

module Namer
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  extend self

  def generate
    noun = NOUNS.shuffle.first
    adj = ADJECTIVES.shuffle.first

    [adj, noun].join(" ")
  end
end

Namer.generate.puts

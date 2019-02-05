require "stdimp/string/puts"
require "./words/*"

module Namer
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  extend self

  def generate(glue : String = " ")
    noun = NOUNS.shuffle.first
    adj = ADJECTIVES.shuffle.first

    [adj, noun].join(glue)
  end
end

def has_arg(args : Array(String))
  !(ARGV & args).empty?
end

if has_arg(%w(-v --version))
  puts "namer v#{Namer::VERSION}"
  exit 0
end

if has_arg(%w(-h --help))
  puts <<-USAGE
    usage: namer [ARGS]
    args:
      --version     show version
      --help        show help
      --kebab       use kebab case
      --continuous  continuous print forever
  USAGE
  exit 0
end

continuous = has_arg(%w(-c --continuous))

loop do
  if has_arg(%w(-k --kebab))
    Namer.generate("-").puts
  else
    Namer.generate.puts
  end

  break if !continuous
end

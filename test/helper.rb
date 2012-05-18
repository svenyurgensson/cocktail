require 'rubygems'
require 'cocktail'
require 'breakpoint'

def colorize(text, color_code)
  "#{color_code}#{text}\e[0m"
end

def red(text); colorize(text, "\e[31m"); end
def green(text); colorize(text, "\e[32m"); end
def blue(text); colorize(text, "\e[34m"); end
def bold(text); colorize(text, "\e[1m"); end
def fail(text); red("FAILED: " + text); end
def banner(text);  print bold("\nTesting '#{text}' ... "); STDOUT.flush; end

include Test::Unit::Assertions
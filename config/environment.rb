require 'bundler/setup'
Bundler.require
require 'pry'

require_relative '../tools/console.rb'
require_relative '../app/models.rb'

Pry.start

#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require


require 'pry'
require 'colorize'
require 'json'

require_relative "../config/environment.rb"

@game = Game.new


puts "THANKS FOR PLAYING!"


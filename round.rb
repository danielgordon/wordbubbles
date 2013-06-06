#!/usr/bin/env ruby

require 'dictionary'

class Round
  attr_accessor :score

  def initialize(file)
    @score = 0
    @words_played = Array.new()
    @word_dictionary = Dictionary.new(file)
  end

  def word_played?(word)
    @words_played.each do |played_word|
      if played_word == word
        return true
      end
    return false
  end
  
  def words_of_length(length)
    count = 0
    @words_played.each do |played_word|
      if played_word.length == length
        count += 1
      end
    end
  end

  def word_valid?(word)
    return @word_dictionary.contains_word?(word)
  end

  def add_word(word)
    add_points(word)
    @words_played << word
  end

  def add_points(word)
    case words_of_length(word)
    when 0
      @points += 30
    when 1
      @points += 60
    when 2
      @points += 90
    end
  end

  def check_word(word)
    len = word.length
    if ((len > 3) and (words_of_length(len) < 3) and (not word_played?(word)) \
      and (word_valid?(word)))
      
      add_word(word)
      return true
    else
      return false 
    end 
  end

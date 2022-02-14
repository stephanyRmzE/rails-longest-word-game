require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    (0...10).each { |x| @letters[x] = Array('A'...'Z').sample }
  end

  def score
    @word = params[:word].downcase.split('')
    @letters = params[:letters]
    count = 0
    @word.each do |word|
      count += 1 if @letters.include?(word.downcase)
    end
    raise
    if @word.length == count
      url = "https://wagon-dictionary.herokuapp.com/#{@word}"
      word_serialized = URI.open(url).read
      word = JSON.parse(word_serialized)
      if word['found']
        @message = 'The word is valid according to the grid and is an English word'
      elsif
        @message = "The word is valid according to the grid, but is not a valid English word"
      end
    elsif
    @message = 'The word cant be built out of the original grid'
    end
  end
end

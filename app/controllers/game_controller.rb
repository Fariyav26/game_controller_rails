class GameController < ApplicationController

  # /game
  def try

    # if there is no random number when the game starts
    if cookies[:random] == nil
      # make a random number
      cookies[:random] = rand(100)

      # set counter to 1
      cookies[:counter] = 1
    else
      # adding a try to the counter each time its reloaded as well as a guess. 
      cookies[:counter] = cookies[:counter].to_i + 1
    end
    # otherwise, if the game has started and we already have a number, DON'T MAKE A NEW RANDOM NUMBER

    # Check if the user has made a guess
    # If there is a guess, put the guess in the @guess
    # variable so we can show it in the view
    if params[:guess] != nil
      @guess = params[:guess].to_i
    end

    # Save random number so we can show it in the view
    @secret = cookies[:random].to_i

    # Save counter so we can show it in the view
    @counter = cookies[:counter]

    # Guess is too high
    if @guess > @secret
      @result = "Too high!"
    # Guess is too low
    elsif @guess < @secret
      @result = "Too low!"
    # Guess is right!
    elsif @guess == @secret
      @result = "You win!"
    end

  end

end

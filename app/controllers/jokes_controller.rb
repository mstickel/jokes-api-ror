class JokesController < ApplicationController
  def random
    @joke = Joke.find(Joke.pluck(:id).sample)
  end
end

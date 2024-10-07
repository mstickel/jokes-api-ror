class JokesController < ApplicationController
  def random
    @joke = Joke.find(Joke.pluck(:id).sample)
  end

  def index
    @jokes = Joke.all
  end

  def show
    @joke = Joke.find(params[:id])
  end

  def destroy
    @joke = Joke.find(params[:id])
  end

  def new
    @joke = Joke.new
  end

  def create
    @joke = Joke.new(joke_params)

    if @joke.save
      redirect_to jokes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @joke = Joke.find(params[:id])
  end

  def update
    @joke = Joke.find(params[:id])

    if @joke.update(joke_params)
      redirect_to jokes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @joke = Joke.find(params[:id])
    @joke.destroy

    redirect_to jokes_path, status: :see_other
  end

  private
    def joke_params
      params.require(:joke).permit(:body)
    end
end

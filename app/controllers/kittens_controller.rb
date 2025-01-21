class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:name])
  end

  def new
  @kitten = Kitten.new
  end
end

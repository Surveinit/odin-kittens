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

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to(@kitten)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @kitten = Kitten.find(params[:name])
  end

  def update
    @kitten = Kitten.find(params[:name])
    if @kitten.update(kitten_params)
      redirect_to(@kitten)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  private
  def kitten_params
    params.expect(kitten: [ :name ])
  end
end

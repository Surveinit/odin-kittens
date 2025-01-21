class KittensController < ApplicationController
  before_action :set_kitten, only: [ :show, :edit, :update, :destroy ]
  def index
    @kittens = Kitten.all
    respond_to do |format|
      # index.html.erb
      format.html
      format.json { render(json: @kittens) }
      format.xml { render(xml: @kittens) }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
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
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to(@kitten)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    if @kitten.destroy
      redirect_to(kittens_url, notice: "Kitten data was deleted successfully!")
    else
      redirect_to(kittens_url, alert: "Error deleting kitten: #{@kitten.errors.full_messages.join(", ")}")
    end
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end

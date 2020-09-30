class ExercicesController < ApplicationController
  before_action :set_exercice, only: [:show, :edit, :update, :destroy]

  # GET /exercices
  def index
    @exercices = Exercice.all
  end

  # GET /exercices/1
  def show
  end

  # GET /exercices/new
  def new
    @exercice = Exercice.new
  end

  # GET /exercices/1/edit
  def edit
  end

  # POST /exercices
  def create
    @exercice = Exercice.new(exercice_params)

    if @exercice.save
      redirect_to @exercice, notice: 'Exercice was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /exercices/1
  def update
    if @exercice.update(exercice_params)
      redirect_to @exercice, notice: 'Exercice was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exercices/1
  def destroy
    @exercice.destroy
    redirect_to exercices_url, notice: 'Exercice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercice
      @exercice = Exercice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exercice_params
      params.fetch(:exercice, {})
    end
end

class CommercesController < ApplicationController
  before_action :set_commerce, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ show ]
  load_and_authorize_resource

  # GET /commerces or /commerces.json
  def index
    @commerces = current_user.commerces
  end

  # GET /commerces/1 or /commerces/1.json
  def show
    puts "\n\n\n\n\n\n\n #{params[:id]} \n\n\n\n\n\n\n"
  end

  # GET /commerces/new
  def new
    @commerce = current_user.commerces.new
  end

  # GET /commerces/1/edit
  def edit
  end

  # POST /commerces or /commerces.json
  def create
    @commerce = current_user.commerces.new(commerce_params)

    respond_to do |format|
      if @commerce.save
        format.html { redirect_to commerce_url(@commerce), notice: "Commerce was successfully created." }
        format.json { render :show, status: :created, location: @commerce }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commerce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commerces/1 or /commerces/1.json
  def update
    respond_to do |format|
      if @commerce.update(commerce_params)
        format.html { redirect_to commerce_url(@commerce), notice: "Commerce was successfully updated." }
        format.json { render :show, status: :ok, location: @commerce }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commerce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commerces/1 or /commerces/1.json
  def destroy
    @commerce.destroy

    respond_to do |format|
      format.html { redirect_to commerces_url, notice: "Commerce was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commerce
      @commerce = Commerce.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commerce_params
      params.require(:commerce).permit(:name, :state, :city, :postal_code, :address, :user_id, :rfc, :dni_photo)
    end
end

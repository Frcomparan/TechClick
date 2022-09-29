class ProductsController < ApplicationController
  before_action :set_product, only: %i[ edit update destroy ]
  before_action :authenticate_user!, except: %i[ show ]
  load_and_authorize_resource

  # GET /products or /products.json
  def index
    @products = current_user.products
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = current_user.products.new
  end

  # GET /products/1/edit
  def edit
    delete_attachment(params[:photo_id]) if params.key?(:photo_id)
  end

  # POST /products or /products.json
  def create
    @product = current_user.products.new(product_params)
    puts "\n\n\n\n\n\n\n\n\n #{@product} \n\n\n\n\n\n"

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_attachment(photo_id)
    attachment = ActiveStorage::Attachment.find(photo_id)
    attachment.purge
    redirect_to edit_product_url(@product)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :discount, :user_id, photos: [])
    end
end

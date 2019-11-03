class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @prices = Price.where(product: @product)
  end

  # GET /products/new
  def new
    @product = Product.new
    @services = Service.all
  end

  # GET /products/1/edit
  def edit
    @services = Service.all
    service_ids = @product.prices.map {|price| price.service_id}
    @current_services = Service.find(service_ids)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    # service_names_hash = Hash[(0...service_names.size).zip service_names]
    # service_prices_hash = Hash[(0...service_prices.size).zip service_prices]
    # service_names.each

    respond_to do |format|
      if @product.save
        checked_service_ids = params[:service_ids] || []
        price_hash = params[:prices]
        checked_service_ids.each do |service_id|
          Price.create!(price: price_hash[service_id], service_id: service_id, product_id: @product.id)
        end
        # if params[:prices]
        #   service_ids = params[:service_ids]

        #   prices = params[:prices].reject { |s| s.empty? }
        #   prices.each_with_index do |price, key|
        #     Price.create!(price: price, product_id: @product.id, service_id: service_ids[key])
        #   end
        # end
        format.html { redirect_to root_path, notice: "已成功建立產品-#{@product.name}" }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)        
        @product.prices.destroy_all
        checked_service_ids = params[:service_ids] || []
        price_hash = params[:prices]
        checked_service_ids.each do |service_id|
          Price.create!(price: price_hash[service_id], service_id: service_id, product_id: @product.id)
        end
        format.html { redirect_to root_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:brand_id, :name, :service_ids, :prices)
    end
end

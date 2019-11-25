class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :show_yahoo_html, :edit_yahoo_html, :new_yahoo_html]

  def index
    @products = Product.all
  end

  def show
    @prices = Price.where(product: @product)
  end

  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.new
    @services = Service.all
  end

  def edit
    @brand = Brand.find(params[:brand_id])
    @services = Service.all.order("name")
    service_ids = @product.prices.map {|price| price.service_id}
    @current_services = Service.find(service_ids)
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @product = Product.new(product_params)
    @product.brand = @brand

    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path(brand_id: @brand.id, product_id: @product.id), notice: "已成功建立產品-#{@product.name}" }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @brand = Brand.find(params[:brand_id])
    respond_to do |format|
      if @product.update(product_params)        
        format.html { redirect_to root_path(brand_id: @brand.id, product_id: @product.id), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:brand_id, :name, :service_ids, :yahoo_prices, :ruten_prices, :shopee_prices)
    end
end

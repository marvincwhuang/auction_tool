class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @prices = Price.where(product: @product)
  end

  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.new
    @services = @brand.services.order(:name)
  end

  def edit
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:id])
    @services = @brand.services.order(:name)
    service_ids = @product.services.map{|service| service.id}
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @product = Product.new(product_params)
    @product.brand = @brand
    service_ids = params[:service_ids]
    yahoo_prices = params[:yahoo_prices]
    ruten_prices = params[:ruten_prices]
    shopee_prices = params[:shopee_prices]

    @product.services = Service.where(id: service_ids)

    respond_to do |format|
      if @product.save
        if service_ids
          service_ids.each_with_index do |service_id|
            Price.create!(
              service_id: service_id,
              product_id: @product.id,
              yahoo: yahoo_prices[service_id],
              ruten: ruten_prices[service_id],
              shopee: shopee_prices[service_id]
            )
          end
        end
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
    service_ids = params[:service_ids]
    yahoo_prices = params[:yahoo_prices]
    ruten_prices = params[:ruten_prices]
    shopee_prices = params[:shopee_prices]

    @product.services = Service.where(id: service_ids)

    respond_to do |format|
      if @product.update(product_params)  
        @product.prices.destroy_all
        if service_ids
          service_ids.each_with_index do |service_id|
            Price.create!(
              service_id: service_id,
              product_id: @product.id,
              yahoo: yahoo_prices[service_id],
              ruten: ruten_prices[service_id],
              shopee: shopee_prices[service_id]
            )
          end
        end  
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

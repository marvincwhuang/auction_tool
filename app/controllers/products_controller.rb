class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :show_yahoo_html, :edit_yahoo_html, :new_yahoo_html]

  def index
    @products = Product.all
  end

  def show
    @prices = Price.where(product: @product)
  end

  def new
    @product = Product.new
    @services = Service.all
  end

  def edit
    @services = Service.all.order("name")
    service_ids = @product.prices.map {|price| price.service_id}
    @current_services = Service.find(service_ids)
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        checked_service_ids = params[:service_ids] || []
        yahoo_price_hash = params[:yahoo_prices]
        ruten_price_hash = params[:ruten_prices]
        shopee_price_hash = params[:shopee_prices]
        checked_service_ids.each do |service_id|
          Price.create!(
            yahoo: yahoo_price_hash[service_id],
            ruten: ruten_price_hash[service_id],
            shopee: shopee_price_hash[service_id],
            service_id: service_id,
            product_id: @product.id)
        end
        format.html { redirect_to root_path, notice: "已成功建立產品-#{@product.name}" }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)        
        @product.prices.destroy_all
        checked_service_ids = params[:service_ids] || []
        yahoo_price_hash = params[:yahoo_prices]
        ruten_price_hash = params[:ruten_prices]
        shopee_price_hash = params[:shopee_prices]
        checked_service_ids.each do |service_id|
          Price.create!(
            yahoo: yahoo_price_hash[service_id],
            ruten: ruten_price_hash[service_id],
            shopee: shopee_price_hash[service_id],
            service_id: service_id,
            product_id: @product.id
          )
        end
        format.html { redirect_to root_path, notice: 'Product was successfully updated.' }
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

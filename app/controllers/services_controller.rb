class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @services = Service.all.order("brand_id")
  end

  def show
  end

  # GET /services/new
  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @service = Service.new
    @services = @brand.services
  end

  # GET /services/1/edit
  def edit
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @price = Price.find_by(product_id: @product.id, service_id: @service.id)
    @yahoo_price = @price ? @price.yahoo : nil
    @ruten_price = @price ? @price.ruten : nil
    @shopee_price = @price ? @price.shopee : nil
  end

  # POST /services
  # POST /services.json
  def create
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    @service = Service.new(service_params)
    @service.brand = @brand
    @service.products << @product

    respond_to do |format|
      if @service.save
        @price = Price.new(product: @product, service: @service)
        @price.yahoo = params[:yahoo_price]
        @price.ruten = params[:ruten_price]
        @price.shopee = params[:shopee_price]
        @price.save
        @service.prices << @price
        format.html { redirect_to root_path(brand_id: @brand.id, product_id: @product.id), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:product_id])
    respond_to do |format|
      if @service.update(service_params)
        @price = Price.find_or_create_by(product: @product, service: @service)
        @price.yahoo = params[:yahoo_price] if  params[:yahoo_price] && 
        @price.ruten = params[:ruten_price] if params[:ruten_price]
        @price.shopee = params[:shopee_price] if params[:shopee_price]
        @price.save
        format.html { redirect_to root_path(brand_id: @brand.id, product_id: @product.id), notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @product.services.delete(@service)
    if @service.products.count == 0
      @service.destroy
    end
    redirect_to root_path, notice: 'Service was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :product_id, :price, :brand_id)
    end
end

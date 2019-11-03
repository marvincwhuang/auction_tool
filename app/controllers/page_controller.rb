class PageController < ApplicationController
  def index
    @current_brand = params[:brand_id] ? Brand.find(params[:brand_id]) : Brand.first
    if params[:product_id]
      @current_product = Product.find(params[:product_id])
    elsif @current_brand
      @current_product = @current_brand.products.first
    else
      @current_product = nil
    end
    @brands = Brand.all
    @products = @current_brand ? @current_brand.products : Product.all
    @prices = @current_product ? Price.where(product_id: @current_product.id) : []
    @services = @prices.map do |item|
      service = Service.find(item.service_id)
      {name: service.name, price: item.price}
    end
  end

  def edit
    @brands = Brand.all
    @products = @brand ? @brand.products : @products = Product.all
  end
end

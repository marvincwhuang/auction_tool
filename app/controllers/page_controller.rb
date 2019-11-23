class PageController < ApplicationController
  def index
    @current_brand = params[:brand_id] ? Brand.find(params[:brand_id]) : Brand.order(:name).first
    if params[:product_id]
      @current_product = Product.find(params[:product_id])
    elsif @current_brand
      @current_product = @current_brand.products.order(:name).first
    else
      @current_product = nil
    end
    @brands = Brand.all.order(:name)
    @products = @current_brand ? @current_brand.products.order(:name) : Product.all.order(:name)
    @prices = @current_product ? Price.where(product_id: @current_product.id) : []
    @services = @prices.map do |item|
      service = Service.find(item.service_id)
      {name: service.name, yahoo_price: item.yahoo, ruten_price: item.ruten, shoppe_price: item.shopee}
    end
  end
end

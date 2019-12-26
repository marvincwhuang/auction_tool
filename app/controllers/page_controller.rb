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
    @services = @current_product ? @current_product.services : []
  end

  def export_data
    puts "export!"
    @products = Product.all
    respond_to do |format|
      format.xlsx
    end
  end
end

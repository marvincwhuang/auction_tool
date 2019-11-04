class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :show_yahoo_html, :edit_yahoo_html, :new_yahoo_html]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def edit_yahoo_html
    @template = @product.yahoo_template
    if @template
      @highlight = @template.highlight
      @product_description_title = @template.product_description_title
      @product_description = @template.product_description
      @available_spec_title = @template.available_spec_title
      @available_spec = @template.available_spec
      @marketplace_detail = @template.marketplace_detail
      @warning = @template.warning
      @gaurantee = @template.gaurantee
      @gaurantee_scope = @template.gaurantee_scope
      @notice_for_use = @template.notice_for_use
      @product_declaration = @template.product_declaration
      @image_1 = @template.image_1
      @image_2 = @template.image_2
      @image_3 = @template.image_3
      @buy_more_product_1 = @template.buy_more_product_1
      @buy_more_product_url_1 = @template.buy_more_product_url_1
      @buy_more_product_2 = @template.buy_more_product_2
      @buy_more_product_url_2 = @template.buy_more_product_url_2
      @buy_more_product_3 = @template.buy_more_product_3
      @buy_more_product_url_3 = @template.buy_more_product_url_3
      @buy_more_product_4 = @template.buy_more_product_4
      @buy_more_product_url_4 = @template.buy_more_product_url_4
    end
  end

  def show_yahoo_html
    @template = @product.yahoo_template
    if @template
      @highlight = @template.highlight
      @product_description_title = @template.product_description_title
      @product_description = @template.product_description
      @available_spec_title = @template.available_spec_title
      @available_spec = @template.available_spec
      @marketplace_detail = @template.marketplace_detail
      @warning = @template.warning
      @gaurantee = @template.gaurantee
      @gaurantee_scope = @template.gaurantee_scope
      @notice_for_use = @template.notice_for_use
      @product_declaration = @template.product_declaration
      @image_1 = @template.image_1
      @image_2 = @template.image_2
      @image_3 = @template.image_3
      @buy_more_product_1 = @template.buy_more_product_1
      @buy_more_product_url_1 = @template.buy_more_product_url_1
      @buy_more_product_2 = @template.buy_more_product_2
      @buy_more_product_url_2 = @template.buy_more_product_url_2
      @buy_more_product_3 = @template.buy_more_product_3
      @buy_more_product_url_3 = @template.buy_more_product_url_3
      @buy_more_product_4 = @template.buy_more_product_4
      @buy_more_product_url_4 = @template.buy_more_product_url_4
    end
  end

  def new_yahoo_html
    @template = YahooTemplate.new
    # yahoo and shopee
    @highlight = "<h2><span style='background-color: rgb(255, 255, 0);'>目前強打優惠</span></h2>"
    @product_description_title = "【產品介紹】"
    @product_description = "全新品\n電薪製造地:韓國\n商品組裝地:中國\n寄送與到貨天數:直寄，3天到貨"
    @available_spec_title = "適用型號"
    @available_spec = "IPad mini 1 / 2 / 3 / 4\nIPad 2 / 3 / 4 / 5 / 6\nIPad Air 1 / 2\nIPad Pro 9.7吋 /12.9吋\n2017 IPad 9.7吋\n2018 IPad 9.7吋"
    @marketplace_detail = "【保固期限】90天\n【促銷活動】499免運費\n【產品特點】頂級電路設計工藝，超優品質，A級電芯，性價比高。\n【適用範圍】皆有現貨供應，適合對手機極度愛護的人使用。\n【珍愛地球】產品皆以環保材料抑或是無外盒包裝，減少對地球的負擔與買家退換貨的難度。\n【貼心提醒】下單前請看一下自己的系統內的型號，千萬別選錯了喔，如果不懂詢問客服也可以喔"
    @warning = "1.商品售出,無法退換貨 。\n2.售價為DIY自行更換價格!\n3.指導教學,須另外付費 。\n4.臨時面交客人.請先聯繫!\n5.歡迎蒞臨本店.現場維修 。\n6.電池背後有黏膠.一經撕取後不得退換貨"
    @gaurantee = "電子商品享有保固7天 。\n零件商品享有保固7天 。\n電池商品享有保固90天 。"
    @gaurantee_scope = "．電池待機時間因使用日久縮短乃屬正常狀況，待機時 間縮短不屬保固範圍內。\n．請搭配原廠或本店銷售之充電器使用，若因使用它牌 充電器導致過充或電池故障，恕無法列入保固。\n．其它人為或外力因素等不當使 用均不予保固。\n．商品需貼有本店之保固貼紙始享有保固，保固貼紙損毀者不予 保固。\n"
    @notice_for_use = "．電池請在充飽後續充1~2小時，可達最佳使用容量。\n．為確保電池能使用較長壽命，建議電池顯示低電量時再進行充電，充電時間請 勿超過24小時。\n．電池如長時間不使用，建議至少每個月將電池做充放電一次， 以免電壓過低導致無法充電。\n．請勿使用輸出電流過高的充電器進行充電，以免電造成電池澎漲或低電壓。"
    @product_declaration = "版本多種，收到的商品可能與照片不同，恕無法因版本 不同而要求退換貨。"
  end

  def create_yahoo_html
    template_params = params[:product]
    template_params = template_params.merge({
      "highlight": params[:editordata],
      "product_id": params[:id]
    }).as_json.to_h
    YahooTemplate.create!(template_params)

    redirect_to "/products/#{params[:id]}/show_yahoo_html"
  end

  def update_yahoo_html
    template_params = params[:product]
    template_params = template_params.merge({
      "highlight": params[:editordata],
      "product_id": params[:id]
    }).as_json.to_h
    YahooTemplate.update(template_params)

    redirect_to "/products/#{params[:id]}/show_yahoo_html"
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

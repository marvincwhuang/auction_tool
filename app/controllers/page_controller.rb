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
      {name: service.name, price: item.price}
    end
  end

  def convertor
    # yahoo and shopee
    @default_default_product_title = "【產品介紹】"
    @default_product_descriptuon_text = "全新品\n電薪製造地:韓國\n商品組裝地:中國\n寄送與到貨天數:直寄，3天到貨"
    @deafault_available_spec_title = "適用型號"
    @deafault_available_spec_text = "IPad mini 1 / 2 / 3 / 4\nIPad 2 / 3 / 4 / 5 / 6\nIPad Air 1 / 2\nIPad Pro 9.7吋 /12.9吋\n2017 IPad 9.7吋\n2018 IPad 9.7吋"
    @default_marketplace_detail_text = "【保固期限】90天\n【促銷活動】499免運費\n【產品特點】頂級電路設計工藝，超優品質，A級電芯，性價比高。\n【適用範圍】皆有現貨供應，適合對手機極度愛護的人使用。\n【珍愛地球】產品皆以環保材料抑或是無外盒包裝，減少對地球的負擔與買家退換貨的難度。\n【貼心提醒】下單前請看一下自己的系統內的型號，千萬別選錯了喔，如果不懂詢問客服也可以喔"
    @default_warning_text = "1.商品售出,無法退換貨 。\n2.售價為DIY自行更換價格!\n3.指導教學,須另外付費 。\n4.臨時面交客人.請先聯繫!\n5.歡迎蒞臨本店.現場維修 。\n6.電池背後有黏膠.一經撕取後不得退換貨"
    @default_gaurantee_text = "電子商品享有保固7天 。\n零件商品享有保固7天 。\n電池商品享有保固90天 。"
    @default_gaurantee_scope_text = "．電池待機時間因使用日久縮短乃屬正常狀況，待機時 間縮短不屬保固範圍內。\n．請搭配原廠或本店銷售之充電器使用，若因使用它牌 充電器導致過充或電池故障，恕無法列入保固。\n．其它人為或外力因素等不當使 用均不予保固。\n．商品需貼有本店之保固貼紙始享有保固，保固貼紙損毀者不予 保固。\n"
    @notice_for_use_text = "．電池請在充飽後續充1~2小時，可達最佳使用容量。\n．為確保電池能使用較長壽命，建議電池顯示低電量時再進行充電，充電時間請 勿超過24小時。\n．電池如長時間不使用，建議至少每個月將電池做充放電一次， 以免電壓過低導致無法充電。\n．請勿使用輸出電流過高的充電器進行充電，以免電造成電池澎漲或低電壓。"
    @product_declaration_text = "版本多種，收到的商品可能與照片不同，恕無法因版本 不同而要求退換貨。"
  end
end

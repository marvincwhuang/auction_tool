class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]
  before_action :set_brand

  def index    
    if params[:product_id]
      @product = Product.find(params[:product_id])
      @templates = @product.templates
    else
     @templates = Template.order(:template_name).select{|template| template.product_id == nil}
    end
  end

  def show
    @product = Product.find(params[:product_id]) if params[:product_id]
    @template_name = @template.template_name
    @product_name_yahoo = @template.product_name_yahoo
    @product_name_ruten = @template.product_name_ruten
    @product_name_shopee = @template.product_name_shopee
    @editor_data = @template.editor_data
    @product_description = @template.product_descriptions.join("\r\n")
    @product_descriptions = @template.product_descriptions
    @contact = @template.contacts.join("\r\n")
    @contacts = @template.contacts
    @contact = @template.contacts.join("\r\n")
    @available_spec = @template.available_specs.join("\r\n")
    @available_specs = @template.available_specs
    @information_titles = @template.information_titles
    @information1_title = @information_titles[0] if @information_titles
    @information2_title = @information_titles[1] if @information_titles
    @information3_title = @information_titles[2] if @information_titles
    @information4_title = @information_titles[3] if @information_titles
    @information5_title = @information_titles[4] if @information_titles
    @information6_title = @information_titles[5] if @information_titles
    @information_contents = @template.information_contents
    @information1_content = @information_contents[0] if @information_titles
    @information2_content = @information_contents[1] if @information_titles
    @information3_content = @information_contents[2] if @information_titles
    @information4_content = @information_contents[3] if @information_titles
    @information5_content = @information_contents[4] if @information_titles
    @information6_content = @information_contents[5] if @information_titles
    @warning = @template.warning.join("\r\n")
    @gaurantee = @template.gaurantee.join("\r\n")
    @gaurantee_scope = @template.gaurantee_scope.join("\r\n")
    @notice_for_use = @template.notice_for_use.join("\r\n")
    @product_declaration = @template.product_declaration.join("\r\n")
    @buy_more_items = @template.buy_more_items
    @buy_more_item_urls = @template.buy_more_item_urls
    @buy_more_item_image_urls = @template.buy_more_item_image_urls
    @image_urls = @template.image_urls
  end

  def new
    @product = Product.find(params[:product_id]) if params[:product_id]
    @template = Template.new
    @templates = Template.order(:id).select{|template| template.product_id == nil}
    @default_name = "範例1"
    @editor_data = "<h2><span style='background-color: rgb(255, 255, 0);'>目前強打優惠</span></h2>"
    @product_description = "全新品\n電薪製造地:韓國\n商品組裝地:中國\n寄送與到貨天數:直寄，3天到貨"
    @available_spec = "IPad mini 1 / 2 / 3 / 4\nIPad 2 / 3 / 4 / 5 / 6\nIPad Air 1 / 2\nIPad Pro 9.7吋 /12.9吋\n2017 IPad 9.7吋\n2018 IPad 9.7吋"
    @information1_title = "【保固期限】"
    @information1_content = "90天"
    @information2_title = "【促銷活動】"
    @information2_content = "499免運費"
    @information3_title = "【產品特點】"
    @information3_content = "頂級電路設計工藝，超優品質，A級電芯，性價比高。"
    @information4_title = "【適用範圍】"
    @information4_content = "皆有現貨供應，適合對手機極度愛護的人使用。"
    @information5_title = "【珍愛地球】"
    @information5_content = "產品皆以環保材料抑或是無外盒包裝，減少對地球的負擔與買家退換貨的難度。"
    @information6_title = "【貼心提醒】"
    @information6_content = "下單前請看一下自己的系統內的型號，千萬別選錯了喔，如果不懂詢問客服也可以喔"

    @warning = "1.商品售出,無法退換貨 。\n2.售價為DIY自行更換價格!\n3.指導教學,須另外付費 。\n4.臨時面交客人.請先聯繫!\n5.歡迎蒞臨本店.現場維修 。\n6.電池背後有黏膠.一經撕取後不得退換貨"
    @gaurantee = "電子商品享有保固7天 。\n零件商品享有保固7天 。\n電池商品享有保固90天 。"
    @gaurantee_scope = "．電池待機時間因使用日久縮短乃屬正常狀況，待機時 間縮短不屬保固範圍內。\n．請搭配原廠或本店銷售之充電器使用，若因使用它牌 充電器導致過充或電池故障，恕無法列入保固。\n．其它人為或外力因素等不當使 用均不予保固。\n．商品需貼有本店之保固貼紙始享有保固，保固貼紙損毀者不予 保固。\n"
    @notice_for_use = "．電池請在充飽後續充1~2小時，可達最佳使用容量。\n．為確保電池能使用較長壽命，建議電池顯示低電量時再進行充電，充電時間請 勿超過24小時。\n．電池如長時間不使用，建議至少每個月將電池做充放電一次， 以免電壓過低導致無法充電。\n．請勿使用輸出電流過高的充電器進行充電，以免電造成電池澎漲或低電壓。"
    @product_declaration = "版本多種，收到的商品可能與照片不同，恕無法因版本 不同而要求退換貨。"
    @buy_more_items = ["商品1", "商品2", "商品3"]
    @buy_more_item_urls = ["https://tw.yahoo.com/","https://tw.yahoo.com/", "https://tw.yahoo.com/"]
    @buy_more_item_image_urls = ["https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200"]
    @image_urls = ["https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200"]
    @contact ="line: test123"
  end

  def create
    @target_template = Template.find(params[:template][:id]) if params[:template]
    if @target_template
      puts "copy with #{@target_template}"
      @product = Product.find(params[:product_id]) if params[:product_id]
      @template = Template.new(template_params)
      @template.template_name = "#{@target_template.template_name} copy"
      @template.product_name_yahoo = @target_template.product_name_yahoo
      @template.product_name_ruten = @target_template.product_name_ruten
      @template.product_name_shopee = @target_template.product_name_shopee
      @template.editor_data = @target_template.editor_data
      @template.product_descriptions = @target_template.product_descriptions
      @template.available_specs = @target_template.available_specs
      @template.information_titles = @target_template.information_titles
      @template.information_contents = @target_template.information_contents
      @template.buy_more_items = @target_template.buy_more_items
      @template.buy_more_item_urls = @target_template.buy_more_item_urls
      @template.buy_more_item_image_urls = @template.buy_more_item_image_urls
      @template.image_urls = @target_template.image_urls
      @template.warning = @target_template.warning
      @template.gaurantee = @target_template.gaurantee
      @template.gaurantee_scope = @target_template.gaurantee_scope
      @template.notice_for_use = @target_template.notice_for_use
      @template.product_declaration = @target_template.product_declaration
      @template.image_urls = @target_template.image_urls
      @template.product_id = params[:product_id] if params[:product_id]
      @template.contacts = @target_template.contacts
      @template.save
      puts @template
      redirect_to edit_brand_product_template_path(id: @template.id)
    else
      @product = Product.find(params[:product_id]) if params[:product_id]
      @template = Template.new(template_params)
      @template.template_name = params[:template_name]
      @template.product_name_yahoo = params[:product_name_yahoo]
      @template.product_name_ruten = params[:product_name_ruten]
      @template.product_name_shopee = params[:product_name_shopee]
      @template.product_descriptions = params[:product_description].split("\r\n") if params[:product_description]
      @template.available_specs = params[:available_spec].split("\r\n") if params[:available_spec]
      @template.information_titles = params[:information_titles]
      @template.information_contents = params[:information_contents]
      @template.buy_more_items = params[:buy_more_items]
      @template.buy_more_item_urls = params[:buy_more_item_urls]
      @template.buy_more_item_image_urls = params[:buy_more_item_image_urls]
      @template.image_urls = params[:image_urls]
      @template.warning = params[:warning].split("\r\n") if params[:warning]
      @template.gaurantee = params[:gaurantee].split("\r\n") if params[:gaurantee]
      @template.gaurantee_scope = params[:gaurantee_scope].split("\r\n") if params[:gaurantee_scope]
      @template.notice_for_use = params[:notice_for_use].split("\r\n") if params[:notice_for_use]
      @template.product_declaration = params[:product_declaration].split("\r\n") if params[:product_declaration]
      @template.image_urls = params[:image_urls]
      @template.product_id = @product.id if params[:product_id]
      @template.contacts = params[:contact].split("\r\n") if params[:contact]

      respond_to do |format|
        if @template.save
          if @product
            format.html { redirect_to brand_product_templates_path, notice: "已成功建立模板-#{@template.template_name}" }
          else
            format.html { redirect_to templates_path, notice: "已成功建立模板-#{@template.template_name}" }
          end
        else
          format.html { render :new }
        end
      end
    end
  end

  def edit
    @product = Product.find(params[:product_id]) if params[:product_id]
    @template_name = @template.template_name
    @product_name_yahoo = @template.product_name_yahoo
    @product_name_ruten = @template.product_name_ruten
    @product_name_shopee = @template.product_name_shopee
    @editor_data = @template.editor_data
    @product_description = @template.product_descriptions.join("\r\n")
    @product_descriptions = @template.product_descriptions
    @available_spec = @template.available_specs.join("\r\n")
    @available_specs = @template.available_specs
    @information_titles = @template.information_titles
    @information1_title = @information_titles[0] if @information_titles
    @information2_title = @information_titles[1] if @information_titles
    @information3_title = @information_titles[2] if @information_titles
    @information4_title = @information_titles[3] if @information_titles
    @information5_title = @information_titles[4] if @information_titles
    @information6_title = @information_titles[5] if @information_titles
    @information_contents = @template.information_contents
    @information1_content = @information_contents[0] if @information_titles
    @information2_content = @information_contents[1] if @information_titles
    @information3_content = @information_contents[2] if @information_titles
    @information4_content = @information_contents[3] if @information_titles
    @information5_content = @information_contents[4] if @information_titles
    @information6_content = @information_contents[5] if @information_titles
    @warning = @template.warning.join("\r\n")
    @gaurantee = @template.gaurantee.join("\r\n")
    @gaurantee_scope = @template.gaurantee_scope.join("\r\n")
    @notice_for_use = @template.notice_for_use.join("\r\n")
    @product_declaration = @template.product_declaration.join("\r\n")
    @buy_more_items = @template.buy_more_items
    @buy_more_item_urls = @template.buy_more_item_urls
    @buy_more_item_image_urls = @template.buy_more_item_image_urls
    @image_urls = @template.image_urls
    @contact = @template.contacts.join("\r\n")
    @contacts = @template.contacts
  end

  def update
    @template.template_name = params[:template_name]
    @template.product_name_yahoo = params[:product_name_yahoo]
    @template.product_name_ruten = params[:product_name_ruten]
    @template.product_name_shopee = params[:product_name_shopee]
    @template.editor_data = params[:editor_data] if params[:editor_data]
    @template.product_descriptions = params[:product_description].split("\r\n") if params[:product_description]
    @template.available_specs = params[:available_spec].split("\r\n") if params[:available_spec]
    @template.information_titles = params[:information_titles]
    @template.information_contents = params[:information_contents]
    @template.buy_more_items = params[:buy_more_items]
    @template.buy_more_item_urls = params[:buy_more_item_urls]
    @template.buy_more_item_image_urls = params[:buy_more_item_image_urls]
    @template.image_urls = params[:image_urls]
    @template.warning = params[:warning].split("\r\n") if params[:warning]
    @template.gaurantee = params[:gaurantee].split("\r\n") if params[:gaurantee]
    @template.gaurantee_scope = params[:gaurantee_scope].split("\r\n") if params[:gaurantee_scope]
    @template.notice_for_use = params[:notice_for_use].split("\r\n") if params[:notice_for_use]
    @template.product_declaration = params[:product_declaration].split("\r\n") if params[:product_declaration]
    @template.image_urls = params[:image_urls]
    @template.contacts = params[:contact].split("\r\n") if params[:contact]
    if @template.save
      if params[:product_id]
        redirect_to brand_product_templates_path
      else
        redirect_to templates_path
      end
    else
      puts "error"
    end
  end

  def destroy
    if @template.destroy
      if params[:product_id]
        @product = Product.find(params[:product_id])
        redirect_to brand_product_templates_path(@brand, @product)
      else
        redirect_to templates_path
      end
    else
      puts "error"
    end
  end

  def copy
    
  end

  private
  def set_template
    @template = Template.find(params[:id])
  end

  def set_brand
    @brand = Brand.find(params[:brand_id]) if params[:brand_id]
  end

  def template_params
    params.permit(
      :template_name,
      :product_name_yahoo,
      :product_name_ruten,
      :product_name_shopee,
      :editor_data,
      :product_descriptions,
      :available_specs,
      :information_titles,
      :information_contents,
      :buy_more_items,
      :buy_more_item_urls,
      :buy_more_item_image_urls,
      :warning,
      :gaurantee,
      :gaurantee_scope,
      :notice_for_use,
      :product_declaration,
      :image_urls,
      :product_id,
      :template,
      :contacts,
    )
  end
end

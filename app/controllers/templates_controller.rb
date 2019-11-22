class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  def index
    @templates = Template.all.order(:id)
  end

  def new
    @template = Template.new
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
    @image_urls = ["https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200"]
  end

  def create
    @template = Template.new(template_params)
    @template.template_name = params[:template_name]
    @template.product_descriptions = params[:product_description].split("\r\n") if params[:product_description]
    @template.available_specs = params[:available_spec].split("\r\n") if params[:available_spec]
    @template.information_titles = params[:information_titles]
    @template.information_contents = params[:information_contents]
    @template.buy_more_items = params[:buy_more_items]
    @template.buy_more_item_urls = params[:buy_more_item_urls]
    @template.image_urls = params[:image_urls]
    @template.warning = params[:warning].split("\r\n") if params[:warning]
    @template.gaurantee = params[:gaurantee].split("\r\n") if params[:gaurantee]
    @template.gaurantee_scope = params[:gaurantee_scope].split("\r\n") if params[:gaurantee_scope]
    @template.notice_for_use = params[:notice_for_use].split("\r\n") if params[:notice_for_use]
    @template.product_declaration = params[:product_declaration].split("\r\n") if params[:product_declaration]
    @template.image_urls = params[:image_urls]
    @template.category = params[:category]

    respond_to do |format|
      if @template.save
        format.html { redirect_to templates_path, notice: "已成功建立模板-#{@template.template_name}" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @template_name = @template.template_name
    @editor_data = @template.editor_data
    @product_description = @template.product_descriptions.join("\r\n")
    @product_descriptions = @template.product_descriptions
    @available_spec = @template.available_specs.join("\r\n")
    @available_specs = @template.available_specs
    @information_titles = @template.information_titles
    @information1_title = @information_titles[0]
    @information2_title = @information_titles[1]
    @information3_title = @information_titles[2]
    @information4_title = @information_titles[3]
    @information5_title = @information_titles[4]
    @information6_title = @information_titles[5]
    @information_contents = @template.information_contents
    @information1_content = @information_contents[0]
    @information2_content = @information_contents[1]
    @information3_content = @information_contents[2]
    @information4_content = @information_contents[3]
    @information5_content = @information_contents[4]
    @information6_content = @information_contents[5]
    @warning = @template.warning.join("\r\n")
    @gaurantee = @template.gaurantee.join("\r\n")
    @gaurantee_scope = @template.gaurantee_scope.join("\r\n")
    @notice_for_use = @template.notice_for_use.join("\r\n")
    @product_declaration = @template.product_declaration.join("\r\n")
    @buy_more_items = @template.buy_more_items
    @buy_more_item_urls = @template.buy_more_item_urls
    @image_urls = @template.image_urls
    @category = @template.category
  end

  def update
    @template.template_name = params[:template_name]
    @template.product_descriptions = params[:product_description].split("\r\n") if params[:product_description]
    @template.available_specs = params[:available_spec].split("\r\n") if params[:available_spec]
    @template.information_titles = params[:information_titles]
    @template.information_contents = params[:information_contents]
    @template.buy_more_items = params[:buy_more_items]
    @template.buy_more_item_urls = params[:buy_more_item_urls]
    @template.image_urls = params[:image_urls]
    @template.warning = params[:warning].split("\r\n") if params[:warning]
    @template.gaurantee = params[:gaurantee].split("\r\n") if params[:gaurantee]
    @template.gaurantee_scope = params[:gaurantee_scope].split("\r\n") if params[:gaurantee_scope]
    @template.notice_for_use = params[:notice_for_use].split("\r\n") if params[:notice_for_use]
    @template.product_declaration = params[:product_declaration].split("\r\n") if params[:product_declaration]
    @template.image_urls = params[:image_urls]
    @template.category = params[:category]

    respond_to do |format|
      if @template.save
        format.html { redirect_to templates_path, notice: 'template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @template.destroy
      respond_to do |format|
        format.html { redirect_to templates_url, notice: 'template was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      puts "error"
    end
  end

  private
  def set_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.permit(
      :template_name,
      :editor_data,
      :product_descriptions,
      :available_specs,
      :information_titles,
      :information_contents,
      :buy_more_items,
      :buy_more_item_urls,
      :warning,
      :gaurantee,
      :gaurantee_scope,
      :notice_for_use,
      :product_declaration,
      :image_urls,
      :category
    )
  end
end

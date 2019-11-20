class TemplatesController < ApplicationController
  def new
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
  end

  def create
  end
end

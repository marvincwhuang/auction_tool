window.onload = function() {
  // const productDescription = document.getElementById("productDescription")
  // productDescription.addEventListener('change', (e)=>{
  //   console.log(e.target.value)
  // })
  
  const convertBtn = document.getElementById("convertBtn")
  convertBtn.addEventListener('click', (e)=>{
    e.preventDefault()

    clearHtmlPreview()

    // 產品介紹
    const productDescriptionTitle = document.getElementById("productDescriptionTitle").textContent
    const productDescription = document.getElementById("productDescription").textContent
    // 適用型號規格
    const availableSpecTitle = document.getElementById("availableSpecTitle").textContent
    const availableSpec = document.getElementById("availableSpec").textContent 
    // 賣場細節
    // const marketplaceDetailTitle = document.getElementById("marketplaceDetailTitle").textContent
    const marketplaceDetail = document.getElementById("marketplaceDetail").textContent 
    // 注意事項
    const warningTitle = document.getElementById("warningTitle").textContent
    const warning = document.getElementById("warning").textContent 
    // 商品保固
    const gauranteeTitle = document.getElementById("gauranteeTitle").textContent
    const gaurantee = document.getElementById("gaurantee").textContent 
    // 保固範圍
    const gauranteeScopeTitle = document.getElementById("gauranteeScopeTitle").textContent
    const gauranteeScope = document.getElementById("gauranteeScope").textContent 
    // 使用須知 noticeForUse
    const noticeForUseTitle = document.getElementById("noticeForUseTitle").textContent
    const noticeForUse = document.getElementById("noticeForUse").textContent 
    // 商品說明 productDeclarationTitle
    const productDeclarationTitle = document.getElementById("productDeclarationTitle").textContent
    const productDeclaration = document.getElementById("productDeclaration").textContent
    // images
    const images = document.querySelectorAll(".image")

    // output
    const productDescriptionTitleHtml = toproductDescriptionTitleHtml(productDescriptionTitle)
    const productDescriptionHtml      = toproductDescriptionHtml(productDescription)
    const availableSpecTitleHtml      = toAvailableSpecTitleHtml(availableSpecTitle)
    const availableSpecHtml           = toAvailableSpecHtml(availableSpec)
    const marketplaceDetailHtml       = toMarketplaceDetailHtml(marketplaceDetail)
    const warningTitleHtml            = toWarningTitleHtml(warningTitle)
    const warningHtml                 = toWarningHtml(warning)
    const gauranteeTitleHtml          = toGauranteeTitleHtml(gauranteeTitle)
    const gauranteeHtml               = toGauranteeHtml(gaurantee)
    const gauranteeScopeTitleHtml     = toGauranteeScopeTitleHtml(gauranteeScopeTitle)
    const gauranteeScopeHtml          = toGauranteeScopeHtml(gauranteeScope)
    const noticeForUseTitleHtml       = toGauranteeScopeTitleHtml(noticeForUseTitle)
    const noticeForUseHtml            = toGauranteeScopeHtml(noticeForUse)
    const productDeclarationTitleHtml = toGauranteeScopeTitleHtml(productDeclarationTitle)
    const productDeclarationHtml      = toGauranteeScopeHtml(productDeclaration)
    const imagesHtml                  = toImagesHtml(images)
    const buyMoreProductHtml          = toBuyMoreProductHtml()

    const resultHtml = 
      productDescriptionTitleHtml + 
      productDescriptionHtml + 
      availableSpecTitleHtml +
      availableSpecHtml +
      marketplaceDetailHtml +
      warningTitleHtml +
      warningHtml +
      gauranteeTitleHtml +
      gauranteeHtml +
      gauranteeScopeTitleHtml +
      gauranteeScopeHtml +
      noticeForUseTitleHtml +
      noticeForUseHtml +
      productDeclarationTitleHtml +
      productDeclarationHtml +
      imagesHtml +
      buyMoreProductHtml

    // generate result 
    generateHtmlPreview (resultHtml)
    generateHtmlCode(resultHtml)
  })
}

function toproductDescriptionTitleHtml (text) {
  return `<p><strong><span style='color: #ff0000;'>${text}</span></strong></p>`
}

function toproductDescriptionHtml (text) {
  const elements = text.split(/\n/)
  var html = ""
  elements.forEach(el => {
    html += `<p><span>${el}</span></p>`
  })
  return html
}

function toAvailableSpecTitleHtml (text) {
  return `<h3><span><strong>${text}</strong></span></h3>`
}

function toAvailableSpecHtml (text) {
  const elements = text.split(/\n/)
  var html = ""
  elements.forEach(el => {
    html += `<p><span><strong>${el}</strong></span></p>`
  })
  return html
}

function toMarketplaceDetailHtml (text) {
  const elements = text.split(/\n/)
  var html = ""
  elements.forEach(el => {
    html += `<p><span>${el}</span></p>`
  })
  return html
}

function toWarningTitleHtml (text) {
  return `<h3><span style="color: #ff6600;">${text}</span><br />`
}

function toWarningHtml (text) {
  const elements = text.split(/\n/)
  var html = ""
  elements.forEach(el => {
    html += `<p><strong>${el}</strong></p>`
  })
  return html
}

function toGauranteeTitleHtml (text) {
  return `<h3><span style="color: #ff0000;">${text}</span><h3>`
}

function toGauranteeHtml (text) {
  const elements = text.split(/\n/)
  var html = ""
  elements.forEach(el => {
    html += `<h3><strong>${el}</strong></h3>`
  })
  return html
}

function toGauranteeScopeTitleHtml (text) {
  return `<h3><span>${text}</span></h3>`
}

function toGauranteeScopeHtml (text) {
  const elements = text.split(/\n/)
  var html = ""
  elements.forEach(el => {
    html += `<h3><strong>${el}</strong></h3>`
  })
  return html
}

function toImagesHtml (images) {
  html = ""
  images.forEach(image => {
    html += `<img src="${image.value}" border="0" alt="" width="792" style="display:block;margin-left:auto;margin- right:auto;" align="absmiddle"></img>`
  })
  return html
}

function toBuyMoreProductHtml() {
  const buyMoreProductNames = Array.from(document.querySelectorAll('.buyMoreProductName')).map(el => el.value)
  const buyMoreProductUrls = Array.from(document.querySelectorAll('.buyMoreProductUrl')).map(el => el.value)
  let html = ""
  for (i = 0; i < buyMoreProductNames.length; i++) {
    html += `<div><b><a rel="nofollow" href="${buyMoreProductUrls[i]}">${buyMoreProductNames[i]}</a></b></div><div><br></div>`
  }
  return html
}

function clearHtmlPreview() {
  const resultHtmlBlock = document.getElementById("resultHtml")
  resultHtmlBlock.innerHTML = ""
}

function generateHtmlPreview (resultHtml) {
  var htmlObject = document.createElement('div')
  htmlObject.innerHTML = resultHtml
  const resultHtmlBlock = document.getElementById("resultHtml")
  resultHtmlBlock.appendChild(htmlObject)
} 

function generateHtmlCode (resultHtml) {
  const resultHtmlCodeBlock = document.getElementById("resultHtmlCode")
  resultHtmlCodeBlock.innerText = resultHtml
} 

// 全新品
// 電薪製造地:韓國 
// 商品組裝地:中國
// 寄送與到貨天數:直寄，3天到貨

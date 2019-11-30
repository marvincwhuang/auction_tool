$(document).ready(function () {
  $('#summernote').summernote()
  $('#summernote').summernote({
    lang: 'zh-TW'
  })
})
clearHtmlPreview()
const removePreview = document.getElementById('removePreview')
if (removePreview) {
  removePreview.addEventListener('click', (e) => {
    e.preventDefault()
    clearHtmlPreview()
  })
}

function clearHtmlPreview() {
  const previewYahooDiv = document.getElementById('previewYahooDiv')
  const previewRutenDiv = document.getElementById('previewRutenDiv')
  const previewShopeeDiv = document.getElementById('previewShopeeDiv')
  if (previewYahooDiv) {
    previewYahooDiv.style.display = 'none'
  }
  if (previewRutenDiv) {
    previewRutenDiv.style.display = 'none'
  }
  if (previewShopeeDiv) {
    previewShopeeDiv.style.display = 'none'
  }
}

const previewYahooBtn = document.getElementById('previewYahooBtn')
const previewRutenBtn = document.getElementById('previewRutenBtn')
const previewShopeeBtn = document.getElementById('previewShopeeBtn')
const previewYahoo = document.getElementById('previewYahoo')
const sourceCodeYahoo = document.getElementById('sourceCodeYahoo')
const previewRuten = document.getElementById('previewRuten')
const sourceCodeRuten = document.getElementById('sourceCodeRuten')
const previewShopee = document.getElementById('previewShopee')
const sourceCodeShopee = document.getElementById('sourceCodeShopee')

if (previewYahooBtn) {
  previewYahooBtn.addEventListener('click', (e) => {
    e.preventDefault()
    clearHtmlPreview()
    previewYahooDiv.style.display = 'block'
    let yahooHtml = generateYahooTemplate()
    previewYahoo.innerHTML = yahooHtml
    sourceCodeYahoo.innerText = yahooHtml
  })
  previewRutenBtn.addEventListener('click', (e) => {
    e.preventDefault()
    clearHtmlPreview()
    previewRutenDiv.style.display = 'block'
    let rutenHtml = generateRutenTemplate()
    previewRuten.innerHTML = rutenHtml
    sourceCodeRuten.innerText = rutenHtml
  })
  previewShopeeBtn.addEventListener('click', (e) => {
    e.preventDefault()
    clearHtmlPreview()
    previewShopeeDiv.style.display = 'block'
    let shopeeHtml = generateShopeeTemplate()
    previewShopee.innerHTML = shopeeHtml
    sourceCodeShopee.innerText = shopeeHtml
  })
}

function generateYahooTemplate() {
  const productDescription = document.getElementsByName("product_description")[0].value
  const availableSpec = document.getElementsByName("available_spec")[0].value
  const informationTitles = [...document.getElementsByName('information_titles[]')].map(el => el.value)
  const informationContents = [...document.getElementsByName('information_contents[]')].map(el => el.value)
  const informationItems = informationTitles.map((el, i) => {
    return el + informationContents[i]
  }).join('\n')
  const buyMoreItems = [...document.getElementsByName('buy_more_items[]')].map(el => el.value)
  const buyMoreItemUrls = [...document.getElementsByName('buy_more_item_urls[]')].map(el => el.value)
  const warning = document.getElementsByName("warning")[0].value
  const gaurantee = document.getElementsByName("gaurantee")[0].value
  const gaurantee_scope = document.getElementsByName("gaurantee_scope")[0].value
  const notice_for_use = document.getElementsByName("notice_for_use")[0].value
  const product_declaration = document.getElementsByName("product_declaration")[0].value
  const imageUrls = [...document.getElementsByName("image_urls[]")].map(el => el.value)
  let html = '' +
    $('#summernote').summernote('code')
  if (productDescription.trim() !== "") {
    let content =
      generateTitleHtml('★產品介紹') +
      generateItemHtml(productDescription) +
      genrateSpaceHtml()
    html += content
  }

  if (availableSpec.trim() !== "") {
    let content =
      generateTitleHtml('★適用型號') +
      generateItemHtml(availableSpec) +
      genrateSpaceHtml()
    html += content
  }
  if (informationItems.trim() !== "") {
    let content =
      generateTitleHtml('★商品說明') +
      generateItemHtml(informationItems) +
      genrateSpaceHtml()
    html += content
  }

  if (buyMoreItems.length > 0) {
    let content =
      generateTitleHtml('★一定要買') +
      generateProductLinkHtml(buyMoreItems, buyMoreItemUrls) +
      genrateSpaceHtml()
    html += content
  }

  if (warning.trim() !== "") {
    let content =
      generateTitleHtml('★注意事項') +
      generateItemHtml(warning) +
      genrateSpaceHtml()
    html += content
  }

  if (gaurantee.trim() !== "") {
    let content =
      generateTitleHtml('★商品保固') +
      generateItemHtml(gaurantee) +
      genrateSpaceHtml()
    html += content
  }

  if (gaurantee_scope.trim() !== "") {
    let content =
      generateTitleHtml('★保固範圍') +
      generateItemHtml(gaurantee_scope) +
      genrateSpaceHtml()
    html += content
  }

  if (notice_for_use.trim() !== "") {
    let content =
      generateTitleHtml('★使用須知') +
      generateItemHtml(notice_for_use) +
      genrateSpaceHtml()
    html += content
  }
  if (product_declaration.trim() !== "") {
    let content =
      generateTitleHtml('★商品說明') +
      generateItemHtml(product_declaration) +
      genrateSpaceHtml()
    html += content
  }

  if (imageUrls.length > 0) {
    html += generateImageHtml(imageUrls)
  }

  return html
}

function generateRutenTemplate() {
  const productDescription = document.getElementsByName("product_description")[0].value
  const availableSpec = document.getElementsByName("available_spec")[0].value
  const informationTitles = [...document.getElementsByName('information_titles[]')].map(el => el.value)
  const informationContents = [...document.getElementsByName('information_contents[]')].map(el => el.value)
  const informationItems = informationTitles.map((el, i) => {
    return el + informationContents[i]
  }).join('\n')
  const buyMoreItemImageUrls = [...document.getElementsByName('buy_more_item_image_urls[]')].map(el => el.value)
  const buyMoreItemUrls = [...document.getElementsByName('buy_more_item_urls[]')].map(el => el.value)
  const warning = document.getElementsByName("warning")[0].value
  const gaurantee = document.getElementsByName("gaurantee")[0].value
  const gaurantee_scope = document.getElementsByName("gaurantee_scope")[0].value
  const notice_for_use = document.getElementsByName("notice_for_use")[0].value
  const product_declaration = document.getElementsByName("product_declaration")[0].value
  const imageUrls = [...document.getElementsByName("image_urls[]")].map(el => el.value)
  let html = '' +
    $('#summernote').summernote('code')
  if (productDescription.trim() !== "") {
    let content =
      generateTitleHtml2('產品介紹') +
      generateItemHtml2(productDescription) +
      genrateSpaceHtml2()
    html += content
  }

  if (availableSpec.trim() !== "") {
    let content =
      generateTitleHtml2('適用型號') +
      generateItemHtml2(availableSpec) +
      genrateSpaceHtml2()
    html += content
  }
  if (informationItems.trim() !== "") {
    let content =
      generateTitleHtml2('商品說明') +
      generateItemHtml2(informationItems) +
      genrateSpaceHtml2()
    html += content
  }

  if (buyMoreItemImageUrls.length > 0) {
    let content =
      `<div style="text-align: center;"><span style="color: #ff0000; font-size: 18pt;" color="#ff0000"><b>★★一定要買★★</b></span></div>` +
      generateProductLinkHtml2(buyMoreItemImageUrls, buyMoreItemUrls) +
      genrateSpaceHtml2()
    html += content
  }

  if (warning.trim() !== "") {
    let content =
      generateTitleHtml2('注意事項') +
      generateItemHtml2(warning) +
      genrateSpaceHtml2()
    html += content
  }

  if (gaurantee.trim() !== "") {
    let content =
      generateTitleHtml2('商品保固') +
      generateItemHtml2(gaurantee) +
      genrateSpaceHtml2()
    html += content
  }

  if (gaurantee_scope.trim() !== "") {
    let content =
      generateTitleHtml2('保固範圍') +
      generateItemHtml2(gaurantee_scope) +
      genrateSpaceHtml2()
    html += content
  }

  if (notice_for_use.trim() !== "") {
    let content =
      generateTitleHtml2('使用須知') +
      generateItemHtml2(notice_for_use) +
      genrateSpaceHtml2()
    html += content
  }
  if (product_declaration.trim() !== "") {
    let content =
      generateTitleHtml2('商品說明') +
      generateItemHtml2(product_declaration) +
      genrateSpaceHtml2()
    html += content
  }

  if (imageUrls.length > 0) {
    html += generateImageHtml2(imageUrls)
  }

  return html
}

function generateShopeeTemplate() {
  const productDescription = document.getElementsByName("product_description")[0].value
  const availableSpec = document.getElementsByName("available_spec")[0].value
  const informationTitles = [...document.getElementsByName('information_titles[]')].map(el => el.value)
  const informationContents = [...document.getElementsByName('information_contents[]')].map(el => el.value)
  const informationItems = informationTitles.map((el, i) => {
    return el + informationContents[i]
  }).join('\n')
  const warning = document.getElementsByName("warning")[0].value
  const gaurantee = document.getElementsByName("gaurantee")[0].value
  const gaurantee_scope = document.getElementsByName("gaurantee_scope")[0].value
  const notice_for_use = document.getElementsByName("notice_for_use")[0].value
  const product_declaration = document.getElementsByName("product_declaration")[0].value
  const contact = document.getElementsByName("contact")[0].value
  const imageUrls = [...document.getElementsByName("image_urls[]")].map(el => el.value)
  let html = '' +
    $($("#summernote").summernote("code")).text() + '\n\n'

  if (warning !== "") {
    let content = '產品介紹\n' + productDescription + '\n\n'
    html += content
  }

  if (warning !== "") {
    let content = '適用型號\n' + availableSpec + '\n\n'
    html += content
  }

  if (warning !== "") {
    let content = '商品說明\n' + informationItems + '\n\n'
    html += content
  }

  if (warning !== "") {
    let content = '注意事項\n' + warning + '\n\n'
    html += content
  }

  if (gaurantee !== "") {
    let content =
      '商品保固\n' +
      gaurantee + '\n\n'
    html += content
  }

  if (gaurantee_scope !== "") {
    let content =
      '保固範圍\n' +
      gaurantee_scope +
      '\n\n'
    html += content
  }

  if (notice_for_use !== "") {
    let content =
      '使用須知\n' +
      notice_for_use +
      '\n\n'
    html += content
  }

  if (product_declaration !== "") {
    let content =
      '商品說明\n' +
      product_declaration +
      '\n\n'
    html += content
  }

  html += contact
  html += '\n'

  return html
}

// yahoo
function generateTitleHtml(title) {
  return `<div><span style="color: #ff0000; font-size: 18pt;" color="#ff0000" size="5"><b>${title}</b></span></div>`
}

function generateItemHtml(content) {
  let html = ''
  const list = content.split(/\n/)
  list.forEach(el => {
    html += `<div><span style="font-size: 14pt;"><b>${el}</b></span></div>`
  })
  return html
}

function genrateSpaceHtml() {
  return `<div><span style="font-size: x-large;" size="5"><b>&nbsp;</b></span></div>`
}

function generateProductLinkHtml(items, urls) {
  let html = ''
  items.forEach((item, i) => {
    html += `<div><font color="#ff0000" size="5"><b><a href="${urls[i]}">${item}</a></b></font></div>`
  })
  return html
}

function generateImageHtml(urls) {
  let html = ''
  urls.forEach(url => {
    html += `<div style="text-align: center;"><img src="${url}" border="0" width="60%" /></div>`
  })
  return html
}

// ruten2
function generateTitleHtml2(title) {
  return `<div><span style="color: #ff0000; font-size: 18pt;" color="#ff0000" size="5"><b>${title}</b></span></div>`
}

function generateItemHtml2(content) {
  let html = ''
  const list = content.split(/\n/)
  list.forEach(el => {
    html += `<div><span style="font-size: 14pt;"><b>${el}</b></span></div>`
  })
  return html
}

function genrateSpaceHtml2() {
  return `<div><span style="font-size: x-large;" size="5"><b>&nbsp;</b></span></div>`
}

function generateProductLinkHtml2(items, urls) {
  let tableHtml = ''
  items.forEach((item, i) => {
    if (i % 4 == 0) {
      tableHtml += `<tr><td style="text-align: left;"><a href="${urls[i]}" rel="noopener"><img
      src="${item}" border="0" alt="" width="100%"
      height="" /></a></td>`
    } else if (i % 4 == 3) {
      tableHtml += `<td style="text-align: left;"><a href="${urls[i]}" rel="noopener"><img
      src="${item}" border="0" alt="" width="100%"
      height="" /></a></td><tr>`
    } else {
      tableHtml += `<td style="text-align: left;"><a href="${urls[i]}" rel="noopener"><img
      src="${item}" border="0" alt="" width="100%"
      height="" /></a></td>`
    }
  })
  const html = `<table style="width: 80%; margin-left: auto; margin-right: auto;" border="3" cellpadding="0" cellspacing="0"><tfoot>` + tableHtml + `</tfoot></table>`
  return html
}

function generateImageHtml2(urls) {
  let html = ''
  urls.forEach(url => {
    html += `<div style="text-align: center;"><img src="${url}" border="0" width="60%" /></div>`
  })
  return html
}
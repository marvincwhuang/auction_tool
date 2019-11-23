$(document).ready(function () {
  $('#summernote').summernote()
  $('#summernote').summernote({
    lang: 'zh-TW'
  })
})

const preview = document.getElementById('preview')
if (preview) {
  preview.addEventListener('click', (e) => {
    e.preventDefault()
    clearHtmlPreview()
    const previewYahoo = document.getElementById('previewYahoo')
    const previewRuten = document.getElementById('previewRuten')
    const sourceCodeRuten = document.getElementById('sourceCodeRuten')
    if (previewYahoo) {
      let yahooHtml = generateYahooTemplate()
      previewYahoo.innerHTML = yahooHtml
      const sourceCodeYahoo = document.getElementById('sourceCodeYahoo')
      sourceCodeYahoo.innerText = yahooHtml
    }
    if (previewRuten) {
      let rutenHtml = generateRutenTemplate()
      previewRuten.innerHTML = rutenHtml
      const sourceCodeRuten = document.getElementById('sourceCodeRuten')
      sourceCodeRuten.innerText = rutenHtml
    }
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
    $('#summernote').summernote('code') +
    generateTitleHtml('產品介紹') +
    generateItemHtml(productDescription) +
    genrateSpaceHtml() +
    generateTitleHtml('適用型號') +
    generateItemHtml(availableSpec) +
    generateTitleHtml('商品說明') +
    generateItemHtml(informationItems) +
    genrateSpaceHtml() +
    generateTitleHtml('一定要買') +
    generateProductLinkHtml(buyMoreItems, buyMoreItemUrls) +
    genrateSpaceHtml() +
    generateTitleHtml('注意事項') +
    generateItemHtml(warning) +
    genrateSpaceHtml()

  if (gaurantee !== "") {
    let content =
      generateTitleHtml('商品保固') +
      generateItemHtml(gaurantee) +
      genrateSpaceHtml()
    html += content
  }

  if (gaurantee_scope !== "") {
    let content =
      generateTitleHtml('保固範圍') +
      generateItemHtml(gaurantee_scope) +
      genrateSpaceHtml()
    html += content
  }

  if (notice_for_use !== "") {
    let content =
      generateTitleHtml('使用須知') +
      generateItemHtml(notice_for_use) +
      genrateSpaceHtml()
    html += content
  }

  if (product_declaration !== "") {
    let content =
      generateTitleHtml('商品說明') +
      generateItemHtml(product_declaration) +
      genrateSpaceHtml()
    html += content
  }

  html += generateImageHtml(imageUrls)

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
  const buyMoreItems = [...document.getElementsByName('buy_more_items[]')].map(el => el.value)
  const buyMoreItemUrls = [...document.getElementsByName('buy_more_item_urls[]')].map(el => el.value)
  const warning = document.getElementsByName("warning")[0].value
  const gaurantee = document.getElementsByName("gaurantee")[0].value
  const gaurantee_scope = document.getElementsByName("gaurantee_scope")[0].value
  const notice_for_use = document.getElementsByName("notice_for_use")[0].value
  const product_declaration = document.getElementsByName("product_declaration")[0].value
  const imageUrls = [...document.getElementsByName("image_urls[]")].map(el => el.value)
  let html = '' +
    $('#summernote').summernote('code') +
    generateTitleHtml2('產品介紹') +
    generateItemHtml2(productDescription) +
    genrateSpaceHtml2() +
    generateTitleHtml2('適用型號') +
    generateItemHtml2(availableSpec) +
    generateTitleHtml2('商品說明') +
    generateItemHtml2(informationItems) +
    genrateSpaceHtml2() +
    `<div style="text-align: center;"><span style="color: #ff0000; font-size: 18pt;" color="#ff0000"><b>★★一定要買★★</b></span>` +
    generateProductLinkHtml2(buyMoreItems, buyMoreItemUrls) +
    genrateSpaceHtml2() +
    generateTitleHtml2('注意事項') +
    generateItemHtml2(warning) +
    genrateSpaceHtml2()

  if (gaurantee !== "") {
    let content =
      generateTitleHtml2('商品保固') +
      generateItemHtml2(gaurantee) +
      genrateSpaceHtml2()
    html += content
  }

  if (gaurantee_scope !== "") {
    let content =
      generateTitleHtml2('保固範圍') +
      generateItemHtml2(gaurantee_scope) +
      genrateSpaceHtml2()
    html += content
  }

  if (notice_for_use !== "") {
    let content =
      generateTitleHtml2('使用須知') +
      generateItemHtml2(notice_for_use) +
      genrateSpaceHtml2()
    html += content
  }

  if (product_declaration !== "") {
    let content =
      generateTitleHtml2('商品說明') +
      generateItemHtml2(product_declaration) +
      genrateSpaceHtml2()
    html += content
  }

  html += generateImageHtml2(imageUrls)

  return html
}

function clearHtmlPreview() {
  const previewYahoo = document.getElementById('previewYahoo')
  const previewRuten = document.getElementById('previewRuten')
  if (previewYahoo) {
    previewYahoo.innerHTML = ""
  }
  if (previewRuten) {
    previewRuten.innerHTML = ""
  }
}


// yahoo
function generateTitleHtml(title) {
  return `<div><font color="#ff0000" size="5"><b>${title}</b></font></div>`
}

function generateItemHtml(content) {
  let html = ''
  const list = content.split(/\n/)
  list.forEach(el => {
    html += `<div><font size="3"><b>${el}</b></font></div>`
  })
  return html
}

function genrateSpaceHtml() {
  return `<div><font size="5"><b><br></b></font></div>`
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
    html += `<div style="text-align:center;"><img src="${url}" width="60%"></div>`
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
    tableHtml += `<td style="text-align: left;"><a href="${urls[i]}" rel="noopener"><img
    src="${item}" border="0" alt="" width="100%"
    height="" /></a></td>`
  })
  const html = `<table style="width: 80%; margin-left: auto; margin-right: auto;" border="3" cellpadding="0" cellspacing="0"><tfoot><tr>` + tableHtml + `</tr></tfoot></table>`
  return html
}

function generateImageHtml2(urls) {
  let html = ''
  urls.forEach(url => {
    html += `<div style="text-align: center;"><img src="${url}" border="0" width="60%" /></div>`
  })
  return html
}
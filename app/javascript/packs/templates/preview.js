  $(document).ready(function () {
    $('#summernote').summernote()
    $('#summernote').summernote({
      lang: 'zh-TW'
    })
  })
  // const template_data = document.getElementById('template_data')
  // const {
  //   templateName,
  //   editorData,
  //   productDescriptions,
  //   availableSpecs,
  //   informationTitles,
  //   informationContents,
  //   buyMoreItems,
  //   buyMoreItemUrls,
  //   warning,
  //   gaurantee,
  //   gauranteeScope,
  //   noticeForUse,
  //   productDeclaration,
  //   imageUrls
  // } = template_data.dataset
  const preview = document.getElementById('preview')
  preview.addEventListener('click', (e) => {
    e.preventDefault()
    clearHtmlPreview()
    const previewYahoo = document.getElementById('previewYahoo')
    const previewRuten = document.getElementById('previewRuten')
    let yahooHtml = generateYahooTemplate()
    let rutenHtml = generateRutenTemplate()
    previewYahoo.innerHTML = yahooHtml
    previewRuten.innerHTML = rutenHtml
  })


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

    console.log(product_declaration)

    let html = '' +
      $('#summernote').summernote('code') +
      generateTitleHtml('產品介紹') +
      generateItemHtml(productDescription) +
      genrateSpeaceHtml() +
      generateTitleHtml('適用型號') +
      generateItemHtml(availableSpec) +
      generateTitleHtml('商品說明') +
      generateItemHtml(informationItems) +
      genrateSpeaceHtml() +
      generateTitleHtml('一定要買') +
      generateProductLinkHtml(buyMoreItems, buyMoreItemUrls) +
      genrateSpeaceHtml() +
      generateTitleHtml('注意事項') +
      generateItemHtml(warning) +
      genrateSpeaceHtml()

    if (gaurantee !== "") {
      let content =
        generateTitleHtml('商品保固') +
        generateItemHtml(gaurantee) +
        genrateSpeaceHtml()
      html += content
    }

    if (gaurantee_scope !== "") {
      let content =
        generateTitleHtml('保固範圍') +
        generateItemHtml(gaurantee_scope) +
        genrateSpeaceHtml()
      html += content
    }

    if (notice_for_use !== "") {
      let content =
        generateTitleHtml('使用須知') +
        generateItemHtml(notice_for_use) +
        genrateSpeaceHtml()
      html += content
    }

    if (product_declaration !== "") {
      let content =
        generateTitleHtml('商品說明') +
        generateItemHtml(product_declaration) +
        genrateSpeaceHtml()
      html += content
    }

    html += generateImageHtml(imageUrls)

    return html
  }

  function generateRutenTemplate() {
    let html = ''
    html += $('#summernote').summernote('code')

    return html
  }

  function clearHtmlPreview() {
    const previewYahoo = document.getElementById('previewYahoo')
    const previewRuten = document.getElementById('previewRuten')
    previewYahoo.innerHTML = ""
    previewRuten.innerHTML = ""
  }


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

  function genrateSpeaceHtml() {
    return `<div><font size="5"><b><br></b></font></div>`
  }

  function generateOneItemHtml(content) {
    return `<div><font size="3"><b>${content}</b></font></div>`
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
window.onload = function () {
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
}

function generateYahooTemplate() {
  // get WYSIWYG content
  let html = ''
  html += $('#summernote').summernote('code')
  html += `<div><font color="#ff0000" size="5"><b>產品介紹</b></font></div>`
  // 產品介紹
  const productDescription = document.getElementsByName("product_description")[0].value
  const productDescriptionList = productDescription.split(/\n/)
  productDescriptionList.forEach(el => {
    html += `<div><font size="3"><b>${el}</b></font></div>`
  })
  html += `<div><font size="5"><b><br></b></font></div>`
  html += `<div><font color="#ff0000" size="5"><b>適用型號</b></font></div>`
  // available spec
  const available_spec = document.getElementById("available_spec")[0].value
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
window.onload = function () {
  const template_data = document.getElementById('template_data')
  console.log(template_data)
  const {
    templateName,
    editorData,
    productDescriptions,
    availableSpecs,
    informationTitles,
    informationContents,
    buyMoreItems,
    buyMoreItemUrls,
    warning,
    gaurantee,
    gauranteeScope,
    noticeForUse,
    productDeclaration,
    imageUrls
  } = template_data.dataset

  console.log(templateName)
  console.log(editorData)
  console.log(productDescriptions)
  console.log(availableSpecs)
  console.log(informationTitles)
  console.log(informationContents)
  console.log(buyMoreItems)
  console.log(buyMoreItemUrls)
  console.log(warning)
  console.log(gaurantee)
  console.log(gauranteeScope)
  console.log(noticeForUse)
  console.log(productDeclaration)
  console.log(imageUrls)
}
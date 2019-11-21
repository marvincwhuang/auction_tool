window.onload = function () {
  let buyMoreItemsCount = document.querySelectorAll(".buy_more_item").length
  let ImagesCount = document.querySelectorAll(".image_url").length

  const createTemplatePage = document.getElementById('createTemplatePage')
  if (!createTemplatePage) {
    return null
  }

  $(document).ready(function () {
    $('#summernote').summernote()
    $('#summernote').summernote({
      lang: 'zh-TW'
    })
  })

  const addBuyMoreItemButton = document.getElementById('addBuyMoreItemButton')
  const removeBuyMoreItemButton = document.getElementById('removeBuyMoreItemButton')
  addBuyMoreItemButton.addEventListener('click', (e) => {
    console.log('addBuyMoreItemButton')
    e.preventDefault()
    buyMoreItemsCount += 1
    setBuyMoreItem(buyMoreItemsCount)
  })
  removeBuyMoreItemButton.addEventListener('click', (e) => {
    e.preventDefault()
    if (buyMoreItemsCount > 0) {
      buyMoreItemsCount -= 1
    }
    setBuyMoreItem(buyMoreItemsCount)
  })

  const addImageButton = document.getElementById('addImageButton')
  const removeImageButton = document.getElementById('removeImageButton')
  addImageButton.addEventListener('click', (e) => {
    e.preventDefault()
    ImagesCount += 1
    setImageItem(ImagesCount)
  })
  removeImageButton.addEventListener('click', (e) => {
    e.preventDefault()
    if (ImagesCount > 0) {
      ImagesCount -= 1
    }
    setImageItem(ImagesCount)
  })
}

function setBuyMoreItem(count) {
  const buyMoreItemsArea = document.getElementById('buyMoreItemsArea')
  let content = ''
  for (i = 0; i < count; i++) {
    content = content + `
    <div class="form-group col-md-3">
      <input class="form-control" type="text" name="buy_more_items[]" placeholder="商品${i+1}">
    </div>
    <div class="form-group col-md-9">
      <input class="form-control" type="text" name="buy_more_item_urls[]" placeholder="商品網址${i+1}">
    </div>
    `
  }
  buyMoreItemsArea.innerHTML = content
  return null
}

function setImageItem(count) {
  const ImagesArea = document.getElementById('ImagesArea')
  let content = ''
  for (i = 0; i < count; i++) {
    content = content + `
    <div class="form-group col-md-12">
      <label for="image-${i+1}">圖片${i+1}</label>
      <input class="form-control" type="text" name="image_urls[]" placeholder="圖片網址${i+1}">
    </div>
    `
  }
  ImagesArea.innerHTML = content
  return null
}
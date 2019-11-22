window.onload = function () {
  let buyMoreItemsCount = document.querySelectorAll(".buy_more_item").length
  let ImagesCount = document.querySelectorAll(".image_item").length
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
    addBuyMoreItem(buyMoreItemsCount)
    buyMoreItemsCount += 1
  })
  removeBuyMoreItemButton.addEventListener('click', (e) => {
    e.preventDefault()
    if (buyMoreItemsCount > 0) {
      removeBuyMoreItem()
      buyMoreItemsCount -= 1
    }

  })

  const addImageButton = document.getElementById('addImageButton')
  const removeImageButton = document.getElementById('removeImageButton')
  addImageButton.addEventListener('click', (e) => {
    e.preventDefault()
    addImageItem(ImagesCount)
    ImagesCount += 1
  })
  removeImageButton.addEventListener('click', (e) => {
    e.preventDefault()
    if (ImagesCount > 0) {
      removeImageItem(ImagesCount)
      ImagesCount -= 1
    }
  })
}

function addBuyMoreItem(currentCount) {
  const buyMoreItemsArea = document.getElementById('buyMoreItemsArea')
  let node = document.createElement("div");
  node.className = 'buy_more_item'
  node.innerHTML = `<div class="form-group col-md-3">
    <input class="form-control" type="text" name="buy_more_items[]" placeholder="商品${currentCount+1}">
  </div>
  <div class="form-group col-md-9">
    <input class="form-control" type="text" name="buy_more_item_urls[]" placeholder="商品網址${currentCount+1}">
  </div>`
  buyMoreItemsArea.appendChild(node)
}

function removeBuyMoreItem() {
  const buyMoreItemsArea = document.getElementById('buyMoreItemsArea')
  buyMoreItemsArea.removeChild(buyMoreItemsArea.lastElementChild)
}

function addImageItem(currentCount) {
  const ImagesArea = document.getElementById('ImagesArea')
  let node = document.createElement("div");
  node.className = 'image_item'
  node.innerHTML = `
  <div class="form-group col-md-12">
    <label for="image-${currentCount+1}">圖片${currentCount+1}</label>
    <input class="form-control" type="text" name="image_urls[]" placeholder="圖片網址${currentCount+1}">
  </div>
  `
  ImagesArea.appendChild(node)
}

function removeImageItem() {
  const ImagesArea = document.getElementById('ImagesArea')
  ImagesArea.removeChild(ImagesArea.lastElementChild)
}
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

function CopyTextToClipboard(id) {
  var TextRange = document.createRange();
  TextRange.selectNode(document.getElementById(id));
  sel = window.getSelection();
  sel.removeAllRanges();
  sel.addRange(TextRange);
  document.execCommand("copy");
  alert("複製完成！") //此行可加可不加
}

window.onload = function () {

  require('./templates/form')
  require('./templates/preview')
  require('./services/index')
  require('./services/new')
  require('./products/form')

  $(".flash").fadeOut(3000);

  const copySourceCodeYahoo = document.getElementById('copySourceCodeYahoo')
  const copySourceCodeRuten = document.getElementById('copySourceCodeRuten')
  const copySourceCodeShopee = document.getElementById('copySourceCodeShopee')
  if (copySourceCodeYahoo) {
    copySourceCodeYahoo.addEventListener('click', () => {
      CopyTextToClipboard('sourceCodeYahoo')
    })
  }
  if (copySourceCodeRuten) {
    copySourceCodeRuten.addEventListener('click', () => {
      CopyTextToClipboard('sourceCodeRuten')
    })
  }
  if (copySourceCodeShopee) {
    copySourceCodeShopee.addEventListener('click', () => {
      CopyTextToClipboard('sourceCodeShopee')
    })
  }

  // brand selector
  const brandSelector = document.getElementById('brand_selector')
  if (brandSelector) {
    const defaultSelected = brandSelector.firstElementChild.value
    const selected = brandSelector.options[brandSelector.selectedIndex].value
    const serviceItems = document.querySelectorAll('.service_item')
    const currentSelected = selected ? selected : defaultSelected
    serviceItems.forEach(item => {
      if (item.getAttribute('brand_id') == currentSelected) {
        item.style.display = 'block'
      } else {
        item.style.display = 'none'
      }
    })
    brandSelector.addEventListener('change', (e) => {
      serviceItems.forEach(item => {
        if (item.getAttribute('brand_id') == e.target.value.toString()) {
          item.style.display = 'block'
        } else {
          item.style.display = 'none'
        }
      })
    })
  }
}
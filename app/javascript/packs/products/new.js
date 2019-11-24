const productNewPage = document.getElementById('productNewPage')
const productEditPage = document.getElementById('productEditPage')
if (productNewPage || productEditPage) {
  const priceGroupFirstList = document.querySelectorAll('.priceGroupFirst')
  priceGroupFirstList.forEach(item => {
    item.addEventListener('change', () => {
      item.parentNode.childNodes.forEach(el => {
        el.value = item.value
      })
    })
  })
}
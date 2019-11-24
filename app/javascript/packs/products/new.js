const productNewPage = document.getElementById('productNewPage')
if (productNewPage) {
  const priceGroupFirstList = document.querySelectorAll('.priceGroupFirst')
  priceGroupFirstList.forEach(item => {
    item.addEventListener('change', () => {
      item.parentNode.childNodes.forEach(el => {
        el.value = item.value
      })
    })
  })
}
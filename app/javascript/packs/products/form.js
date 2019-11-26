const productNewPage = document.getElementById('productNewPage')
const productEditPage = document.getElementById('productEditPage')
if (productNewPage || productEditPage) {
  const priceGroupFirstList = document.querySelectorAll('#priceGroupFirst')
  console.log(priceGroupFirstList)
  priceGroupFirstList.forEach(item => {
    item.addEventListener('change', () => {
      console.log('change')
      item.parentNode.childNodes.forEach(el => {
        el.value = item.value
      })
    })
  })
}
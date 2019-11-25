const serviceNewPage = document.getElementById('serviceNewPage')
const serviceEditPage = document.getElementById('serviceEditPage')
if (serviceNewPage || serviceEditPage) {
  const priceGroupFirst = document.getElementById('priceGroupFirst')
  priceGroupFirst.addEventListener('change', () => {
    priceGroupFirst.parentNode.childNodes.forEach(el => {
      el.value = priceGroupFirst.value
    })
  })
}
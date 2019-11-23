const brands = document.querySelectorAll('.brand_selector')
const brand_services = document.querySelectorAll('.brand_services')
const serviceIndexPage = document.getElementById('serviceIndexPage')

if (serviceIndexPage) {
  // init
  const firstBrand = brands[0]
  firstBrand.style.background = 'yellow'
  brand_services.forEach((service) => {
    service.style.display = 'none'
  })
  brand_services[0].style.display = 'block'


  // on click
  brands.forEach((brand) => {
    brand.addEventListener('click', (e) => {
      brands.forEach((brand) => {
        brand.style.background = 'none'
      })
      e.target.style.background = 'yellow'

      brand_services.forEach((service) => {
        if (service.id === e.target.innerText) {
          service.style.display = 'block'
        } else {
          service.style.display = 'none'
        }
      })
    })
  })
}
const switchChart = () => {
  const chartOne = document.getElementById('chartOne')
  const chartTwo = document.getElementById('chartTwo')
  const btn = document.getElementById('btn')

  btn.addEventListener('click', event => {
    if (chartOne.classList.contains('show')) {
      chartOne.classList.remove('show')
      chartOne.classList.add('hide')
      chartTwo.classList.remove('hide')
      chartTwo.classList.add('show')
    } else {
      chartTwo.classList.remove('show')
      chartTwo.classList.add('hide')
      chartOne.classList.remove('hide')
      chartOne.classList.add('show')
    }
  })

}



export{switchChart}

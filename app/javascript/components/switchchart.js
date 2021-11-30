const switchChart = () => {
  const chartOne = document.getElementById('chartOne')
  const chartTwo = document.getElementById('chartTwo')
  const btn = document.getElementById('btn')
  if (chartOne) {
    btn.addEventListener('click', event => {
      if (chartOne.classList.contains('show1')) {
        chartOne.classList.remove('show1')
        chartOne.classList.add('hide1')
        chartTwo.classList.remove('hide1')
        chartTwo.classList.add('show1')
      } else {
        chartTwo.classList.remove('show1')
        chartTwo.classList.add('hide1')
        chartOne.classList.remove('hide1')
        chartOne.classList.add('show1')
      }
    })

  }


}



export{switchChart}

const initForm = () => {

  const firstButton = document.querySelector(".first")
  const container = document.querySelector(".container")
  const secondButton = document.querySelector(".second")
  const yourBank = document.querySelector(".your-bank")
  const accountNumber = document.querySelector(".account-number-p")

  if (firstButton) {
  firstButton.addEventListener("click", event => {
    event.preventDefault();
    container.classList.add("center");
    container.classList.add("slider-two-active")
    container.classList.remove("full");
    container.classList.remove("slider-one-active")
  })


  secondButton.addEventListener("click", event => {
    event.preventDefault();
    container.classList.add("full");
    container.classList.add("slider-three-active");
    container.classList.remove("center");
    container.classList.remove("slider-two-active")
    container.classList.remove("slider-one-active")
    const name = document.querySelector(".name").value
    const number = document.querySelector(".number").value
    yourBank.innerHTML=`Bank: ${name}`;
    accountNumber.innerHTML=`Account Number: ${number}`;
    console.log(accountNumber)
    console.log(yourBank)

    })
  }
}


export { initForm }

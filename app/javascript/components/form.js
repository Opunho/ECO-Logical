const initForm = () => {

  const firstButton = document.querySelector(".first")
  const container = document.querySelector(".container")
  const secondButton = document.querySelector(".second")
  const yourBank = document.querySelector(".your-bank")
  const accountNumber = document.querySelector(".account-number-p")
  const firstForm = document.querySelector(".form-1")
  const secondForm = document.querySelector(".form-2")

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
    let name = "";
    let number = "";
    container.classList.add("full");
    container.classList.add("slider-three-active");
    container.classList.remove("center");
    container.classList.remove("slider-two-active")
    container.classList.remove("slider-one-active")
    if (secondButton.parentElement === firstForm) {
      name = document.querySelector(".name").value
      number = document.querySelector(".number").value
    }
    else if (secondButton.parentElement === secondForm) {


            };
    yourBank.innerHTML=`Bank: ${name}`;
    accountNumber.innerHTML=`Account Number: ${number}`;
    console.log(accountNumber)
    console.log(yourBank)

    })
  }
}


export { initForm }

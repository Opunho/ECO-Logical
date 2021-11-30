import { data } from "jquery"

const initForm = () => {

  const firstButton = document.querySelector(".first")
  const container = document.querySelector(".container")
  const secondButton = document.querySelector(".second")
  const thirdButton = document.querySelector(".third")
  const yourBank = document.querySelector(".your-bank")
  const accountNumber = document.querySelector(".account-number-p")
  const firstForm = document.querySelector(".form-1")
  const secondForm = document.querySelector(".form-2")
  const token = document.querySelector('meta[name="csrf-token"]').content

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
    let creditorName = "";
    let subCategory = "";
    let pickDate = "";
    let amount = "";
    let currency = "";
    container.classList.add("full");
    container.classList.add("slider-three-active");
    container.classList.remove("center");
    container.classList.remove("slider-two-active")
    container.classList.remove("slider-one-active")
    if (secondButton.parentElement === firstForm) {
      name = document.querySelector(".name").value
      number = document.querySelector(".number").value
      yourBank.innerHTML=`Bank: ${name}`;
      accountNumber.innerHTML=`Account Number: ${number}`;
    }
    else if (secondButton.parentElement === secondForm) {
      creditorName = document.querySelector(".creditor-name").value;
      subCategory = document.querySelector(".sub-category").value;
      pickDate = document.querySelector(".date-pick").value;
      amount = document.querySelector(".amount").value;
      currency = document.querySelector(".currency").value;
    };
    const data = {
      amount: amount,
      sub_category: subCategory,
      creditor_name: creditorName,
      token: token
    }
    thirdButton.addEventListener("click", event => {
      event.preventDefault();
      fetch('/accounts/1/expenses', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-type': 'application/json' },
        body: JSON.stringify(data),
        success: window.location = "/dashboard"
      })
    })
  })
}
}



export { initForm }

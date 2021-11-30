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
      const paidTo = document.getElementById("paid-to")
      const showSubCategory = document.getElementById("sub-category-show")
      const showAmount = document.getElementById("amount-show")
      // const showCurrency = document.getElementById("currency-show")
      const transactionDate = document.getElementById("transaction-date")
      paidTo.innerHTML = `Paid To: ${creditorName}`
      showSubCategory.innerHTML = `For: ${subCategory}`
      showAmount.innerHTML = `Amount: ${amount} ${currency}`
      transactionDate.innerHTML = `In: ${transactionDate}`
      console.log(showSubCategory)
    };
    const data = {
      amount: amount,
      sub_category: subCategory,
      creditor_name: creditorName,
      token: token,
      date: pickDate,
      currency: currency
    }
    const currentUser = document.getElementById("current-user").value
    thirdButton.addEventListener("click", event => {
      console.log(currentUser)
      event.preventDefault();
      fetch(`/accounts/${currentUser}/expenses`, {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-type': 'application/json' },
        body: JSON.stringify(data),
        // success: window.location = "/dashboard"
      })
    })
  })
}
}



export { initForm }

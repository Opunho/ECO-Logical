const initForm = () => {
  const firstButton = document.querySelector(".first");


  firstButton.addEventListener("click", (event) => {
    event.preventDefault();
    console.log(event)
  })

}

export { initForm }


const initModal = () => {
  // Get the modal
  const modals = document.querySelectorAll("#myPledgeModal");

  // Get the button that opens the modal
  const buttons = document.querySelectorAll("#myPledgeModalBtn");

  // Get the <span> element that closes the modal
  const spans = document.querySelectorAll(".close");
  if (modals){
  // When the user clicks on the button, open the modal
  buttons.forEach(button => {
    button.addEventListener('click', event => {
      const modal = document.querySelector(`#myPledgeModal-${event.currentTarget.dataset.id}`)
      modal.style.display = "block";
    })
  })


  // When the user clicks on <span> (x), close the modal
  spans.forEach(span => {
    span.addEventListener('click', event => {
      const modal = event.currentTarget.parentElement.parentElement.parentElement
      modal.style.display = "none";
    })
})

  // When the user clicks anywhere outside of the modal, close it
  // window.onclick = function (event) {
  //   debugger
  //   if (event.target == modal) {
  //     const modal = event.currentTarget.parentElement.parentElement.parentElement
  //     modal.style.display = "none";
  //   }
  // }
}}

export { initModal }

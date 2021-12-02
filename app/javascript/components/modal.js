
const initModal = () => {
  // Get the modal
  const modal = document.querySelector("#myPledgeModal");

  // Get the button that opens the modal
  const btn = document.querySelector("#myPledgeModalBtn");

  // Get the <span> element that closes the modal
  const span = document.querySelectorAll(".close")[0];

  // When the user clicks on the button, open the modal
  btn.onclick = function () {
    modal.style.display = "block";
  }

  // When the user clicks on <span> (x), close the modal
  span.onclick = function () {
    modal.style.display = "none";
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}

export { initModal }

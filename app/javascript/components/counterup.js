const counterUp  = () => {
  const counters = document.querySelectorAll('.counterUp');
  const speed = 1000;
  if (counters) {
    counters.forEach(counter => {
      const animate = () => {
        const value = +counter.getAttribute('akhi');
        const data = +counter.innerText;

        const time = value / speed;
        if (data < value) {
          counter.innerText = Math.ceil(data + time);
          setTimeout(animate, 1);
        } else {
          counter.innerText = value;
        }

      }

      animate();
    });
  }
}

export { counterUp };

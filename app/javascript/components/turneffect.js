const turnEffect = () => {
  const letters = document.querySelectorAll('.scrabble-letter');
  letters.forEach((letter) => {
    letter.classList.toggle('turn-effect')
  });

  // letters.forEach((letter) => {
  //   letter.addEventListener('mouseover' => {
  //     letter.classList.toggle('turn-effect')
  //   });
  // })
}

export { turnEffect };

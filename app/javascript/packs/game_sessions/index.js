const initMapToggler = () => {
  const mapToggler = document.getElementById("map-toggler")
  const mapAndCardsContainer = document.getElementById("map-and-cards-container")
  const cardsContainer = document.getElementById("cards-container")
  const mapContainer = document.getElementById("map-container")
  const map = document.getElementById("map")

  mapToggler.addEventListener('click', (event) => {
    mapContainer.classList.toggle("invisible");
    map.classList.toggle("invisible");
    mapAndCardsContainer.classList.toggle("flex-direction-to-column")
    cardsContainer.classList.toggle("take-place");

    if(mapToggler.innerText === "Hide Map") {
      mapToggler.innerText = "Show Map";
    } else {
      mapToggler.innerText = "Hide Map";
    }
  });
}

export { initMapToggler };


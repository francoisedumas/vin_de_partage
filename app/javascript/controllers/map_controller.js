import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["mapContainer", "producerShow", "producerClose"]

  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log(this.mapContainerTarget)
    if (!this.hasMapContainerTarget) return;
    this.loadMap();
  }

  loadMap() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapContainerTarget,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.map.on('load', () => {
      this.#addMarkersToMap()
      this.#fitMapToMarkers()
    })
  }

  show(event) {
    this.producerShowTargets.forEach(frame => {
      frame.src = `/producers/${event.currentTarget.id}`;
      frame.reload();
    });
  }

  closeShow() {
    this.producerCloseTargets.forEach(target => target.classList.add("hidden"));
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const producerMarker = document.createElement('div')
      producerMarker.setAttribute("data-action", `click->map#show`);
      producerMarker.setAttribute("id", `${marker.id}`);
      producerMarker.classList.add("w-4", "h-4", "bg-red-600", "rounded-full", "cursor-pointer", "marker", "!opacity-50")
      new mapboxgl.Marker(producerMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}

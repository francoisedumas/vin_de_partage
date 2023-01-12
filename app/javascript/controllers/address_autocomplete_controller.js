import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address", "latitude", "longitude", "search"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.searchTarget)
    this.geocoder.on("result", event => {
      this.#setInputValue(event);
      this.#setLongitudeLatitudeValue(event);
    })
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  disconnect() {
    this.geocoder.onRemove()
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"];
  }

  #setLongitudeLatitudeValue(event) {
    this.longitudeTarget.value = event.result["center"][0];
    this.latitudeTarget.value = event.result["center"][1];
  }

  #clearInputValue() {
    this.addressTarget.value = "";
  }
}

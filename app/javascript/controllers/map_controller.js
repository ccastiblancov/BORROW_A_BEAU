import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = { apiKey: String }
  connect() {
  mapboxgl.accessToken = this.apiKeyValue
  this.map = new mapboxgl.Map({
  container: this.element,
  style: 'mapbox://styles/mapbox/streets-v12' // style URL
})
  }
}

#addMarkersToMap() {
  this.markersValue.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html) // Add this
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // Add this
      .addTo(this.map)
  });
}

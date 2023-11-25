import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="trips-create"
export default class extends Controller {
  static targets = ["tripElement"]
  connect() {
  }
  fire() {
    this.tripElementTarget.classList.toggle("d-none");
    }
}

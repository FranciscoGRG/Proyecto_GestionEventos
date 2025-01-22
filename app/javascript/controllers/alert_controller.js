import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "alert" ]
  static values = { timeout: Number }

  connect() {
    setTimeout(() => {
      this.close();
    }, this.timeoutValue || 3000); // Usa el valor del dataset o 5000ms por defecto
  }

  close() {
    this.alertTarget.classList.add("opacity-0", "translate-x-full");
  }
}

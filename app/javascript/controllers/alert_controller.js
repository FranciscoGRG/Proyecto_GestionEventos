// app/javascript/controllers/alert_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "alert" ]

  close() {
    this.alertTarget.classList.add("opacity-0", "translate-x-full");
    setTimeout(() => {
      this.alertTarget.remove(); // Eliminar la alerta después de la animación
    }, 500); // Eliminar después de la duración de la animación
  }
}

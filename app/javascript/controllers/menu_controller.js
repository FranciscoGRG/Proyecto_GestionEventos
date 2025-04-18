import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["dropdown"]

    toggleMenu() {
        this.dropdownTarget.classList.toggle("hidden");
    }
}
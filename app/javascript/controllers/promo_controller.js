import { Controller } from "@hotwired/stimulus"
import bootstrap from "bootstrap"

export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(document.getElementById('promoModal'))
  }

  openModal() {
    this.modal.show()
  }

  copyCode() {
    const codeElement = document.getElementById('promoCode')
    const code = codeElement.innerText

    navigator.clipboard.writeText(code).then(() => {
      alert("Promo code copied to clipboard!")
    }).catch(() => {
      alert("Failed to copy promo code.")
    })
  }
}

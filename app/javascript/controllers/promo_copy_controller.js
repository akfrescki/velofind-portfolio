import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["code"]

  copy() {
    const text = this.codeTarget.innerText
    navigator.clipboard.writeText(text).then(() => {
      alert("Promo code copied!")
    }).catch(err => {
      console.error("Failed to copy text: ", err)
    })
  }
}

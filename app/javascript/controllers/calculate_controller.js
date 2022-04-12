import { Controller } from 'stimulus'; 

export default class extends Controller {
  static targets = [ "amount", "output" ]
  static values  = { url: String }

  calculate() {
    if (this.amountTarget.value != '') {
      let controller = this
      fetch(this.urlValue + "?amount=" + this.amountTarget.value)
      .then((response) => response.text())
      .then((content) => {
        controller.outputTarget.innerHTML= content;
      });
    }
    else {
      alert("debe ingresar un valor")
    }
  }

  clear() {
    this.amountTarget.value = ''
    this.outputTarget.innerHTML= '';
  }
}
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['statisticCards']
  static values  = { url: String }

  connect() {
    this.interval()
  }

  interval(){
    let controller = this
    setInterval(function(){
      controller.showSpin()
      controller.request()
   }, 5000);
  }

  request(){
    fetch(this.urlValue)
    .then((response) => response.text())
    .then((html) => {
      this.statisticCardsTarget.innerHTML = html
    });
  }
}

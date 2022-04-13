import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "btc", "eth" ]
  static values  = { url: String }

  connect() {
    this.interval()
  }

  interval(){
    let controller = this
    setInterval(function(){
      controller.request()
   }, 10000);
  }

  request(){
    let controller = this
    fetch(this.urlValue)
    .then((response) => response.json())
    .then((json) => {
      controller.btcTarget.innerHTML = '$' + json.btc;
      controller.ethTarget.innerHTML = '$' + json.eth;
    });
  }
}

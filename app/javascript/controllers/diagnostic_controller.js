import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "picked", "diagnostic" ]
  connect() {
  }
  showdoctors(event) {

    //recupérer l'id du bouton cliqué
    const selectedId = event.currentTarget.id
    // cacher le bouton
    this.pickedTargets.forEach(element => {
      if ( element.id === selectedId ){
        element.classList.remove("d-block")
        element.classList.add("d-none")
      }
      else {
        element.classList.remove("d-none")
        element.classList.add("d-block")
      }
    });
    // recupérer l'ensemble du détails des spécialistes
    console.log(this.diagnosticTargets)
    // recuperer l'id de la liste correspondant a l'id du bouton cliqué
    this.diagnosticTargets.forEach(element => {
      if ( element.id === selectedId ){
        element.classList.add("d-block")
        element.classList.remove("d-none")
      }
      else {
        element.classList.add("d-none")
        element.classList.remove("d-block")
      }
    });
    // afficher la liste recupérée
  }

}

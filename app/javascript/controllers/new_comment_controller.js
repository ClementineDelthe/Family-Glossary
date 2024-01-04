import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // connect() {
  //   console.log("Hello from our first Stimulus controller");

  // }

  static targets = ["btnNewComment", "newCommentDiv"]

  showNewComment() {
    // this.btnNewCommentTarget.innerText = "Masquer";
    // this.newCommentDivTarget.classList.remove("d-none");
    if (this.newCommentDivTarget.classList.contains("d-none")) {
      // If the div is hidden, show it and change the button text to "Masquer"
      this.btnNewCommentTarget.innerText = "Masquer";
      this.newCommentDivTarget.classList.remove("d-none");
    } else {
      // If the div is shown, hide it and change the button text to "Nouveau Commentaire"
      this.btnNewCommentTarget.innerText = "Nouveau Commentaire";
      this.newCommentDivTarget.classList.add("d-none");
    }
  }
}

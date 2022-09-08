import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  greet() {
    console.log("Hello, Stimulus!", this.element)
  }

  showDNI(){
    console.log('aaa')
    console.log(document.getElementById("user_role"))
    let select_location = document.getElementById("user_role");
    if (select_location.value == "seller") {
      document.getElementById("hidden-div").style.display = "block";
    } else {
      document.getElementById("hidden-div").style.display = "none";
    }
  };
  
  loadDNI(event) {
    let img = document.getElementById('dni');
    document.getElementById('addDNI').style.display = 'none';
    img.src = URL.createObjectURL(event.target.files[0]);
    img.style.display = 'block';
  };
}

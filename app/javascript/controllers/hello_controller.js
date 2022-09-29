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

  loadFiles(event) {
    let container = document.getElementById('upload');
    document.getElementById('add').style.display = 'none';
    const uploadPhotos = event.target.files;
    if (document.getElementsByClassName('output').length > 0) {
      this.removeChilds(document.getElementsByClassName('output'));
    }
    this.addImages(uploadPhotos, container);
    document.getElementById('upload').style.backgroundColor = '#ffff'
  };
  
  removeChilds(imgs) {
    imgs = document.getElementsByClassName('output');
    let parent = imgs[0].parentNode;
    let size = imgs.length;
    for (let key = 0; key <= size; key++) {
      parent.removeChild(parent.lastChild);
    }
  };
  
  addImages(uploadPhotos, container) {
    for (let key = 0; key < uploadPhotos['length']; key++) {
      let img = '<img class="photo output"/>';
      container.innerHTML = container.innerHTML + img;
      img = document.getElementsByClassName('output')
      img[key].src = URL.createObjectURL(uploadPhotos[key]);
      img[key].style.display = 'block'
    }
  };
}

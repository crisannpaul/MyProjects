const attributes = document.getElementsByClassName('attribute');
let currentAttribute = 0;

function typeAttribute(attribute, callback) {
  let characters = attribute.textContent.split('');
  attribute.textContent = '';
  let index = 0;

  function typeNextCharacter() {
    if (index < characters.length) {
      attribute.textContent += characters[index];
      index++;
      setTimeout(typeNextCharacter, 100);
    } else {
      setTimeout(callback, 100);
    }
  }

  typeNextCharacter();
}

function untypeAttribute(attribute, callback) {
  let index = attribute.textContent.length - 1;

  function untypeNextCharacter() {
    if (index >= 0) {
      attribute.textContent = attribute.textContent.slice(0, -1);
      index--;
      setTimeout(untypeNextCharacter, 100);
    } else {
      setTimeout(callback, 100);
    }
  }

  untypeNextCharacter();
}

function showNextAttribute() {
    // Hide the previous attribute
    if (currentAttribute > 0) {
      attributes[currentAttribute - 1].style.display = 'none';
    } else if (currentAttribute === 0 && attributes.length > 0) {
      attributes[attributes.length - 1].style.display = 'none';
    }
  
    // Show and type the current attribute
    attributes[currentAttribute].style.display = 'inline';
    typeAttribute(attributes[currentAttribute], () => {
      setTimeout(() => {
        // Untype the current attribute
        untypeAttribute(attributes[currentAttribute], () => {
          // Move on to the next attribute and loop
          currentAttribute = (currentAttribute + 1) % attributes.length;
          setTimeout(showNextAttribute, 100); // Add a short delay before displaying the next attribute
        });
      }, 1500); // Pause for 1500ms after typing before starting to untype
    });
  }
  

window.onload = function () {
  showNextAttribute();
};

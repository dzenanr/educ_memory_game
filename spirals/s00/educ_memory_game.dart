
import 'dart:html';

num rotatePos = 0;

void main() {
  querySelector("#text").text = "Click me!";

  querySelector("#text").onClick.listen(rotateText);
}

void rotateText(Event event) {
  rotatePos += 360;

  var textElement = querySelector("#text");

  textElement.style.transition = "1s";
  textElement.style.transform = "rotate(${rotatePos}deg)";
}

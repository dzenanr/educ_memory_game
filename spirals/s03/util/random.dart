part of memory;

int randomInt(int max) => new Random().nextInt(max);

randomListElement(List list) => list[randomInt(list.length - 1)];

String randomColor() => randomListElement(colorList);
String randomColorCode() => colorMap[randomColor()];

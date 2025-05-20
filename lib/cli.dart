void tests() {
  var counter = 0;
  do {
    print('counter do = $counter');
    counter++;
    if (counter == 2) {
      break;
    }
  } while (counter < 4);
}

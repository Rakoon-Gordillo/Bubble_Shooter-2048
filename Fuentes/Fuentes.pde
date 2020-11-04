size(500, 200);
background(20);
String[] fontList = PFont.list();
PFont agfb;
agfb = createFont("MS PGothic",30); //Agency FB (todo), Barrio Regular (números), Bauhaus 93 (todo), Broadway (todo), Bubblegum Sans Regular (letra), Cabin Sketch Regular (letra), 
//Century Gothic (números), Comfortaa Bold (todo), Comic Sans MS Bold (todo), Comic Sans MS Negrita (todo), Cooper Black (letra), Courier New Bold (todo), Dosis Regular (número), 
//Dubai Bold (números), Forte (letra), Fredericka the Great (letra), Fredoka One (todo), Gill Sans Ultra Bold Condensed (letra), Imprint MT Shadow (letra), Kristen ITC (letra),
//Lucida Calligraphy Italic (letra), MS PGothic (letra)
printArray(fontList);
textFont(agfb,30);
textMode(CENTER);
text("BubbleShotter 2048", 100, 100);

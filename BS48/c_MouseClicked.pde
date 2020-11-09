void mouseClicked(){
  if (interfaz == 1){
    shoots.add(new Bubble((shoots.get(0)).getN(), true, (shoots.get(0)).getBubbleColor()));
    (shoots.get(0)).reset();
  }
  play.isPressed();
}

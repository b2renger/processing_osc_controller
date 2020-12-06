
class Tab extends Controller {
  float h;
  float rounded = 0;
  boolean checked = false;
  boolean change = true;
  int nElts;
  ArrayList<Toggle> elts;
  int value = 0;
  float outterPadding = 2;
  String[]names;

  Tab(float h, String[] names) {
    super( 0, 0, "");
    this.nElts = names.length;

    this.h = h;
    elts = new ArrayList();
    float eltsSize = (width - outterPadding * nElts)/nElts;
    for (int i = 0; i < nElts; i++) {
      Toggle t = new Toggle( eltsSize * i + outterPadding*i, 0, eltsSize, h, names[i] );
      t.innerPadding = 0;
      t.rounded = this.rounded;
      if (i == 0) t.checked = true;
      elts.add(t);
    }
  }

  void draw() {
    fill(255);
    textAlign(LEFT, BOTTOM);
    text(label, xpos, ypos);
    for (int i = 0; i < nElts; i++) {
      Toggle t = elts.get(i);
      t.draw();
      textAlign(CENTER, CENTER);
      text(t.label, t.xpos + t.w/2, t.ypos + t.h/2);
    }
  }

  void update(float mx, float my) {
    for (int i = 0; i < nElts; i++) {
      Toggle t =  elts.get(i);
      t.update(mx, my);

      if (t.checked == true  ) {
        this.value = i;
      } 
      for (int j = 0; j < nElts; j++) {
        if (this.value!=j) elts.get(j).checked = false;
      }
    }
  }
}

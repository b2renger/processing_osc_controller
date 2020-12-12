
class HRadio extends Controller {
  float w, h;
  float rounded = 100;
  boolean checked = false;
  boolean change = true;
  int nElts;
  ArrayList<Toggle> elts;
  float outterPadding = 2;

  HRadio(float xpos, float ypos, float w, float h, String label, int nElts) {
    super( xpos, ypos, label);
    this.nElts = nElts;
    this.w = w;
    this.h = h;
    elts = new ArrayList();
    float eltsSize = (w - outterPadding * nElts)/nElts;
    for (int i = 0; i < nElts; i++) {
      Toggle t = new Toggle(xpos + eltsSize * i + outterPadding*i, ypos, eltsSize, eltsSize, "" );
      t.rounded = this.rounded;
      if (i == 0 ) t.checked = true;
      elts.add(t);
    }
  }

  void draw() {
    fill(255);
    textAlign(LEFT, BOTTOM);
    text(label, xpos, ypos);
    for (int i = 0; i < nElts; i++) {
      elts.get(i).draw();
    }
  }

  void update(float mx, float my) {
    for (int i = 0; i < nElts; i++) {
      Toggle t =  elts.get(i);
      if (t.checked == false) {
        t.update(mx, my);
      }

      if (t.checked == true  ) {
        value = i;
      } 
      for (int j = 0; j < nElts; j++) {
        if (value!=j) elts.get(j).checked = false;
      }
    }
    if (pvalue != value) onChange();
    pvalue = value;
  }
}



class VRadio extends Controller {
  float w, h;
  float rounded = 100;
  boolean checked = false;
  boolean change = true;
  int nElts;
  ArrayList<Toggle> elts;
  float outterPadding = 2;

  VRadio(float xpos, float ypos, float w, float h, String label, int nElts) {
    super( xpos, ypos, label);
    this.nElts = nElts;
    this.w = w;
    this.h = h;
    elts = new ArrayList();
    float eltsSize = (h - outterPadding * nElts)/nElts;
    for (int i = 0; i < nElts; i++) {
      Toggle t = new Toggle(xpos, ypos + + eltsSize * i + outterPadding*i, eltsSize, eltsSize, "" );
      t.rounded = this.rounded;
      if (i == 0 ) t.checked = true;
      elts.add(t);
    }
  }

  void draw() {
    fill(255);
    textAlign(CENTER, BOTTOM);
    text(label, xpos + w/2, ypos);
    for (int i = 0; i < nElts; i++) {
      elts.get(i).draw();
    }
  }

  void update(float mx, float my) {
    for (int i = 0; i < nElts; i++) {
      Toggle t =  elts.get(i);
      if (t.checked == false) {
        t.update(mx, my);
      }

      if (t.checked == true  ) {
        value = i;
      } 
      for (int j = 0; j < nElts; j++) {
        if (value!=j) elts.get(j).checked = false;
      }
    }
    if (pvalue != value) onChange();
    pvalue = value;
  }
}

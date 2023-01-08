void exportsmugdata() {
  JSONArray smugdata = new JSONArray();
  for(int i = 0; i < smugnum; i++) {
    JSONObject smugi = new JSONObject();
    smugi.setInt("smugID", i);
    smugi.setFloat("leftEyeX", Leyex[i]);
    smugi.setFloat("leftEyeY", Leyey[i]);
    smugi.setFloat("rightEyeX", Reyex[i]);
    smugi.setFloat("rightEyeY", Reyey[i]);
    smugi.setBoolean("mouth", isone(mouth[i]));
    smugi.setFloat("moustX", mouthx[i]);
    smugi.setFloat("moustY", mouthy[i]);
    smugi.setBoolean("other", isone(other[i]));
    smugi.setFloat("otherX", otherx[i]);
    smugi.setFloat("otherY", othery[i]);
    
    smugdata.setJSONObject(i, smugi);
  }
  saveJSONArray(smugdata, "export/smug.json");
}


void exportsmugdata2() {
  String[] smugdata = new String[smugnum];
  for(int i = 0; i < smugnum; i++) {
    smugdata[i] = "" + Leyex[i] + " " + Leyey[i] + " " + Reyex[i] + " " + Reyey[i] + " " +
                  isone(mouth[i]) + " " + mouthx[i] + " " + mouthy[i] + " " + isone(other[i]) + " " +
                  otherx[i] + " " + othery[i];
  }
  saveStrings("export/smug.txt", smugdata);
}



boolean isone(int in) {
  if(in == 1) { return(true); }
  else { return(false); }
}

function loadGApi(){
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(setupChart);
}

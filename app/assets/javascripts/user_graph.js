

function loadGApi(){
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(setupChart);
}

function setupChart() {
  chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
  data = findData();
  options = findOptions();
  chart.draw(data, options);
}

function findOptions() {
  return {
    title: "Average Score for Questions/Answers",
    seriesType: "bars",
    colors: ["c0392b","c0392b"]
  }
}

function findData(){
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Type');
  data.addColumn('number', 'Average Score');
  data.addRows([
    ['Questions', -3],
    ['Answers', 4],
  ]);
  return data
}
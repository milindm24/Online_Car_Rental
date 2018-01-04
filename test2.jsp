<%@include file ='header.jsp' %>
<%@page import = "java.util.*"%>

<title>Chart</title>  
  
  <% if(request.getAttribute("graph")==null){ %>
  <p>kuch to gadbad h<p>

  	<%} %>


  	<%ArrayList<String> carlist = (ArrayList<String>) request.getAttribute("graph");%>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <div id="chart_div"></div>
      
	 <script> 
	  google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

	var data = google.visualization.arrayToDataTable([
        ['City', 'Available Cars',],
		<% 
				int i =0;
				%>
				<%while (i<carlist.size()){%>
              	
					['<%out.print(carlist.get(i));%>',<%out.print(carlist.get(i+1));%>],

					<%i=i+2;}%>
			
      ]);

      var options = {
        title: 'Available cars in U.S. Cities',
        chartArea: {width: '70%'},
		 
        hAxis: {
          title: 'Total Cars',
          minValue: 0
        },
        vAxis: {
          title: 'City'
        }
      };

      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
	</script>

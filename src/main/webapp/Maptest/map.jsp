<!DOCTYPE html>
<html lang="ko">
<head>
<title>구글지도사용하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=" ></script>
<style>
#map_ma {width:100%; height:400px; clear:both; border:solid 1px red;}
</style>
</head>
<body>
<div id="map_ma"></div>
<script type="text/javascript">
		$(document).ready(function() {
			var myLatlng = new google.maps.LatLng(35.837143,128.558612); 
	var Y_point			= 35.837143;		
	var X_point			= 128.558612;		
	var zoomLevel		= 18;				
	var markerTitle		= "Daegu";		
	var markerMaxWidth	= 300;			


	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {
						zoom: zoomLevel,
						center: myLatlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					}
	var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
	var marker = new google.maps.Marker({
											position: myLatlng,
											map: map,
											title: markerTitle
	});
	var infowindow = new google.maps.InfoWindow(
												{
													content: contentString,
													maxWizzzdth: markerMaxWidth
												}
			);
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
});
		</script>
</body>
</html>
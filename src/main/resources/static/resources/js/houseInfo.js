/**
 * 
 */

function calculData(dong, house) {
	var dLength = dong.length;

	var dongAvg = {
		transportationConvenience : 0,
		soundProof : 0,
		convenientFacilities : 0,
		lighting : 0,
		scoreAvg : 0
	}

	dong.forEach(function(item) {
		dongAvg.transportationConvenience += item.transportationConvenience;
		dongAvg.soundProof += item.soundProof;
		dongAvg.convenientFacilities += item.convenientFacilities;
		dongAvg.lighting += item.lighting;
		dongAvg.scoreAvg += item.scoreAvg;
	});

	dongAvg.transportationConvenience = dongAvg.transportationConvenience
			/ dLength;
	dongAvg.soundProof = dongAvg.soundProof / dLength;
	dongAvg.convenientFacilities = dongAvg.convenientFacilities / dLength;
	dongAvg.lighting = dongAvg.lighting / dLength;
	dongAvg.scoreAvg = dongAvg.scoreAvg / dLength;

	// /////////////////////////////////////////////////////////////
	var hLength = house.length;

	var houseAvg = {
		transportationConvenience : 0,
		soundProof : 0,
		convenientFacilities : 0,
		lighting : 0,
		scoreAvg : 0
	}

	house.forEach(function(item) {
		houseAvg.transportationConvenience += item.transportationConvenience;
		houseAvg.soundProof += item.soundProof;
		houseAvg.convenientFacilities += item.convenientFacilities;
		houseAvg.lighting += item.lighting;
		houseAvg.scoreAvg += item.scoreAvg;
	});

	houseAvg.transportationConvenience = houseAvg.transportationConvenience
			/ hLength;
	houseAvg.soundProof = houseAvg.soundProof / hLength;
	houseAvg.convenientFacilities = houseAvg.convenientFacilities / hLength;
	houseAvg.lighting = houseAvg.lighting / hLength;
	houseAvg.scoreAvg = houseAvg.scoreAvg / hLength;

	// ////////////////////////////////////////////

	loadChart(dongAvg, houseAvg);
}

function loadChart(dongAvg, houseAvg) {

	var dongA = dongAvg;
	var houseA = houseAvg;
	var data = new google.visualization.arrayToDataTable([
			[ '기준', '해당 주택 평점', '해당 지역 주택 평균' ],
			[ '교통 편의', houseAvg.transportationConvenience,
					dongAvg.transportationConvenience ],
			[ '방음', houseAvg.soundProof, dongAvg.soundProof ],
			[ '편의 시설', houseAvg.convenientFacilities,
					dongAvg.convenientFacilities ],
			[ '채광', houseAvg.lighting, dongAvg.lighting ],
			[ '평가 평균', houseAvg.scoreAvg, dongAvg.scoreAvg ] ]);

	console.log(data);

	var options = {
		width : 800,
		chart : {
			title : '주민 평가',
			subtitle : '해당 주택의 점수를 비교하세요'
		},
		bars : 'horizontal', // Required for Material Bar Charts.
		series : {
			0 : {
				axis : 'score'
			}, // Bind series 0 to an axis named 'distance'.
		},
		axes : {
			x : {
				score : {
					label : '평점'
				}, // Bottom x-axis.
			}
		}
	};

	var chart = new google.charts.Bar(document.getElementById('chart'));
	chart.draw(data, options);
}

var shoplist;
var markers= [];

var map;
function mapInitialize(shops, info) {
	shoplist = shops;
	console.log(info);

	var myLatlng = new google.maps.LatLng(info.lat, info.lng); // 좌표값
	var mapOptions = {
		zoom : 16, // 지도 확대레벨 조정
		center : myLatlng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}
	map = new google.maps.Map(document.getElementById('map_canvas'),
			mapOptions);

	/*
	 * var marker = new google.maps.Marker({ position : myLatlng, map : map,
	 * title : "역삼 멀티캠퍼스" // 마커에 마우스를 올렸을때 간략하게 표기될 설명글 });
	 */
	
	initMarkers();
}

function onRadioChange() {
	var selected = $("#category").val();
	console.log(selected);
	filteredShopList = [];
	switch(selected) {
		case "all" :
			setMarkers("전체")
			break;
		case "food" :
			setMarkers("음식");
			break;
		case "life" :
			setMarkers("생활서비스");
			break;
		case "retail" :
			setMarkers("소매");
			break;
		case "medical" :
			setMarkers("의료");
			break;
		case "education" :
			setMarkers("학문/교육");
			break;
		case "entertain" :
			setMarkers("관광/여가/오락");
			break;
		case "estate" :
			setMarkers("부동산");
			break;
		case "stay" :
			setMarkers("숙박");
			break;
		case "sports" :
			setMarkers("스포츠");
			break;
	}
	
}

function setMarkers(category) {
	if(category == "전체") {
		for(var i = 0 ; i < shoplist.length; i++) {
			markers[i].setMap(map);
		}
	} else {
		for(var i = 0 ; i < shoplist.length; i++) {
			if(shoplist[i].bigCategoryName != category) {
				markers[i].setMap(null);
			} else {
				markers[i].setMap(map);
			}
		}
	}
}

function initMarkers() {
	for (var i = 0; i < shoplist.length; i++) {
		var shop = shoplist[i];
		var marker = new google.maps.Marker({
			position : {
				lat : shop.latitude,
				lng : shop.longitude
			},
			map : map,
			title : shop.shopName // 마커에 마우스를 올렸을때 간략하게 표기될 설명글
		});
		markers.push(marker);
		
		attachEvent(marker, i);
//		google.maps.event.addListener(marker, 'mouseover', function(e) {
//			console.log(e);
//		});

	}
}

function attachEvent(marker, i) {

      marker.addListener('mouseover', function() {
    	  var shop = shoplist[i];
    	  console.log(shop);
    	  $("#selected_shop_name").text(shop.shopName);
    	  $("#selected_shop_category").text(shop.smallCategoryName);
    	  $("#selected_shop_address").text(shop.roadAddress);
    	  $("#selected_shop_floor").text(shop.floorInfo + "층");
      });
}

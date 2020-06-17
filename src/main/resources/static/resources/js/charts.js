
function setCharts(dongAvg, houseAvg) {
	Chart.defaults.global.maintainAspectRatio = false;
	var ctx1 = document.getElementById('myChart1').getContext("2d");
	drawCharts(ctx1, "교통 편의",houseAvg.transportationConvenience ,dongAvg.transportationConvenience);
	
	var ctx2 = document.getElementById('myChart2').getContext("2d");
	drawCharts(ctx2, "방음",houseAvg.soundProof ,dongAvg.soundProof);
	
	var ctx3 = document.getElementById('myChart3').getContext("2d");
	drawCharts(ctx3, "편의 시설",houseAvg.convenientFacilities ,dongAvg.convenientFacilities);
	
	var ctx4 = document.getElementById('myChart4').getContext("2d");
	drawCharts(ctx4, "채광",houseAvg.lighting ,dongAvg.lighting);
	
	var ctx5 = document.getElementById('myChart5').getContext("2d");
	drawCharts(ctx5, "평가 평균",houseAvg.scoreAvg ,dongAvg.scoreAvg);
}

function drawCharts(domElement, label, firstData, secondData) {
	var myChart = new Chart(domElement, {
	    type: 'bar',
	    data: {
	        labels: ['현재 부동산', '지역 전체'],
	        datasets: [{
	            //label: label,
	            data: [firstData.toFixed(2), secondData.toFixed(2)],
	            backgroundColor: [
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 99, 132, 0.2)'
	            ],
	            borderColor: [

	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 99, 132, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	    	legend: {
	    		display:false
	    	},
	    	responsive: false,
	    	tooltips: {
				enabled: false
			},
			hover: {
				animationDuration: 0
			},
			animation: {
				duration: 1,
				onComplete: function () {
					var chartInstance = this.chart,
						ctx = chartInstance.ctx;
					ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
					ctx.fillStyle = 'black';
					ctx.textAlign = 'center';
					ctx.textBaseline = 'bottom';

					this.data.datasets.forEach(function (dataset, i) {
						var meta = chartInstance.controller.getDatasetMeta(i);
						meta.data.forEach(function (bar, index) {
							var data = dataset.data[index];							
							ctx.fillText(data, bar._model.x, bar._model.y - 5);
						});
					});
				}
			},
	        scales: {
	            xAxes: [{
	                ticks: {
	                    beginAtZero: true,
	                    steps: 1,
	                    setpValue : 5,
	                    max: 5
	                }, 
	                gridLines : {
	                       display : false
	                   }
	                
	            }],
	            yAxes: [{
	            	ticks: {
	                    beginAtZero: true,
	                    steps: 1,
	                    setpValue : 5,
	                    max: 5
	                }, 
	                   gridLines : {
	                       display : false
	                   }
	               }]
	        }
	    }
	});
}

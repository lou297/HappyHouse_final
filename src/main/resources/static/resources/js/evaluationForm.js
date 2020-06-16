/**
 * 
 */

window.onload = function() {
		var btn = document.getElementById("btn1");
		btn.addEventListener('click', function() {
			var frm = document.getElementById("frm");
			$("#houseNo").val($("#no").val());
			getAvg();

			frm.submit();
		})
		
		$('.starRevT span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  
			  
			  var point = $(".starRevT span.on").length;
			  $("#transportationConvenience").val(point);
			  
			  console.log($("#transportationConvenience").val());
			  getAvg();
			  return false;
			});
		$('.starRevS span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  
			  var point = $(".starRevS span.on").length;
			  $("#soundProof").val(point);
			  
			  console.log($("#soundProof").val());
			  getAvg();
			  return false;
			});
		$('.starRevC span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  
			  var point = $(".starRevC span.on").length;
			  $("#convenientFacilities").val(point);
			  
			  console.log($("#convenientFacilities").val());
			  getAvg();
			  return false;
			});
		$('.starRevL span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  
			  var point = $(".starRevL span.on").length;
			  $("#lighting").val(point);
			  
			  console.log($("#lighting").val());
			  getAvg();
			  return false;
			});
	}

	function getAvg() {
		var total = $("#transportationConvenience").val()*1 + $("#soundProof").val()*1 + $("#convenientFacilities").val()*1 + $("#lighting").val()*1;

		var avg = (total / 4).toFixed(2);
		
		$("#scoreAvg").val(avg);
		
	}

	function getParam(sname) {
		var params = location.search.substr(location.search.indexOf("?") + 1);
		var sval = "";
		params = params.split("&");
		for (var i = 0; i < params.length; i++) {
			temp = params[i].split("=");
			if ([ temp[0] ] == sname) {
				sval = temp[1];
			}
		}
		return sval;
	}

	function returnPage() {
		var no = getParam("no");
		location.href = "${root}/house/detail?no=" + no;
	}
	
	
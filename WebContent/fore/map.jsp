<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	#allmap{
		width:80%;
		float:right;
		z-index:0;
	}
	.images{
		float:left;
		height:100%;
		width:19%;
		border-right:15px solid #000;
		background:#e9e9e9;
	}
	</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=2Qh2BIjQNssBt8A7gmQ0SiK8QF5DBgWs"></script>
<script src="../dist/jquery/jquery.js"></script>
<title>地图展示</title>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 18);  // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	
	var point = new BMap.Point(116.404, 39.915);
	addHospital(point,map);
	
	function addHospital(point,map){
		var hIcon = new BMap.Icon("../img/1.jpg",new BMap.Size(40,40));
		var marker = new BMap.Marker(point,{icon:hIcon});
		marker.enableDragging();
		marker.setTitle("这是一个医院");		
		marker.addEventListener("mouseup",function(e){
		//alert("111");
		console.log(e.target.point);
		});
		map.addOverlay(marker);
	}
	function addMarket(point,map){
		var hIcon = new BMap.Icon("../img/2.jpg",new BMap.Size(92,46));
		var marker = new BMap.Marker(point,{icon:hIcon});
		marker.enableDragging();
		marker.setTitle("这是一个超市");
		marker.addEventListener("mouseup",function(e){
		//alert("111");
		console.log(e.target.point);
		});
		map.addOverlay(marker);
	}
	
	function addOverLay(selectId,point,map){
		var imgPath = "../img/"+selectId+".jpg";
		var hIcon = new BMap.Icon(imgPath,new BMap.Size(40,40));
		var marker = new BMap.Marker(point,{icon:hIcon});
		marker.enableDragging();
		//alert("我在addOverLay中"+point.lng);
		marker.addEventListener("mouseup",function(e){
		//alert("111");
		console.log(e.target.point);
		});
		map.addOverlay(marker);
	}
	
	function listOverLay(map){
		$.ajax({
			url:"/BMap/listOverLay",
			type:"post",
			success:function(data){
				for(var i=0;i<data.length;i++){
					var p = new BMap.Point(data[i].lng,data[i].lat);
					//alert(p.lng);
					var hIcon = new BMap.Icon("../img/1.jpg",new BMap.Size(40,40));
					var marker = new BMap.Marker(p,{icon:hIcon});
					marker.enableDragging();
					marker.setTitle("这是一个医院");		
					marker.addEventListener("mouseup",function(e){
					//alert("111");
					console.log(e.target.point);
					});
					map.addOverlay(marker);
				}
			}
		});
	}
	function addOverLay2db(point){
		$.ajax({
			url:"/BMap/addOverLay",
			data:{lng:point.lng,lat:point.lat,imageId:selectId},
			type:"post",
			success:function(data){
				for(var i=0;i<data.length;i++){
					var p = new BMap.Point(data[i].lng,data[i].lat);
					//alert(p.lng);
					var hIcon = new BMap.Icon("../img/1.jpg",new BMap.Size(40,40));
					var marker = new BMap.Marker(p,{icon:hIcon});
					marker.enableDragging();
					marker.setTitle("这是一个医院");		
					marker.addEventListener("mouseup",function(e){
					//alert("111");
					console.log(e.target.point);
					});
					map.addOverlay(marker);
				}
			}
		});
	}
</script>
<%@include file="images.jsp"%>
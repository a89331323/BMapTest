<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=2Qh2BIjQNssBt8A7gmQ0SiK8QF5DBgWs"></script>
<script src="../dist/jquery/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="images">
		<p>图片</p>
		<div id="imagelist"></div>
	</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"/BMap/listImages",
            type:"post",
            success:function(data){
        		var html = "";
            	for(i=0;i<data.length;i++){
            		html += "<div id='image"
        				+data[i].id+"' style='float:left;margin-left:5px;display:inline-block;position:relative;width:auto;z-index:1'"
            				+" id='move' onclick='fly(this)'>"+"<img src='../img/"+data[i].id+".jpg' /></div>";
            	}
            	$("#imagelist").html(html);
            }
		});
	});
	//var moveTarget;
	var copy=null;
	var ofsl;//左偏移量
	var ofst;//上偏移量
	var status=0;//记录是否右键点击过
	var selectStatus;//记录是否是选中图标状态
	var offsetT;//鼠标相对于图片左上角的偏移量
	var offsetL;
	var selectId=0;//所选图片的ID
	var x;//鼠标的位置
	var y;//鼠标的位置
	var pixel;
	function fly(target){
		//moveTarget = target;
		//如果图片属于选中状态，并且还有copy元素，那么就先把copy清除。
		if(selectStatus=1 && copy!=null){
			$(copy).remove();
			status=0;
		}
		copy = target.cloneNode(true);
		selectStatus=1;//设置为选中状态
		$(copy).css("position","absolute");
		$(copy).hide();
		
		ofsl = $(copy).offset().left;
		ofst = $(copy).offset().top;
		$("#imagelist").append(copy);
		
        offsetT = $(target).height()/2;
        offsetL = $(target).width()/2;
		
        //alert(offsetT);
        //alert("id:"+$(copy).attr("id"));
        selectId= getImageId($(copy).attr("id"));
        
		document.onmousemove = function(e){
            x = e.clientX;
            y = e.clientY;	
            pixel = new BMap.Pixel((x-(document.body.clientWidth)*0.2+offsetL),(y+offsetT));
            if (!copy) {//判断图片是否加载完了，如果没加载
                return;
            } 
            //alert(offsetL);
            $(copy).css("left",x-ofsl-offsetL);
            $(copy).css("top",y-ofst-offsetT);
            if(status==0 &&copy!=null){
	            $(copy).show();
	            status=1;
            }
        }; 
        document.onmousedown=function(e){
       		if(selectId!=0){
	        	var p = map.pixelToPoint(pixel);
				addOverLay(selectId,p,map);
				addOverLay2db(p);
				$(copy).remove();
				copy=null;
       		}
       		
       		if(3==e.which){//当为右键点击时，相当于自动取消这次操作
				status=0;
				selectStatus=0;
			}
       		if(1==e.which){//当为左键时，还可以继续点击添加同一覆盖物
				status=0;
				selectStatus=1;
			}
		}
	}
	
	function getImageId(str){
		var len = str.length;
		//alert(len);
		//image1
		//alert(str.substring(5,6));
		var id = parseInt((str.substring(5,len)),10);
		alert(id);
		return id;
	}
</script>
/****************/
/*****单柱图*****/
/****************/
function findSWF(movieName) {
  if (navigator.appName.indexOf("Microsoft")!= -1) {
    return window[movieName];
  } else {
    return document[movieName];
  }
}
/*
 * 参数：text-标题
 * xlabels:x轴数据数组
 * datas:y值的数组  组成的数组
 */
function buildSingleChartData(text,labels,xlabels,datas){
	//alert(text+"---"+labels+"---"+xlabels+"---"+datas);
	var title =  buildTitle(text);	
	var lefty = getYAxisUtilData(datas[0]);
	var chart = {
		"title" : title,
		"tooltip":{
		    "shadow":false,
		    "stroke":1,
		    "colour":"#333333",
		    "background":"#FFFFFF",
		    "title":"{font-size: 14px; color: #905050;}",
		    "body":"{font-size: 12px; font-weight: bold; color: #333333;}"
		  },
		"elements" :[{
		      	"type":      "bar",
		      	"alpha":     1.0,
		      	"colour":    "#1B95D9",
		      	"text":      buildLabel(labels[0]),
		      	"font-size": 10,
		      	"tip":buildTip(labels[0]), 
		      //	"on-show":	{"type": "pop-up","delay":0.1},
		      	"values" :   datas[0]
		    }],
		"x_axis":{
				"stroke":1,
				"tick_height":3,
				"colour":"#909090",
				"grid_colour":"#333333",
				"labels": buildXLables(xlabels)
				},
		"y_axis":{
			    "stroke":      1,
			    "tick_length": 3,
			    "max":   lefty.max,
			    "min":   lefty.min,
			    "steps": lefty.step,
			    "colour":      "#1B95D9",
			    "grid_colour": "#333333"
			 }
  }
  	return chart;
}
function buildXLables(xlables){
	return{
		  "align":"center",
		  // "steps":getXlablesSteps(xlables),
	      "labels":xlables    
	      }
}
/*
 * 可以完善此方法优化x轴显示方式
 */
function getXlablesSteps(xlables){
	var step = 1;
	return step;
}
function buildTip(label){
	//如果有单位  则label与单位间用@@分开
	var ls = [];
	var unit = "";
	var l = label;
	if(label.indexOf("@@")!=-1){
		ls = label.split("@@");
		l = ls[0];
		unit = ls[1];
	}
	return l + "：#val#"+unit+" \n";
}
function buildLabel(label){
	if(label.indexOf("@@")!=-1){
		var us = label.split("@@");
		return us[0]+"("+us[1]+")";
	}else{
		return label;
	}
}
function buildTitle(text){
	var  title = {
	    "text" : text,
	    "style" : "{font-size: 14px; color:#333333; font-family: Verdana; text-align: center;padding-top:10px;}"
	  };
	return title;
}
/*
 * 处理数据，返回最大值，最小值，步长
 */
function getYAxisUtilData(datas){
	var obj = new Object();
	var max =0;
	var min =0;
	var step =1;
	
	if(datas.length>0){
		if(typeof (datas[0].top)!="undefined"){
			max = datas[0].top;
			min = datas[0].top;
			for(var i=1;i<datas.length;i++){
				if(datas[i].top>max){
					max = datas[i].top;
				}
				if(datas[i].top<min){
					min = datas[i].top;
				}
			}
		}else{
		max = datas[0];
		min = datas[0]; 
		for(var i=1;i<datas.length;i++){
			if(datas[i]>max){
				max = datas[i];
			}
			if(datas[i]<min){
				min = datas[i];
			}
		}
		}
	}
	obj.max = max;
	//图形y轴从最小值开始
	//obj.min = min;
	//图形y轴从0开始
	obj.min = 0;
	//默认y轴刻度为10左右
	var fobj = getSteps(obj,10);
	return fobj;
}
/*
 * 处理数据，根据最大值，最小值和分段数，步长
 */
function getSteps(obj,size){
	var max = obj.max;
	var min = obj.min;
	var k = max-min==0?max:max-min;
	
	//字符串(如:2346.9)
	var ttstep = k/size+"";
	var zs = ttstep.split(".")[0];
	var ststep =zs.substr(0,1)+ zs.substr(1).replace(/\d/g,'0');
	var step = parseInt(ststep);
	step = step==0?1:step;
	
	var realMin = parseInt(min/step);
	var realMax = parseInt(max/step)==(min/step)?parseInt(max/step):(parseInt(max/step)+1)
	realMin = realMin*step;
	realMax = realMax*step;
	var realSize = (realMax-realMin)/step;
	obj.max = realMax;
	obj.min = realMin;
	obj.step = step;
	obj.size = realSize;
	return obj;
}
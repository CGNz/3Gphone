//菜单按钮
var menuBtn = $('#menu-btn');
menuBtn.click(function(){
	var menu = $('#menu');
	if(menu.css('left') == '0px'){
		menu.css('left','-260px');
		$('.cover').fadeOut();
	}else if(menu.css('left') == '-260px'){
		menu.css('left','0px');
		$('.cover').fadeIn();
	}
});
$('.cover').click(function(){
	
	$('#menu').css('left','-260px');
	$('.cover').fadeOut();
});

/*
//菜单呼出页面种类
var MenuItemFunc = (function () {
	var listPage = function(type) {
		$('.cover').fadeOut();
		if(type=='todo'){
			$('#completed-list').fadeOut();
			$('#task-list').fadeIn();
		}else if(type=='completed'){
			if($('#completed-list').html()==''){
				render.init('#completed-list');
			}
			render.init('#completed-list');
			$('#task-list').fadeOut();
			$('#completed-list').fadeIn();	
		}
	};

	var takeBill = function(){
		$('.cover').fadeOut();
		$('#bill-list').fadeOut();
		$('#take-bill').fadeIn()
	}

	var bills = function(){
		if($('#bill-list').html() == ''){
			render.init(#bill-list);
		}
	};

	var devices = function () {
		subMenuPanel();
		colorPanel();
		showHeaderBtn();
	};
	var contact = function() {
		subMenuPanel();
		aboutPanel();
	};
	return {
		listPage: listPage,
		changeColor: changeColor,
		aboutApp: about
	};
})();



//保修单、设备列表渲染器
function Render() {
	var items,
		itemTitle,
		itemHTML='';

	var init = function(el) {
		//渲染保修单列表
		if(el=='#bill-list'){
			if(localStorage['s_biils']) {
			items = localStorage['s_biils'].split(',');
			for(var i=1; i<items.length; i++) {
				itemTitle = items[i];			
				$(el).prepend('<li class="bill-item"><span class="bill-title">'+taskTitle+'</span><i>'+i+'</i><div class="clear"></div></li>');
			}
		}
		//渲染设备列表
		}else if(el=='#device-list'){
			if(localStorage['s_devices']) {
			items = localStorage['s_devices'].split(',');
			for(var i=1; i<items.length; i++) {
				itemTitle = items[i];			
				$(el).prepend('<li class="device-item"><span class="device-title">'+taskTitle+'</span><i>'+i+'</i><div class="clear"></div></li>');
			}
		}
		}
		
		
		
	}
	return {
		init: init
	};
}


//数据存储
function Model() {
	var addBill = function(b) {
		var billItem = [localStorage['s_bills']];
		billItem.push(b);
		localStorage.setItem('s_bills', billItem);
		render.init('#bill-list');
	};
	var addDevice = function(d) {
		var arr = [localStorage['s_devices']];
		arr.push(d);
		localStorage.setItem('s_devices', arr);
		render.init('#device-list');
		
	};
	//分待完成和已完成，对列表下标进行删除 需传递-> todo or completed 
	var clearTask = function(list, i) {
		var arr, listName, el;
		if(list=='todo') {
			listName = 'yoone_todo';
			el = '#task-list';
		}else if(list=='completed') {
			listName = 'yoone_completed';
			el = '#completed-list';
		}
		arr = localStorage[listName].split(',');
		arr.splice(i,1);
		localStorage.setItem(listName, arr);
		render.init(el);
	};
	return {
		addTask: addTask,
		completeTask: completeTask,
		clearTask: clearTask
	};
}

*/
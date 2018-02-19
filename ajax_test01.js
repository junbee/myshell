
function ajaxpost01(urlpost,poststr01){

    var ajax = false;
    //开始初始化XMLHttpRequest对象
    if(window.XMLHttpRequest){ //Mozilla 浏览器
        ajax = new XMLHttpRequest();
        //if (ajax.overrideMimeType){ //设置MiME类别
        //    ajax.overrideMimeType("text/xml");
        //}
    }
    else if (window.ActiveXObject){ // IE浏览器
        try{
            ajax = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e){
            try{ ajax = new ActiveXObject("Microsoft.XMLHTTP"); } catch (e) {}
        }
    }
    if (!ajax){ // 异常，创建对象实例失败
        window.alert("不能创建XMLHttpRequest对象实例.");
        return false;
    }
     
    //通过Post方式打开连接
    ajax.open("POST", urlpost, true);
    //定义传输的文件HTTP头信息
    ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    //发送POST数据
    var postStr = "myurl="+encodeURIComponent(poststr01)+"&";
    ajax.send(postStr);
    //获取执行状态
    ajax.onreadystatechange = function(){
        //如果执行状态成功，那么就把返回信息写到指定的层里
        if (ajax.readyState == 4 && ajax.status == 200){
            //introducemsg.innerHTML = ajax.responseText;
            //alert(111);
        }
    }

}

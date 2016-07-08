$(document).ready(function(){
    var mainli = $('#main-nav>ul>li');
    var ul_hovered;

    //初始化，隐藏二级导航
    for(var j=0;j<mainli.length;j++){
        $(mainli[j]).find('ul').addClass('hidden');
    }
 
    var i;
    //初始化，为选中的导航项添加li-selected样式（白色字体），并显示其下的二级导航（如果有）
    if($('#main-nav>ul>li.active').size()!=0){
        i = $('#main-nav>ul>li.active').data("sub");
        $('#main-nav>ul>li.active>a').addClass('li-selected');
        $(mainli[i+1]).find('ul').removeClass('hidden');      
    }else{
        i = -1;
        $('#main-nav>ul>li').find('a').eq(0).addClass('li-selected');        
    }

    //若为首页隐藏二级导航背景
    if(i==-1){
        $('#subnav-bg').animate({
            height:'hide'
        },0); 
    }

    //根据选中导航项移动.selected图块
    var offset = 82*(i+1)+255;
    $('.selected').css({"left":offset+"px"});

    mainli.hover(function(){
        var tmp = $(this);
        var i = tmp.data("sub");
        var offset = 82*(i+1)+255;

        //改变二级导航及其背景
        if(i==-1){
            mainli.find('ul').addClass('hidden');
            $('#subnav-bg').stop(true,true).animate({
                height:'hide'
            },{duration: 500, queue: false,complete:function(){
                $(mainli).find('ul').addClass('hidden');
            }}); 
        }else{
            $('#subnav-bg').stop(true,true).animate({
                height:'show'
            },{duration: 500, queue: false,complete:function(){
                $(mainli).find('ul').addClass('hidden');
                $(mainli[i+1]).find('ul').removeClass('hidden');
            }});
        }

        //移动select图块并改变字体颜色
        if($('#main-nav>ul>li a.li-selected').parent().data("sub")!=i){
            $('#main-nav>ul>li a.li-selected').removeClass('li-selected');
        }     
        $('.selected').animate({"left":offset+"px"},{ duration: 500, queue: false,complete:function(){      
            $('#main-nav>ul>li a.li-selected').removeClass('li-selected');                   
            tmp.find('a').addClass('li-selected');
        }});

    },function(){
        var i;
        if($('#main-nav>ul>li.active').size()!=0){
            i = $('#main-nav>ul>li.active').data("sub");
        }else{
            i = -1;
        }

        var offset = 82*(i+1)+255;

        $(mainli).find('ul').addClass('hidden');
        $(mainli[i+1]).find('ul').removeClass('hidden');

        if($('#main-nav>ul>li a.li-selected').parent().data("sub")!=i){
            $('#main-nav>ul>li a.li-selected').removeClass('li-selected');
        }     
        $('.selected').animate({"left":offset+"px"},{ duration: 500, queue: false,complete:function(){  
            $('#main-nav>ul>li a').removeClass('li-selected');              
            $('#main-nav>ul>li.active>a').addClass('li-selected');
            if($('#main-nav>ul>li.active').size()==0){
                $('#main-nav>ul>li').find('a').eq(0).addClass('li-selected');
            }
            if(($('#main-nav>ul>li a.li-selected').parent().data("sub")==-1)&&(!ul_hovered)){
                $('#subnav-bg').animate({
                    height:'hide'
                },{ duration: 500, queue: false}); 
            }
        }});       
    });

    $('#main-nav>ul').hover(function(){
        ul_hovered=true;
    },function(){
        ul_hovered=false;
    });


    $('#search-button').mouseover(function(){
        $('#search-button').css('background','url(../../templates/tuanwei/images/searchbtn-down.png)');
    });
    $('#search-button').mouseout(function(){
        $('#search-button').css('background','url(../../templates/tuanwei/images/searchbtn-up.png)');
    });

    $(".item-page img").each(function(){
        if($(this).attr('width')>677){
            $(this).width(620);
            $(this).height($(this).attr('height')*620/$(this).attr('width'));
        }
    });
    
    // 五四表彰
    jQuery(".fancybox").fancybox({
        height:1000,
        width:1000,
        autoScale: false,
        padding: 0,
        margin: 0
    });

   // jQuery.vnetTool.move();

});
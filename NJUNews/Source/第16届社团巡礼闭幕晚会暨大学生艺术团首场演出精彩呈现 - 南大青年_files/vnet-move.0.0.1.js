/**
 * 本插件用于生成网页浮动广告
 * 调用参数如下：
 * width:浮动窗口宽度
 * height:浮动窗口高度
 * imgurl:浮动窗口图片地址
 * target:点击后打开目标url
 * speed:窗口移动像素
 * step;窗口移动速度
 * text:鼠标移动到窗口时的提示文字
 * divcss:窗口处定义样式
 * imgcss：图片层的css样式
 * acss:连接层css样式
 * hasCl:是否可以关闭
 */
jQuery.vnetTool = {
    move:function(o){
        o = $.extend({
            //width:100,
            //height:100,
            imgurl:'http://tuanwei.nju.edu.cn/images/yd.png',
            target:'http://njuyd.nju.edu.cn',
            speed:1,
            step:40,
            text:'test',
            divcss:'',
            imgcss:'',
            acss:'',
            hasCl:false,
        }, o);

        initx = Math.random()*jQuery(window).width();
        inity = Math.random()*jQuery(window).height();
        if(initx>(jQuery(window).width()- o.width)){
            initx = jQuery(window).width- o.width;
        }
        if(inity>(jQuery(window).height()- o.height)){
            inity = jQuery(window).height()- o.height;
        }

        $div = $('<div>')
        $div.css({'border':'none',/*'width': o.width,'height': o.height,*/'position':'absolute','top':inity,'left':initx,'padding':0,'margin':0,"z-index":999}).css(o.divcss);
        $img = $('<img/>')
        $img.css({'border':'none',/*'width': o.width,'height': o.height,*/'margin':0}).css(o.imgcss);
        $img.attr('alt', o.text);
        $img.attr('src', o.imgurl);
        $a = $('<a>');
        $a.attr('href', o.target);
        $a.css({'border':'none',/*'width': o.width,'height': o.height,*/'margin':0}).css(o.acss);
        $close = jQuery('<div style="border:none;text-align:right;padding-right:2px;margin-top:-5px"><span>X</span><div>');
        $close.children('span').click(function(){
            $div.css('display', 'none');
        });
        $a.append($img);
        $div.append($a);
        if(o.hasCl){
            $div.append($close);
        }
        $('body').append($div);


        xrec = true;
        yrec = true;

        moveAd = function(){
            dtop = $div.offset().top;
            dleft = $div.offset().left;
            if(yrec) {
                dtop+= o.speed;
                if(dtop>jQuery(window).height()-$div.height()){
                    yrec = false;
                }
            }else{
                dtop-= o.speed;
                if(dtop<0){
                    yrec = true;
                }
            }
            $div.css({'top':dtop});
            if(xrec){
               dleft +=  o.speed;
               if(dleft>jQuery(window).width()-$div.width()){
                   xrec = false;
               }
            }else{
                dleft -= o.speed;
                if(dleft<0){
                    xrec=true;
                }
            }
            $div.css('left',dleft);
        };

        vnetMove = setInterval('moveAd()', o.step);

        $div.hover(function(){
            $div.css('cursor','pointer');
            clearInterval(vnetMove);
        }, function(){
            vnetMove = setInterval('moveAd()', o.step);
        });


    }
};

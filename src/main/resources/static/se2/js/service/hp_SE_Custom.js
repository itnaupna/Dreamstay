nhn.husky.SE_Custom = jindo.$Class({
    //이미지 업로드를 위한 커스텀 애드온 제작
    //itnaupna
    //jindo는 메세지를 정의해서 메세지로 함수들을 호출하는듯.
    //찾아보니 jindo 라이브러리는 더이상 개발되지 않고 jquery로 마이그레이션해서 쓰라고 권장함.

    name : "SE_Custom", //적당한 이름 설정
    $init : function(elAppContainer){ //초기화
        this._assignHTMLObjects(elAppContainer);
    },

    _assignHTMLObjects : function(elAppContainer){ //필요한 요소 등록.
        this.oDropdownLayer=cssquery.getSingle("DIV.husky_se2m_eong_layer",elAppContainer);
        this.oImageUploadButton = cssquery.getSingle('.se2_eong button:nth-of-type(1)',elAppContainer);
        this.oImageInsertButton = cssquery.getSingle('.se2_eong button:nth-of-type(2)',elAppContainer);
        this.oImageDeleteButton = cssquery.getSingle('.se2_eong button:nth-of-type(3)',elAppContainer);
        this.oImageFileInput = cssquery.getSingle('#frmImg input',elAppContainer);
        this.oImageFileList = cssquery.getSingle('#lst_img',elAppContainer);
    },

    $ON_MSG_APP_READY : function(){ //로딩되면 실행할 스크립트라인.
        this.oApp.exec("REGISTER_UI_EVENT",
            ["Custom","click","SE_TOGGLE_EONG_LAYER"]); //사진버튼 클릭시 하위레이어를 띄우도록 해주고
        this.oApp.registerBrowserEvent(this.oImageUploadButton,'click','PASTE_IMGURL'); //업로드 버튼 클릭시 업로드 실행
        this.oApp.registerBrowserEvent(this.oImageInsertButton,'click','INSERT_IMAGE');
        this.oApp.registerBrowserEvent(this.oImageDeleteButton,'click','DELETE_IMAGE');
        this.oApp.registerBrowserEvent(this.oImageFileInput,'change','CHANGE_FILE');
        this.oApp.registerBrowserEvent(this.oImageFileList,'change','CHANGE_LIST');
    },
    $ON_CHANGE_LIST : function(){
        //https://ukkzyijeexki17078490.cdn.ntruss.com/room/42b1598b-9441-40e4-a590-eb75c1075ee9?type=f&w=120&h=90
        let thumbpre = 'https://ukkzyijeexki17078490.cdn.ntruss.com/room/';
        let thumbsuf = '?type=f&w=120&h=90';
        if($('#lst_img')[0].selectedIndex===-1){
            $('#imgupload_preview').attr('src',"https://kr.object.ncloudstorage.com/dreamsstaybucket/noimg.jpg");
        }
        $('#imgupload_preview').attr('src',thumbpre + $('#lst_img :selected').val() + thumbsuf);
    },

    $ON_INSERT_IMAGE : function(){ //본문에 업로드된 이미지 다시한번 삽입
        let imgPathPre='<img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/room/';
        let imgPathSuf='"><br/>';
        let sel = $('#lst_img :selected');
        if(sel.length === 0)
            return;
        let imgPath = sel.text();

        this.oApp.exec("PASTE_HTML",[imgPathPre + imgPath + imgPathSuf]);
    },

    $ON_DELETE_IMAGE : function(){ //이미지 삭제. 본문에선 어떻게 삭제하여야 할까? 그런 메시지가 있을까?
        let sel = $('#lst_img :selected');
        if(sel.length === 0)
            return;

        $.ajax({
            url:'/admin/deletep',
            data:{name:sel.text()},
            type:'post',
            dataType:'json',
            success:(e)=>{
                if(e){
                    sel.remove();
                    $('#imgupload_preview').attr('src',"https://kr.object.ncloudstorage.com/dreamsstaybucket/noimg.jpg");
                    $('#lst_img')[0].selectedIndex = -1;
                    //$('#lst_img')[0].selectedIndex = $('#lst_img option').length-1;
                }else{
                    console.log('err');
                    alert('이미지 삭제에 실패하였습니다.');
                }
            }
        });
    },
    $ON_SE_TOGGLE_EONG_LAYER : function(){ //레이어 토글
        $('.husky_se2m_eong_layer').toggle();
        //this.oApp.exec("TOGGLE_TOOLBAR_ACTIVE_LAYER",[this.oDropdownLayer]);
        //버튼 클릭시 레이어가 나타나지만 토글이 마우스 다운시 사라짐, 마우스 업시 나타남이 됨.
        //그래서 걍 jquery 토글로 처리함...
    },
    $ON_CHANGE_FILE : function(){
        let input = $('#frmImg input');
        if(input[0].files.length === 0)
            return;

        let formData = new FormData(document.getElementById('frmImg'));
        let imgPathPre='<img src="https://kr.object.ncloudstorage.com/dreamsstaybucket/room/';
        let imgPathSuf='"><br/>';

        $.ajax({
            type:'post',
            url:'/admin/uploadp',
            data:formData,
            cache:false,
            contentType:false,
            processData:false,
            success:(res)=>{
                console.log(res);
                $.each(res,(i,e)=>{
                    $('#lst_img').append(
                        $('<option>').text(e)
                    );
                    this.oApp.exec("PASTE_HTML",[imgPathPre + e + imgPathSuf]);
                    $('#lst_img')[0].selectedIndex=i;
                });
                //this.oApp.exec("PASTE_HTML",[imgPathPre + res + imgPathSuf]);
            },
            error:(res)=>{
                console.log("err",res);
                alert("error" + res);
                //this.oApp.exec("PASTE_HTML",[res]);
            }
        });
    },
    $ON_PASTE_IMGURL : function(){//업로드 버튼 클릭시 file불러오기 창 열기.
        $('#frmImg input').click();
    }
})
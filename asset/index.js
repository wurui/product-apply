define(['oxjs'],function(OXJS){
  return {
    init:function($mod){
    	$('form',$mod).on('submit',function(e){
    		var data=OXJS.formToJSON(this);
    		var filedata=[];
    		for(var k in data){
    			filedata.push({
    				name:k,
    				value:data[k]
    			})
    		}
    		var target=this.getAttribute('data-target'),
    		title=this.getAttribute('data-title');
            $mod.OXPost({
                'user-apply':{
                    
                    target:target,
                    subject:title,
                    file:filedata,

                    $inserter:'default'
                }
            },function(r){
                var r=r && r[0];
                if(r.error){
                    OXJS.toast('[操作失败]'+r.error)
                }else{
                    
                    $mod.OXRefresh();
                }
            });
            return false;

        });
    }
  }
})

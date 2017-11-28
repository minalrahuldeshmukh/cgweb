$(document).ready(function(){
        $document.bind("click",function(e)
        {
             var target = $(e.target);
              if(target.is('.button'))    {

                $.ajax(
                {
                url:'home'
                }
                ).then(function(data)
                {
                   $('#resultContainer').show();
                }
                )
                }
                })
            }
        )


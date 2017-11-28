/**
*
*/
$(document).ready(function() {
    $('#cdars').submit(
        function(event) {

            $.ajax({
                url : $("#cdars").attr("action"),

                type : "GET",

                success : function(response) {
                    alert( response );
                },
                error : function(xhr, status, error) {

                //$("#call").paintLabel(xhr);
                    alert(xhr.responseText);
                }
            });
            return false;
        });
    });

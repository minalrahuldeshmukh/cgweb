<!DOCTYPE html>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="F:\\CG\\cgweb\\src\\main\\webapp\\WEB-INF\\css\\style.css">
<!-- Static content

<script type="text/javascript" src="F:\\CG\\cgweb\\src\\main\\webapp\\WEB-INF\\js\cdars.js"></script>
       -->

<script type="text/javascript">

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


</script>

<title>Spring Boot</title>
</head>
<body>
  <h1>Spring Boot - MVC web application example</h1>
  <hr>


    <form action="/home" method="post" name = "cdars" id="cdars">
      <table>
        <tr>
          <td>Enter Your name</td>
          <td><input id="name" name="name"></td>
          <td><input type="submit" value="Log In" class="button" name="submit"></td>
        </tr>
      </table>
    </form>

        <div id="resultContainer" style="display: none;">
         <hr/>
         <h4 style="color: green;">JSON Response From Server</h4>
         akjshaj
        </div>
</body>
</html>
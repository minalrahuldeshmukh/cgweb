<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>CDARS</title>
    <style type="text/css">

		body {
			margin: 0;
			padding: 0;
			overflow: hidden;
			height: 100%;
			max-height: 100%;
			font-family:Sans-serif;
			line-height: 1.5em;
		}

		#header {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100px;
			overflow: hidden; /* Disables scrollbars on the header frame. To enable scrollbars, change "hidden" to "scroll" */
			background: #BCCE98;
		}

		#nav {
			position: absolute;
			top: 100px;
			left: 0;
			bottom: 0;
			width: 230px;
			overflow: auto; /* Scrollbars will appear on this frame only when there's enough content to require scrolling. To disable scrollbars, change to "hidden", or use "scroll" to enable permanent scrollbars */
			background: #DAE9BC;
		}

		#logo {
			padding:10px;
		}

		main {
			position: fixed;
			top: 100px; /* Set this to the height of the header */
			left: 230px;
			right: 0;
			bottom: 0;
			overflow: auto;
			background: #fff;
		}

		.innertube {
			margin: 15px; /* Provides padding for the content */

		}


		p {
			color: #555;
		}

		nav ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}

		nav ul a {
			color: darkgreen;
			text-decoration: none;
		}
		.textfont {
        			color: darkgreen;
        			text-decoration: none;
        		}
        .textfont bold {
        
        }

		/*IE6 fix*/
		* html body{
			padding: 100px 0 0 230px; /* Set the first value to the height of the header and last value to the width of the nav */
		}

		* html main{
			height: 100%;
			width: 100%;
		}

		/* Style the tab */
div.tab {
    overflow: hidden;

    background-color: #DAE9BC;

}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: #BCCE98;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
          }
.tabone{
}
.tabtwo{
}
.typeButton {
    background-color: #BCCE98;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
.result{

}

#retdata {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#retdata td, #retdata th {
    border: 1px solid #ddd;
    padding: 8px;
}

#retdata tr:nth-child(even){background-color: #f2f2f2;}

#retdata tr:hover {background-color: #ddd;}

#retdata th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript">
    function openType(evt, dataName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(dataName).style.display = "block";
        evt.currentTarget.className += " active";
    }


$(document).ready(function() {
           $(document).bind("click",function(e){
                    var target = $(e.target) ;
                    bunchtableHtml = "";
                    if(target.is(".tabone")) {
                      bunchtableHtml = "<ul> <li>"+ $("#tab1").val()+"</li>  <li>"+$("#tab2").val()+"</li> <li>"+$("#tab3").val()+"</li></ul> ";
                      $("#arctable").html(bunchtableHtml);
                      $("#rettable").html(bunchtableHtml);
                       $("#arctable").show();
                       $("#rettable").show();
                    }
                     else if(target.is(".tabtwo")) {
                       bunchtableHtml = "<ul> <li>"+ $("#tab1").val()+"</li>  <li>"+$("#tab2").val()+"</li> <li>"+$("#tab3").val()+"</li><li>"+$("#tab4").val()+"</li></ul> ";
                        $("#arctable").html(bunchtableHtml);
                        $("#rettable").html(bunchtableHtml);
                         $("#rettable").show();
                         $("#arctable").show();
                     }
                     else if(target.is("#archivetab")) {
                            $(".result").hide();

                     }
                     else if(target.is("#retrievetab")) {
                                                 $(".result").hide();

                     }
                     else if(target.is("#retrieveBut")) {
                            startDate = $("#arcmeetingstart").val();
                            endDate=    $("#aremeetingend").val();
                            datasetname = "TRADE";
                            var  bunchHtml;
                            // call rest
                            var data = 'datasetname='+ encodeURIComponent(datasetname);
                            //var baseURL = "url/"+startDate+"/"+endDate+"/"+scriptType+"/"+datasetname;
                            var baseURL = "/home";
                            $.ajax({
                                url : baseURL,
                                data : data,
                                error : function(xhr) {
                                if(xhr.status!=200){
                                         bunchHtml ="<h1>Error in data retrieval </h1> "  ;
                                         $(".result").html(bunchHtml);
                                     }
                                    }
                            }).then(function(response) {
                                alert( response );
                                alert(response.status)
                                bunchHtml =  " <table id='retdata'><tr><th>DataSet Name</th><th>Archival Id</th><th>File Name</th><th>Start Date</th><th>End Date</th><th>Download</th></tr>"  ;


                               if(response.archiveRecList!=""){
                                alert( "1"+response.archiveRecList );
                                 $.each(response.archiveRecList,function(i,archivedRecord){
                                  alert( "2"+archivedRecord.dataSetName );
                                   bunchHtml +="<tr><td>"+archivedRecord.dataSetName+"</td>"+
                                   "<td>"+archivedRecord.archiveSystemId+"</td>"+
                                   "<td>"+archivedRecord.fileFullName+"</td>"+
                                   "<td>"+archivedRecord.startDate+"</td>"+
                                   "<td>"+archivedRecord.endDate+"</td>"+
                                   "<td><button  onclick='' >Download Object</button> </td></tr>";
                                   });
                                   bunchHtml += "</table>";
                                   $(".result").html(bunchHtml);
                                   $(".result").show();
                               }
                            });
                           // $(".result").append(bunchHtml)   ;
                      }
                     else if(target.is("#archiveBut")) {
                         startDate = $("#arcmeetingstart").val();
                         endDate=    $("#aremeetingend").val();
                         scriptType = $("#scripttype").val();
                         datasetname = "TRADE";
                              // call rest
                              var data = 'datasetname='
                                                  + encodeURIComponent(datasetname);

                             //var baseURL = "url/"+startDate+"/"+endDate+"/"+scriptType+"/"+datasetname;
                             var baseURL = "/home";
                             $.ajax({
                                url : baseURL,
                                data : data,
                                error : function(xhr) {
                                        if(xhr.status!=200){
                                          bunchHtml ="<h1>Error in data archival </h1> "  ;
                                          $(".result").html(bunchHtml);
                                        }
                                }
                              }).then(function(response) {
                                    alert( response );
                                    alert(response.status)
                                    bunchHtml ="<h1>Dataset has been successfully uploaded </h1> "  ;

                                    $(".result").html(bunchHtml);
                                          $(".result").show();
                               });
                          }  //end of lst cndn
                     });
                });
	</script>

</head>

<body>

<header id="header">
    <div id="logo">
        <h1>CDARS</h1>
    </div>
</header>

<main>
    <div class="tab">
        <button class="tablinks" onclick="openType(event, 'archive')" id="archivetab">Archive</button>
        <button class="tablinks" onclick="openType(event, 'retrieve')" id="retrievetab">Retrieve</button>

    </div>


    <div class="tabcontent" id="archive">
        <h1>Archive Data</h1>
        <div id="arctable" class="textfont" >
        </div>
        <label for="arcmeetingstart" class="textfont">Start Date : </label><input id="arcmeetingstart" type="date" value="2017-11-29"/>
        <label for="aremeetingend" class="textfont" >End Date : </label><input id="aremeetingend" type="date" value="2017-11-29"/>
        <input type="checkbox" name="ddl" value="DDL" id="scripttype" class="textfont"> DDL?
        <br>
        <br>

       <button class="typeButton" id="archiveBut">Archive</button>
       <div style="display:none;" class="result">
       </div>

    </div>
    <div class="tabcontent" id="retrieve">
        <h1>Retrieve Data</h1>
        <div id="rettable" class="textfont" >

        </div>
        <label for="retmeetingstart">Start Date : </label>
        <input id="retmeetingstart" type="date" value="2011-01-13"/>
        <label for="retmeetingend">End Date : </label>
        <input id="retmeetingend" type="date" value="2011-01-13"/>
        <br>
        <br>
         <button class="typeButton" id="retrieveBut">Retrieve</button>
          <br>
          <br>
           <div style="display:none;" class="result">



           </div>
    </div>
</main>

<nav id="nav">
    <div class="innertube" >
        <h1>DataSet</h1>
        <ul>
            <li><a href="#" class="tabone">TRADES</a></li>
            <input type="hidden" value="TRADE" id="tab1">
            <input type="hidden" value="AGREEMENT" id="tab2">
            <input type="hidden" value="PRODUCT" id="tab3">
            <li><a href="#" class="tabtwo">ALL</a></li>
            <input type="hidden" value="MARGINCALL" id="tab4">
        </ul>

    </div>
</nav>
</body>
</html>
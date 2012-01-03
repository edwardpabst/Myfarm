// Javascript for Hover menus
 

<!--  Script for hover mega menus -->

 
		var menuArray = new Array();
		menuArray[0] = 'submenu1';
		menuArray[1] = 'submenu2';
		menuArray[2] = 'submenu3';
		menuArray[3] = 'submenu4';



		var mglobalObject = '';
		var misActive = false;
		var mourTimer;

		function showhide(obj, onlink)
		{
		    targetObject = document.getElementById(obj).style;
		    mglobalObject = targetObject;

		    if(onlink)
		    {
		        clearTimeout(mourTimer);

		        for (i=0; i < menuArray.length; i++)
		        {
		            var tempObject = document.getElementById(menuArray[i]).style;
		            tempObject.visibility = "hidden";
		        }

		        targetObject.visibility = 'visible';
		        misActive = true;
		    }
		    else
		    {
		        misActive = false;
		        layerTimer();
		    }
		}

		function layerTimer()
		{
		    mourTimer = setTimeout("hideMenu()",3000);
		}

		function hideMenu()
		{
		    if( !misActive )
		    {
		        mglobalObject.visibility = 'hidden';
		    }
		}

		function layerCheck(flag)
		{
		    if(flag)
		    {
		        misActive = true;
		        clearTimeout(mourTimer);
		    }
		    else
		    {
		        misActive = false;
		        layerTimer();
		    }
		}

		window.onload = function()
		{
		    for(var i=0;i<menuArray.length;i++)
		    {
		        var id = menuArray[i];
		        var e = document.getElementById(id);
		        e.onmouseover = function(e)
		        {
		            layerCheck(true);
		        }
		        e.onmouseout = function(e)
		        {
		            layerCheck(false);
		        }
		    }
		}
 


 

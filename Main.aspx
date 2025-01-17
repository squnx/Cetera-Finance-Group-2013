<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
	<title>Smartworks</title>
	<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
	<meta content="C#" name="CODE_LANGUAGE">
	<meta content="JavaScript" name="vs_defaultClientScript">
	<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	<LINK href="../_css/menuStyle.css" type="text/css" rel="stylesheet">
	<LINK href="../_css/master.css" type="text/css" rel="stylesheet">
	<script language="javascript" src="_javascripts/Main.js"></script>
	<script language="javascript">
		var LastName;
		var curWidth = 0;
		var curX = 0;
		var newX = 0;
		var mouseButtonPos = "up";
		var sTemp = "Last Name: [% = wildcard]";

		function NewContact() {
			sURL = "ClientDetails.aspx";
			window.frames.frmContent.location.href = sURL;
		}

		function ClientSearch() {
			var sURL;

			LastName = Trim(document.Main.txtClientName.value);
			if (LastName != "" && LastName != null) {
				if (LastName == sTemp)
					LastName = "";
				encode_cookie(LastName);
				sURL = "ClientSearch.aspx?LastName=" + LastName;
				window.frames.frmContent.location.href = sURL;
			}
			else {
				sURL = "ClientSearch.aspx";
				window.frames.frmContent.location.href = sURL;
			}
			//setDefault();					
			return false;
		}
		function encode_cookie(cookie_value) {
			var coded_string = "";
			for (var counter = 0; counter < cookie_value.length; counter++) {
				coded_string += cookie_value.charCodeAt(counter);
				if (counter < cookie_value.length - 1) {
					coded_string += "+";
				}
			}
			LastName = coded_string;
		}
		function contactSearchOnFocus() {
			LastName = Trim(document.Main.txtClientName.value);
			if (LastName == sTemp) {
				document.Main.txtClientName.value = "";
				document.Main.txtClientName.className = "Textbox";
			}
		}
		function contactSearchOnLostFocus() {
			LastName = Trim(document.Main.txtClientName.value);
			if ((LastName == "") || (LastName == sTemp)) {
				document.Main.txtClientName.value = sTemp;
				document.Main.txtClientName.className = "search_below";
				return false;
			}
		}
		function ChangeChannel() {
			Main.submit();
		}
		function expand(divid, obj, objimg) {
			var divhgt = document.getElementById(divid);
			var hiddenId = document.getElementById(obj);
			var imgctl = document.getElementById(objimg);

			if (hiddenId.value == "COLLAPSED" || hiddenId.value == "") {
				divhgt.style.display = "inline";
				imgctl.innerHTML = "<img src='_images/white_arrow_down.gif' border=0>";
				hiddenId.value = "EXPANDED";
			}
			else {
				divhgt.style.display = "none";
				imgctl.innerHTML = "<img src='_images/blue_arrow_right.gif' border=0>";
				hiddenId.value = "COLLAPSED";
			}
		}
		function getPos() {
			alert(window.screen.height);
			alert(window.screen.availHeight);
		}

		function setPos(e) {
			curEvent = ((typeof event == "undefined") ? e : event);
			//Sets mouse flag as down. 
			mouseButtonPos = "down";
			//Gets position of click. 
			curX = curEvent.clientX;
			//Get the width of the div. 
			var tempWidth = document.getElementById("frmLeft").style.width;
			//Get the width value. 
			var widthArray = tempWidth.split("p");
			//Set the current width. 
			curWidth = parseInt(widthArray[0]);

		}

		var win;
		var intervalID;
		var iIdleTime = parseInt(getCookie("IDLE_TIME_TO_EXPIRE"));

		function CheckSessionTimeout() {

			iIdleTime = iIdleTime - 1;

			var iMins = (iIdleTime - (iIdleTime % 60)) / 60;
			var iSecs = iIdleTime % 60;

			if (parseInt(getCookie("IDLE_TIME_TO_EXPIRE")) > 0) {
				reset_interval();
			}

			//5 min warning
			if (iMins == 5 & iSecs == 0) {
				var winX = (screen.width / 2) - (600 / 2);
				var winY = (screen.height / 2) - (280 / 2);
				var sFeat = "SCROLLBARS=NO, MENUBAR=NO, TOP=" + winY + ", LEFT=" + winX + ", TOOLBAR=NO, RESIZABLE=NO, WIDTH=600, HEIGHT=280";
				win = window.open("/SessionTimeoutReminder.htm", "Alert", sFeat, true);
				return;
			}

			//timeout warning
			if (iMins == 0 & iSecs == 0) {
				clearInterval(intervalID);

				if (win) {
					if (false == win.closed)
						win.close();
				}

				document.location.href = "/login.aspx?SMAUTHREASON=4";
				return;
			}

			setCookie("IDLE_TIME_TO_EXPIRE", "0");

		}

		function reset_interval() {
			clearInterval(intervalID);
			iIdleTime = parseInt(getCookie("IDLE_TIME_TO_EXPIRE"));
			intervalID = window.setInterval("CheckSessionTimeout()", 1000);
		}

		intervalID = window.setInterval("CheckSessionTimeout()", 1000);
		CheckSessionTimeout();

		setCookie("SWUserId", "");

	</script>
</head>

<body>
	<form name="Main" method="post" action="Main.aspx" id="Main">
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
			value="/wEPDwUKMTUwNzExMTM0OA9kFgJmD2QWCAIBDw8WBB4ISW1hZ2VVcmwFGS4vX2ltYWdlcy9CRC9Mb2dvL0NGUy5qcGceC05hdmlnYXRlVXJsBRYvV29ya3N0YXRpb24vTWFpbi5hc3B4ZGQCAw8PFgIfAAUhX2ltYWdlcy9TV0xvZ29fRk5fTUZTX1ZlcnNpb24uZ2lmZGQCBQ9kFgJmDw8WAh4EVGV4dAXPAzxhIGlkPSJfYTAiIGhyZWY9Ii9Xb3Jrc3RhdGlvbi8iIGNsYXNzPSJsaW5rXzAxIlRhcmdldD0nX3RvcCcgPkhvbWU8L2E+Jm5ic3A7fCZuYnNwOzxhIGlkPSJfYTEiIGhyZWY9Ii9Ub3RhbEFjY2Vzcy9BdXRoL3VzZXJwcm9maWxlLmFzcHgiIGNsYXNzPSJsaW5rXzAxIlRhcmdldD0nZnJtQ29udGVudCcgPk15IFByb2ZpbGU8L2E+Jm5ic3A7fCZuYnNwOzxhIGlkPSJfYTIiIGhyZWY9Ii9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0NvbW1vbi5hc3B4P0NvbnRlbnRJZD0yODU5MTQxNyIgY2xhc3M9ImxpbmtfMDEiVGFyZ2V0PSdfQmxhbmsnID5Db250YWN0IFVzPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iX2EzIiBocmVmPSIvbG9nb3V0cGVuZGluZy5hc3B4P1NpdGVJZD1hd3NfMTAxJlBlcnNvblBhcnR5SWQ9NzAwOTIzNCIgY2xhc3M9ImxpbmtfMDEiVGFyZ2V0PSdfcGFyZW50JyA+TG9nIE91dDwvYT4mbmJzcDtkZAIHDxQrAANkBY9/PE1lbnVEYXRhIEltYWdlc0Jhc2VVUkw9Ik1lbnVzLnhtbCIgRGVmYXVsdEdyb3VwQ3NzQ2xhc3M9Ik1lbnVHcm91cCIgRGVmYXVsdEl0ZW1TcGFjaW5nPSIxIiBEZWZhdWx0SXRlbUNzc0NsYXNzPSJNZW51SXRlbSIgRGVmYXVsdEl0ZW1Dc3NDbGFzc092ZXI9Ik1lbnVJdGVtT3ZlciIgRGVmYXVsdEl0ZW1Dc3NDbGFzc0Rvd249Ik1lbnVJdGVtRG93biIgRGVmYXVsdEl0ZW1DaGlsZEV4cGFuZGVkQ3NzQ2xhc3M9Ik1lbnVJdGVtRXhwYW5kZWQiIHhtbG5zPSJBU1AuTkVUIE1lbnUgTWVudURhdGEgU2NoZW1hIj48TWVudUdyb3VwIEl0ZW1TcGFjaW5nPSIwIj48TWVudUl0ZW0gTGFiZWw9IkdvIHRvIEJyb2tlci1EZWFsZXIgQ2VudGVyIiBVUkw9Ii9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0hvbWUuYXNweCIgVVJMVGFyZ2V0PSJfYmxhbmsiIElEPSJHb1RvQkRDZW50ZXIiIFdpZHRoPSIxNjAiIExlZnRJY29uSGVpZ2h0PSIxNSIgSGVpZ2h0PSIyMiI+PC9NZW51SXRlbT48TWVudUl0ZW0gTGFiZWw9IkNvbW1pc3Npb25zIiBXaWR0aD0iODAiIExlZnRJY29uSGVpZ2h0PSIxNSIgSGVpZ2h0PSIyMiI+PE1lbnVHcm91cCBFeHBhbmREaXJlY3Rpb249IlJpZ2h0RG93biIgQ3NzQ2xhc3M9Ik1lbnVTdWJHcm91cCI+PE1lbnVJdGVtIElEPSJTdW1tYXJ5IiBMYWJlbD0iU3VtbWFyeSIgVVJMPSIvVG90YWxBY2Nlc3MvQXV0aC9TdW1tYXJ5LmFzcHgiIFVSTFRhcmdldD0iZnJtQ29udGVudCIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJBbmFseXRpY3MiIExhYmVsPSJBbmFseXRpY3MiIFVSTD0iL1RvdGFsQWNjZXNzL0F1dGgvdGVjaG5vbG9neS9Db21taXNzaW9ucy9jaGFydGluZy9hbmFseXplci5hc3B4IiBVUkxTZWN1cml0eT0iLENGU19IT01FX09GRklDRSxDRlNfUkVHSVNURVJFRF9SRVBSRVNFTlRBVElWRSxDRlNfSU5WRVNURU1FTlRfIEFEVklTRVJfUkVQUkVTRU5UQVRJVkUsIENGU19JTlNVUkFOQ0UsQ0ZTX0VDT01NSVNTSU9OUyxDRlNfUkVGRVJSSU5HIFBBUlRORVIsIiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iU3RhdGVtZW50cyIgTGFiZWw9IlN0YXRlbWVudHMiIFVSTD0iL1RvdGFsQWNjZXNzL0F1dGgvVGVjaG5vbG9neS9Db21taXNzaW9ucy9zdW1tYXJ5LmFzcHgiIFVSTFNlY3VyaXR5PSIsQ0ZTX0hPTUVfT0ZGSUNFLENGU19SRUdJU1RFUkVEX1JFUFJFU0VOVEFUSVZFLENGU19JTlZFU1RFTUVOVF8gQURWSVNFUl9SRVBSRVNFTlRBVElWRSwgQ0ZTX0lOU1VSQU5DRSxDRlNfRUNPTU1JU1NJT05TLENGU19SRUZFUlJJTkcgUEFSVE5FUiwiIFVSTFRhcmdldD0iZnJtQ29udGVudCIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJnb2FsUGxhbm5pbmciIExhYmVsPSJHb2FsIFBsYW5uaW5nIiBVUkw9Ii9Ub3RhbEFjY2Vzcy9BdXRoL3ByYWN0aWNlTWFuYWdlbWVudC9nb2Fsc3BsYW5uaW5nLmFzcHgiIFVSTFNlY3VyaXR5PSIsQ0ZTX0hPTUVfT0ZGSUNFLENGU19FQ09NTUlTU0lPTlMsQ0ZTX0lOU1VSQU5DRSxDRlNfUkVHSVNURVJFRF9SRVBSRVNFTlRBVElWRSxDRlNfSU5WRVNURU1FTlRfIEFEVklTRVJfUkVQUkVTRU5UQVRJVkUsIiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjwvTWVudUdyb3VwPjwvTWVudUl0ZW0+PE1lbnVJdGVtIExhYmVsPSJUb29scyIgV2lkdGg9IjMwIiBIZWlnaHQ9IjIyIj48TWVudUdyb3VwIEV4cGFuZERpcmVjdGlvbj0iUmlnaHREb3duIiBDc3NDbGFzcz0iTWVudVN1Ykdyb3VwIj48TWVudUl0ZW0gSUQ9IkFjY291bnRMaXN0IiBMYWJlbD0iQWNjb3VudCBMaXN0IiBVUkw9Ii9Ub3RhbEFjY2Vzcy9BdXRoL3RlY2hub2xvZ3kvTWFuYWdlZE1vbmV5L0NsaWVudExpc3QuYXNweCIgVVJMU2VjdXJpdHk9IixDRlNfSE9NRV9PRkZJQ0UsQ0ZTX0lOVkVTVEVNRU5UXyBBRFZJU0VSX1JFUFJFU0VOVEFUSVZFLENGU19FQ09NTUlTU0lPTlMsQ0ZTX1NUQVRFTUVOVFMsIiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iQWR2aXNvckNlbnRyYWwiIExhYmVsPSJBZHZpc29yIENlbnRyYWwiIFVSTD0iTGlua0hhbmRsZXIuYXNweD9MaW5rSUQ9NTU4IiBVUkxUYXJnZXQ9Il9ibGFuayIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJBZHZpc29yeSIgTGFiZWw9IkFkdmlzb3J5IiBMZWZ0SWNvbkhlaWdodD0iMTUiIEhlaWdodD0iMjIiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIj48TWVudUdyb3VwIEV4cGFuZERpcmVjdGlvbj0iUmlnaHREb3duIiBDc3NDbGFzcz0iTWVudVN1Ykdyb3VwIj48TWVudUl0ZW0gSUQ9ImVXZWFsdGhNYW5hZ2VyIiBMYWJlbD0iZVdlYWx0aE1hbmFnZXIiIFVSTD0iaHR0cHM6Ly93d3cuZXdlYWx0aG1hbmFnZXIuY29tL2xvZ2luLmFzcCIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iTG9ja3dvb2QiIExhYmVsPSJNYW5hZ2VkIFdlYWx0aCBBZHZhbnRhZ2UiIFVSTD0iL1RvdGFsQWNjZXNzL0F1dGgvVGVjaG5vbG9neS9BZHZpc29yUG9ydFNTTy5hc3B4IiBVUkxTZWN1cml0eT0iLENGU19IT01FX09GRklDRSxDRlNfSU5WRVNURU1FTlRfIEFEVklTRVJfUkVQUkVTRU5UQVRJVkUsQ0ZTX0FTU0lTVEFOVCxDRlNfRUNPTU1JU1NJT05TLCIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iTU1TVHJhZGVSZXF1ZXN0IiBMYWJlbD0iTU1TIFRyYWRlIFJlcXVlc3QiIFVSTD0iL1RvdGFsQWNjZXNzL0F1dGgvVGVjaG5vbG9neS9UcmFkZVJlcXVlc3QvRGVmYXVsdC5hc3B4IiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iUG9ydGZvbGlvQWR2aXNvcnlTZXJ2aWNlcyIgTGFiZWw9IlBvcnRmb2xpbyBBZHZpc29yeSBTZXJ2aWNlcyIgVVJMPSIvVG90YWxBY2Nlc3MvQXV0aC9UZWNobm9sb2d5L01hbmFnZWRNb25leS9Nb25leU1hbmFnZW1lbnRTZXJ2aWNlc0Z1bGwuYXNweCIgVVJMU2VjdXJpdHk9IixDRlNfSE9NRV9PRkZJQ0UsQ0ZTX0lOVkVTVE1FTlRfQURWSVNFUl9SRVBSRVNFTlRBVElWRSxDRlNfRUNPTU1JU1NJT05TLENGU19TVEFURU1FTlRTLCIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjwvTWVudUdyb3VwPjwvTWVudUl0ZW0+PE1lbnVJdGVtIElEPSJBc2hCcm9rZXJhZ2UiIExhYmVsPSJBc2ggQnJva2VyYWdlIiBVUkw9Ii9Ub3RhbEFjY2Vzcy9BdXRoL1RlY2hub2xvZ3kvU1NPL0FzaEJyb2tlcmFnZS5hc3B4IiBVUkxUYXJnZXQ9Il9ibGFuayIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJCdW5kbGVkRm9ybXMiIExhYmVsPSJCdW5kbGVkIEZvcm1zIiBVUkw9Ii9Ub3RhbEFjY2Vzcy9BdXRoL2Zvcm1zL2J1bmRsZWRmb3Jtcy5hc3B4IiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iQ1JNVE9PTCIgTGFiZWw9IkNSTSBJbnRlZ3JhdGlvbiIgVVJMPSIvQ1JNVG9vbC9VcGxvYWRGaWxlLmFzcHgiIFVSTFRhcmdldD0iZnJtQ29udGVudCIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJEU1RWSVNJT04iIExhYmVsPSJEU1QgVmlzaW9uIiBVUkw9Ii9Ub3RhbEFjY2Vzcy9BdXRoL1RlY2hub2xvZ3kvZHN0dmlzaW9ubG9naW4uYXNweCIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iTWFya2V0aW5nQWR2YW50YWdlIiBMYWJlbD0iTWFya2V0aW5nIEFkdmFudEVER0UiIFVSTD0iL1RvdGFsQWNjZXNzL0F1dGgvU2FsZXNNYXJrZXRpbmcvQWR2YW50RWRnZS5hc3B4IiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iTUZFeHBlbnNlQW5hbHl6ZXIiIExhYmVsPSJNRiBFeHBlbnNlIEFuYWx5emVyIiBVUkw9IkxpbmtIYW5kbGVyLmFzcHg/TGlua0lEPTU4NCIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iTXN0YXIiIExhYmVsPSJNb3JuaW5nc3RhciBBV1MiIFVSTD0iaHR0cHM6Ly93d3cubW9ybmluZ3N0YXIuY29tL2Fkdmlzb3IiIFVSTFRhcmdldD0iX2JsYW5rIiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9Ik1zdGFyUG9ydGZvbGlvIFNuYXBzaG90IiBMYWJlbD0iTW9ybmluZ3N0YXIgUG9ydGZvbGlvIFNuYXBzaG90IiBVUkw9IlNTTy9NU3Rhci9Qb3J0Zm9saW9TbmFwc2hvdC5hc3B4IiBDbGllbnRTaWRlT25DbGljaz0iamF2YXNjcmlwdDpJY29uQ2xpY2soJ1BvcnRmb2xpb1NuYXBzaG90JywnMCcpIiBVUkxUYXJnZXQ9Il9ibGFuayIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJQb3J0Zm9saW9BY2Nlc3MiIExhYmVsPSJQb3J0Zm9saW8gQWNjZXNzIiBVUkw9Ii9Ub3RhbEFjY2Vzcy9BdXRoL1RlY2hub2xvZ3kvaW52ZXN0aWdvLmFzcHgiIFVSTFNlY3VyaXR5PSIsQ0ZTX0hPTUVfT0ZGSUNFLENGU19SRUdJU1RFUkVEX1JFUFJFU0VOVEFUSVZFLENGU19JTlZFU1RFTUVOVF8gQURWSVNFUl9SRVBSRVNFTlRBVElWRSwgQ0ZTX0lOU1VSQU5DRSxDRlNfRUNPTU1JU1NJT05TLENGU19BU1NJU1RBTlQsIiBVUkxUYXJnZXQ9Il9ibGFuayIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJSZXBFbWFpbCIgTGFiZWw9IlJlcCBFbWFpbCIgVVJMPSIvVG90YWxBY2Nlc3MvQXV0aC9UZWNobm9sb2d5L0VtYWlsLmFzcHgiIFVSTFRhcmdldD0iZnJtQ29udGVudCIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJGb2xpbyIgTGFiZWw9IlNtYXJ0V29ya3MgQWR2aXNlciIgTGVmdEljb25IZWlnaHQ9IjE1IiBIZWlnaHQ9IjIyIiBVUkxTZWN1cml0eT0iLEZPTElPRFlOQU1JWCwiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIj48TWVudUdyb3VwIEV4cGFuZERpcmVjdGlvbj0iUmlnaHREb3duIiBDc3NDbGFzcz0iTWVudVN1Ykdyb3VwIj48TWVudUl0ZW0gSUQ9IkRhc2hib2FyZCIgTGFiZWw9IkRhc2hib2FyZCIgVVJMPSIvU1NPL1NBTUwyMC9EZWZhdWx0LmFzcHg/SWQ9MSZhbXA7Q29kZT1UR0Z1WkdsdVp6MD0iIENsaWVudFNpZGVPbkNsaWNrPSJqYXZhc2NyaXB0Om9wZW5XaW5kb3dSZXNpemFibGVDZW50ZXIoJy9TU08vU0FNTDIwL0RlZmF1bHQuYXNweD9JZD0xJmFtcDtDb2RlPVRHRnVaR2x1WnowPScsJ0ZvbGlvRHgnLCc3NTAnLCc0MDAnKSIgVVJMVGFyZ2V0PSJGb2xpb0R4IiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9IlByb3Bvc2FsIiBMYWJlbD0iUHJvcG9zYWwiIFVSTD0iL1NTTy9TQU1MMjAvRGVmYXVsdC5hc3B4P0lkPTEmYW1wO0NvZGU9VEdGdVpHbHVaejFRY205d2IzTmhiRWRsYm1WeVlYUnBiMjQ9IiBDbGllbnRTaWRlT25DbGljaz0iamF2YXNjcmlwdDpvcGVuV2luZG93UmVzaXphYmxlQ2VudGVyKCcvU1NPL1NBTUwyMC9EZWZhdWx0LmFzcHg/SWQ9MSZhbXA7Q29kZT1UR0Z1WkdsdVp6MVFjbTl3YjNOaGJFZGxibVZ5WVhScGIyND0nLCdGb2xpb0R4JywnNzUwJywnNDAwJykiIFVSTFRhcmdldD0iRm9saW9EeCIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJSZWJhbGFuY2luZyIgTGFiZWw9IlRyYWRpbmcgVG9vbHMiIFVSTD0iL1NTTy9TQU1MMjAvRGVmYXVsdC5hc3B4P0lkPTEmYW1wO0NvZGU9VEdGdVpHbHVaejFVY21Ga2FXNW5WRzl2YkhNPSIgQ2xpZW50U2lkZU9uQ2xpY2s9ImphdmFzY3JpcHQ6b3BlbldpbmRvd1Jlc2l6YWJsZUNlbnRlcignL1NTTy9TQU1MMjAvRGVmYXVsdC5hc3B4P0lkPTEmYW1wO0NvZGU9VEdGdVpHbHVaejFVY21Ga2FXNW5WRzl2YkhNPScsJ0ZvbGlvRHgnLCc3NTAnLCc0MDAnKSIgVVJMVGFyZ2V0PSJGb2xpb0R4IiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9Ik1vZGVsIiBMYWJlbD0iTW9kZWwiIFVSTD0iL1NTTy9TQU1MMjAvRGVmYXVsdC5hc3B4P0lkPTEmYW1wO0NvZGU9VEdGdVpHbHVaejFOYjJSbGJHbHVadz09IiBDbGllbnRTaWRlT25DbGljaz0ib3BlbldpbmRvd1Jlc2l6YWJsZUNlbnRlcignL1NTTy9TQU1MMjAvRGVmYXVsdC5hc3B4P0lkPTEmYW1wO0NvZGU9VEdGdVpHbHVaejFOYjJSbGJHbHVadz09JywnRm9saW9EeCcsJzc1MCcsJzQwMCcpIiBVUkxUYXJnZXQ9IkZvbGlvRHgiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iQWNjb3VudCBMaXN0IiBMYWJlbD0iQWNjb3VudCBMaXN0IiBVUkw9Ii9TU08vU0FNTDIwL0RlZmF1bHQuYXNweD9JZD0xJmFtcDtDb2RlPVRHRnVaR2x1WnoxQlkyTnZkVzUwVTNSaGRIVnoiIENsaWVudFNpZGVPbkNsaWNrPSJqYXZhc2NyaXB0Om9wZW5XaW5kb3dSZXNpemFibGVDZW50ZXIoJy9TU08vU0FNTDIwL0RlZmF1bHQuYXNweD9JZD0xJmFtcDtDb2RlPVRHRnVaR2x1WnoxQlkyTnZkVzUwVTNSaGRIVnonLCdGb2xpb0R4JywnNzUwJywnNDAwJykiIFVSTFRhcmdldD0iRm9saW9EeCIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJSZXBvcnRzIiBMYWJlbD0iUmVwb3J0cyIgVVJMPSIvU1NPL1NBTUwyMC9EZWZhdWx0LmFzcHg/SWQ9MSZhbXA7Q29kZT1UR0Z1WkdsdVp6MVNaWEJ2Y25SelEyVnVkR1Z5IiBDbGllbnRTaWRlT25DbGljaz0iamF2YXNjcmlwdDpvcGVuV2luZG93UmVzaXphYmxlQ2VudGVyKCcvU1NPL1NBTUwyMC9EZWZhdWx0LmFzcHg/SWQ9MSZhbXA7Q29kZT1UR0Z1WkdsdVp6MVNaWEJ2Y25SelEyVnVkR1Z5JywnRm9saW9EeCcsJzc1MCcsJzQwMCcpIiBVUkxUYXJnZXQ9IkZvbGlvRHgiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjwvTWVudUdyb3VwPjwvTWVudUl0ZW0+PE1lbnVJdGVtIElEPSJTdG9ja1NjcmVlbmVyIiBMYWJlbD0iU3RvY2sgU2NyZWVuZXIiIFVSTD0iL1dvcmtzdGF0aW9uL1NjcmVlbmVyLmh0bWwiIFVSTFRhcmdldD0iX2JsYW5rIiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9Ik1hcmtldFBsYWNlIiBMYWJlbD0iU3VjY2Vzc2lvbiBQbGFubmluZyAtIE1hcmtldHBsYWNlIiBVUkw9Ii9Ub3RhbEFjY2Vzcy9BdXRoL1ByYWN0aWNlTWFuYWdlbWVudC9NYXJrZXRwbGFjZS9NYXJrZXRwbGFjZS5hc3B4IiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iVkFDb21wYXJpc29uIiBMYWJlbD0iVkEgQ29tcGFyaXNvbiIgVVJMPSIvVG90YWxBY2Nlc3MvQXV0aC9Qcm9kdWN0cy9WYXJpYWJsZUFubnVpdGllcy9kZWZhdWx0LmFzcHgiIFVSTFRhcmdldD0iX2JsYW5rIiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48L01lbnVHcm91cD48L01lbnVJdGVtPjxNZW51SXRlbSBMYWJlbD0iQnJva2VyYWdlIFRvb2xzIiBXaWR0aD0iOTUiIExlZnRJY29uSGVpZ2h0PSIxNSIgSGVpZ2h0PSIyMiI+PE1lbnVHcm91cCBFeHBhbmREaXJlY3Rpb249IlJpZ2h0RG93biIgQ3NzQ2xhc3M9Ik1lbnVTdWJHcm91cCI+PE1lbnVJdGVtIElEPSJQcmltZVZlc3RGaXhlZEluY29tZSIgTGFiZWw9IkNldGVyYSBJbnZlc3RtZW50IFNlcnZpY2VzIEZpeGVkIEluY29tZSBUcmFkaW5nIiBVUkw9IkxpbmtIYW5kbGVyLmFzcHg/TGlua0lEPTE0IiBVUkxUYXJnZXQ9IkFXU19QVl9GSVhFRF9JTkNPTUVfVFJBRElORyIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJOZXRYUHJvQ09NIiBMYWJlbD0id3d3Lm5ldHgzNjAuY29tIiBVUkw9IkxpbmtIYW5kbGVyLmFzcHg/TGlua0lEPTU1OSIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjwvTWVudUdyb3VwPjwvTWVudUl0ZW0+PE1lbnVJdGVtIExhYmVsPSJTZWFyY2giIFdpZHRoPSI0MCIgTGVmdEljb25IZWlnaHQ9IjE1IiBIZWlnaHQ9IjIyIj48TWVudUdyb3VwIEV4cGFuZERpcmVjdGlvbj0iUmlnaHREb3duIiBDc3NDbGFzcz0iTWVudVN1Ykdyb3VwIj48TWVudUl0ZW0gSUQ9IkFjY291bnRzIiBMYWJlbD0iQWNjb3VudHMiIFVSTD0iQWNjb3VudFNlYXJjaC5hc3B4IiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iQ29udGFjdHMiIExhYmVsPSJDb250YWN0cyIgVVJMPSJDbGllbnRTZWFyY2guYXNweCIgVVJMVGFyZ2V0PSJmcm1Db250ZW50IiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9IkZvcm1zQ2VudHJhbCIgTGFiZWw9IkZvcm1zIiBVUkw9IkxpbmtIYW5kbGVyLmFzcHg/TGlua0lEPTU3IiBVUkxUYXJnZXQ9Il9ibGFuayIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJQb3NpdGlvbnMiIExhYmVsPSJQb3NpdGlvbnMiIFVSTD0iUG9zaXRpb25TZWFyY2guYXNweCIgVVJMVGFyZ2V0PSJmcm1Db250ZW50IiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9IlByb2ZpbGVNYW5hZ2VyIiBMYWJlbD0iUHJvZmlsZSBNYW5hZ2VyIiBVUkw9Ii9Qcm9maWxlTWFuYWdlci9TZWFyY2gvUGVyc29uU2VhcmNoLmFzcHgiIFVSTFRhcmdldD0iZnJtQ29udGVudCIgVVJMU2VjdXJpdHk9IixJc0FkbWluaXN0cmF0b3IsSXNCT1AsIiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9IlFSUCIgTGFiZWw9IlFSUCBTcG9uc29yIEluZm9ybWF0aW9uIiBVUkw9Ii9RUlAvUVJQTGlzdGluZy5hc3B4IiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iQkRDZW50ZXIiIExhYmVsPSJTZWFyY2ggQnJva2VyLURlYWxlciBDZW50ZXIiIFVSTD0iTGlua0hhbmRsZXIuYXNweD9MaW5rSUQ9MTgiIFVSTFRhcmdldD0iX2JsYW5rIiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48L01lbnVHcm91cD48L01lbnVJdGVtPjxNZW51SXRlbSBMYWJlbD0iUXVpY2sgTGlua3MiIFdpZHRoPSI3MCIgTGVmdEljb25IZWlnaHQ9IjE1IiBIZWlnaHQ9IjIyIj48TWVudUdyb3VwIEV4cGFuZERpcmVjdGlvbj0iUmlnaHREb3duIiBDc3NDbGFzcz0iTWVudVN1Ykdyb3VwIj48TWVudUl0ZW0gSUQ9IkFkdmlzZXJSZWZlcnJhbFByb2dyYW0iIExhYmVsPSJBZHZpc29yIFJlZmVycmFsIFByb2dyYW0iIFVSTD0iL1RvdGFsQWNjZXNzL0F1dGgvT3BlcmF0aW9ucy9yZXByZWZlcnJhbHNmb3JtLmFzcHgiIFVSTFRhcmdldD0iZnJtQ29udGVudCIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJBcHByb3ZlZFByb2R1Y3RMaXN0IiBMYWJlbD0iQXBwcm92ZWQgUHJvZHVjdCBMaXN0cyIgVVJMPSJMaW5rSGFuZGxlci5hc3B4P0xpbmtJRD02MDAiIFVSTFRhcmdldD0iX2JsYW5rIiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9IkNvbm5lY3QyQ2xpZW50cyIgTGFiZWw9IkNvbm5lY3QyQ2xpZW50cyIgVVJMPSJMaW5rSGFuZGxlci5hc3B4P0xpbmtJRD01NDkiIFVSTFRhcmdldD0iX2JsYW5rIiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9Ik1hcmtldGluZ0NlbnRlciIgTGFiZWw9Ik1hcmtldGluZyBDZW50ZXIiIFVSTD0iTGlua0hhbmRsZXIuYXNweD9MaW5rSUQ9NTYyIiBVUkxUYXJnZXQ9Il9ibGFuayIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJSZXNlYXJjaElOU0lURSIgTGFiZWw9IlJlc2VhcmNoIEluc2l0ZSIgVVJMPSJMaW5rSGFuZGxlci5hc3B4P0xpbmtJRD01NjMiIFVSTFRhcmdldD0iX2JsYW5rIiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9IlN0cmF0ZWdpY1BhcnRuZXJzIiBMYWJlbD0iU3RyYXRlZ2ljIFBhcnRuZXJzIiBVUkw9IkxpbmtIYW5kbGVyLmFzcHg/TGlua0lEPTU2NyIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjwvTWVudUdyb3VwPjwvTWVudUl0ZW0+PE1lbnVJdGVtIExhYmVsPSJDb21wbGlhbmNlIiBXaWR0aD0iNjAiIExlZnRJY29uSGVpZ2h0PSIxNSIgSGVpZ2h0PSIyMiI+PE1lbnVHcm91cCBFeHBhbmREaXJlY3Rpb249IlJpZ2h0RG93biIgQ3NzQ2xhc3M9Ik1lbnVTdWJHcm91cCI+PE1lbnVJdGVtIElEPSJDb21wbGlhbmNlT3ZlcnZpZXciIExhYmVsPSJDb21wbGlhbmNlIE92ZXJ2aWV3IiBVUkw9IkxpbmtIYW5kbGVyLmFzcHg/TGlua0lEPTU2NCIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iR0UiIExhYmVsPSJHaWZ0ICZhbXA7IEVudGVydGFpbm1lbnQgVHJhY2tlciIgVVJMPSIvVG90YWxBY2Nlc3MvQXV0aC9nZXQvZ2V0aG9tZS5hc3B4IiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iQWRSZXZpZXciIExhYmVsPSJSZXZpZXcgb2YgQ29tbXVuaWNhdGlvbnMiIFVSTD0iL1RvdGFsQWNjZXNzL0F1dGgvQ29tcGxpYW5jZS9BZFJldmlldy5hc3B4IiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iQ01hbnVhbHMiIExhYmVsPSJTdXBlcnZpc29yeSAmYW1wOyBDb21wbGlhbmNlIE1hbnVhbHMgIiBVUkw9IkxpbmtIYW5kbGVyLmFzcHg/TGlua0lEPTU2MSIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjwvTWVudUdyb3VwPjwvTWVudUl0ZW0+PE1lbnVJdGVtIExhYmVsPSJUcmFpbmluZyIgV2lkdGg9IjQ1IiBMZWZ0SWNvbkhlaWdodD0iMTUiIEhlaWdodD0iMjIiPjxNZW51R3JvdXAgRXhwYW5kRGlyZWN0aW9uPSJSaWdodERvd24iIENzc0NsYXNzPSJNZW51U3ViR3JvdXAiPjxNZW51SXRlbSBJRD0iVEFkdmlzb3J5IiBMYWJlbD0iQWR2aXNvcnkiIFVSTD0iTGlua0hhbmRsZXIuYXNweD9MaW5rSUQ9NTA0IiBVUkxUYXJnZXQ9Il9ibGFuayIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJCcm93c2VTZWFyY2giIExhYmVsPSJCcm93c2Ugb3IgU2VhcmNoIiBVUkw9IkxpbmtIYW5kbGVyLmFzcHg/TGlua0lEPTUwNSIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iQ2xpY2tQbGF5IiBMYWJlbD0iQ2xpY2sgJ24gUGxheSBMaWJyYXJ5IiBVUkw9IkxpbmtIYW5kbGVyLmFzcHg/TGlua0lEPTUwNiIgVVJMVGFyZ2V0PSJfYmxhbmsiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iY0VkdWNhdGlvbiIgTGFiZWw9IkNvbnRpbnVpbmcgRWR1Y2F0aW9uIiBVUkw9Ii9Ub3RhbEFjY2Vzcy9hdXRoL3RlY2hub2xvZ3kvY2UvaG9tZS5hc3B4IiBVUkxUYXJnZXQ9ImZybUNvbnRlbnQiIEhlaWdodD0iMjEiIENzc0NsYXNzPSJTdWJNZW51SXRlbSIgQ3NzQ2xhc3NPdmVyPSJTdWJNZW51SXRlbU92ZXIiIENzc0NsYXNzRG93bj0iU3ViTWVudUl0ZW1Eb3duIiAvPjxNZW51SXRlbSBJRD0iTkV4Y2hhbmdlUHJvIiBMYWJlbD0iTmV0WDM2MCIgVVJMPSJMaW5rSGFuZGxlci5hc3B4P0xpbmtJRD01MzIiIFVSTFRhcmdldD0iX2JsYW5rIiBIZWlnaHQ9IjIxIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48TWVudUl0ZW0gSUQ9IkxNUyIgTGFiZWw9IlNtYXJ0V29ya3MgTGVhcm5pbmcgQ2VudGVyIiBVUkw9Ii9TU08vU0FNTDIwL0RlZmF1bHQuYXNweD9JZD03IiBVUkxUYXJnZXQ9Il9ibGFuayIgSGVpZ2h0PSIyMSIgQ3NzQ2xhc3M9IlN1Yk1lbnVJdGVtIiBDc3NDbGFzc092ZXI9IlN1Yk1lbnVJdGVtT3ZlciIgQ3NzQ2xhc3NEb3duPSJTdWJNZW51SXRlbURvd24iIC8+PE1lbnVJdGVtIElEPSJGRFhUcmFpbmluZyIgTGFiZWw9IlNtYXJ0V29ya3MgQWR2aXNlciBDZXJ0aWZpY2F0aW9uIiBVUkw9Ii9JQU5fU1NPL0ZvbGlvL3RyYWluaW5nLmFzcHgiIFVSTFRhcmdldD0iZnJtQ29udGVudCIgSGVpZ2h0PSIyMSIgVVJMU2VjdXJpdHk9IixGT0xJT0RZTkFNSVgsIiBDc3NDbGFzcz0iU3ViTWVudUl0ZW0iIENzc0NsYXNzT3Zlcj0iU3ViTWVudUl0ZW1PdmVyIiBDc3NDbGFzc0Rvd249IlN1Yk1lbnVJdGVtRG93biIgLz48L01lbnVHcm91cD48L01lbnVJdGVtPjxNZW51SXRlbSBMYWJlbD0iIiBXaWR0aD0iMjI3IiBMZWZ0SWNvbkhlaWdodD0iMTUiIEhlaWdodD0iMjIiIENzc0NsYXNzT3Zlcj0iTWVudUl0ZW1fTm90SW5Vc2UiIENzc0NsYXNzRG93bj0iTWVudUl0ZW1fTm90SW5Vc2UiPjwvTWVudUl0ZW0+PC9NZW51R3JvdXA+PC9NZW51RGF0YT4XDQUTRGVmYXVsdEl0ZW1Dc3NDbGFzcwUITWVudUl0ZW0FFENsaWVudFNjcmlwdExvY2F0aW9uBQ1fSmF2YVNjcmlwdHMvBRJIaWRlU2VsZWN0RWxlbWVudHNnBSBEZWZhdWx0SXRlbUNoaWxkRXhwYW5kZWRDc3NDbGFzcwUQTWVudUl0ZW1FeHBhbmRlZAUURGVmYXVsdEdyb3VwQ3NzQ2xhc3MFCU1lbnVHcm91cAUSRGVmYXVsdEl0ZW1TcGFjaW5nAgEFDUltYWdlc0Jhc2VVUkwFCU1lbnVzLnhtbAUXRGVmYXVsdEl0ZW1Dc3NDbGFzc0Rvd24FDE1lbnVJdGVtRG93bgULRXhwYW5kRGVsYXlmBQlNZW51U3R5bGVmBQhNZW51RGF0YQUZWE1MXFRvcE1lbnVcQ0ZTX01lbnVzLnhtbAUXRGVmYXVsdEl0ZW1Dc3NDbGFzc092ZXIFDE1lbnVJdGVtT3ZlcgUMRXhwYW5kRWZmZWN0ZmRk2R/VUFiRSQ+ccNJBewPyBZkwlvHiYlo15S7+yudWpS4=" />

		<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
		<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
		<table width="1002" height="100%" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="15">&nbsp;</td>
				<td width="972">
					<table width="100%" cellspacing="0" cellpadding="0">
						<tr>
							<td height="5" colspan="3"></td>
						</tr>
						<tr>
							<td width="58%" style="PADDING-LEFT:3px"><a id="hypLogo" href="/Workstation/Main.aspx"><img
										src="./_images/BD/Logo/CFS.jpg" alt="" border="0" /></a></td>
							<td width="20%" valign="bottom">&nbsp;</td>
							<td width="22%" align="right" valign="bottom"><img id="imgLogo" src="_images/SWLogo_FN_MFS_Version.gif"
									border="0" /></td>
						</tr>
						<tr>
							<td height="5" colspan="3" bgcolor="#ada794" style="PADDING-LEFT:3px"></td>
						</tr>
						<tr height="20">
							<td valign="top" class="links_01" style="PADDING-TOP:2px"><span id="pnlMainMenu"><span id="lblMainMenu"
										style="width:100%;"><a id="_a0" href="/Workstation/" class="link_01"
											Target='_top'>Home</a>&nbsp;|&nbsp;<a id="_a1" href="/TotalAccess/Auth/userprofile.aspx"
											class="link_01" Target='frmContent'>My Profile</a>&nbsp;|&nbsp;<a id="_a2"
											href="/BrokerDealerCenter/Portal/Common.aspx?ContentId=28591417" class="link_01"
											Target='_Blank'>Contact Us</a>&nbsp;|&nbsp;<a id="_a3"
											href="/logoutpending.aspx?SiteId=aws_101&PersonPartyId=7009234" class="link_01"
											Target='_parent'>Log Out</a>&nbsp;</span></span></td>
							<td valign="center" align="right" colspan="2">
								<table>
									<tr>
										<td nowrap><A class="send" href="javascript:NewContact();">New Contact</A>&nbsp;<label
												class="pipe">|</label></td>
										<td><INPUT class="search_below" value="Last Name: [% = wildcard]"
												onblur="javascript:contactSearchOnLostFocus();" onfocus="javascript:contactSearchOnFocus();"
												onkeypress="javascript:if(window.event.keyCode == 13){return ClientSearch();}" type="text"
												maxLength="20" name="txtClientName" style="WIDTH: 130px; HEIGHT: 18px" size="21"></td>
										<td><A class="send" onmouseout="this.style.textDecoration='none';"
												onmouseover="this.style.textDecoration='underline';"
												onclick="javascript:return ClientSearch();">Contact
												Search</A></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="15">&nbsp;</td>
			</tr>
			<tr height="90%">
				<td valign="top">
				</td>
				<td>
					<table width="100%" height="98%" border="0">
						<tr>
							<td colspan="3" valign="top">
								<div id="TopMenu" style="height:22px;">
									<table class="MenuGroup" cellspacing="0" id="TopMenug1" height="100%" cellpadding="0" border="0"
										onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug1&#39;, null, null, 0);"
										style="z-index:999;">
										<tr>
											<td class="MenuItem" onmousemove="return false;" ondblclick="return false;"
												onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui1&#39;, &#39;MenuItemOver&#39;);"
												onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui1&#39;, &#39;MenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
												onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui1&#39;, &#39;MenuItemDown&#39;);"
												onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui1&#39;, &#39;MenuItemOver&#39;);"
												onclick="aspnm_hideAllGroups();window.open(&#39;/BrokerDealerCenter/Portal/Home.aspx&#39;,&#39;_blank&#39;);"
												width="160" height="22" id="TopMenui1">Go to Broker-Dealer Center</td>
											<td class="MenuItem" onmousemove="return false;" ondblclick="return false;"
												onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui2&#39;, &#39;MenuItemOver&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOver(&#39;TopMenui2&#39;, &#39;TopMenug2&#39;, &#39;belowleft&#39;, 0, 0, 0, null);"
												onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui2&#39;, &#39;MenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOut(&#39;TopMenui2&#39;, &#39;TopMenug1&#39;, &#39;TopMenug2&#39;, 0, null);"
												onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui2&#39;, &#39;MenuItemDown&#39;);"
												onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui2&#39;, &#39;MenuItemOver&#39;);"
												width="80" height="22" id="TopMenui2">Commissions</td>
											<td class="MenuItem" onmousemove="return false;" ondblclick="return false;"
												onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui7&#39;, &#39;MenuItemOver&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOver(&#39;TopMenui7&#39;, &#39;TopMenug3&#39;, &#39;belowleft&#39;, 0, 0, 0, null);"
												onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui7&#39;, &#39;MenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOut(&#39;TopMenui7&#39;, &#39;TopMenug1&#39;, &#39;TopMenug3&#39;, 0, null);"
												onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui7&#39;, &#39;MenuItemDown&#39;);"
												onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui7&#39;, &#39;MenuItemOver&#39;);"
												width="30" height="22" id="TopMenui7">Tools</td>
											<td class="MenuItem" onmousemove="return false;" ondblclick="return false;"
												onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui35&#39;, &#39;MenuItemOver&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOver(&#39;TopMenui35&#39;, &#39;TopMenug6&#39;, &#39;belowleft&#39;, 0, 0, 0, null);"
												onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui35&#39;, &#39;MenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOut(&#39;TopMenui35&#39;, &#39;TopMenug1&#39;, &#39;TopMenug6&#39;, 0, null);"
												onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui35&#39;, &#39;MenuItemDown&#39;);"
												onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui35&#39;, &#39;MenuItemOver&#39;);"
												width="95" height="22" id="TopMenui35">Brokerage Tools</td>
											<td class="MenuItem" onmousemove="return false;" ondblclick="return false;"
												onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui38&#39;, &#39;MenuItemOver&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOver(&#39;TopMenui38&#39;, &#39;TopMenug7&#39;, &#39;belowleft&#39;, 0, 0, 0, null);"
												onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui38&#39;, &#39;MenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOut(&#39;TopMenui38&#39;, &#39;TopMenug1&#39;, &#39;TopMenug7&#39;, 0, null);"
												onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui38&#39;, &#39;MenuItemDown&#39;);"
												onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui38&#39;, &#39;MenuItemOver&#39;);"
												width="40" height="22" id="TopMenui38">Search</td>
											<td class="MenuItem" onmousemove="return false;" ondblclick="return false;"
												onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui46&#39;, &#39;MenuItemOver&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOver(&#39;TopMenui46&#39;, &#39;TopMenug8&#39;, &#39;belowleft&#39;, 0, 0, 0, null);"
												onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui46&#39;, &#39;MenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOut(&#39;TopMenui46&#39;, &#39;TopMenug1&#39;, &#39;TopMenug8&#39;, 0, null);"
												onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui46&#39;, &#39;MenuItemDown&#39;);"
												onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui46&#39;, &#39;MenuItemOver&#39;);"
												width="70" height="22" id="TopMenui46">Quick Links</td>
											<td class="MenuItem" onmousemove="return false;" ondblclick="return false;"
												onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui53&#39;, &#39;MenuItemOver&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOver(&#39;TopMenui53&#39;, &#39;TopMenug9&#39;, &#39;belowleft&#39;, 0, 0, 0, null);"
												onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui53&#39;, &#39;MenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOut(&#39;TopMenui53&#39;, &#39;TopMenug1&#39;, &#39;TopMenug9&#39;, 0, null);"
												onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui53&#39;, &#39;MenuItemDown&#39;);"
												onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui53&#39;, &#39;MenuItemOver&#39;);"
												width="60" height="22" id="TopMenui53">Compliance</td>
											<td class="MenuItem" onmousemove="return false;" ondblclick="return false;"
												onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui58&#39;, &#39;MenuItemOver&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOver(&#39;TopMenui58&#39;, &#39;TopMenug10&#39;, &#39;belowleft&#39;, 0, 0, 0, null);"
												onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui58&#39;, &#39;MenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOut(&#39;TopMenui58&#39;, &#39;TopMenug1&#39;, &#39;TopMenug10&#39;, 0, null);"
												onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui58&#39;, &#39;MenuItemDown&#39;);"
												onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui58&#39;, &#39;MenuItemOver&#39;);"
												width="45" height="22" id="TopMenui58">Training</td>
											<td class="MenuItem" onmousemove="return false;" ondblclick="return false;"
												onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui66&#39;, &#39;MenuItem_NotInUse&#39;);"
												onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui66&#39;, &#39;MenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
												onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui66&#39;, &#39;MenuItem_NotInUse&#39;);"
												onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui66&#39;, &#39;MenuItem_NotInUse&#39;);"
												width="227" height="22" id="TopMenui66"></td>
										</tr>
									</table>
									<div id="TopMenusubgs">
										<table class="MenuSubGroup" cellspacing="1" id="TopMenug2" cellpadding="0" border="0"
											onmouseover="aspnm_groupMsOver(&#39;TopMenug2&#39;)"
											onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug2&#39;, &#39;TopMenui2&#39;, &#39;TopMenug1&#39;, 0, null);"
											style="z-index:999;position:absolute;visibility:hidden;z-index:999;left:0px;top:0px;">
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui3&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui3&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui3&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui3&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Summary.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui3">Summary</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui4&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui4&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui4&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui4&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/technology/Commissions/charting/analyzer.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui4">Analytics</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui5&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui5&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui5&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui5&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Technology/Commissions/summary.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui5">Statements</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui6&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui6&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui6&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui6&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/practiceManagement/goalsplanning.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui6">Goal Planning</td>
											</tr>
										</table>
										<table class="MenuSubGroup" cellspacing="1" id="TopMenug3" cellpadding="0" border="0"
											onmouseover="aspnm_groupMsOver(&#39;TopMenug3&#39;)"
											onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug3&#39;, &#39;TopMenui7&#39;, &#39;TopMenug1&#39;, 0, null);"
											style="z-index:999;position:absolute;visibility:hidden;z-index:999;left:0px;top:0px;">
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui8&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui8&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui8&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui8&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/technology/ManagedMoney/ClientList.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui8">Account List</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui9&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui9&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui9&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui9&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=558&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui9">Advisor Central</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui10&#39;, &#39;SubMenuItemOver&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOver(&#39;TopMenui10&#39;, &#39;TopMenug4&#39;, &#39;rightdown&#39;, 0, 0, 0, null);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui10&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOut(&#39;TopMenui10&#39;, &#39;TopMenug3&#39;, &#39;TopMenug4&#39;, 0, null);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui10&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui10&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="__doPostBack(&#39;TopMenu&#39;,&#39;Advisory&#39;)" height="22" id="TopMenui10">
													Advisory</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui15&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui15&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui15&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui15&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Technology/SSO/AshBrokerage.aspx&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui15">Ash Brokerage</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui16&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui16&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui16&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui16&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/forms/bundledforms.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui16">Bundled Forms</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui17&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui17&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui17&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui17&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/CRMTool/UploadFile.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui17">CRM Integration</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui18&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui18&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui18&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui18&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Technology/dstvisionlogin.aspx&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui18">DST Vision</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui19&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui19&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui19&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui19&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/SalesMarketing/AdvantEdge.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui19">Marketing AdvantEDGE</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui20&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui20&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui20&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui20&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=584&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui20">MF Expense Analyzer</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui21&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui21&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui21&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui21&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;https://www.morningstar.com/advisor&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui21">Morningstar AWS</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui22&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui22&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui22&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui22&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();javascript:IconClick(&#39;PortfolioSnapshot&#39;,&#39;0&#39;)"
													height="21" id="TopMenui22">Morningstar Portfolio Snapshot</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui23&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui23&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui23&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui23&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Technology/investigo.aspx&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui23">Portfolio Access</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui24&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui24&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui24&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui24&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Technology/Email.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui24">Rep Email</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui25&#39;, &#39;SubMenuItemOver&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOver(&#39;TopMenui25&#39;, &#39;TopMenug5&#39;, &#39;rightdown&#39;, 0, 0, 0, null);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui25&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);if (document.readyState == &#39;complete&#39;) aspnm_itemMsOut(&#39;TopMenui25&#39;, &#39;TopMenug3&#39;, &#39;TopMenug5&#39;, 0, null);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui25&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui25&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="__doPostBack(&#39;TopMenu&#39;,&#39;Folio&#39;)" height="22" id="TopMenui25">
													SmartWorks Adviser</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui32&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui32&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui32&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui32&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/Workstation/Screener.html&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui32">Stock Screener</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui33&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui33&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui33&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui33&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/PracticeManagement/Marketplace/Marketplace.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui33">Succession Planning - Marketplace</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui34&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui34&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui34&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui34&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Products/VariableAnnuities/default.aspx&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui34">VA Comparison</td>
											</tr>
										</table>
										<table class="MenuSubGroup" cellspacing="1" id="TopMenug4" cellpadding="0" border="0"
											onmouseover="aspnm_groupMsOver(&#39;TopMenug4&#39;)"
											onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug4&#39;, &#39;TopMenui10&#39;, &#39;TopMenug3&#39;, 0, null);"
											style="z-index:999;position:absolute;visibility:hidden;z-index:999;left:0px;top:0px;">
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui11&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui11&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui11&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui11&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;https://www.ewealthmanager.com/login.asp&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui11">eWealthManager</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui12&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui12&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui12&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui12&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Technology/AdvisorPortSSO.aspx&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui12">Managed Wealth Advantage</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui13&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui13&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui13&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui13&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Technology/TradeRequest/Default.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui13">MMS Trade Request</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui14&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui14&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui14&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui14&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Technology/ManagedMoney/MoneyManagementServicesFull.aspx&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui14">Portfolio Advisory Services</td>
											</tr>
										</table>
										<table class="MenuSubGroup" cellspacing="1" id="TopMenug5" cellpadding="0" border="0"
											onmouseover="aspnm_groupMsOver(&#39;TopMenug5&#39;)"
											onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug5&#39;, &#39;TopMenui25&#39;, &#39;TopMenug3&#39;, 0, null);"
											style="z-index:999;position:absolute;visibility:hidden;z-index:999;left:0px;top:0px;">
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui26&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui26&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui26&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui26&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();javascript:openWindowResizableCenter(&#39;/SSO/SAML20/Default.aspx?Id=1&amp;Code=TGFuZGluZz0=&#39;,&#39;FolioDx&#39;,&#39;750&#39;,&#39;400&#39;)"
													height="21" id="TopMenui26">Dashboard</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui27&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui27&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui27&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui27&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();javascript:openWindowResizableCenter(&#39;/SSO/SAML20/Default.aspx?Id=1&amp;Code=TGFuZGluZz1Qcm9wb3NhbEdlbmVyYXRpb24=&#39;,&#39;FolioDx&#39;,&#39;750&#39;,&#39;400&#39;)"
													height="21" id="TopMenui27">Proposal</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui28&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui28&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui28&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui28&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();javascript:openWindowResizableCenter(&#39;/SSO/SAML20/Default.aspx?Id=1&amp;Code=TGFuZGluZz1UcmFkaW5nVG9vbHM=&#39;,&#39;FolioDx&#39;,&#39;750&#39;,&#39;400&#39;)"
													height="21" id="TopMenui28">Trading Tools</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui29&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui29&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui29&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui29&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();openWindowResizableCenter(&#39;/SSO/SAML20/Default.aspx?Id=1&amp;Code=TGFuZGluZz1Nb2RlbGluZw==&#39;,&#39;FolioDx&#39;,&#39;750&#39;,&#39;400&#39;)"
													height="21" id="TopMenui29">Model</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui30&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui30&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui30&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui30&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();javascript:openWindowResizableCenter(&#39;/SSO/SAML20/Default.aspx?Id=1&amp;Code=TGFuZGluZz1BY2NvdW50U3RhdHVz&#39;,&#39;FolioDx&#39;,&#39;750&#39;,&#39;400&#39;)"
													height="21" id="TopMenui30">Account List</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui31&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui31&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui31&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui31&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();javascript:openWindowResizableCenter(&#39;/SSO/SAML20/Default.aspx?Id=1&amp;Code=TGFuZGluZz1SZXBvcnRzQ2VudGVy&#39;,&#39;FolioDx&#39;,&#39;750&#39;,&#39;400&#39;)"
													height="21" id="TopMenui31">Reports</td>
											</tr>
										</table>
										<table class="MenuSubGroup" cellspacing="1" id="TopMenug6" cellpadding="0" border="0"
											onmouseover="aspnm_groupMsOver(&#39;TopMenug6&#39;)"
											onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug6&#39;, &#39;TopMenui35&#39;, &#39;TopMenug1&#39;, 0, null);"
											style="z-index:999;position:absolute;visibility:hidden;z-index:999;left:0px;top:0px;">
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui36&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui36&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui36&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui36&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=14&#39;,&#39;AWS_PV_FIXED_INCOME_TRADING&#39;);"
													height="21" id="TopMenui36">Cetera Investment Services Fixed Income Trading</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui37&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui37&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui37&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui37&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=559&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui37">www.netx360.com</td>
											</tr>
										</table>
										<table class="MenuSubGroup" cellspacing="1" id="TopMenug7" cellpadding="0" border="0"
											onmouseover="aspnm_groupMsOver(&#39;TopMenug7&#39;)"
											onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug7&#39;, &#39;TopMenui38&#39;, &#39;TopMenug1&#39;, 0, null);"
											style="z-index:999;position:absolute;visibility:hidden;z-index:999;left:0px;top:0px;">
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui39&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui39&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui39&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui39&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;AccountSearch.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui39">Accounts</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui40&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui40&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui40&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui40&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;ClientSearch.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui40">Contacts</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui41&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui41&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui41&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui41&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=57&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui41">Forms</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui42&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui42&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui42&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui42&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;PositionSearch.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui42">Positions</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui43&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui43&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui43&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui43&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/ProfileManager/Search/PersonSearch.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui43">Profile Manager</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui44&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui44&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui44&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui44&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/QRP/QRPListing.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui44">QRP Sponsor Information</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui45&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui45&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui45&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui45&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=18&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui45">Search Broker-Dealer Center</td>
											</tr>
										</table>
										<table class="MenuSubGroup" cellspacing="1" id="TopMenug8" cellpadding="0" border="0"
											onmouseover="aspnm_groupMsOver(&#39;TopMenug8&#39;)"
											onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug8&#39;, &#39;TopMenui46&#39;, &#39;TopMenug1&#39;, 0, null);"
											style="z-index:999;position:absolute;visibility:hidden;z-index:999;left:0px;top:0px;">
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui47&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui47&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui47&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui47&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Operations/repreferralsform.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui47">Advisor Referral Program</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui48&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui48&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui48&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui48&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=600&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui48">Approved Product Lists</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui49&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui49&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui49&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui49&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=549&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui49">Connect2Clients</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui50&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui50&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui50&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui50&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=562&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui50">Marketing Center</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui51&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui51&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui51&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui51&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=563&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui51">Research Insite</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui52&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui52&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui52&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui52&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=567&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui52">Strategic Partners</td>
											</tr>
										</table>
										<table class="MenuSubGroup" cellspacing="1" id="TopMenug9" cellpadding="0" border="0"
											onmouseover="aspnm_groupMsOver(&#39;TopMenug9&#39;)"
											onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug9&#39;, &#39;TopMenui53&#39;, &#39;TopMenug1&#39;, 0, null);"
											style="z-index:999;position:absolute;visibility:hidden;z-index:999;left:0px;top:0px;">
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui54&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui54&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui54&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui54&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=564&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui54">Compliance Overview</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui55&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui55&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui55&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui55&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/get/gethome.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui55">Gift & Entertainment Tracker</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui56&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui56&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui56&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui56&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/Auth/Compliance/AdReview.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui56">Review of Communications</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui57&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui57&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui57&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui57&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=561&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui57">Supervisory & Compliance Manuals </td>
											</tr>
										</table>
										<table class="MenuSubGroup" cellspacing="1" id="TopMenug10" cellpadding="0" border="0"
											onmouseover="aspnm_groupMsOver(&#39;TopMenug10&#39;)"
											onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_groupMsOut(&#39;TopMenug10&#39;, &#39;TopMenui58&#39;, &#39;TopMenug1&#39;, 0, null);"
											style="z-index:999;position:absolute;visibility:hidden;z-index:999;left:0px;top:0px;">
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui59&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui59&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui59&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui59&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=504&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui59">Advisory</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui60&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui60&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui60&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui60&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=505&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui60">Browse or Search</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui61&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui61&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui61&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui61&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=506&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui61">Click 'n Play Library</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui62&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui62&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui62&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui62&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/TotalAccess/auth/technology/ce/home.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui62">Continuing Education</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui63&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui63&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui63&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui63&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;LinkHandler.aspx?LinkID=532&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui63">NetX360</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui64&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui64&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui64&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui64&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/SSO/SAML20/Default.aspx?Id=7&#39;,&#39;_blank&#39;);"
													height="21" id="TopMenui64">SmartWorks Learning Center</td>
											</tr>
											<tr>
												<td class="SubMenuItem" onmousemove="return false;" ondblclick="return false;"
													onmouseover="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;over&#39;, &#39;TopMenui65&#39;, &#39;SubMenuItemOver&#39;);"
													onmouseout="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;out&#39;, &#39;TopMenui65&#39;, &#39;SubMenuItem&#39;, null, null, null, null, null, null, &#39;MenuItemExpanded&#39;);"
													onmousedown="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;down&#39;, &#39;TopMenui65&#39;, &#39;SubMenuItemDown&#39;);"
													onmouseup="if (document.readyState == &#39;complete&#39;) aspnm_updateCell(&#39;up&#39;, &#39;TopMenui65&#39;, &#39;SubMenuItemOver&#39;);"
													onclick="aspnm_hideAllGroups();window.open(&#39;/IAN_SSO/Folio/training.aspx&#39;,&#39;frmContent&#39;);"
													height="21" id="TopMenui65">SmartWorks Adviser Certification</td>
											</tr>
										</table>
									</div>
									<table style="position:absolute;top:0px;left:0px;visibility:hidden;">
										<tr>
											<td></td>
										</tr>
									</table>
									<script language="javascript" src="_JavaScripts/IE4core.js" type="text/javascript"></script>
									<script language="javascript" type="text/javascript">
										//<![CDATA[

										// ASP.NET Menu global variables ------------------------------------------------------------------
										if (aspnm_accessKeys == null) // it is important to initialize this variable only once
										{
											var aspnm_accessKeys = new Array();       // array of keyboard shortcuts
										}
										if (aspnm_oldBodyOnLoad == null) // it is important to initialize this variable only once
										{
											var aspnm_oldBodyOnLoad = new Array();    // array of functions that hold the previous body.onload when overriding it
										}
										if (aspnm_menucount == null) // it is important to initialize this variable only once
										{
											var aspnm_menucount = 0;                  // number of menus in this page
										}
										var aspnm_hideSelectElems = true;         // whether to hide HTML select elements
										var aspnm_highlightExpanded = true;       // whether a menu item retains highlight while its subgroup is expanded
										var aspnm_overlayWindowed = false;        // whether to overlay windowed controls
										var aspnm_shadows = new Array();          // used to hold shadow rectangles
										var aspnm_shadowEnabled = false;          // whether shadow is enabled
										var aspnm_shadowColor = '#777777';        // shadow color
										var aspnm_shadowOffest = 4;               // shadow offset
										var aspnm_mac = false;                    // whether the client is a Mac IE
										var aspnm_ie4 = false;                    // whether the client is IE 4.x
										var aspnm_documentOnKeyDown = null;       // document.onkeydown handler
										var aspnm_expandedObjects = new Array();  // array of expanded groups 
										var aspnm_expandCount = 0;                // expanded group count 
										var aspnm_expandTimerID = 0;          // timer for the current expanding group 
										var aspnm_collapseTimerID = 0;        // timer for the current collapsing group 
										var aspnm_collapseAllTimerID = 0;     // timer for collapseAll
										var aspnm_expandingGroup = '';        // current expanding group name 
										var aspnm_collapsingGroup = '';       // current collapsing group name 
										var aspnm_restoredGroup = '';         // group that got focus after collapseAll has been called
										var aspnm_curItem = '';               // current menu item 
										var aspnm_collapsingAll = false;      // whether the collapseAll command is pending 
										var aspnm_contextUp = false;          // whether a context menu is up 
										var aspnm_marginX = null;             // Left page margin in pixels (only matters on Macs)
										var aspnm_marginY = null;             // Top page margin in pixels (only matters on Macs)

										//]]>
									</script>
									<script language="javascript" type="text/javascript">
										//<![CDATA[

										aspnm_oldBodyOnLoad[aspnm_menucount] = document.body.onload;
										document.body.onload = new Function("aspnm_moveSubgroups('TopMenusubgs');return ((aspnm_oldBodyOnLoad[" + aspnm_menucount + "] != null) ? aspnm_oldBodyOnLoad[" + aspnm_menucount + "]() : true);");
										aspnm_menucount++;

										//]]>
									</script>

								</div>
							</td>
						</tr>
						<tr height="95%">
							<!--		Begin issue # 23832  & 24755
								<td valign="top" width="20%" id="rowLeft"><iframe name="frmLeft" src="Left.aspx" class="IFrame" frameBorder="0" width="100%" scrolling="no" height="100%"></iframe>
								</td>
								<td valign="top" width="1%"><iframe name="frmLeftRight" src="LeftRight.htm" frameBorder="0" width="100%" scrolling="no" height="100%"></iframe>
								</td>
								<td valign="top" width="89%" id="rowContent"><iframe name="frmContent" class="IFrame" src="TopRecordsBrief.aspx" frameBorder="0" width="100%" scrolling="yes" height="100%"></iframe>
								</td>			 -->
							<td valign="top" width="185" id="rowLeft"><iframe name="frmLeft" id="frmLeft" src="Left.aspx"
									class="IFrame" frameBorder="0" width="100%" scrolling="1" height="100%"></iframe>
							</td>
							<td valign="top" width="7"><iframe name="frmLeftRight" id="frmLeftRight" src="LeftRight.htm"
									frameBorder="0" width="100%" scrolling="no" height="100%"></iframe>
							</td>
							<td valign="top" width="780" id="rowContent"><iframe id="frmContent" name="frmContent" class="IFrame"
									src="TopRecordsBrief.aspx" frameBorder="0" width="100%" scrolling="1" height="100%"></iframe>
							</td>
							<!--end issue # 23832 & 24755-->
						</tr>
						<tr>
							<td colspan="3">
								<iframe src="ticker.htm" name="frmTicker" id="frmTicker" frameBorder="no" height="40" width="100%"
									scrolling="no">
								</iframe>
							</td>
						</tr>
					</table>
				</td>
				<td>
				</td>
			</tr>
		</table>

		<script type="text/javascript">
			<!--
			var theForm = document.forms['Main'];
			if (!theForm) {
					theForm = document.Main;
			}
			function __doPostBack(eventTarget, eventArgument) {
					if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
							theForm.__EVENTTARGET.value = eventTarget;
							theForm.__EVENTARGUMENT.value = eventArgument;
							theForm.submit();
					}
			}
			// -->
		</script>

	</form>
</body>

</html>
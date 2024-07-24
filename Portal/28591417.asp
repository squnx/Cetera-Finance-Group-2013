 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head><link href="../css/BDCMaster.css" rel="styleSheet" type="text/css" />
    <style type="text/css">
        .GrayedOut
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style>
 
    <script src="../resources/1056787.js" type="text/javascript"></script> <!-- jQuery library -->
	<script src="../resources/1060060.js" type="text/javascript"></script> <!-- jQuery UI library -->
	
    <script type="text/javascript">
 
        function setStatusBar(sText) {
            window.status = sText;
            return true;
        }
        
        function pageredirect(parm1, parm2, sContentId)
        {
            window.location.href = "/BrokerDealerCenter/Portal/Common.aspx?ContentId=" + sContentId;
        }
        
        function OpenDocument(strDocID, strDocType, strNewWindow, strLinkToURL, strRowNumber) 
        {
            
            if(strLinkToURL.length>0)
            {
                window.open(strLinkToURL);
            }
            else
            {
                if(strDocType.toString().toLowerCase().indexOf("html")>=0)
                {
                    if(strNewWindow.toString().toLowerCase()=="yes")
                    {
                        if(strRowNumber.length>0)
                        {
                            window.open("/BrokerDealerCenter/Portal/RenderContent.aspx?ContentId=" + strDocID + "&SearchRecord=" + strRowNumber);
                        }
                        else
                        {
                            window.open("/BrokerDealerCenter/Portal/RenderContent.aspx?ContentId=" + strDocID);
                        }
                    }
                    else 
                    {
                        if(strRowNumber.length>0)
                        {
                            window.location.href = "/BrokerDealerCenter/Portal/Common.aspx?ContentId=" + strDocID + "&SearchRecord=" + strRowNumber;
                        }
                        else
                        {
                            window.location.href = "/BrokerDealerCenter/Portal/Common.aspx?ContentId=" + strDocID;
                        }
                    }
                }
                else
                {
                    if(strRowNumber.length>0)
                    {
                        window.open("/BrokerDealerCenter/Portal/RenderContent.aspx?ContentId=" + strDocID + "&SearchRecord=" + strRowNumber)
                    }
                    else
                    {
                        window.open("/BrokerDealerCenter/Portal/RenderContent.aspx?ContentId=" + strDocID)
                    }
                }
            }
        }
        
        function OpenFavoriteDocument(strDocID, strDocType, strNewWindow, strLinkToURL, strFavoriteId) 
        {
            
            if(strLinkToURL.length>0)
            {
                window.open(strLinkToURL);
            }
            else
            {
                if(strDocType.toString().toLowerCase().indexOf("html")>=0)
                {
                    if(strNewWindow.toString().toLowerCase()=="yes")
                    {
                        window.open("/BrokerDealerCenter/Portal/RenderContent.aspx?ContentId=" + strDocID + "&FavoriteId=" + strFavoriteId);
                    }
                    else 
                    {
                        window.location.href = "/BrokerDealerCenter/Portal/Common.aspx?ContentId=" + strDocID + "&FavoriteId=" + strFavoriteId;
                    }
                }
                else
                {
                    window.open("/BrokerDealerCenter/Portal/RenderContent.aspx?ContentId=" + strDocID + "&FavoriteId=" + strFavoriteId)
                }
            }
        }
        
        function OpenLink(strDocID, strNewWindow, strLinkToURL) 
        {
            
            if(strLinkToURL.length>0)
            {
                window.open(strLinkToURL);
            }
            else
            {
                if(strNewWindow.toString().toLowerCase()=="no")
                {
                    window.location.href = "/BrokerDealerCenter/Portal/Common.aspx?ContentId=" + strDocID;
                }
                else 
                {
                    window.open("/BrokerDealerCenter/Portal/RenderContent.aspx?ContentId=" + strDocID);
                }
            }
        }
		
        function ShowQuickLink(ddlQuickLinks)
        {
            var myindex  = ddlQuickLinks.selectedIndex;
            var SelValue = ddlQuickLinks.options[myindex].value;
            var LinkDetails = new Array();
            LinkDetails = SelValue.split('|');
            
            if(myindex==0)
            {
                return;
            }
            else if(LinkDetails[0] == "News" || LinkDetails[0] == "Newsletters")// News & News Letters
            {
                window.location.href = "/BrokerDealerCenter/Portal/Common.aspx?Category=" + LinkDetails[0];
                return;
            }
            
            LinkDetails = SelValue.split('|');
            OpenLink(LinkDetails[0],LinkDetails[1],LinkDetails[2]);
        }
 
        function logout()
        {
            var strSiteId = document.getElementById('ctl00_hfSiteId').value;
            var strPersonPartyId = document.getElementById('ctl00_hfPersonPartyId').value;
 
	        if(window.opener && !window.opener.closed)
	        {
		        window.close();
	        }
	        else
	        {
		        window.document.location = "/logoutpending.aspx?SiteId=" + strSiteId + "&PersonPartyId=" + strPersonPartyId;
            }
        }
        
        function launch_smartworks()
        {
 
	        if(window.opener && !window.opener.closed)
	        {
	        	window.opener.focus();
	        }
	        else
	        {
 		        window.open("/Workstation/Default.aspx", "SmartWorks");
            	}
        }
        
        function SiteSearch(sKeyWord)
        {
            var ddlSiteSection = document.getElementById('ctl00_ddlSiteSection');
            
            if (sKeyWord != "" && sKeyWord != "Type Keyword")
            {
                document.location = "../Portal/Search.aspx?Keyword=" + sKeyWord + "&FolderName=" + ddlSiteSection.value;
                
            }
            
            if (ddlSiteSection.value == "Complinet")
            {
                window.open("/IAN_SSO/Complinet/Complinet.aspx?search_sub=1&and_words=" + sKeyWord + "&numresults=20", "WIN_COMPLINET");
            }
            return false;
        }
 
        function doMenu(item) 
        { 
            obj=document.getElementById(item); 
            col=document.getElementById("x" + item); 
            if (obj.style.display=="none") 
            { 
                obj.style.display="block"; 
                col.innerHTML="[-]"; 
            } 
            else 
            { 
                obj.style.display="none"; 
                col.innerHTML="[+]"; 
            } 
        }
        
        String.prototype.trim = function() { return this.replace(/^\s+|\s+$/, ''); }; 
        
        function ValidateKeyword()
        {
            var ddlSiteSection = document.getElementById('ctl00_ddlSiteSection');
            var sKeyWord = document.getElementById('ctl00_txtGlobalSearch');
            
            if(document.getElementById('ctl00_txtGlobalSearch').value=='Type Keyword' || document.getElementById('ctl00_txtGlobalSearch').value.trim().length==0)
            {
                if(document.getElementById('ctl00_txtGlobalSearch').value.trim().length==0)
                {
                    document.getElementById('ctl00_txtGlobalSearch').value='';
                }
                
                alert('Please enter keyword to search');
                document.getElementById('ctl00_txtGlobalSearch').focus();
                return false;
            }
            
            if (ddlSiteSection.value == "Complinet")
            {
                window.open("/IAN_SSO/Complinet/Complinet.aspx?search_sub=1&and_words=" + sKeyWord.value + "&numresults=20", "WIN_COMPLINET");
            }
            
            return true;
        }
        
       function onOk() 
        { 
            var strDocID=document.getElementById('ctl00_hfDocId').value;
            var strDocType=document.getElementById('ctl00_hfDocType').value;
            var strNewWindow=document.getElementById('ctl00_hfNewWindow').value;
            var strLinkToURL=document.getElementById('ctl00_hfLinkToUrl').value;
            var strSuppressLeftNavigation=document.getElementById('ctl00_hfSuppressLeftNavigation').value;
            var strRowNo=document.getElementById('ctl00_hfRowNo').value;
            
            if(strSuppressLeftNavigation.toLowerCase()=='no')
            {
                window.location.href=window.location.href; 
            }
            else
            {
                OpenDocument(strDocID, strDocType, strNewWindow, strLinkToURL, strRowNo);
            }
        }
        
        function onCancel() 
        { 
            HideModalPopup();
        }
        
        function ShowMyModalPopup(strDocID,strDocType,strNewWindow,strLinkToURL,strRowNo) 
        { 
            document.getElementById('ctl00_hfDocId').value=strDocID;
            document.getElementById('ctl00_hfDocType').value=strDocType;
 
            document.getElementById('ctl00_hfLinkToUrl').value=strLinkToURL;
            document.getElementById('ctl00_hfNewWindow').value=strNewWindow;
        
            document.getElementById('ctl00_pnlPopup').style.display='block';
            
            document.getElementById('ctl00_hfRowNo').value=strRowNo;
        
            var modal = $find('ctl00_ModalPopupExtender1'); 
            modal.show(); 
        }
        
        function HideModalPopup() 
        { 
            document.getElementById('ctl00_pnlPopup').style.display='none';
            var modal = $find('ctl00_ModalPopupExtender1'); 
            modal.hide(); 
        }
        
        var win;
			var intervalID;
			var iIdleTime = parseInt(getCookie("IDLE_TIME_TO_EXPIRE")); 
			
			function CheckSessionTimeout()
			{
			
				iIdleTime = iIdleTime - 1;
				
				var iMins = (iIdleTime-(iIdleTime%60))/60;
				var iSecs = iIdleTime%60;
				
				if ( parseInt(getCookie("IDLE_TIME_TO_EXPIRE")) > 0 )
				{
					reset_interval();
				}
				
				//5 min warning
				if (iMins == 5 & iSecs == 0) 
				{
					var winX = (screen.width/2)-(600/2);
					var winY = (screen.height/2)-(280/2);	
					var sFeat = "SCROLLBARS=NO, MENUBAR=NO, TOP=" + winY + ", LEFT=" + winX + ", TOOLBAR=NO, RESIZABLE=NO, WIDTH=600, HEIGHT=280";
					win = window.open("../../SessionTimeoutReminder.htm", "Alert", sFeat, true);
					return;
				}
 
				//timeout warning
				if (iMins == 0 & iSecs == 0) 
				{
					clearInterval(intervalID);
					
					if (win)
					{
						if (false == win.closed)
							win.close();
					}
					
					document.location.href = "../../login.aspx?SMAUTHREASON=4";
					return;
				}
				
				setCookie("IDLE_TIME_TO_EXPIRE", "0");
				
			}
			
			function reset_interval()
			{
				clearInterval(intervalID);
				iIdleTime = parseInt(getCookie("IDLE_TIME_TO_EXPIRE"));
				intervalID = window.setInterval("CheckSessionTimeout()",1000);
			}
			
			intervalID = window.setInterval("CheckSessionTimeout()",1000);
    		CheckSessionTimeout();
			
			//Send name and value pair : Sets cookie based values  
            function setCookie(name, value) {
	            expireDate = new Date;
	            expireDate.setMonth( expireDate.getMonth() + 6 );
	            document.cookie = name + "=" + value + "; expires=" + expireDate.toGMTString() + "; path=/";
            }
 
            function getCookie( obj ) {
	            var Cookie = "";
	            if ( document.gcookie != "" ){
		            Name = obj;
		            begin = document.cookie.indexOf( Name ); 
		            if ( begin != -1 ){ // if cookie exists          
			            begin += ( Name.length + 1 ) // set the index at the of beginning of cookie value                              
			            end = document.cookie.indexOf(";", begin);
			            // set the index for the end of cookie value   
			            if ( end == -1 ){                    
				            end = document.cookie.length;
			            } // return value. read string from beginning to end of value index
			            Cookie = unescape(document.cookie.substring(begin, end));
			            return Cookie;
		            }
		            else{
			            return Cookie; // Default values
		            }
	            }
	            else{
		            return Cookie; // Default values
	            }
            }
        
            //-------------------------------------------------------------------
            // isInteger(value)
            //   Returns true if value contains all digits
            //-------------------------------------------------------------------
            function isInteger(val) 
            {
                for (var i=0; i < val.length; i++) 
                {
                    if (!isDigit(val.charAt(i))) { return false; }
                }
                return true;
            }
 
            //-------------------------------------------------------------------
            // isDigit(value)
            //   Returns true if value is a 1-character digit
            //-------------------------------------------------------------------
            function isDigit(num) 
            {
                var string="1234567890";
                if (string.indexOf(num) != -1) { return true; }
                return false;
            }
 
            //SWRM-38137. Used for OnKeyPress of 'txtGlobalSearch'
            function SearchOnEnter(txtKey, e) {
                var keyPressed;
 
                if (window.event)
                    keyPressed = window.event.keyCode; // IE
                else
                    keyPressed = e.which; // Firefox
 
                if (keyPressed == 13) {
                    return SiteSearch(txtKey.value);
                }
            }
            //
	
    </script>
 
    <title>
	BrokerDealer
</title>
    <style type="text/css"> 
	.ctl00_mainMenu_0 { background-color:white;visibility:hidden;display:none;position:absolute;left:0px;top:0px; }
	.ctl00_mainMenu_1 { text-decoration:none; }
	.ctl00_mainMenu_2 {  }
	.ctl00_mainMenu_3 { border-style:none; }
	.ctl00_mainMenu_4 {  }
	.ctl00_mainMenu_5 {  }
	.ctl00_mainMenu_6 { border-style:none; }
	.ctl00_mainMenu_7 {  }
	.ctl00_mainMenu_8 {  }
	.ctl00_mainMenu_9 { border-style:none; }
	.ctl00_mainMenu_10 {  }
	.ctl00_mainMenu_11 { border-style:none; }
	.ctl00_mainMenu_12 {  }
	.ctl00_mainMenu_13 { border-style:none; }
	.ctl00_mainMenu_14 {  }
	.ctl00_ContentPlaceHolder1_WebPartZone11_0 { border-color:Black;border-width:1px;border-style:Solid; }
	.ctl00_ContentPlaceHolder1_WebPartZone11_1 {  }
 
</style></head>
<body>
    <form name="aspnetForm" method="post" action="Common.aspx?ContentId=28591417" id="aspnetForm">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE3OTk2MzE0NDAPZBYCZg9kFgQCAQ9kFgICAw9kFgIFE2d3cHVjQ29udGVudFBvcnRsZXQPZBYCZg9kFgQCAQ9kFgICAw8WAh4EVGV4dAWuFjwhLS0gY29iYmxlcjogMjg1OTE0MTcgIC0tPg0KDQo8ZGl2IGlkPSJjZXQiPg0KDQo8aDE+QWR2aXNlciBQb3J0YWwgLSBDb250YWN0czwvaDE+DQo8dWw+DQoNCjxsaT48YSBocmVmPSIvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9SZW5kZXJDb250ZW50LmFzcHg/Q29udGVudElkPTI4OTA3MzM1IiB0YXJnZXQ9Il9ibGFuayI+R0ZTQyBHZXQgQ29ubmVjdGVkPC9hPjwvbGk+DQogIDxsaT48YSBocmVmPSIvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Db21tb24uYXNweD9Db250ZW50SWQ9Mjg5MDczNTciPkdGU0MgUXVpY2sgQ29ubmVjdHM8L2E+PC9saT4NCiANCjwvdWw+IA0KICA8aDI+VGVhbSBEaXJlY3Rvcnk8L2gyPg0KIDx1bD4gDQogIDxsaT48YSBocmVmPSIvVG90YWxBY2Nlc3MvQXV0aC9Db250YWN0cy9TaG93RGVwYXJ0bWVudEFuZEVtcGxveWVlcy5hc3B4P0RlcGFydG1lbnRJZD0wZWY1YTczMC00MzhlLTQ5MDUtOGY1NC1mNGQyZGM4MTNlOTQiPkFkdmlzZXIgUmVjcnVpdGluZzwvYT48L2xpPg0KICA8bGk+PGEgaHJlZj0iL1RvdGFsQWNjZXNzL0F1dGgvQ29udGFjdHMvU2hvd0RlcGFydG1lbnRBbmRFbXBsb3llZXMuYXNweD9EZXBhcnRtZW50SWQ9MjgxYzAxNzUtMTBmNi00ODM0LWFlZTUtY2JjNjg2M2E0YzE1Ij5BZHZpc2VyIFNlcnZpY2VzPC9hPjwvbGk+DQogIDxsaT48YSBocmVmPSIvVG90YWxBY2Nlc3MvQXV0aC9Db250YWN0cy9TaG93RGVwYXJ0bWVudEFuZEVtcGxveWVlcy5hc3B4P0RlcGFydG1lbnRJZD03MTk3ZGYzNy1jNTk4LTRiY2EtYTU0Zi00NTJhYzYwYWE0MWQiPkJ1c2luZXNzIERldmVsb3BtZW50IChSUFMvSVBTL1BNQyk8L2E+PC9saT4NCiAgPGxpPjxhIGhyZWY9Ii9Ub3RhbEFjY2Vzcy9BdXRoL0NvbnRhY3RzL1Nob3dEZXBhcnRtZW50QW5kRW1wbG95ZWVzLmFzcHg/RGVwYXJ0bWVudElkPTI0NGMxNWIzLTlmYjYtNDU0NS04OGM0LWNkNDA5NzE4NjlkNyI+QnVzaW5lc3MgUHJvY2Vzc2luZzwvYT48L2xpPg0KICA8bGk+PGEgaHJlZj0iL1RvdGFsQWNjZXNzL0F1dGgvQ29udGFjdHMvU2hvd0RlcGFydG1lbnRBbmRFbXBsb3llZXMuYXNweD9EZXBhcnRtZW50SWQ9M2NiMzdiYjktYWE4Ny00MDI0LWFiYTUtYjg5MDkxM2RmZWY3Ij5DbGllbnQgU29sdXRpb25zPC9hPjwvbGk+DQogIDxsaT48YSBocmVmPSIvVG90YWxBY2Nlc3MvQXV0aC9Db250YWN0cy9TaG93RGVwYXJ0bWVudEFuZEVtcGxveWVlcy5hc3B4P0RlcGFydG1lbnRJZD00Y2Y3ODI2Ny1iMjIzLTQzYzktYmJjZS01YWYzYWUxY2UwNzQiPkNvbW1pc3Npb25zPC9hPjwvbGk+DQogIDxsaT48YSBocmVmPSIvVG90YWxBY2Nlc3MvQXV0aC9Db250YWN0cy9TaG93RGVwYXJ0bWVudEFuZEVtcGxveWVlcy5hc3B4P0RlcGFydG1lbnRJZD0wMTY0M2FlYS1iNmYyLTRmNmYtODA3ZS1hODY1MjIyMjliYjIiPkNvbXBsaWFuY2U8L2E+PC9saT4NCiAgPGxpPjxhIGhyZWY9Ii9Ub3RhbEFjY2Vzcy9BdXRoL0NvbnRhY3RzL1Nob3dEZXBhcnRtZW50QW5kRW1wbG95ZWVzLmFzcHg/RGVwYXJ0bWVudElkPWNkNGUxOWY4LWQzZjctNDBiOC1hNTYxLTVkMDc5ZjQxOTQxOCI+RXhlY3V0aXZlIFRlYW08L2E+PC9saT4NCiAgPGxpPjxhIGhyZWY9Ii9Ub3RhbEFjY2Vzcy9BdXRoL0NvbnRhY3RzL1Nob3dEZXBhcnRtZW50QW5kRW1wbG95ZWVzLmFzcHg/RGVwYXJ0bWVudElkPThmYzFiOGNjLTc4YTYtNDJlYy1iODY1LTZlNmMyYmZjZjMyOCI+RmluYW5jZTwvYT48L2xpPg0KDQogIDxsaT48YSBocmVmPSIvVG90YWxBY2Nlc3MvQXV0aC9Db250YWN0cy9TaG93RGVwYXJ0bWVudEFuZEVtcGxveWVlcy5hc3B4P0RlcGFydG1lbnRJZD1mYjFkMGUyNS1hYWUxLTRhNDYtYjczMy1jNDI2ZGEyY2M4YjYiPkluc3VyYW5jZSBBcHBvaW50bWVudHMgYW5kIFNlY3VyaXRpZXMgUmVnaXN0cmF0aW9uczwvYT48L2xpPg0KICA8bGk+PGEgaHJlZj0iL1RvdGFsQWNjZXNzL0F1dGgvQ29udGFjdHMvU2hvd0RlcGFydG1lbnRBbmRFbXBsb3llZXMuYXNweD9EZXBhcnRtZW50SWQ9N2QxMzYwY2MtZDc5OC00NjEwLTg4MzctYmY2MjNkNmNkOTk1Ij5NYXJrZXRpbmc8L2E+PC9saT4NCiAgPGxpPjxhIGhyZWY9Ii9Ub3RhbEFjY2Vzcy9BdXRoL0NvbnRhY3RzL1Nob3dEZXBhcnRtZW50QW5kRW1wbG95ZWVzLmFzcHg/RGVwYXJ0bWVudElkPTg3YjZlZDk3LWM4YzAtNDYwNi04ZDA1LWQ4ZTZiYWQ2MjkzMiI+UHJvZHVjdCBNYW5hZ2VtZW50PC9hPjwvbGk+DQogIDxsaT48YSBocmVmPSIvVG90YWxBY2Nlc3MvQXV0aC9Db250YWN0cy9TaG93RGVwYXJ0bWVudEFuZEVtcGxveWVlcy5hc3B4P0RlcGFydG1lbnRJZD01OGYyNWNmOC02ZGRlLTRjZGYtOWU0ZC0zZmU1OTBmMGNlMGQiPlNlcnZpY2UgTGVhZGVyc2hpcDwvYT48L2xpPg0KICA8bGk+PGEgaHJlZj0iL1RvdGFsQWNjZXNzL0F1dGgvQ29udGFjdHMvU2hvd0RlcGFydG1lbnRBbmRFbXBsb3llZXMuYXNweD9EZXBhcnRtZW50SWQ9MmM3N2Y1MGUtMjdiMi00YmZhLWI0N2QtN2Y1MTZjZDg2YjdiIj5UcmFkaW5nIFNlcnZpY2VzPC9hPjwvbGk+DQogPC91bD4NCiANCjxoMj5PdGhlciBDb250YWN0czwvaDI+DQo8dWw+DQogICAgPGxpPjxhIGhyZWY9Ii9Ub3RhbEFjY2Vzcy9BdXRoL0NvbnRhY3RzL3JkLmFzcHgiPlJlZ2lvbmFsIERpcmVjdG9yczwvYT48L2xpPg0KICAgIDxsaT48YSBocmVmPSIvVG90YWxBY2Nlc3MvQXV0aC9Db250YWN0cy9MaWZlSW5zQWR2Q2FzZVN1cHAuYXNweCI+SW5zdXJhbmNlIFN1cHBvcnQ8L2E+PC9saT4NCiAgICA8bGk+PGEgaHJlZj0iL1RvdGFsQWNjZXNzL0F1dGgvQ29udGFjdHMvY29yZS5hc3B4Ij5UaGlyZCBQYXJ0eSBUZWNobm9sb2d5IFZlbmRvcnM8L2E+PC9saT4NCjwvdWw+DQoNCjwvZGl2PmQCAw9kFgICAQ88KwASAQA8KwAJAQAPFgIeB1Zpc2libGVoZGQCAw9kFg4CAQ8PFgIfAAURV2VsY29tZSBJVkFOIFNPTkdkZAIFDw8WBB4ISW1hZ2VVcmwFGS4uL3Jlc291cmNlcy9DRlNfTE9HTy5wbmceC05hdmlnYXRlVXJsBSQvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Ib21lLmFzcHhkZAIHDw8WAh8ABeIFJm5ic3A7fCZuYnNwOzxhIGlkPSJoeXBNeVByb2ZpbGUiIGhyZWY9Ii9Ub3RhbEFjY2Vzcy9BdXRoL3VzZXJwcm9maWxlLmFzcHgiIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nZnJtQ29udGVudCcgPk15IFByb2ZpbGU8L2E+Jm5ic3A7fCZuYnNwOzxhIGlkPSJoeXBDb250YWN0VXMiIGhyZWY9Ii4uL1BvcnRhbC9Db21tb24uYXNweD9Db250ZW50SWQ9Mjg1OTE0MTciIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nX3NlbGYnID5Db250YWN0IFVzPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwU2l0ZU1hcCIgaHJlZj0iLi4vUG9ydGFsL1NpdGVtYXAuYXNweCIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdfc2VsZicgPlNpdGUgTWFwPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwQWRtaW4iIGhyZWY9Ii4uL1BvcnRhbC9DaGFuZ2VQcm9maWxlLmFzcHgiIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nX3NlbGYnID5BZG1pbjwvYT4mbmJzcDt8Jm5ic3A7PGEgaWQ9Imh5cFNtYXJ0d29ya3MiIGhyZWY9ImphdmFzY3JpcHQ6d2luZG93SGFuZGxlID0gbGF1bmNoX3NtYXJ0d29ya3MoKTsiIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nX3NlbGYnID5TbWFydFdvcmtzPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwTG9nT3V0IiBocmVmPSJqYXZhc2NyaXB0OndpbmRvd0hhbmRsZSA9IGxvZ291dCgpOyIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdfc2VsZicgPkxvZyBPdXQ8L2E+Jm5ic3A7ZGQCEQ88KwANAgAPFgIeC18hRGF0YUJvdW5kZ2QMFCsACwUnMDowLDA6MSwwOjIsMDozLDA6NCwwOjUsMDo2LDA6NywwOjgsMDo5FCsAAhYUHgVWYWx1ZQUESG9tZR4JRGF0YUJvdW5kZx4IU2VsZWN0ZWRnHwAFBEhvbWUfAwUtL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvSG9tZS5hc3B4P01lbnVJZD0xHgdFbmFibGVkZx4KU2VsZWN0YWJsZWceBlRhcmdldAUFX3NlbGYeB1Rvb2xUaXAFBEhvbWUeCERhdGFQYXRoBQExZBQrAAIWEh8FBQtNeSBCdXNpbmVzcx8GZx8ABQtNeSBCdXNpbmVzcx8DBQEjHwhnHwloHwoFBV9zZWxmHwsFC015IEJ1c2luZXNzHwwFATIUKwAEBUswOjAsMDoxLDA6MiwxOjIsMDoyLDE6MiwwOjIsMDozLDE6MywwOjMsMTozLDA6MywxOjMsMDozLDE6MywwOjMsMTozLDA6MywxOjMUKwACFhIfBQUUQnJva2VyYWdlIE9wZXJhdGlvbnMfBmcfAAUUQnJva2VyYWdlIE9wZXJhdGlvbnMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9MTAfCGcfCWcfCgUFX3NlbGYfCwUUQnJva2VyYWdlIE9wZXJhdGlvbnMfDAUCMTAUKwAFBS8wOjAsMDoxLDE6MSwwOjEsMDoyLDA6MywxOjMsMDozLDE6MywwOjMsMDo0LDE6NBQrAAIWEh8FBQ9HZXR0aW5nIFN0YXJ0ZWQfBmcfAAUPR2V0dGluZyBTdGFydGVkHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzOB8IZx8JZx8KBQVfc2VsZh8LBQ9HZXR0aW5nIFN0YXJ0ZWQfDAUDMjM4ZBQrAAIWEh8FBQxOZXcgQWNjb3VudHMfBmcfAAUMTmV3IEFjY291bnRzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTE3NR8IZx8JZx8KBQVfc2VsZh8LBQxOZXcgQWNjb3VudHMfDAUDMTc1FCsABwUXMDowLDA6MSwwOjIsMDozLDA6NCwwOjUUKwACFhIfBQUVQWNjb3VudCBFc3RhYmxpc2htZW50HwZnHwAFFUFjY291bnQgRXN0YWJsaXNobWVudB8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNzcfCGcfCWcfCgUFX3NlbGYfCwUVQWNjb3VudCBFc3RhYmxpc2htZW50HwwFAzE3N2QUKwACFhIfBQUTQWNjb3VudCBNYWludGVuYW5jZR8GZx8ABRNBY2NvdW50IE1haW50ZW5hbmNlHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIwNB8IZx8JZx8KBQVfc2VsZh8LBRNBY2NvdW50IE1haW50ZW5hbmNlHwwFAzIwNGQUKwACFhIfBQUTQWRkaXRpb25hbCBTZXJ2aWNlcx8GZx8ABRNBZGRpdGlvbmFsIFNlcnZpY2VzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE3Nh8IZx8JZx8KBQVfc2VsZh8LBRNBZGRpdGlvbmFsIFNlcnZpY2VzHwwFAzE3NmQUKwACFhIfBQUJQU1MIFJ1bGVzHwZnHwAFCUFNTCBSdWxlcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xODAfCGcfCWcfCgUFX3NlbGYfCwUJQU1MIFJ1bGVzHwwFAzE4MGQUKwACFhIfBQUTUHJvaGliaXRlZCBBY2NvdW50cx8GZx8ABRNQcm9oaWJpdGVkIEFjY291bnRzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4MR8IZx8JZx8KBQVfc2VsZh8LBRNQcm9oaWJpdGVkIEFjY291bnRzHwwFAzE4MWQUKwACFhIfBQUeUmV0aXJlbWVudCBBY2NvdW50IEluZm9ybWF0aW9uHwZnHwAFHlJldGlyZW1lbnQgQWNjb3VudCBJbmZvcm1hdGlvbh8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNzgfCGcfCWcfCgUFX3NlbGYfCwUeUmV0aXJlbWVudCBBY2NvdW50IEluZm9ybWF0aW9uHwwFAzE3OGQUKwACFhIfBQUNTmV3cyAmIEFsZXJ0cx8GZx8ABQ1OZXdzICYgQWxlcnRzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4Mh8IZx8JZx8KBQVfc2VsZh8LBQ1OZXdzICYgQWxlcnRzHwwFAzE4MmQUKwACFhIfBQUHVHJhZGluZx8GZx8ABQdUcmFkaW5nHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTE4NB8IZx8JZx8KBQVfc2VsZh8LBQdUcmFkaW5nHwwFAzE4NBQrAA0FMTA6MCwwOjEsMDoyLDA6MywwOjQsMDo1LDA6NiwwOjcsMDo4LDA6OSwwOjEwLDA6MTEUKwACFhIfBQUVQW5udWl0aWVzIChTdWJzY3JpYmUpHwZnHwAFFUFubnVpdGllcyAoU3Vic2NyaWJlKR8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMDgfCGcfCWcfCgUFX3NlbGYfCwUVQW5udWl0aWVzIChTdWJzY3JpYmUpHwwFAzIwOGQUKwACFhIfBQUgQiBhbmQgQyBTaGFyZSAtIENsYXNzIEV4ZW1wdGlvbnMfBmcfAAUgQiBhbmQgQyBTaGFyZSAtIENsYXNzIEV4ZW1wdGlvbnMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTg1HwhnHwlnHwoFBV9zZWxmHwsFIEIgYW5kIEMgU2hhcmUgLSBDbGFzcyBFeGVtcHRpb25zHwwFAzE4NWQUKwACFhIfBQUcQiBhbmQgQyBTaGFyZSAtIENsYXNzIFBvbGljeR8GZx8ABRxCIGFuZCBDIFNoYXJlIC0gQ2xhc3MgUG9saWN5HwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4Nh8IZx8JZx8KBQVfc2VsZh8LBRxCIGFuZCBDIFNoYXJlIC0gQ2xhc3MgUG9saWN5HwwFAzE4NmQUKwACFhIfBQUQRFZQIChDT0Qgb3IgUlZQKR8GZx8ABRBEVlAgKENPRCBvciBSVlApHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4Nx8IZx8JZx8KBQVfc2VsZh8LBRBEVlAgKENPRCBvciBSVlApHwwFAzE4N2QUKwACFhIfBQUORXJyb3IgQWNjb3VudHMfBmcfAAUORXJyb3IgQWNjb3VudHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTg4HwhnHwlnHwoFBV9zZWxmHwsFDkVycm9yIEFjY291bnRzHwwFAzE4OGQUKwACFhIfBQUMRml4ZWQgSW5jb21lHwZnHwAFDEZpeGVkIEluY29tZR8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xODkfCGcfCWcfCgUFX3NlbGYfCwUMRml4ZWQgSW5jb21lHwwFAzE4OWQUKwACFhIfBQUMTXV0dWFsIEZ1bmRzHwZnHwAFDE11dHVhbCBGdW5kcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOTAfCGcfCWcfCgUFX3NlbGYfCwUMTXV0dWFsIEZ1bmRzHwwFAzE5MGQUKwACFhIfBQUeTm8gVHJhbnNhY3Rpb24gRmVlIChOVEYpIEZ1bmRzHwZnHwAFHk5vIFRyYW5zYWN0aW9uIEZlZSAoTlRGKSBGdW5kcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOTEfCGcfCWcfCgUFX3NlbGYfCwUeTm8gVHJhbnNhY3Rpb24gRmVlIChOVEYpIEZ1bmRzHwwFAzE5MWQUKwACFhIfBQULT3BlbiBPcmRlcnMfBmcfAAULT3BlbiBPcmRlcnMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTkyHwhnHwlnHwoFBV9zZWxmHwsFC09wZW4gT3JkZXJzHwwFAzE5MmQUKwACFhIfBQUOU2VjdXJpdHkgU2V0dXAfBmcfAAUOU2VjdXJpdHkgU2V0dXAfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTkzHwhnHwlnHwoFBV9zZWxmHwsFDlNlY3VyaXR5IFNldHVwHwwFAzE5M2QUKwACFhIfBQUZU3lzdGVtYXRpYyBCdXlzIGFuZCBTZWxscx8GZx8ABRlTeXN0ZW1hdGljIEJ1eXMgYW5kIFNlbGxzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE5NB8IZx8JZx8KBQVfc2VsZh8LBRlTeXN0ZW1hdGljIEJ1eXMgYW5kIFNlbGxzHwwFAzE5NGQUKwACFhIfBQUUVGhyZXNob2xkIFNlY3VyaXRpZXMfBmcfAAUUVGhyZXNob2xkIFNlY3VyaXRpZXMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTk1HwhnHwlnHwoFBV9zZWxmHwsFFFRocmVzaG9sZCBTZWN1cml0aWVzHwwFAzE5NWQUKwACFhIfBQUXQWR2YW5jZWQgUGxhbm5pbmcgR3JvdXAfBmcfAAUXQWR2YW5jZWQgUGxhbm5pbmcgR3JvdXAfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9MTEfCGcfCWcfCgUFX3NlbGYfCwUXQWR2YW5jZWQgUGxhbm5pbmcgR3JvdXAfDAUCMTEUKwAEBQswOjAsMDoxLDA6MhQrAAIWEh8FBQ9UYXggSW5mb3JtYXRpb24fBmcfAAUPVGF4IEluZm9ybWF0aW9uHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIxNR8IZx8JZx8KBQVfc2VsZh8LBQ9UYXggSW5mb3JtYXRpb24fDAUDMjE1ZBQrAAIWEh8FBQ9JUkEgSW5mb3JtYXRpb24fBmcfAAUPSVJBIEluZm9ybWF0aW9uHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIxNx8IZx8JZx8KBQVfc2VsZh8LBQ9JUkEgSW5mb3JtYXRpb24fDAUDMjE3ZBQrAAIWEh8FBQ1NaXNjZWxsYW5lb3VzHwZnHwAFDU1pc2NlbGxhbmVvdXMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjE4HwhnHwlnHwoFBV9zZWxmHwsFDU1pc2NlbGxhbmVvdXMfDAUDMjE4ZBQrAAIWEh8FBRlMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb25zHwZnHwAFGUxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbnMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9MTQfCGcfCWcfCgUFX3NlbGYfCwUZTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucx8MBQIxNBQrAAQFCzA6MCwwOjEsMDoyFCsAAhYSHwUFCFJlbmV3YWxzHwZnHwAFCFJlbmV3YWxzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE1Mh8IZx8JZx8KBQVfc2VsZh8LBQdSZW5ld2FsHwwFAzE1MmQUKwACFhIfBQUeTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEZvcm1zHwZnHwAFHkxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbiBGb3Jtcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNTMfCGcfCWcfCgUFX3NlbGYfCwUeTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEZvcm1zHwwFAzE1M2QUKwACFhIfBQUhTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucyBHZW5lcmFsHwZnHwAFIUxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbnMgR2VuZXJhbB8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yNDIfCGcfCWcfCgUFX3NlbGYfCwUhTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucyBHZW5lcmFsHwwFAzI0MmQUKwACFhIfBQUTUHJvZHVjdCBJbmZvcm1hdGlvbh8GZx8ABRNQcm9kdWN0IEluZm9ybWF0aW9uHwMFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTMfCGcfCWcfCgUFX3NlbGYfCwUTUHJvZHVjdCBJbmZvcm1hdGlvbh8MBQEzFCsACAUjMDowLDA6MSwwOjIsMDozLDA6NCwwOjUsMDo2LDA6NywxOjcUKwACFhIfBQUWQXBwcm92ZWQgUHJvZHVjdCBMaXN0cx8GZx8ABRZBcHByb3ZlZCBQcm9kdWN0IExpc3RzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTU0HwhnHwlnHwoFBV9zZWxmHwsFFkFwcHJvdmVkIFByb2R1Y3QgTGlzdHMfDAUCNTRkFCsAAhYSHwUFCEFkdmlzb3J5HwZnHwAFCEFkdmlzb3J5HwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTU1HwhnHwlnHwoFBV9zZWxmHwsFCEFkdmlzb3J5HwwFAjU1ZBQrAAIWEh8FBQlBbm51aXRpZXMfBmcfAAUJQW5udWl0aWVzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTU3HwhnHwlnHwoFBV9zZWxmHwsFCUFubnVpdGllcx8MBQI1NxQrAAMFBzA6MCwwOjEUKwACFhIfBQUFRml4ZWQfBmcfAAUFRml4ZWQfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTgfCGcfCWcfCgUFX3NlbGYfCwUFRml4ZWQfDAUCNThkFCsAAhYSHwUFCFZhcmlhYmxlHwZnHwAFCFZhcmlhYmxlHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTU5HwhnHwlnHwoFBV9zZWxmHwsFCFZhcmlhYmxlHwwFAjU5ZBQrAAIWEh8FBQtJbnZlc3RtZW50cx8GZx8ABQtJbnZlc3RtZW50cx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD02MB8IZx8JZx8KBQVfc2VsZh8LBQtJbnZlc3RtZW50cx8MBQI2MBQrAAYFEzA6MCwwOjEsMDoyLDA6MywwOjQUKwACFhIfBQUXQWx0ZXJuYXRpdmUgSW52ZXN0bWVudHMfBmcfAAUXQWx0ZXJuYXRpdmUgSW52ZXN0bWVudHMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjEfCGcfCWcfCgUFX3NlbGYfCwUXQWx0ZXJuYXRpdmUgSW52ZXN0bWVudHMfDAUCNjFkFCsAAhYSHwUFFERlZmluZWQgQ29udHJpYnV0aW9uHwZnHwAFFERlZmluZWQgQ29udHJpYnV0aW9uHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTYyHwhnHwlnHwoFBV9zZWxmHwsFFERlZmluZWQgQ29udHJpYnV0aW9uHwwFAjYyZBQrAAIWEh8FBQxNdXR1YWwgRnVuZHMfBmcfAAUMTXV0dWFsIEZ1bmRzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTYzHwhnHwlnHwoFBV9zZWxmHwsFDE11dHVhbCBGdW5kcx8MBQI2M2QUKwACFhIfBQURU2VjdGlvbiA1MjkgUGxhbnMfBmcfAAURU2VjdGlvbiA1MjkgUGxhbnMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjQfCGcfCWcfCgUFX3NlbGYfCwURU2VjdGlvbiA1MjkgUGxhbnMfDAUCNjRkFCsAAhYSHwUFEU90aGVyIEludmVzdG1lbnRzHwZnHwAFEU90aGVyIEludmVzdG1lbnRzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY1HwhnHwlnHwoFBV9zZWxmHwsFEU90aGVyIEludmVzdG1lbnRzHwwFAjY1ZBQrAAIWEh8FBQlJbnN1cmFuY2UfBmcfAAUJSW5zdXJhbmNlHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTY2HwhnHwlnHwoFBV9zZWxmHwsFCUluc3VyYW5jZR8MBQI2NhQrAAcFFzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1FCsAAhYSHwUFEURpc2FiaWxpdHkgSW5jb21lHwZnHwAFEURpc2FiaWxpdHkgSW5jb21lHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY3HwhnHwlnHwoFBV9zZWxmHwsFEURpc2FiaWxpdHkgSW5jb21lHwwFAjY3ZBQrAAIWEh8FBQ5Mb25nLVRlcm0gQ2FyZR8GZx8ABQ5Mb25nLVRlcm0gQ2FyZR8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD02OB8IZx8JZx8KBQVfc2VsZh8LBQ5Mb25nIFRlcm0gY2FyZR8MBQI2OGQUKwACFhIfBQUEVGVybR8GZx8ABQRUZXJtHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY5HwhnHwlnHwoFBV9zZWxmHwsFBFRlcm0fDAUCNjlkFCsAAhYSHwUFDlVuaXZlcnNhbCBMaWZlHwZnHwAFDlVuaXZlcnNhbCBMaWZlHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTcwHwhnHwlnHwoFBV9zZWxmHwsFDlVuaXZlcnNhbCBMaWZlHwwFAjcwZBQrAAIWEh8FBRdWYXJpYWJsZSBVbml2ZXJzYWwgTGlmZR8GZx8ABRdWYXJpYWJsZSBVbml2ZXJzYWwgTGlmZR8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03MR8IZx8JZx8KBQVfc2VsZh8LBSFWYXJpYWJsZSBVbml2ZXJzYWwgTGlmZSBJbnN1cmFuY2UfDAUCNzFkFCsAAhYSHwUFCldob2xlIExpZmUfBmcfAAUKV2hvbGUgTGlmZR8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03Mh8IZx8JZx8KBQVfc2VsZh8LBRRXaG9sZSBMaWZlIEluc3VyYW5jZR8MBQI3MmQUKwACFhIfBQUQUmV0aXJlbWVudCBQbGFucx8GZx8ABRBSZXRpcmVtZW50IFBsYW5zHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI5NR8IZx8JZx8KBQVfc2VsZh8LBRBSZXRpcmVtZW50IFBsYW5zHwwFAzI5NWQUKwACFhIfBQUSU3RyYXRlZ2ljIFBhcnRuZXJzHwZnHwAFElN0cmF0ZWdpYyBQYXJ0bmVycx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03Mx8IZx8JZx8KBQVfc2VsZh8LBRJTdHJhdGVnaWMgUGFydG5lcnMfDAUCNzNkFCsAAhYSHwUFBUZvcm1zHwZnHwAFBUZvcm1zHwMFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTQfCGcfCWcfCgUFX3NlbGYfCwUFRm9ybXMfDAUBNBQrAAcFNzA6MCwxOjAsMDowLDA6MSwwOjIsMToyLDA6MiwwOjMsMTozLDA6MywwOjQsMDo1LDE6NSwwOjUUKwACFhIfBQUNRm9ybXMgU2VhcmNoIB8GZx8ABQ1Gb3JtcyBTZWFyY2ggHwMFNy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1NlYXJjaC5hc3B4P0ZvbGRlck5hbWU9Rm9ybXMfCGcfCWcfCgUFX3NlbGYfCwUNRm9ybXMgU2VhcmNoIB8MBQIxOGQUKwACFhIfBQURQWR2aXNvcnkgU2VydmljZXMfBmcfAAURQWR2aXNvcnkgU2VydmljZXMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTkfCGcfCWcfCgUFX3NlbGYfCwURQWR2aXNvcnkgU2VydmljZXMfDAUCMTlkFCsAAhYSHwUFGExpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbh8GZx8ABRhMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb24fAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9MjEfCGcfCWcfCgUFX3NlbGYfCwUYTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uHwwFAjIxFCsAAgULMDowLDA6MSwxOjEUKwACFhIfBQUgTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEdlbmVyYWwfBmcfAAUgTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEdlbmVyYWwfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzUfCGcfCWcfCgUFX3NlbGYfCwUgTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEdlbmVyYWwfDAUCMzVkFCsAAhYSHwUFDU1pc2NlbGxhbmVvdXMfBmcfAAUNTWlzY2VsbGFuZW91cx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yMh8IZx8JZx8KBQVfc2VsZh8LBQ1NaXNjZWxsYW5lb3VzHwwFAjIyFCsAAwUXMDowLDA6MSwwOjIsMToyLDA6MiwxOjIUKwACFhIfBQUVTWlzY2VsbGFuZW91cyBHZW5lcmFsHwZnHwAFFU1pc2NlbGxhbmVvdXMgR2VuZXJhbB8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zNh8IZx8JZx8KBQVfc2VsZh8LBRVNaXNjZWxsYW5lb3VzIEdlbmVyYWwfDAUCMzZkFCsAAhYSHwUFBUFkbWluHwZnHwAFBUFkbWluHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTM3HwhnHwlnHwoFBV9zZWxmHwsFBUFkbWluHwwFAjM3ZBQrAAIWEh8FBQxOZXcgQnVzaW5lc3MfBmcfAAUMTmV3IEJ1c2luZXNzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTIzHwhnHwlnHwoFBV9zZWxmHwsFDE5ldyBCdXNpbmVzcx8MBQIyMxQrAAMFBzA6MCwwOjEUKwACFhIfBQUUTmV3IEJ1c2luZXNzIEdlbmVyYWwfBmcfAAUUTmV3IEJ1c2luZXNzIEdlbmVyYWwfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzkfCGcfCWcfCgUFX3NlbGYfCwUUTmV3IEJ1c2luZXNzIEdlbmVyYWwfDAUCMzlkFCsAAhYSHwUFCUluc3VyYW5jZR8GZx8ABQlJbnN1cmFuY2UfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTQ3HwhnHwlnHwoFBV9zZWxmHwsFCUluc3VyYW5jZR8MBQMxNDdkFCsAAhYSHwUFCkZvcm1zIExpc3QfBmcfAAUKRm9ybXMgTGlzdB8DBSkvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Gb3Jtc0xpc3QuYXNweB8IZx8JZx8KBQVfc2VsZh8LBQpGb3JtcyBMaXN0HwwFAzEzOGQUKwACFhIfBQURU2FsZXMgJiBNYXJrZXRpbmcfBmcfAAURU2FsZXMgJiBNYXJrZXRpbmcfAwUuL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9NR8IZx8JZx8KBQVfc2VsZh8LBRFTYWxlcyAmIE1hcmtldGluZx8MBQE1FCsABQUPMDowLDA6MSwwOjIsMDozFCsAAhYSHwUFD0Nvbm5lY3QyQ2xpZW50cx8GZx8ABQ9Db25uZWN0MkNsaWVudHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9Mjk3HwhnHwlnHwoFBV9zZWxmHwsFD0Nvbm5lY3QyQ2xpZW50cx8MBQMyOTcUKwADBQ8wOjAsMDoxLDE6MSwwOjEUKwACFhIfBQUZQzJDIE1hcmtldGluZyBMaWJyYXJ5IFBybx8GZx8ABRlDMkMgTWFya2V0aW5nIExpYnJhcnkgUHJvHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzMR8IZx8JZx8KBQVfU2VsZh8LBRlDMkMgTWFya2V0aW5nIExpYnJhcnkvUHJvHwwFAzMzMWQUKwACFhIfBQUOQzJDIFVuaXZlcnNpdHkfBmcfAAUOQzJDIFVuaXZlcnNpdHkfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzMzHwhnHwlnHwoFBV9TZWxmHwsFDkMyQyBVbml2ZXJzaXR5HwwFAzMzM2QUKwACFhIfBQUeQ2xpZW50IEFjcXVpc2l0aW9uICYgUmV0ZW50aW9uHwZnHwAFHkNsaWVudCBBY3F1aXNpdGlvbiAmIFJldGVudGlvbh8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yNR8IZx8JZx8KBQVfc2VsZh8LBR5DbGllbnQgQWNxdWlzaXRpb24gJiBSZXRlbnRpb24fDAUCMjUUKwAJBR8wOjAsMDoxLDA6MiwwOjMsMDo0LDA6NSwwOjYsMDo3FCsAAhYSHwUFEEFkdmVydGlzaW5nICYgUFIfBmcfAAUQQWR2ZXJ0aXNpbmcgJiBQUh8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03NR8IZx8JZx8KBQVfc2VsZh8LBRBBZHZlcnRpc2luZyAmIFBSHwwFAjc1ZBQrAAIWEh8FBRJCcm9jaHVyZXMgJiBGbHllcnMfBmcfAAUSQnJvY2h1cmVzICYgRmx5ZXJzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTc2HwhnHwlnHwoFBV9zZWxmHwsFEkJyb2NodXJlcyAmIEZseWVycx8MBQI3NmQUKwACFhIfBQUJQ2FtcGFpZ25zHwZnHwAFCUNhbXBhaWducx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03Nx8IZx8JZx8KBQVfc2VsZh8LBQlDYW1wYWlnbnMfDAUCNzdkFCsAAhYSHwUFHENsaWVudCAmIFByb3NwZWN0aW5nIExldHRlcnMfBmcfAAUcQ2xpZW50ICYgUHJvc3BlY3RpbmcgTGV0dGVycx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03OB8IZx8JZx8KBQVfc2VsZh8LBRxDbGllbnQgJiBQcm9zcGVjdGluZyBMZXR0ZXJzHwwFAjc4ZBQrAAIWEh8FBQ9DbGllbnQgUmVmZXJyYWwfBmcfAAUPQ2xpZW50IFJlZmVycmFsHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTc5HwhnHwlnHwoFBV9zZWxmHwsFD0NsaWVudCBSZWZlcnJhbB8MBQI3OWQUKwACFhIfBQUUUHJvZ3JhbXMgJiBSZXNvdXJjZXMfBmcfAAUUUHJvZ3JhbXMgJiBSZXNvdXJjZXMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9ODAfCGcfCWcfCgUFX3NlbGYfCwUUUHJvZ3JhbXMgJiBSZXNvdXJjZXMfDAUCODBkFCsAAhYSHwUFH1NhbGVzIElkZWFzICYgVHVybmtleSBTb2x1dGlvbnMfBmcfAAUfU2FsZXMgSWRlYXMgJiBUdXJua2V5IFNvbHV0aW9ucx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD04Mh8IZx8JZx8KBQVfc2VsZh8LBSNTYWxlcyBJZGVhcyAmYW1wOyBUdXJua2V5IFNvbHV0aW9ucx8MBQI4MmQUKwACFhIfBQUIU2VtaW5hcnMfBmcfAAUIU2VtaW5hcnMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9ODMfCGcfCWcfCgUFX3NlbGYfCwUIU2VtaW5hcnMfDAUCODNkFCsAAhYSHwUFDkJyYW5kIElkZW50aXR5HwZnHwAFDkJyYW5kIElkZW50aXR5HwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI2HwhnHwlnHwoFBV9zZWxmHwsFDkJyYW5kIElkZW50aXR5HwwFAjI2FCsAAwUHMDowLDA6MRQrAAIWEh8FBRBCcmFuZCBHdWlkZWxpbmVzHwZnHwAFEEJyYW5kIEd1aWRlbGluZXMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NDgfCGcfCWcfCgUFX3NlbGYfCwUQQnJhbmQgR3VpZGVsaW5lcx8MBQI0OGQUKwACFhIfBQUSTG9nb3MgJiBTdGF0aW9uZXJ5HwZnHwAFEkxvZ29zICYgU3RhdGlvbmVyeR8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD00OR8IZx8JZx8KBQVfc2VsZh8LBRJMb2dvcyAmIFN0YXRpb25lcnkfDAUCNDlkFCsAAhYSHwUFE1Rvb2xzICYgQ2FsY3VsYXRvcnMfBmcfAAUTVG9vbHMgJiBDYWxjdWxhdG9ycx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yNx8IZx8JZx8KBQVfc2VsZh8LBRNUb29scyAmIENhbGN1bGF0b3JzHwwFAjI3FCsADwVLMDowLDA6MSwxOjEsMDoxLDA6MiwwOjMsMDo0LDA6NSwxOjUsMDo1LDA6NiwwOjcsMDo4LDA6OSwwOjEwLDA6MTEsMDoxMiwwOjEzFCsAAhYSHwUFH0Fkdmlzb3J5IE9ubGluZSBBY2NvdW50IE9wZW5pbmcfBmcfAAUfQWR2aXNvcnkgT25saW5lIEFjY291bnQgT3BlbmluZx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMjIfCGcfCWcfCgUFX3NlbGYfCwUfQWR2aXNvcnkgT25saW5lIEFjY291bnQgT3BlbmluZx8MBQMyMjJkFCsAAhYSHwUFIEJyb2tlcmFnZSBPbmxpbmUgQWNjb3VudCBPcGVuaW5nHwZnHwAFIEJyb2tlcmFnZSBPbmxpbmUgQWNjb3VudCBPcGVuaW5nHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNB8IZx8JZx8KBQVfc2VsZh8LBSBCcm9rZXJhZ2UgT25saW5lIEFjY291bnQgT3BlbmluZx8MBQMyMjRkFCsAAhYSHwUFC0NhbGN1bGF0b3JzHwZnHwAFC0NhbGN1bGF0b3JzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNR8IZx8JZx8KBQVfc2VsZh8LBQtDYWxjdWxhdG9ycx8MBQMyMjVkFCsAAhYSHwUFDkNSTSBJbnRlZ2F0aW9uHwZnHwAFDkNSTSBJbnRlZ2F0aW9uHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNh8IZx8JZx8KBQVfc2VsZh8LBQ5DUk0gSW50ZWdhdGlvbh8MBQMyMjZkFCsAAhYSHwUFCEZlYXR1cmVzHwZnHwAFCEZlYXR1cmVzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNx8IZx8JZx8KBQVfc2VsZh8LBQhGZWF0dXJlcx8MBQMyMjdkFCsAAhYSHwUFHkludmVzdG1lbnQgJiBSZXNlYXJjaCBBbmFseXNpcx8GZx8ABR5JbnZlc3RtZW50ICYgUmVzZWFyY2ggQW5hbHlzaXMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjI5HwhnHwlnHwoFBV9zZWxmHwsFHkludmVzdG1lbnQgJiBSZXNlYXJjaCBBbmFseXNpcx8MBQMyMjlkFCsAAhYSHwUFCExhc2VyQXBwHwZnHwAFCExhc2VyQXBwHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzMB8IZx8JZx8KBQVfc2VsZh8LBQhMYXNlckFwcB8MBQMyMzBkFCsAAhYSHwUFEE1vbmV5R3VpZGVCcm9rZXIfBmcfAAUQTW9uZXlHdWlkZUJyb2tlch8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzEfCGcfCWcfCgUFX3NlbGYfCwUQTW9uZXlHdWlkZUJyb2tlch8MBQMyMzFkFCsAAhYSHwUFDU1vbmV5R3VpZGVQcm8fBmcfAAUNTW9uZXlHdWlkZVBybx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzIfCGcfCWcfCgUFX3NlbGYfCwUNTW9uZXlHdWlkZVBybx8MBQMyMzJkFCsAAhYSHwUFC01vcm5pbmdzdGFyHwZnHwAFC01vcm5pbmdzdGFyHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzMx8IZx8JZx8KBQVfc2VsZh8LBQtNb3JuaW5nc3Rhch8MBQMyMzNkFCsAAhYSHwUFCE5ldFggMzYwHwZnHwAFCE5ldFggMzYwHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzNB8IZx8JZx8KBQVfc2VsZh8LBQhOZXRYIDM2MB8MBQMyMzRkFCsAAhYSHwUFDFRyYWRlIFJldmlldx8GZx8ABQxUcmFkZSBSZXZpZXcfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjM1HwhnHwlnHwoFBV9zZWxmHwsFDFRyYWRlIFJldmlldx8MBQMyMzVkFCsAAhYSHwUFDVZBIENvbXBhcmlzb24fBmcfAAUNVkEgQ29tcGFyaXNvbh8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzYfCGcfCWcfCgUFX3NlbGYfCwUNVkEgQ29tcGFyaXNvbh8MBQMyMzZkFCsAAhYSHwUFEFBvcnRmb2xpbyBBY2Nlc3MfBmcfAAUQUG9ydGZvbGlvIEFjY2Vzcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zMzgfCGcfCWcfCgUFX3NlbGYfCwUQUG9ydGZvbGlvIEFjY2Vzcx8MBQMzMzhkFCsAAhYSHwUFCkNvbXBsaWFuY2UfBmcfAAUKQ29tcGxpYW5jZR8DBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD02HwhnHwlnHwoFBV9zZWxmHwsFCkNvbXBsaWFuY2UfDAUBNhQrAAQFEzA6MCwxOjAsMDowLDA6MSwwOjIUKwACFhIfBQUUTWFudWFscyAmIEd1aWRlbGluZXMfBmcfAAUUTWFudWFscyAmIEd1aWRlbGluZXMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjkfCGcfCWcfCgUFX3NlbGYfCwUUTWFudWFscyAmIEd1aWRlbGluZXMfDAUCMjlkFCsAAhYSHwUFEE5vdGljZXMgJiBBbGVydHMfBmcfAAUQTm90aWNlcyAmIEFsZXJ0cx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0zMB8IZx8JZx8KBQVfc2VsZh8LBRBOb3RpY2VzICYgQWxlcnRzHwwFAjMwFCsABAULMDowLDA6MSwwOjIUKwACFhIfBQURQ29tcGxpYW5jZSBBbGVydHMfBmcfAAURQ29tcGxpYW5jZSBBbGVydHMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTIfCGcfCWcfCgUFX3NlbGYfCwURQ29tcGxpYW5jZSBBbGVydHMfDAUCNTJkFCsAAhYSHwUFEkNvbXBsaWFuY2UgTm90aWNlcx8GZx8ABRJDb21wbGlhbmNlIE5vdGljZXMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTMfCGcfCWcfCgUFX3NlbGYfCwUSQ29tcGxpYW5jZSBOb3RpY2VzHwwFAjUzZBQrAAIWEh8FBQlCdWxsZXRpbnMfBmcfAAUJQnVsbGV0aW5zHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTg5HwhnHwlnHwoFBV9zZWxmHwsFCUJ1bGxldGlucx8MBQI4OWQUKwACFhIfBQUVUG9saWNpZXMgJiBQcm9jZWR1cmVzHwZnHwAFFVBvbGljaWVzICYgUHJvY2VkdXJlcx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zMR8IZx8JZx8KBQVfc2VsZh8LBRVQb2xpY2llcyAmIFByb2NlZHVyZXMfDAUCMzFkFCsAAhYSHwUFCEFkdmlzb3J5HwZnHwAFCEFkdmlzb3J5HwMFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTcfCGcfCWcfCgUFX3NlbGYfCwUIQWR2aXNvcnkfDAUBNxQrAAYFEzA6MCwwOjEsMDoyLDA6MywwOjQUKwACFhIfBQUPR2V0dGluZyBTdGFydGVkHwZnHwAFD0dldHRpbmcgU3RhcnRlZB8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD05MB8IZx8JZx8KBQVfc2VsZh8LBQ9HZXR0aW5nIFN0YXJ0ZWQfDAUCOTBkFCsAAhYSHwUFEVByb2dyYW0gT2ZmZXJpbmdzHwZnHwAFEVByb2dyYW0gT2ZmZXJpbmdzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTkxHwhnHwlnHwoFBV9zZWxmHwsFEVByb2dyYW0gT2ZmZXJpbmdzHwwFAjkxFCsABAUrMDowLDE6MCwwOjAsMTowLDA6MCwwOjEsMDoyLDE6MiwwOjIsMToyLDA6MhQrAAIWEh8FBRtQb3J0Zm9saW8gQWR2aXNvcnkgU2VydmljZXMfBmcfAAUbUG9ydGZvbGlvIEFkdmlzb3J5IFNlcnZpY2VzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzNR8IZx8JZx8KBQVfc2VsZh8LBRtQb3J0Zm9saW8gQWR2aXNvcnkgU2VydmljZXMfDAUDMzM1ZBQrAAIWEh8FBRxQcmVtaWVyIFBvcnRmb2xpbyBNYW5hZ2VtZW50HwZnHwAFHFByZW1pZXIgUG9ydGZvbGlvIE1hbmFnZW1lbnQfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzM2HwhnHwlnHwoFBV9zZWxmHwsFHFByZW1pZXIgUG9ydGZvbGlvIE1hbmFnZW1lbnQfDAUDMzM2ZBQrAAIWEh8FBRhNYW5hZ2VkIFdlYWx0aCBBRFZBTlRBR0UfBmcfAAUYTWFuYWdlZCBXZWFsdGggQURWQU5UQUdFHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzNx8IZx8JZx8KBQVfc2VsZh8LBRhNYW5hZ2VkIFdlYWx0aCBBRFZBTlRBR0UfDAUDMzM3ZBQrAAIWEh8FBQVUb29scx8GZx8ABQVUb29scx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD05Mh8IZx8JZx8KBQVfc2VsZh8LBQVUb29scx8MBQI5MmQUKwACFhIfBQUUVHJhaW5pbmcgJiBFZHVjYXRpb24fBmcfAAUUVHJhaW5pbmcgJiBFZHVjYXRpb24fAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9OTMfCGcfCWcfCgUFX3NlbGYfCwUUVHJhaW5pbmcgJiBFZHVjYXRpb24fDAUCOTNkFCsAAhYSHwUFFUdyb3dpbmcgWW91ciBCdXNpbmVzcx8GZx8ABRVHcm93aW5nIFlvdXIgQnVzaW5lc3MfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9OTQfCGcfCWcfCgUFX3NlbGYfCwUVR3Jvd2luZyBZb3VyIEJ1c2luZXNzHwwFAjk0ZBQrAAIWEh8FBQhSZXNlYXJjaB8GZx8ABQhSZXNlYXJjaB8DBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD04HwhnHwlnHwoFBV9zZWxmHwsFCFJlc2VhcmNoHwwFATgUKwAFBQ8wOjAsMDoxLDA6MiwwOjMUKwACFhIfBQUbQXNzZXQgQWxsb2NhdGlvbiBQb3J0Zm9saW9zHwZnHwAFG0Fzc2V0IEFsbG9jYXRpb24gUG9ydGZvbGlvcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yOTYfCGcfCWcfCgUFX3NlbGYfCwUbQXNzZXQgQWxsb2NhdGlvbiBQb3J0Zm9saW9zHwwFAzI5NmQUKwACFhIfBQUTSW52ZXN0bWVudCBSZXNlYXJjaB8GZx8ABRNJbnZlc3RtZW50IFJlc2VhcmNoHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI0OR8IZx8JZx8KBQVfc2VsZh8LBRNJbnZlc3RtZW50IFJlc2VhcmNoHwwFAzI0ORQrAAQFEzA6MCwxOjAsMDowLDA6MSwwOjIUKwACFhIfBQUERVRGcx8GZx8ABQRFVEZzHwMFPC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI1NyZTU089RVRGX1JFUx8IZx8JZx8KBQVfc2VsZh8LBQRFVEZzHwwFAzI1N2QUKwACFhIfBQUQTXV0dWFsIEZ1bmQgTmV3cx8GZx8ABRBNdXR1YWwgRnVuZCBOZXdzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI2MB8IZx8JZx8KBQVfc2VsZh8LBRBNdXR1YWwgRnVuZCBOZXdzHwwFAzI2MGQUKwACFhIfBQUUUmVzZWFyY2ggU2VsZWN0IExpc3QfBmcfAAUUUmVzZWFyY2ggU2VsZWN0IExpc3QfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjYxHwhnHwlnHwoFBV9zZWxmHwsFFFJlc2VhcmNoIFNlbGVjdCBMaXN0HwwFAzI2MWQUKwACFhIfBQUQSW52ZXN0bWVudCBUb29scx8GZx8ABRBJbnZlc3RtZW50IFRvb2xzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI1MB8IZx8JZx8KBQVfc2VsZh8LBRBJbnZlc3RtZW50IFRvb2xzHwwFAzI1MBQrAAcFFzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1FCsAAhYSHwUFC0NhbGN1bGF0b3JzHwZnHwAFC0NhbGN1bGF0b3JzHwMFQS9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNSZSZWZlcmVyPVJlc2VhcmNoHwhnHwlnHwoFBV9zZWxmHwsFC0NhbGN1bGF0b3JzHwwFAzI1MmQUKwACFhIfBQUTRklOUkEgRnVuZCBBbmFseXplch8GZx8ABRNGSU5SQSBGdW5kIEFuYWx5emVyHwMFOC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0NvbW1vbi5hc3B4P0NvbnRlbnRJZD0xMDIxMjI0HwhnHwlnHwoFBV9zZWxmHwsFE0ZJTlJBIEZ1bmQgQW5hbHl6ZXIfDAUDMjUzZBQrAAIWEh8FBQ9Nb3JuaW5nc3RhciBBV1MfBmcfAAUPTW9ybmluZ3N0YXIgQVdTHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI1NB8IZx8JZx8KBQVfc2VsZh8LBQ9Nb3JuaW5nc3RhciBBV1MfDAUDMjU0ZBQrAAIWEh8FBR9Nb3JuaW5nc3RhciBQb3J0Zm9saW8gU25hcFNob3QgHwZnHwAFH01vcm5pbmdzdGFyIFBvcnRmb2xpbyBTbmFwU2hvdCAfAwUtL1dvcmtzdGF0aW9uL1NTTy9NU3Rhci9Qb3J0Zm9saW9TbmFwc2hvdC5hc3B4HwhnHwlnHwoFBV9zZWxmHwsFH01vcm5pbmdzdGFyIFBvcnRmb2xpbyBTbmFwU2hvdCAfDAUDMjU1ZBQrAAIWEh8FBQ5TdG9jayBTY3JlZW5lch8GZx8ABQ5TdG9jayBTY3JlZW5lch8DBRovV29ya3N0YXRpb24vU2NyZWVuZXIuaHRtbB8IZx8JZx8KBQVfc2VsZh8LBQ5TdG9jayBTY3JlZW5lch8MBQMyNTZkFCsAAhYSHwUFElZBIENvbXBhcmlzb24gVG9vbB8GZx8ABRJWQSBDb21wYXJpc29uIFRvb2wfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjcyHwhnHwlnHwoFBV9zZWxmHwsFElZBIENvbXBhcmlzb24gVG9vbB8MBQMyNzJkFCsAAhYSHwUFE01hcmtldCBDb21tZW50YXJpZXMfBmcfAAUTTWFya2V0IENvbW1lbnRhcmllcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yNjUfCGcfCWcfCgUFX3NlbGYfCwUTTWFya2V0IENvbW1lbnRhcmllcx8MBQMyNjUUKwAHBRcwOjAsMDoxLDA6MiwwOjMsMDo0LDA6NRQrAAIWEh8FBRVEYWlseSBNYXJrZXQgQnJpZWZpbmcfBmcfAAUVRGFpbHkgTWFya2V0IEJyaWVmaW5nHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI2Nh8IZx8JZx8KBQVfc2VsZh8LBRVEYWlseSBNYXJrZXQgQnJpZWZpbmcfDAUDMjY2ZBQrAAIWEh8FBR9NYXJrZXQgQnVsbGV0aW5zICYgV2hpdGUgUGFwZXJzHwZnHwAFH01hcmtldCBCdWxsZXRpbnMgJiBXaGl0ZSBQYXBlcnMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjY3HwhnHwlnHwoFBV9zZWxmHwsFH01hcmtldCBCdWxsZXRpbnMgJiBXaGl0ZSBQYXBlcnMfDAUDMjY3ZBQrAAIWEh8FBRZNb250aGx5IE1hcmtldCBNb25pdG9yHwZnHwAFFk1vbnRobHkgTWFya2V0IE1vbml0b3IfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjY4HwhnHwlnHwoFBV9zZWxmHwsFFk1vbnRobHkgTWFya2V0IE1vbml0b3IfDAUDMjY4ZBQrAAIWEh8FBRhRdWFydGVybHkgTWFya2V0IE91dGxvb2sfBmcfAAUYUXVhcnRlcmx5IE1hcmtldCBPdXRsb29rHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI2OR8IZx8JZx8KBQVfc2VsZh8LBRhRdWFydGVybHkgTWFya2V0IE91dGxvb2sfDAUDMjY5ZBQrAAIWEh8FBQ9RdWFydGVybHkgUmVjYXAfBmcfAAUPUXVhcnRlcmx5IFJlY2FwHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI3MB8IZx8JZx8KBQVfc2VsZh8LBQ9RdWFydGVybHkgUmVjYXAfDAUDMjcwZBQrAAIWEh8FBR9UaGlyZCBQYXJ0eSBNYXJrZXQgQ29tbWVudGFyaWVzHwZnHwAFH1RoaXJkIFBhcnR5IE1hcmtldCBDb21tZW50YXJpZXMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjcxHwhnHwlnHwoFBV9zZWxmHwsFH1RoaXJkIFBhcnR5IE1hcmtldCBDb21tZW50YXJpZXMfDAUDMjcxZBQrAAIWEh8FBRRFZHVjYXRpb24gJiBUcmFpbmluZx8GZx8ABRRFZHVjYXRpb24gJiBUcmFpbmluZx8DBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD05HwhnHwlnHwoFBV9zZWxmHwsFFEVkdWNhdGlvbiAmIFRyYWluaW5nHwwFATkUKwAHBScwOjAsMDoxLDA6MiwxOjIsMDoyLDA6MywwOjQsMDo1LDA6NiwxOjYUKwACFhIfBQUVQ2xpY2sgJ24gUGxheSBMaWJyYXJ5HwZnHwAFFUNsaWNrICduIFBsYXkgTGlicmFyeR8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0xMTMfCGcfCWcfCgUFX3NlbGYfCwUVQ2xpY2sgJ24gUGxheSBMaWJyYXJ5HwwFAzExMxQrAAgFMzA6MCwwOjEsMToxLDA6MSwwOjIsMToyLDA6MiwxOjIsMDoyLDA6MywwOjQsMDo1LDA6NhQrAAIWEh8FBRFBZHZpc29yeSBTZXJ2aWNlcx8GZx8ABRFBZHZpc29yeSBTZXJ2aWNlcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMjEfCGcfCWcfCgUFX3NlbGYfCwURQWR2aXNvcnkgU2VydmljZXMfDAUDMTIxZBQrAAIWEh8FBQ9BcmNoaXZlZCBFdmVudHMfBmcfAAUPQXJjaGl2ZWQgRXZlbnRzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTEyMh8IZx8JZx8KBQVfc2VsZh8LBQ9BcmNoaXZlZCBFdmVudHMfDAUDMTIyZBQrAAIWEh8FBQpTbWFydFdvcmtzHwZnHwAFClNtYXJ0V29ya3MfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTI1HwhnHwlnHwoFBV9zZWxmHwsFClNtYXJ0V29ya3MfDAUDMTI1ZBQrAAIWEh8FBQ9Nb25leUd1aWRlU3VpdGUfBmcfAAUPTW9uZXlHdWlkZVN1aXRlHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI0OB8IZx8JZx8KBQVfc2VsZh8LBQ9Nb25leUd1aWRlU3VpdGUfDAUDMjQ4ZBQrAAIWEh8FBR9Nb3JuaW5nc3RhciBBZHZpc29yIFdvcmtzdGF0aW9uHwZnHwAFH01vcm5pbmdzdGFyIEFkdmlzb3IgV29ya3N0YXRpb24fAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTI2HwhnHwlnHwoFBV9zZWxmHwsFH01vcm5pbmdzdGFyIEFkdmlzb3IgV29ya3N0YXRpb24fDAUDMTI2ZBQrAAIWEh8FBQhOZXRYIDM2MB8GZx8ABQhOZXRYIDM2MB8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMjcfCGcfCWcfCgUFX3NlbGYfCwUITmV0WCAzNjAfDAUDMTI3ZBQrAAIWEh8FBRxUaW1lc2F2aW5nIFRvb2xzICYgUmVzb3VyY2VzHwZnHwAFHFRpbWVzYXZpbmcgVG9vbHMgJiBSZXNvdXJjZXMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTI4HwhnHwlnHwoFBV9zZWxmHwsFHFRpbWVzYXZpbmcgVG9vbHMgJiBSZXNvdXJjZXMfDAUDMTI4ZBQrAAIWEh8FBRNDb21wbGlhbmNlIFRyYWluaW5nHwZnHwAFE0NvbXBsaWFuY2UgVHJhaW5pbmcfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTE0HwhnHwlnHwoFBV9zZWxmHwsFE0NvbXBsaWFuY2UgVHJhaW5pbmcfDAUDMTE0ZBQrAAIWEh8FBRBHdWlkZXMgJiBNYW51YWxzHwZnHwAFEEd1aWRlcyAmIE1hbnVhbHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTE2HwhnHwlnHwoFBV9zZWxmHwsFEEd1aWRlcyAmIE1hbnVhbHMfDAUDMTE2ZBQrAAIWEh8FBRRKb2IgQWlkcyAmIEVaIEd1aWRlcx8GZx8ABRRKb2IgQWlkcyAmIEVaIEd1aWRlcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMTcfCGcfCWcfCgUFX3NlbGYfCwUUSm9iIEFpZHMgJiBFWiBHdWlkZXMfDAUDMTE3ZBQrAAIWEh8FBRVUZWNobm9sb2d5ICYgU2VjdXJpdHkfBmcfAAUVVGVjaG5vbG9neSAmIFNlY3VyaXR5HwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI4OB8IZx8JZx8KBQVfc2VsZh8LBRVUZWNobm9sb2d5ICYgU2VjdXJpdHkfDAUDMjg4ZBQrAAIWEh8FBRZUcmFpbmluZyAmIERldmVsb3BtZW50HwZnHwAFFlRyYWluaW5nICYgRGV2ZWxvcG1lbnQfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTE5HwhnHwlnHwoFBV9zZWxmHwsFFlRyYWluaW5nICYgRGV2ZWxvcG1lbnQfDAUDMTE5ZBQrAAIWDh8ABTAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsfBQUwJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7HwhnHwlnHwwFAzEzNx8GZx8KBQVfc2VsZmRkAikPZBYCAgMPEGQPFgFmFgEQBRktLSBTZWxlY3QgYSBRdWljayBMaW5rIC0tBQEwZ2RkAi0PZBYCAgMPFgIfAWgWAgIFD2QWAgIFDxYCHwFnFgICBQ88KwARAgAPFgIeCFBhZ2VTaXplAhRkARAWABYAFgBkAi8PFgIeBGhyZWYFJy4uL1BvcnRhbC9Db21tb24uYXNweD9Db250ZW50SWQ9MjAwMDAxNGQYAgUzY3RsMDAkQ29udGVudFBsYWNlSG9sZGVyMSR1Y1ZpZXdBbGxQb3J0bGV0JGd2RGV0YWlsD2dkBQ5jdGwwMCRtYWluTWVudQ8PZAUESG9tZWRQ6dHBjJwDAoGHUb8LWmDbRLR3NRk0TP2MGmBNJ+GEIw==" />
</div>
 
<script type="text/javascript"> 
//<![CDATA[
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>
 
 
<script src="/BrokerDealerCenter/WebResource.axd?d=uMCZy70hqe4xjQY1mq6QOQ2&amp;t=634869908874485606" type="text/javascript"></script>
 
 
<script src="/BrokerDealerCenter/ScriptResource.axd?d=cKOmutB4MGOOKybFENIvpiMiW82KLhODjYPcW1WHH5eX1yoV9jyuk1zhrtak0pRB6fzYbZmJlKxHeVHgLtx-TA2&amp;t=1e961a8d" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=cKOmutB4MGOOKybFENIvpiMiW82KLhODjYPcW1WHH5dVj4wv-oNqssDhAjxhPhnc0&amp;t=1e961a8d" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ccpKWwRF_zQQoRh6ENNJeVA9v0QrTGvFzjwUMR1USco73FDWeH4_MZxpQZbSLQxnAZSo-fDxQPNoLzR8ihsVIMWDT3estctdBlxZri-YOas1&amp;t=16ab2387" type="text/javascript"></script>
<script type="text/javascript"> 
//<![CDATA[
if (typeof(Sys) === 'undefined') throw new Error('ASP.NET Ajax client-side framework failed to load.');
//]]>
</script>
 
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ccpKWwRF_zQQoRh6ENNJeVA9v0QrTGvFzjwUMR1USco73FDWeH4_MZxpQZbSLQxnDHhpM-cpR2NQwhuOD8bELP7gbh_CZaPR8bKM2wPnRZ0ciNF03UR5Z0DN0hoFOUtJ0&amp;t=16ab2387" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ppWbO0_DX3ljH50PKB5RibtfElJqPlpC-6j6M1yBOcyHmVhVmkPYdDA6JB1ylTwd8XEkO_AtkETZt-npVrgxUoTBSOcLVX5AvHvPT-mEaLUi3QXvZcV_7Cr4tcDtEhPn0&amp;t=ffffffff848c5cde" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ppWbO0_DX3ljH50PKB5RibtfElJqPlpC-6j6M1yBOcyHmVhVmkPYdDA6JB1ylTwd8XEkO_AtkETZt-npVrgxUqT_d2KcSlVW1mbzKD3cKvaItLRnMzuLIv5cxIDPXX_XMLU01pFb4zWjWMm3H5MEnQ2&amp;t=ffffffff848c5cde" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ppWbO0_DX3ljH50PKB5RibtfElJqPlpC-6j6M1yBOcyHmVhVmkPYdDA6JB1ylTwd8XEkO_AtkETZt-npVrgxUugkAKGJDydT8ZYCPPRXZLTiI8iwMYMaur67s_pWgO308Q08IrV0AGuubuI-YthEmik-tiZyYPPBfTq1oZNAhuY1&amp;t=ffffffff848c5cde" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ppWbO0_DX3ljH50PKB5RibtfElJqPlpC-6j6M1yBOcyHmVhVmkPYdDA6JB1ylTwd8XEkO_AtkETZt-npVrgxUtfS-P9sw64EGilgHUn4iJaKNB4gCdtTYmoJCeDzkZlG0&amp;t=ffffffff848c5cde" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ppWbO0_DX3ljH50PKB5RibtfElJqPlpC-6j6M1yBOcyHmVhVmkPYdDA6JB1ylTwd8XEkO_AtkETZt-npVrgxUjEP-ZjtBCXzcl6ML_plpTpQI_tL41RDrU98iHcPg5WTExQ5nBUET4OuW3eVv9IU8Q2&amp;t=ffffffff848c5cde" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ppWbO0_DX3ljH50PKB5RibtfElJqPlpC-6j6M1yBOcyHmVhVmkPYdDA6JB1ylTwd8XEkO_AtkETZt-npVrgxUmHjTs4izyW7q4fyiUWL5rYJXWjcIxpf91zfugHfDzZPcSPcRtY3vKzBmL4juTwR2-UH2ka1-0GG4RfP4PZxF9w1&amp;t=ffffffff848c5cde" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ppWbO0_DX3ljH50PKB5RibtfElJqPlpC-6j6M1yBOcyHmVhVmkPYdDA6JB1ylTwd8XEkO_AtkETZt-npVrgxUtfS-P9sw64EGilgHUn4iJbndWl7eOYKSAthLFHRDVMACorpclvsSrUfAdbRpPaDog2&amp;t=ffffffff848c5cde" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ppWbO0_DX3ljH50PKB5RibtfElJqPlpC-6j6M1yBOcyHmVhVmkPYdDA6JB1ylTwd8XEkO_AtkETZt-npVrgxUiSCib6LLuMP36NfOtVmV2Xb53-IU0wOC3oskinQy6vzWxCkgpOX05dmFkVf-ddRiQ2&amp;t=ffffffff848c5cde" type="text/javascript"></script>
<script src="/BrokerDealerCenter/ScriptResource.axd?d=ppWbO0_DX3ljH50PKB5RibtfElJqPlpC-6j6M1yBOcyHmVhVmkPYdDA6JB1ylTwd8XEkO_AtkETZt-npVrgxUuUZBXZMaOU7P4f5WM8p1ogZUmwpFF7PcCRMvFVmJTVL99hRi_ARqwB7aFKvwXC5rQ2&amp;t=ffffffff848c5cde" type="text/javascript"></script>
    <div id="container">
        <!-- ################  Start #header ################ -->
        <div id="header">
            <div class="logo">
                <div id="menuSmallUser" style="float:right;padding-top:20px;">
                    <span id="ctl00_lblUserName" class="toolBar">Welcome IVAN SONG</span>
                    &nbsp;&nbsp;</div>
                <a id="ctl00_bdlogo" href="../Portal/Home.aspx"><img src="../resources/CFS_LOGO.png" alt="" style="border-width:0px;" /></a>
            </div>
            <hr />
            <div id="menuSmall">
                <div id="menuSmallLeft">
                    <span id="ctl00_lblMainMenu">&nbsp;|&nbsp;<a id="hypMyProfile" href="/TotalAccess/Auth/userprofile.aspx" class="func_link" Target='frmContent' >My Profile</a>&nbsp;|&nbsp;<a id="hypContactUs" href="../Portal/28591417.aspx" class="func_link" Target='_self' >Contact Us</a>&nbsp;|&nbsp;<a id="hypSiteMap" href="../Portal/Sitemap.aspx" class="func_link" Target='_self' >Site Map</a>&nbsp;|&nbsp;<a id="hypAdmin" href="../Portal/ChangeProfile.aspx" class="func_link" Target='_self' >Admin</a>&nbsp;|&nbsp;<a id="hypSmartworks" href="javascript:windowHandle = launch_smartworks();" class="func_link" Target='_self' >SmartWorks</a>&nbsp;|&nbsp;<a id="hypLogOut" href="javascript:windowHandle = logout();" class="func_link" Target='_self' >Log Out</a>&nbsp;</span>
                </div>
                <div id="inputSearch">
                    
                    <input name="ctl00$txtGlobalSearch" type="text" value="Type Keyword" id="ctl00_txtGlobalSearch" class="searchText" onkeypress="return SearchOnEnter(this,event);" onfocus="if (this.value==&#39;Type Keyword&#39;){this.value=&#39;&#39;;}" onblur="if (this.value==&#39;&#39;){this.value=&#39;Type Keyword&#39;;}" style="width:150px;" />
                    <select name="ctl00$ddlSiteSection" id="ctl00_ddlSiteSection" class="searchSelect">
	<option value="CFG Portal Space">Entire Site</option>
	<option value="cm:My_x0020_Business/cm:Advanced_x0020_Markets">My Business/Advanced Markets</option>
	<option value="cm:My_x0020_Business/cm:Brokerage_x0020_Operations">My Business/Brokerage Operations</option>
	<option value="cm:My_x0020_Business/cm:Compensation">My Business/Compensation</option>
	<option value="cm:My_x0020_Business/cm:FID">My Business/Financial Institution Division</option>
	<option value="cm:My_x0020_Business/cm:Licensing_x0020__x0026__x0020_Registrations">My Business/Licensing &amp; Registrations</option>
	<option value="cm:My_x0020_Business/cm:Other_x0020_Programs">My Business/Other Programs</option>
	<option value="cm:My_x0020_Business/cm:Practice_x0020_Development">My Business/Practice Development</option>
	<option value="cm:My_x0020_Business/cm:Recruiting">My Business/Recruiting</option>
	<option value="cm:My_x0020_Business/cm:Transitioning">My Business/Transitioning</option>
	<option value="cm:Product_x0020_Information">Product Information</option>
	<option value="cm:Forms">Forms</option>
	<option value="cm:Sales_x0020__x0026__x0020_Marketing">Sales &amp; Marketing</option>
	<option value="cm:Compliance">Compliance</option>
	<option value="cm:Advisory">Advisory</option>
	<option value="cm:Research">Research</option>
	<option value="cm:Education_x0020__x0026__x0020_Training">Education &amp; Training</option>
	<option value="Complinet">Entire Site w/ Supervisory &amp; Compliance Manuals</option>
 
</select>
                    <a onclick="return ValidateKeyword();" id="ctl00_LinkBtnSearch" class="searchLink" href="javascript:__doPostBack(&#39;ctl00$LinkBtnSearch&#39;,&#39;&#39;)">Search</a>
                </div>
                <!-- end #inputSearch -->
                <div class="clearfloat">
                </div>
            </div>
            <div id="menuSmallAdvanced">
                <a id="ctl00_LinkBtnAdvancedSearch" class="adv" href="javascript:__doPostBack(&#39;ctl00$LinkBtnAdvancedSearch&#39;,&#39;&#39;)">Advanced Search</a>
            </div>
            <div class="clearfloat">
            </div>
            <div id="menuContainer">
                <div id="menu">
                    <a href="#ctl00_mainMenu_SkipLink"><img alt="Skip Navigation Links" src="../WebResource_SkipNav.gif" width="0" height="0" style="border-width:0px;" /></a>
                    <table id="ctl00_mainMenu" class="Writing menu ctl00_mainMenu_5 ctl00_mainMenu_2" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Home" id="ctl00_mainMenun0"><table class="menuitems ctl00_mainMenu_4 menuhover ctl00_mainMenu_10" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3 menuhover ctl00_mainMenu_9" href="/BrokerDealerCenter/Portal/Home.aspx?MenuId=1" target="_self" style="border-style:none;font-size:1em;">Home</a></td>
			</tr>
		</table></td><td style="width:0px;"></td><td style="width:0px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="My Business" id="ctl00_mainMenun1"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="#" style="border-style:none;font-size:1em;cursor:text;">My Business</a></td>
			</tr>
		</table></td><td style="width:0px;"></td><td style="width:0px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Product Information" id="ctl00_mainMenun2"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=3" target="_self" style="border-style:none;font-size:1em;">Product Information</a></td>
			</tr>
		</table></td><td style="width:0px;"></td><td style="width:0px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Forms" id="ctl00_mainMenun3"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=4" target="_self" style="border-style:none;font-size:1em;">Forms</a></td>
			</tr>
		</table></td><td style="width:0px;"></td><td style="width:0px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Sales &amp; Marketing" id="ctl00_mainMenun4"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=5" target="_self" style="border-style:none;font-size:1em;">Sales & Marketing</a></td>
			</tr>
		</table></td><td style="width:0px;"></td><td style="width:0px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Compliance" id="ctl00_mainMenun5"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=6" target="_self" style="border-style:none;font-size:1em;">Compliance</a></td>
			</tr>
		</table></td><td style="width:0px;"></td><td style="width:0px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Advisory" id="ctl00_mainMenun6"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=7" target="_self" style="border-style:none;font-size:1em;">Advisory</a></td>
			</tr>
		</table></td><td style="width:0px;"></td><td style="width:0px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Research" id="ctl00_mainMenun7"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=8" target="_self" style="border-style:none;font-size:1em;">Research</a></td>
			</tr>
		</table></td><td style="width:0px;"></td><td style="width:0px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Education &amp; Training" id="ctl00_mainMenun8"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=9" target="_self" style="border-style:none;font-size:1em;">Education & Training</a></td>
			</tr>
		</table></td><td style="width:0px;"></td><td style="width:0px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" id="ctl00_mainMenun9"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="javascript:__doPostBack(&#39;ctl00$mainMenu&#39;,&#39;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&#39;)" style="border-style:none;font-size:1em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			</tr>
		</table></td><td style="width:0px;"></td>
	</tr>
</table><div id="ctl00_mainMenun1Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Brokerage Operations" id="ctl00_mainMenun10">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=10" target="_self" style="border-style:none;font-size:1em;">Brokerage Operations</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Brokerage Operations" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Advanced Planning Group" id="ctl00_mainMenun11">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=11" target="_self" style="border-style:none;font-size:1em;">Advanced Planning Group</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Advanced Planning Group" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Licensing &amp; Registrations" id="ctl00_mainMenun12">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=14" target="_self" style="border-style:none;font-size:1em;">Licensing & Registrations</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Licensing &amp; Registrations" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun1ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun1ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun10Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Getting Started" id="ctl00_mainMenun13">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=238" target="_self" style="border-style:none;font-size:1em;">Getting Started</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="New Accounts" id="ctl00_mainMenun14">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=175" target="_self" style="border-style:none;font-size:1em;">New Accounts</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand New Accounts" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="News &amp; Alerts" id="ctl00_mainMenun15">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=182" target="_self" style="border-style:none;font-size:1em;">News & Alerts</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Trading" id="ctl00_mainMenun16">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=184" target="_self" style="border-style:none;font-size:1em;">Trading</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Trading" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun10ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun10ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun14Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Account Establishment" id="ctl00_mainMenun17">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=177" target="_self" style="border-style:none;font-size:1em;">Account Establishment</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Account Maintenance" id="ctl00_mainMenun18">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=204" target="_self" style="border-style:none;font-size:1em;">Account Maintenance</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Additional Services" id="ctl00_mainMenun19">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=176" target="_self" style="border-style:none;font-size:1em;">Additional Services</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="AML Rules" id="ctl00_mainMenun20">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=180" target="_self" style="border-style:none;font-size:1em;">AML Rules</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Prohibited Accounts" id="ctl00_mainMenun21">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=181" target="_self" style="border-style:none;font-size:1em;">Prohibited Accounts</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Retirement Account Information" id="ctl00_mainMenun22">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=178" target="_self" style="border-style:none;font-size:1em;">Retirement Account Information</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun14ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun14ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun16Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Annuities (Subscribe)" id="ctl00_mainMenun23">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=208" target="_self" style="border-style:none;font-size:1em;">Annuities (Subscribe)</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="B and C Share - Class Exemptions" id="ctl00_mainMenun24">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=185" target="_self" style="border-style:none;font-size:1em;">B and C Share - Class Exemptions</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="B and C Share - Class Policy" id="ctl00_mainMenun25">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=186" target="_self" style="border-style:none;font-size:1em;">B and C Share - Class Policy</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="DVP (COD or RVP)" id="ctl00_mainMenun26">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=187" target="_self" style="border-style:none;font-size:1em;">DVP (COD or RVP)</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Error Accounts" id="ctl00_mainMenun27">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=188" target="_self" style="border-style:none;font-size:1em;">Error Accounts</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Fixed Income" id="ctl00_mainMenun28">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=189" target="_self" style="border-style:none;font-size:1em;">Fixed Income</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Mutual Funds" id="ctl00_mainMenun29">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=190" target="_self" style="border-style:none;font-size:1em;">Mutual Funds</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="No Transaction Fee (NTF) Funds" id="ctl00_mainMenun30">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=191" target="_self" style="border-style:none;font-size:1em;">No Transaction Fee (NTF) Funds</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Open Orders" id="ctl00_mainMenun31">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=192" target="_self" style="border-style:none;font-size:1em;">Open Orders</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Security Setup" id="ctl00_mainMenun32">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=193" target="_self" style="border-style:none;font-size:1em;">Security Setup</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Systematic Buys and Sells" id="ctl00_mainMenun33">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=194" target="_self" style="border-style:none;font-size:1em;">Systematic Buys and Sells</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Threshold Securities" id="ctl00_mainMenun34">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=195" target="_self" style="border-style:none;font-size:1em;">Threshold Securities</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun16ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun16ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun11Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Tax Information" id="ctl00_mainMenun35">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=215" target="_self" style="border-style:none;font-size:1em;">Tax Information</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="IRA Information" id="ctl00_mainMenun36">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=217" target="_self" style="border-style:none;font-size:1em;">IRA Information</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Miscellaneous" id="ctl00_mainMenun37">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=218" target="_self" style="border-style:none;font-size:1em;">Miscellaneous</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun11ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun11ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun12Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Renewal" id="ctl00_mainMenun38">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=152" target="_self" style="border-style:none;font-size:1em;">Renewals</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Licensing &amp; Registration Forms" id="ctl00_mainMenun39">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=153" target="_self" style="border-style:none;font-size:1em;">Licensing & Registration Forms</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Licensing &amp; Registrations General" id="ctl00_mainMenun40">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=242" target="_self" style="border-style:none;font-size:1em;">Licensing & Registrations General</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun12ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun12ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun2Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Approved Product Lists" id="ctl00_mainMenun41">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=54" target="_self" style="border-style:none;font-size:1em;">Approved Product Lists</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Advisory" id="ctl00_mainMenun42">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=55" target="_self" style="border-style:none;font-size:1em;">Advisory</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Annuities" id="ctl00_mainMenun43">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=57" target="_self" style="border-style:none;font-size:1em;">Annuities</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Annuities" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Investments" id="ctl00_mainMenun44">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=60" target="_self" style="border-style:none;font-size:1em;">Investments</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Investments" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Insurance" id="ctl00_mainMenun45">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=66" target="_self" style="border-style:none;font-size:1em;">Insurance</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Insurance" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Retirement Plans" id="ctl00_mainMenun46">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=295" target="_self" style="border-style:none;font-size:1em;">Retirement Plans</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Strategic Partners" id="ctl00_mainMenun47">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=73" target="_self" style="border-style:none;font-size:1em;">Strategic Partners</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun2ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun2ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun43Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Fixed" id="ctl00_mainMenun48">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=58" target="_self" style="border-style:none;font-size:1em;">Fixed</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Variable" id="ctl00_mainMenun49">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=59" target="_self" style="border-style:none;font-size:1em;">Variable</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun43ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun43ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun44Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Alternative Investments" id="ctl00_mainMenun50">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=61" target="_self" style="border-style:none;font-size:1em;">Alternative Investments</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Defined Contribution" id="ctl00_mainMenun51">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=62" target="_self" style="border-style:none;font-size:1em;">Defined Contribution</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Mutual Funds" id="ctl00_mainMenun52">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=63" target="_self" style="border-style:none;font-size:1em;">Mutual Funds</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Section 529 Plans" id="ctl00_mainMenun53">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=64" target="_self" style="border-style:none;font-size:1em;">Section 529 Plans</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Other Investments" id="ctl00_mainMenun54">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=65" target="_self" style="border-style:none;font-size:1em;">Other Investments</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun44ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun44ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun45Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Disability Income" id="ctl00_mainMenun55">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=67" target="_self" style="border-style:none;font-size:1em;">Disability Income</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Long Term care" id="ctl00_mainMenun56">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=68" target="_self" style="border-style:none;font-size:1em;">Long-Term Care</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Term" id="ctl00_mainMenun57">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=69" target="_self" style="border-style:none;font-size:1em;">Term</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Universal Life" id="ctl00_mainMenun58">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=70" target="_self" style="border-style:none;font-size:1em;">Universal Life</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Variable Universal Life Insurance" id="ctl00_mainMenun59">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=71" target="_self" style="border-style:none;font-size:1em;">Variable Universal Life</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Whole Life Insurance" id="ctl00_mainMenun60">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=72" target="_self" style="border-style:none;font-size:1em;">Whole Life</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun45ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun45ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun3Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Forms Search " id="ctl00_mainMenun61">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Search.aspx?FolderName=Forms" target="_self" style="border-style:none;font-size:1em;">Forms Search </a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Advisory Services" id="ctl00_mainMenun62">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=19" target="_self" style="border-style:none;font-size:1em;">Advisory Services</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Licensing &amp; Registration" id="ctl00_mainMenun63">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=21" target="_self" style="border-style:none;font-size:1em;">Licensing & Registration</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Licensing &amp; Registration" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Miscellaneous" id="ctl00_mainMenun64">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=22" target="_self" style="border-style:none;font-size:1em;">Miscellaneous</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Miscellaneous" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="New Business" id="ctl00_mainMenun65">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=23" target="_self" style="border-style:none;font-size:1em;">New Business</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand New Business" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Forms List" id="ctl00_mainMenun66">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/FormsList.aspx" target="_self" style="border-style:none;font-size:1em;">Forms List</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun3ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun3ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun63Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Licensing &amp; Registration General" id="ctl00_mainMenun67">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=35" target="_self" style="border-style:none;font-size:1em;">Licensing & Registration General</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun63ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun63ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun64Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Miscellaneous General" id="ctl00_mainMenun68">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=36" target="_self" style="border-style:none;font-size:1em;">Miscellaneous General</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Admin" id="ctl00_mainMenun69">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=37" target="_self" style="border-style:none;font-size:1em;">Admin</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun64ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun64ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun65Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="New Business General" id="ctl00_mainMenun70">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=39" target="_self" style="border-style:none;font-size:1em;">New Business General</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Insurance" id="ctl00_mainMenun71">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=147" target="_self" style="border-style:none;font-size:1em;">Insurance</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun65ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun65ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun4Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Connect2Clients" id="ctl00_mainMenun72">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=297" target="_self" style="border-style:none;font-size:1em;">Connect2Clients</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Connect2Clients" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Client Acquisition &amp; Retention" id="ctl00_mainMenun73">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=25" target="_self" style="border-style:none;font-size:1em;">Client Acquisition & Retention</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Client Acquisition &amp; Retention" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Brand Identity" id="ctl00_mainMenun74">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=26" target="_self" style="border-style:none;font-size:1em;">Brand Identity</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Brand Identity" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Tools &amp; Calculators" id="ctl00_mainMenun75">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=27" target="_self" style="border-style:none;font-size:1em;">Tools & Calculators</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Tools &amp; Calculators" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun4ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun4ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun72Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="C2C Marketing Library/Pro" id="ctl00_mainMenun76">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=331" target="_Self" style="border-style:none;font-size:1em;">C2C Marketing Library Pro</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="C2C University" id="ctl00_mainMenun77">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=333" target="_Self" style="border-style:none;font-size:1em;">C2C University</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun72ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun72ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun73Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Advertising &amp; PR" id="ctl00_mainMenun78">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=75" target="_self" style="border-style:none;font-size:1em;">Advertising & PR</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Brochures &amp; Flyers" id="ctl00_mainMenun79">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=76" target="_self" style="border-style:none;font-size:1em;">Brochures & Flyers</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Campaigns" id="ctl00_mainMenun80">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=77" target="_self" style="border-style:none;font-size:1em;">Campaigns</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Client &amp; Prospecting Letters" id="ctl00_mainMenun81">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=78" target="_self" style="border-style:none;font-size:1em;">Client & Prospecting Letters</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Client Referral" id="ctl00_mainMenun82">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=79" target="_self" style="border-style:none;font-size:1em;">Client Referral</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Programs &amp; Resources" id="ctl00_mainMenun83">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=80" target="_self" style="border-style:none;font-size:1em;">Programs & Resources</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Sales Ideas &amp;amp; Turnkey Solutions" id="ctl00_mainMenun84">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=82" target="_self" style="border-style:none;font-size:1em;">Sales Ideas & Turnkey Solutions</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Seminars" id="ctl00_mainMenun85">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=83" target="_self" style="border-style:none;font-size:1em;">Seminars</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun73ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun73ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun74Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Brand Guidelines" id="ctl00_mainMenun86">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=48" target="_self" style="border-style:none;font-size:1em;">Brand Guidelines</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Logos &amp; Stationery" id="ctl00_mainMenun87">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=49" target="_self" style="border-style:none;font-size:1em;">Logos & Stationery</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun74ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun74ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun75Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Advisory Online Account Opening" id="ctl00_mainMenun88">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=222" target="_self" style="border-style:none;font-size:1em;">Advisory Online Account Opening</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Brokerage Online Account Opening" id="ctl00_mainMenun89">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=224" target="_self" style="border-style:none;font-size:1em;">Brokerage Online Account Opening</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Calculators" id="ctl00_mainMenun90">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=225" target="_self" style="border-style:none;font-size:1em;">Calculators</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="CRM Integation" id="ctl00_mainMenun91">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=226" target="_self" style="border-style:none;font-size:1em;">CRM Integation</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Features" id="ctl00_mainMenun92">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=227" target="_self" style="border-style:none;font-size:1em;">Features</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Investment &amp; Research Analysis" id="ctl00_mainMenun93">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=229" target="_self" style="border-style:none;font-size:1em;">Investment & Research Analysis</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="LaserApp" id="ctl00_mainMenun94">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=230" target="_self" style="border-style:none;font-size:1em;">LaserApp</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="MoneyGuideBroker" id="ctl00_mainMenun95">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=231" target="_self" style="border-style:none;font-size:1em;">MoneyGuideBroker</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="MoneyGuidePro" id="ctl00_mainMenun96">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=232" target="_self" style="border-style:none;font-size:1em;">MoneyGuidePro</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Morningstar" id="ctl00_mainMenun97">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=233" target="_self" style="border-style:none;font-size:1em;">Morningstar</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="NetX 360" id="ctl00_mainMenun98">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=234" target="_self" style="border-style:none;font-size:1em;">NetX 360</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Trade Review" id="ctl00_mainMenun99">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=235" target="_self" style="border-style:none;font-size:1em;">Trade Review</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="VA Comparison" id="ctl00_mainMenun100">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=236" target="_self" style="border-style:none;font-size:1em;">VA Comparison</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Portfolio Access" id="ctl00_mainMenun101">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=338" target="_self" style="border-style:none;font-size:1em;">Portfolio Access</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun75ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun75ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun5Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Manuals &amp; Guidelines" id="ctl00_mainMenun102">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=29" target="_self" style="border-style:none;font-size:1em;">Manuals & Guidelines</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Notices &amp; Alerts" id="ctl00_mainMenun103">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=30" target="_self" style="border-style:none;font-size:1em;">Notices & Alerts</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Notices &amp; Alerts" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Policies &amp; Procedures" id="ctl00_mainMenun104">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=31" target="_self" style="border-style:none;font-size:1em;">Policies & Procedures</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun5ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun5ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun103Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Compliance Alerts" id="ctl00_mainMenun105">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=52" target="_self" style="border-style:none;font-size:1em;">Compliance Alerts</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Compliance Notices" id="ctl00_mainMenun106">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=53" target="_self" style="border-style:none;font-size:1em;">Compliance Notices</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Bulletins" id="ctl00_mainMenun107">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=89" target="_self" style="border-style:none;font-size:1em;">Bulletins</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun103ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun103ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun6Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Getting Started" id="ctl00_mainMenun108">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=90" target="_self" style="border-style:none;font-size:1em;">Getting Started</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Program Offerings" id="ctl00_mainMenun109">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=91" target="_self" style="border-style:none;font-size:1em;">Program Offerings</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Program Offerings" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Tools" id="ctl00_mainMenun110">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=92" target="_self" style="border-style:none;font-size:1em;">Tools</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Training &amp; Education" id="ctl00_mainMenun111">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=93" target="_self" style="border-style:none;font-size:1em;">Training & Education</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Growing Your Business" id="ctl00_mainMenun112">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=94" target="_self" style="border-style:none;font-size:1em;">Growing Your Business</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun6ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun6ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun109Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Portfolio Advisory Services" id="ctl00_mainMenun113">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=335" target="_self" style="border-style:none;font-size:1em;">Portfolio Advisory Services</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Premier Portfolio Management" id="ctl00_mainMenun114">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=336" target="_self" style="border-style:none;font-size:1em;">Premier Portfolio Management</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Managed Wealth ADVANTAGE" id="ctl00_mainMenun115">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=337" target="_self" style="border-style:none;font-size:1em;">Managed Wealth ADVANTAGE</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun109ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun109ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun7Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Asset Allocation Portfolios" id="ctl00_mainMenun116">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=296" target="_self" style="border-style:none;font-size:1em;">Asset Allocation Portfolios</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Investment Research" id="ctl00_mainMenun117">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=249" target="_self" style="border-style:none;font-size:1em;">Investment Research</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Investment Research" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Investment Tools" id="ctl00_mainMenun118">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=250" target="_self" style="border-style:none;font-size:1em;">Investment Tools</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Investment Tools" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Market Commentaries" id="ctl00_mainMenun119">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=265" target="_self" style="border-style:none;font-size:1em;">Market Commentaries</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Market Commentaries" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun7ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun7ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun117Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="ETFs" id="ctl00_mainMenun120">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=257&amp;SSO=ETF_RES" target="_self" style="border-style:none;font-size:1em;">ETFs</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Mutual Fund News" id="ctl00_mainMenun121">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=260" target="_self" style="border-style:none;font-size:1em;">Mutual Fund News</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Research Select List" id="ctl00_mainMenun122">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=261" target="_self" style="border-style:none;font-size:1em;">Research Select List</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun117ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun117ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun118Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Calculators" id="ctl00_mainMenun123">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=225&amp;Referer=Research" target="_self" style="border-style:none;font-size:1em;">Calculators</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="FINRA Fund Analyzer" id="ctl00_mainMenun124">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Common.aspx?ContentId=1021224" target="_self" style="border-style:none;font-size:1em;">FINRA Fund Analyzer</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Morningstar AWS" id="ctl00_mainMenun125">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=254" target="_self" style="border-style:none;font-size:1em;">Morningstar AWS</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Morningstar Portfolio SnapShot " id="ctl00_mainMenun126">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/Workstation/SSO/MStar/PortfolioSnapshot.aspx" target="_self" style="border-style:none;font-size:1em;">Morningstar Portfolio SnapShot </a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Stock Screener" id="ctl00_mainMenun127">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/Workstation/Screener.html" target="_self" style="border-style:none;font-size:1em;">Stock Screener</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="VA Comparison Tool" id="ctl00_mainMenun128">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=272" target="_self" style="border-style:none;font-size:1em;">VA Comparison Tool</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun118ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun118ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun119Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Daily Market Briefing" id="ctl00_mainMenun129">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=266" target="_self" style="border-style:none;font-size:1em;">Daily Market Briefing</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Market Bulletins &amp; White Papers" id="ctl00_mainMenun130">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=267" target="_self" style="border-style:none;font-size:1em;">Market Bulletins & White Papers</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Monthly Market Monitor" id="ctl00_mainMenun131">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=268" target="_self" style="border-style:none;font-size:1em;">Monthly Market Monitor</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Quarterly Market Outlook" id="ctl00_mainMenun132">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=269" target="_self" style="border-style:none;font-size:1em;">Quarterly Market Outlook</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Quarterly Recap" id="ctl00_mainMenun133">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=270" target="_self" style="border-style:none;font-size:1em;">Quarterly Recap</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Third Party Market Commentaries" id="ctl00_mainMenun134">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=271" target="_self" style="border-style:none;font-size:1em;">Third Party Market Commentaries</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun119ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun119ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun8Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Click &#39;n Play Library" id="ctl00_mainMenun135">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier2.aspx?MenuId=113" target="_self" style="border-style:none;font-size:1em;">Click 'n Play Library</a></td><td style="width:0;"><img src="../resources/6099252.gif" alt="Expand Click &#39;n Play Library" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Compliance Training" id="ctl00_mainMenun136">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=114" target="_self" style="border-style:none;font-size:1em;">Compliance Training</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Guides &amp; Manuals" id="ctl00_mainMenun137">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=116" target="_self" style="border-style:none;font-size:1em;">Guides & Manuals</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Job Aids &amp; EZ Guides" id="ctl00_mainMenun138">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=117" target="_self" style="border-style:none;font-size:1em;">Job Aids & EZ Guides</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Technology &amp; Security" id="ctl00_mainMenun139">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=288" target="_self" style="border-style:none;font-size:1em;">Technology & Security</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Training &amp; Development" id="ctl00_mainMenun140">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=119" target="_self" style="border-style:none;font-size:1em;">Training & Development</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun8ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun8ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><div id="ctl00_mainMenun135Items" class="ctl00_mainMenu_0 adjustedZindex ctl00_mainMenu_8">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Advisory Services" id="ctl00_mainMenun141">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=121" target="_self" style="border-style:none;font-size:1em;">Advisory Services</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Archived Events" id="ctl00_mainMenun142">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=122" target="_self" style="border-style:none;font-size:1em;">Archived Events</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="SmartWorks" id="ctl00_mainMenun143">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=125" target="_self" style="border-style:none;font-size:1em;">SmartWorks</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="MoneyGuideSuite" id="ctl00_mainMenun144">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=248" target="_self" style="border-style:none;font-size:1em;">MoneyGuideSuite</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Morningstar Advisor Workstation" id="ctl00_mainMenun145">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=126" target="_self" style="border-style:none;font-size:1em;">Morningstar Advisor Workstation</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="NetX 360" id="ctl00_mainMenun146">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=127" target="_self" style="border-style:none;font-size:1em;">NetX 360</a></td>
				</tr>
			</table></td>
		</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Timesaving Tools &amp; Resources" id="ctl00_mainMenun147">
			<td><table class="submenuitems ctl00_mainMenu_7" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;width:100%;"><a class="ctl00_mainMenu_1 submenuitems ctl00_mainMenu_6" href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=128" target="_self" style="border-style:none;font-size:1em;">Timesaving Tools & Resources</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun135ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=p73wclBgx332R7R92FSkXItosjnzEvwhoKR90xC9BeE1&amp;t=634869908874485606" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun135ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="/BrokerDealerCenter/WebResource.axd?d=eC0Lrv5e7yCQhdbL271hTYdnVvy25zeraTDNsnXTC3g1&amp;t=634869908874485606" alt="Scroll down" />
	</div>
</div><a id="ctl00_mainMenu_SkipLink"></a>
                </div>
                <input type="hidden" name="ctl00$hfSiteId" id="ctl00_hfSiteId" value="108" />
                <input type="hidden" name="ctl00$hfPersonPartyId" id="ctl00_hfPersonPartyId" value="7009234" />
                <input type="hidden" name="ctl00$hfSplashParam" id="ctl00_hfSplashParam" />
                <input type="hidden" name="ctl00$hfDocId" id="ctl00_hfDocId" />
                <input type="hidden" name="ctl00$hfDocType" id="ctl00_hfDocType" />
                <input type="hidden" name="ctl00$hfNewWindow" id="ctl00_hfNewWindow" />
                <input type="hidden" name="ctl00$hfLinkToUrl" id="ctl00_hfLinkToUrl" />
                <input type="hidden" name="ctl00$hfSuppressLeftNavigation" id="ctl00_hfSuppressLeftNavigation" />
                <input type="hidden" name="ctl00$hfRowNo" id="ctl00_hfRowNo" />
                
                <div class="clearfloat">
                </div>
            </div>
            <!-- end #menuContainer -->
            <div id="breadQuick">
                <div class="fltlft">
                    
<div></div>
<span id="ctl00_BreadCrumb1_SiteMapPathNavigation"><a href="#ctl00_BreadCrumb1_SiteMapPathNavigation_SkipLink"><img alt="Skip Navigation Links" height="0" width="0" src="../WebResource_SkipNav.gif" style="border-width:0px;" /></a><a id="ctl00_BreadCrumb1_SiteMapPathNavigation_SkipLink"></a></span>
 
                </div>
                <div class="fltrt">
                    
<div></div>
<select name="ctl00$QuickLinks1$ddlQuickLink" id="ctl00_QuickLinks1_ddlQuickLink" class="dropdown1" onChange="ShowQuickLink(this);" style="width:250px;">
	<option value="0">-- Select a Quick Link --</option>
 
</select>
                            
                        
 
                </div>
                <div class="clearfloat">
                </div>
                <div>
                    
                </div>
            </div>
        </div>
        <!-- end #header -->
        <!-- #############  Start #mainWrapper ############# -->
        <div id="mainWrapper">
            
    <div>
    <div>
    
    </div>
        
        <div id="ctl00_ContentPlaceHolder1_divContent" valign="top" style="width: 100%">
            <table cellspacing="0" cellpadding="0" border="0" id="ctl00_ContentPlaceHolder1_WebPartZone11" style="width:100%;">
	<tr>
		<td style="height:100%;"><table cellspacing="0" cellpadding="2" border="0" style="width:100%;height:100%;">
			<tr>
				<td><table cellspacing="0" cellpadding="2" border="0" id="WebPart_gwpucContentPortlet" style="width:100%;">
					<tr>
						<td class="PartStyleOverview" style="padding:5px;">
<table width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="top">
            <div id="ctl00_ctl03_gwpucContentPortlet_ucContentPortlet_divContent" style="width: 100%">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                        
                        </td>
                    </tr>
                    <tr>
                        <td>
                        
                            <!-- cobbler: 28591417  -->
 
<div id="cet">
 
<h1>Adviser Portal - Contacts</h1>
<ul>
 
<li><a href="/BrokerDealerCenter/Portal/RenderContent.aspx?ContentId=28907335" target="_blank">GFSC Get Connected</a></li>
  <li><a href="/BrokerDealerCenter/Portal/Common.aspx?ContentId=28907357">GFSC Quick Connects</a></li>
 
</ul> 
  <h2>Team Directory</h2>
 <ul> 
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=0ef5a730-438e-4905-8f54-f4d2dc813e94">Adviser Recruiting</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=281c0175-10f6-4834-aee5-cbc6863a4c15">Adviser Services</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=7197df37-c598-4bca-a54f-452ac60aa41d">Business Development (RPS/IPS/PMC)</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=244c15b3-9fb6-4545-88c4-cd40971869d7">Business Processing</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=3cb37bb9-aa87-4024-aba5-b890913dfef7">Client Solutions</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=4cf78267-b223-43c9-bbce-5af3ae1ce074">Commissions</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=01643aea-b6f2-4f6f-807e-a86522229bb2">Compliance</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=cd4e19f8-d3f7-40b8-a561-5d079f419418">Executive Team</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=8fc1b8cc-78a6-42ec-b865-6e6c2bfcf328">Finance</a></li>
 
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=fb1d0e25-aae1-4a46-b733-c426da2cc8b6">Insurance Appointments and Securities Registrations</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=7d1360cc-d798-4610-8837-bf623d6cd995">Marketing</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=87b6ed97-c8c0-4606-8d05-d8e6bad62932">Product Management</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=58f25cf8-6dde-4cdf-9e4d-3fe590f0ce0d">Service Leadership</a></li>
  <li><a href="/TotalAccess/Auth/Contacts/ShowDepartmentAndEmployees.aspx?DepartmentId=2c77f50e-27b2-4bfa-b47d-7f516cd86b7b">Trading Services</a></li>
 </ul>
 
<h2>Other Contacts</h2>
<ul>
    <li><a href="/TotalAccess/Auth/Contacts/rd.aspx">Regional Directors</a></li>
    <li><a href="/TotalAccess/Auth/Contacts/LifeInsAdvCaseSupp.aspx">Insurance Support</a></li>
    <li><a href="/TotalAccess/Auth/Contacts/core.aspx">Third Party Technology Vendors</a></li>
</ul>
 
</div>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        <td valign="top">
            
        </td>
    </tr>
</table>
</td>
					</tr>
				</table></td>
			</tr><tr>
				<td style="padding:0;height:100%;"></td>
			</tr>
		</table></td>
	</tr>
</table>
        </div>
    </div>
 
            <div class="clearfloat">
            </div>
        </div>
        <!-- end #mainContent -->
        <!-- ################  Start #footer ################ -->
        <div id="footer">
            <div id="footerCopyright">
                <p class="fltrt">
                    Cetera Financial Group © 2010. All rights reserved.</p>
             <!--   <p>
                    <a href="Common.aspx?ContentId=2000014" id="ctl00_PrivacyPromise" class="linkType2">Cetera's Privacy Promise</a>
                </p> -->
            </div>
            <!-- end #footertop -->
            <div class="clearfloat">
            </div>
        </div>
        <!-- end #footer -->
        <div>
            <div id="ctl00_pnlPopup" style="background-color:White;border-color:#788CC7;border-width:4px;border-style:solid;height:100px;width:400px;display: none">
	
                <table class="style1">
                    <tr>
                        <td>
                            
<table cellpadding="0" cellspacing="0">
    <tr>
        <td>
        
        </td>
    </tr>
    <tr>
        <td>
         
            
        </td>
    </tr>
</table>
 
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="submit" name="ctl00$btnOk" value="Ok" id="ctl00_btnOk" />
                            &nbsp;
                            <input type="submit" name="ctl00$btnCancel" value="Cancel" id="ctl00_btnCancel" />
                        </td>
                    </tr>
                </table>
            
</div>
            <a id="ctl00_lnkBtnPopup" href="javascript:__doPostBack(&#39;ctl00$lnkBtnPopup&#39;,&#39;&#39;)"></a>
            <script type="text/javascript"> 
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ctl00$ScriptManager1', 'aspnetForm', [], [], [], 90, 'ctl00');
//]]>
</script>
 
            
        </div>
    </div>
    <!-- end #container -->
    
 
<script type="text/javascript"> 
//<![CDATA[
var __wpmExportWarning='This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.';var __wpmCloseProviderWarning='You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.';var __wpmDeleteWarning='You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.';//]]>
</script>
 
<script type="text/javascript"> 
 
__wpm = new WebPartManager();
__wpm.overlayContainerElement = null;
__wpm.personalizationScopeShared = false;
 
var zoneElement;
var zoneObject;
 
zoneElement = document.getElementById('ctl00_ContentPlaceHolder1_WebPartZone12');
if (zoneElement != null) {
    zoneObject = __wpm.AddZone(zoneElement, 'ctl00$ContentPlaceHolder1$WebPartZone12', true, false, 'black');
    zoneObject.AddWebPart(document.getElementById('WebPart_gwpucContentOverview'), null, false);
}
zoneElement = document.getElementById('ctl00_ContentPlaceHolder1_WebPartZone11');
if (zoneElement != null) {
    zoneObject = __wpm.AddZone(zoneElement, 'ctl00$ContentPlaceHolder1$WebPartZone11', true, false, 'black');
    zoneObject.AddWebPart(document.getElementById('WebPart_gwpucContentPortlet'), null, false);
}
zoneElement = document.getElementById('ctl00_ctl03_gwpucContentPortlet_ucContentPortlet_WebPartZoneRelatedContent');
if (zoneElement != null) {
    zoneObject = __wpm.AddZone(zoneElement, 'ctl00$ctl03$gwpucContentPortlet$ucContentPortlet$WebPartZoneRelatedContent', true, false, 'black');
    zoneObject.AddWebPart(document.getElementById('WebPart_gwpucRelatedContent'), null, false);
}
</script>
 
<script type="text/javascript"> 

//<![CDATA[
var ctl00_mainMenu_Data = new Object();
ctl00_mainMenu_Data.disappearAfter = 500;
ctl00_mainMenu_Data.horizontalOffset = 2;
ctl00_mainMenu_Data.verticalOffset = 0;
ctl00_mainMenu_Data.hoverClass = 'ctl00_mainMenu_14 submenuhover';
ctl00_mainMenu_Data.hoverHyperLinkClass = 'ctl00_mainMenu_13 submenuhover';
ctl00_mainMenu_Data.staticHoverClass = 'ctl00_mainMenu_12 menuhover';
ctl00_mainMenu_Data.staticHoverHyperLinkClass = 'ctl00_mainMenu_11 menuhover';
Sys.Application.add_init(function() {
    $create(AjaxControlToolkit.ModalPopupBehavior, {"BackgroundCssClass":"GrayedOut","CancelControlID":"ctl00_btnCancel","OkControlID":"ctl00_btnOk","OnCancelScript":"onCancel()","OnOkScript":"onOk()","PopupControlID":"ctl00_pnlPopup","dynamicServicePath":"/BrokerDealerCenter/Portal/Common.aspx","id":"ctl00_ModalPopupExtender1"}, null, null, $get("ctl00_lnkBtnPopup"));
});
//]]>
</script>
</form>
</body>
</html>


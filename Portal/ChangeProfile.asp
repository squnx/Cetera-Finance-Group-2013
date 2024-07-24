
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
			var iIdleTime = parseInt(getCookie("IDLE_TIME_TO_EXPIRE")); 
			
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
	Broker-Dealer
</title>

    <script language="javascript" type="text/javascript">
    
        function refreshSmartworks()
        {
//	        if(window.opener && !window.opener.closed)
//	        {
//	        	window.opener.focus();
//	        }
//	        else
//	        {
// 		        window.open("/Workstation/Default.aspx", "SmartWorks");
//            }
        }
    
        function CheckInputs()
			{			
			
                var Party_Id = document.getElementById('ctl00_ContentPlaceHolder1_txtProfileId');
                var SSN_Id = document.getElementById('ctl00_ContentPlaceHolder1_txtSSN');

				if( SSN_Id.value != "" )
				{			 
				    var regexpSSN = /^(\d{9}|\d{3}-\d{2}-\d{4})$/;  // For SSN Check
				    var regexpTaxId = /^(\d{9}|\d{2}-\d{7})$/;   // For TaxId Check  
				    if(!regexpSSN.test(SSN_Id.value))
                    {
                        if(!regexpTaxId.test(SSN_Id.value))
                        {
                            alert("Enter a valid SSN or TaxId");
                                return false;
                        }
                    }   
				}	
				if( Party_Id.value != "" )
				{
				    if(!isInteger(Party_Id.value))
				    {
				        alert("Enter a valid person party id");
						Party_Id.focus();
						return false;
				    }
				}
		    }
    
    </script>
    
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

</style></head>
<body>
    <form name="aspnetForm" method="post" action="ChangeProfile.aspx" id="aspnetForm">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTQ5MzU3MDg3OQ9kFgJmD2QWAgIDD2QWDgIBDw8WAh4EVGV4dAURV2VsY29tZSBJVkFOIFNPTkdkZAIFDw8WBB4ISW1hZ2VVcmwFGS4uL3Jlc291cmNlcy9DRlNfTE9HTy5wbmceC05hdmlnYXRlVXJsBSQvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Ib21lLmFzcHhkZAIHDw8WAh8ABeIFJm5ic3A7fCZuYnNwOzxhIGlkPSJoeXBNeVByb2ZpbGUiIGhyZWY9Ii9Ub3RhbEFjY2Vzcy9BdXRoL3VzZXJwcm9maWxlLmFzcHgiIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nZnJtQ29udGVudCcgPk15IFByb2ZpbGU8L2E+Jm5ic3A7fCZuYnNwOzxhIGlkPSJoeXBDb250YWN0VXMiIGhyZWY9Ii4uL1BvcnRhbC9Db21tb24uYXNweD9Db250ZW50SWQ9Mjg1OTE0MTciIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nX3NlbGYnID5Db250YWN0IFVzPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwU2l0ZU1hcCIgaHJlZj0iLi4vUG9ydGFsL1NpdGVtYXAuYXNweCIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdfc2VsZicgPlNpdGUgTWFwPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwQWRtaW4iIGhyZWY9Ii4uL1BvcnRhbC9DaGFuZ2VQcm9maWxlLmFzcHgiIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nX3NlbGYnID5BZG1pbjwvYT4mbmJzcDt8Jm5ic3A7PGEgaWQ9Imh5cFNtYXJ0d29ya3MiIGhyZWY9ImphdmFzY3JpcHQ6d2luZG93SGFuZGxlID0gbGF1bmNoX3NtYXJ0d29ya3MoKTsiIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nX3NlbGYnID5TbWFydFdvcmtzPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwTG9nT3V0IiBocmVmPSJqYXZhc2NyaXB0OndpbmRvd0hhbmRsZSA9IGxvZ291dCgpOyIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdfc2VsZicgPkxvZyBPdXQ8L2E+Jm5ic3A7ZGQCEQ88KwANAgAPFgIeC18hRGF0YUJvdW5kZ2QMFCsACwUnMDowLDA6MSwwOjIsMDozLDA6NCwwOjUsMDo2LDA6NywwOjgsMDo5FCsAAhYUHgVWYWx1ZQUESG9tZR4JRGF0YUJvdW5kZx4IU2VsZWN0ZWRnHwAFBEhvbWUfAgUtL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvSG9tZS5hc3B4P01lbnVJZD0xHgdFbmFibGVkZx4KU2VsZWN0YWJsZWceBlRhcmdldAUFX3NlbGYeB1Rvb2xUaXAFBEhvbWUeCERhdGFQYXRoBQExZBQrAAIWEh8EBQtNeSBCdXNpbmVzcx8FZx8ABQtNeSBCdXNpbmVzcx8CBQEjHwdnHwhoHwkFBV9zZWxmHwoFC015IEJ1c2luZXNzHwsFATIUKwAEBUswOjAsMDoxLDA6MiwxOjIsMDoyLDE6MiwwOjIsMDozLDE6MywwOjMsMTozLDA6MywxOjMsMDozLDE6MywwOjMsMTozLDA6MywxOjMUKwACFhIfBAUUQnJva2VyYWdlIE9wZXJhdGlvbnMfBWcfAAUUQnJva2VyYWdlIE9wZXJhdGlvbnMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9MTAfB2cfCGcfCQUFX3NlbGYfCgUUQnJva2VyYWdlIE9wZXJhdGlvbnMfCwUCMTAUKwAFBS8wOjAsMDoxLDE6MSwwOjEsMDoyLDA6MywxOjMsMDozLDE6MywwOjMsMDo0LDE6NBQrAAIWEh8EBQ9HZXR0aW5nIFN0YXJ0ZWQfBWcfAAUPR2V0dGluZyBTdGFydGVkHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzOB8HZx8IZx8JBQVfc2VsZh8KBQ9HZXR0aW5nIFN0YXJ0ZWQfCwUDMjM4ZBQrAAIWEh8EBQxOZXcgQWNjb3VudHMfBWcfAAUMTmV3IEFjY291bnRzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTE3NR8HZx8IZx8JBQVfc2VsZh8KBQxOZXcgQWNjb3VudHMfCwUDMTc1FCsABwUXMDowLDA6MSwwOjIsMDozLDA6NCwwOjUUKwACFhIfBAUVQWNjb3VudCBFc3RhYmxpc2htZW50HwVnHwAFFUFjY291bnQgRXN0YWJsaXNobWVudB8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNzcfB2cfCGcfCQUFX3NlbGYfCgUVQWNjb3VudCBFc3RhYmxpc2htZW50HwsFAzE3N2QUKwACFhIfBAUTQWNjb3VudCBNYWludGVuYW5jZR8FZx8ABRNBY2NvdW50IE1haW50ZW5hbmNlHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIwNB8HZx8IZx8JBQVfc2VsZh8KBRNBY2NvdW50IE1haW50ZW5hbmNlHwsFAzIwNGQUKwACFhIfBAUTQWRkaXRpb25hbCBTZXJ2aWNlcx8FZx8ABRNBZGRpdGlvbmFsIFNlcnZpY2VzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE3Nh8HZx8IZx8JBQVfc2VsZh8KBRNBZGRpdGlvbmFsIFNlcnZpY2VzHwsFAzE3NmQUKwACFhIfBAUJQU1MIFJ1bGVzHwVnHwAFCUFNTCBSdWxlcx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xODAfB2cfCGcfCQUFX3NlbGYfCgUJQU1MIFJ1bGVzHwsFAzE4MGQUKwACFhIfBAUTUHJvaGliaXRlZCBBY2NvdW50cx8FZx8ABRNQcm9oaWJpdGVkIEFjY291bnRzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4MR8HZx8IZx8JBQVfc2VsZh8KBRNQcm9oaWJpdGVkIEFjY291bnRzHwsFAzE4MWQUKwACFhIfBAUeUmV0aXJlbWVudCBBY2NvdW50IEluZm9ybWF0aW9uHwVnHwAFHlJldGlyZW1lbnQgQWNjb3VudCBJbmZvcm1hdGlvbh8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNzgfB2cfCGcfCQUFX3NlbGYfCgUeUmV0aXJlbWVudCBBY2NvdW50IEluZm9ybWF0aW9uHwsFAzE3OGQUKwACFhIfBAUNTmV3cyAmIEFsZXJ0cx8FZx8ABQ1OZXdzICYgQWxlcnRzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4Mh8HZx8IZx8JBQVfc2VsZh8KBQ1OZXdzICYgQWxlcnRzHwsFAzE4MmQUKwACFhIfBAUHVHJhZGluZx8FZx8ABQdUcmFkaW5nHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTE4NB8HZx8IZx8JBQVfc2VsZh8KBQdUcmFkaW5nHwsFAzE4NBQrAA0FMTA6MCwwOjEsMDoyLDA6MywwOjQsMDo1LDA6NiwwOjcsMDo4LDA6OSwwOjEwLDA6MTEUKwACFhIfBAUVQW5udWl0aWVzIChTdWJzY3JpYmUpHwVnHwAFFUFubnVpdGllcyAoU3Vic2NyaWJlKR8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMDgfB2cfCGcfCQUFX3NlbGYfCgUVQW5udWl0aWVzIChTdWJzY3JpYmUpHwsFAzIwOGQUKwACFhIfBAUgQiBhbmQgQyBTaGFyZSAtIENsYXNzIEV4ZW1wdGlvbnMfBWcfAAUgQiBhbmQgQyBTaGFyZSAtIENsYXNzIEV4ZW1wdGlvbnMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTg1HwdnHwhnHwkFBV9zZWxmHwoFIEIgYW5kIEMgU2hhcmUgLSBDbGFzcyBFeGVtcHRpb25zHwsFAzE4NWQUKwACFhIfBAUcQiBhbmQgQyBTaGFyZSAtIENsYXNzIFBvbGljeR8FZx8ABRxCIGFuZCBDIFNoYXJlIC0gQ2xhc3MgUG9saWN5HwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4Nh8HZx8IZx8JBQVfc2VsZh8KBRxCIGFuZCBDIFNoYXJlIC0gQ2xhc3MgUG9saWN5HwsFAzE4NmQUKwACFhIfBAUQRFZQIChDT0Qgb3IgUlZQKR8FZx8ABRBEVlAgKENPRCBvciBSVlApHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4Nx8HZx8IZx8JBQVfc2VsZh8KBRBEVlAgKENPRCBvciBSVlApHwsFAzE4N2QUKwACFhIfBAUORXJyb3IgQWNjb3VudHMfBWcfAAUORXJyb3IgQWNjb3VudHMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTg4HwdnHwhnHwkFBV9zZWxmHwoFDkVycm9yIEFjY291bnRzHwsFAzE4OGQUKwACFhIfBAUMRml4ZWQgSW5jb21lHwVnHwAFDEZpeGVkIEluY29tZR8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xODkfB2cfCGcfCQUFX3NlbGYfCgUMRml4ZWQgSW5jb21lHwsFAzE4OWQUKwACFhIfBAUMTXV0dWFsIEZ1bmRzHwVnHwAFDE11dHVhbCBGdW5kcx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOTAfB2cfCGcfCQUFX3NlbGYfCgUMTXV0dWFsIEZ1bmRzHwsFAzE5MGQUKwACFhIfBAUeTm8gVHJhbnNhY3Rpb24gRmVlIChOVEYpIEZ1bmRzHwVnHwAFHk5vIFRyYW5zYWN0aW9uIEZlZSAoTlRGKSBGdW5kcx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOTEfB2cfCGcfCQUFX3NlbGYfCgUeTm8gVHJhbnNhY3Rpb24gRmVlIChOVEYpIEZ1bmRzHwsFAzE5MWQUKwACFhIfBAULT3BlbiBPcmRlcnMfBWcfAAULT3BlbiBPcmRlcnMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTkyHwdnHwhnHwkFBV9zZWxmHwoFC09wZW4gT3JkZXJzHwsFAzE5MmQUKwACFhIfBAUOU2VjdXJpdHkgU2V0dXAfBWcfAAUOU2VjdXJpdHkgU2V0dXAfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTkzHwdnHwhnHwkFBV9zZWxmHwoFDlNlY3VyaXR5IFNldHVwHwsFAzE5M2QUKwACFhIfBAUZU3lzdGVtYXRpYyBCdXlzIGFuZCBTZWxscx8FZx8ABRlTeXN0ZW1hdGljIEJ1eXMgYW5kIFNlbGxzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE5NB8HZx8IZx8JBQVfc2VsZh8KBRlTeXN0ZW1hdGljIEJ1eXMgYW5kIFNlbGxzHwsFAzE5NGQUKwACFhIfBAUUVGhyZXNob2xkIFNlY3VyaXRpZXMfBWcfAAUUVGhyZXNob2xkIFNlY3VyaXRpZXMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTk1HwdnHwhnHwkFBV9zZWxmHwoFFFRocmVzaG9sZCBTZWN1cml0aWVzHwsFAzE5NWQUKwACFhIfBAUXQWR2YW5jZWQgUGxhbm5pbmcgR3JvdXAfBWcfAAUXQWR2YW5jZWQgUGxhbm5pbmcgR3JvdXAfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9MTEfB2cfCGcfCQUFX3NlbGYfCgUXQWR2YW5jZWQgUGxhbm5pbmcgR3JvdXAfCwUCMTEUKwAEBQswOjAsMDoxLDA6MhQrAAIWEh8EBQ9UYXggSW5mb3JtYXRpb24fBWcfAAUPVGF4IEluZm9ybWF0aW9uHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIxNR8HZx8IZx8JBQVfc2VsZh8KBQ9UYXggSW5mb3JtYXRpb24fCwUDMjE1ZBQrAAIWEh8EBQ9JUkEgSW5mb3JtYXRpb24fBWcfAAUPSVJBIEluZm9ybWF0aW9uHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIxNx8HZx8IZx8JBQVfc2VsZh8KBQ9JUkEgSW5mb3JtYXRpb24fCwUDMjE3ZBQrAAIWEh8EBQ1NaXNjZWxsYW5lb3VzHwVnHwAFDU1pc2NlbGxhbmVvdXMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjE4HwdnHwhnHwkFBV9zZWxmHwoFDU1pc2NlbGxhbmVvdXMfCwUDMjE4ZBQrAAIWEh8EBRlMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb25zHwVnHwAFGUxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbnMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9MTQfB2cfCGcfCQUFX3NlbGYfCgUZTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucx8LBQIxNBQrAAQFCzA6MCwwOjEsMDoyFCsAAhYSHwQFCFJlbmV3YWxzHwVnHwAFCFJlbmV3YWxzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE1Mh8HZx8IZx8JBQVfc2VsZh8KBQdSZW5ld2FsHwsFAzE1MmQUKwACFhIfBAUeTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEZvcm1zHwVnHwAFHkxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbiBGb3Jtcx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNTMfB2cfCGcfCQUFX3NlbGYfCgUeTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEZvcm1zHwsFAzE1M2QUKwACFhIfBAUhTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucyBHZW5lcmFsHwVnHwAFIUxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbnMgR2VuZXJhbB8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yNDIfB2cfCGcfCQUFX3NlbGYfCgUhTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucyBHZW5lcmFsHwsFAzI0MmQUKwACFhIfBAUTUHJvZHVjdCBJbmZvcm1hdGlvbh8FZx8ABRNQcm9kdWN0IEluZm9ybWF0aW9uHwIFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTMfB2cfCGcfCQUFX3NlbGYfCgUTUHJvZHVjdCBJbmZvcm1hdGlvbh8LBQEzFCsACAUjMDowLDA6MSwwOjIsMDozLDA6NCwwOjUsMDo2LDA6NywxOjcUKwACFhIfBAUWQXBwcm92ZWQgUHJvZHVjdCBMaXN0cx8FZx8ABRZBcHByb3ZlZCBQcm9kdWN0IExpc3RzHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTU0HwdnHwhnHwkFBV9zZWxmHwoFFkFwcHJvdmVkIFByb2R1Y3QgTGlzdHMfCwUCNTRkFCsAAhYSHwQFCEFkdmlzb3J5HwVnHwAFCEFkdmlzb3J5HwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTU1HwdnHwhnHwkFBV9zZWxmHwoFCEFkdmlzb3J5HwsFAjU1ZBQrAAIWEh8EBQlBbm51aXRpZXMfBWcfAAUJQW5udWl0aWVzHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTU3HwdnHwhnHwkFBV9zZWxmHwoFCUFubnVpdGllcx8LBQI1NxQrAAMFBzA6MCwwOjEUKwACFhIfBAUFRml4ZWQfBWcfAAUFRml4ZWQfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTgfB2cfCGcfCQUFX3NlbGYfCgUFRml4ZWQfCwUCNThkFCsAAhYSHwQFCFZhcmlhYmxlHwVnHwAFCFZhcmlhYmxlHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTU5HwdnHwhnHwkFBV9zZWxmHwoFCFZhcmlhYmxlHwsFAjU5ZBQrAAIWEh8EBQtJbnZlc3RtZW50cx8FZx8ABQtJbnZlc3RtZW50cx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD02MB8HZx8IZx8JBQVfc2VsZh8KBQtJbnZlc3RtZW50cx8LBQI2MBQrAAYFEzA6MCwwOjEsMDoyLDA6MywwOjQUKwACFhIfBAUXQWx0ZXJuYXRpdmUgSW52ZXN0bWVudHMfBWcfAAUXQWx0ZXJuYXRpdmUgSW52ZXN0bWVudHMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjEfB2cfCGcfCQUFX3NlbGYfCgUXQWx0ZXJuYXRpdmUgSW52ZXN0bWVudHMfCwUCNjFkFCsAAhYSHwQFFERlZmluZWQgQ29udHJpYnV0aW9uHwVnHwAFFERlZmluZWQgQ29udHJpYnV0aW9uHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTYyHwdnHwhnHwkFBV9zZWxmHwoFFERlZmluZWQgQ29udHJpYnV0aW9uHwsFAjYyZBQrAAIWEh8EBQxNdXR1YWwgRnVuZHMfBWcfAAUMTXV0dWFsIEZ1bmRzHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTYzHwdnHwhnHwkFBV9zZWxmHwoFDE11dHVhbCBGdW5kcx8LBQI2M2QUKwACFhIfBAURU2VjdGlvbiA1MjkgUGxhbnMfBWcfAAURU2VjdGlvbiA1MjkgUGxhbnMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjQfB2cfCGcfCQUFX3NlbGYfCgURU2VjdGlvbiA1MjkgUGxhbnMfCwUCNjRkFCsAAhYSHwQFEU90aGVyIEludmVzdG1lbnRzHwVnHwAFEU90aGVyIEludmVzdG1lbnRzHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY1HwdnHwhnHwkFBV9zZWxmHwoFEU90aGVyIEludmVzdG1lbnRzHwsFAjY1ZBQrAAIWEh8EBQlJbnN1cmFuY2UfBWcfAAUJSW5zdXJhbmNlHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTY2HwdnHwhnHwkFBV9zZWxmHwoFCUluc3VyYW5jZR8LBQI2NhQrAAcFFzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1FCsAAhYSHwQFEURpc2FiaWxpdHkgSW5jb21lHwVnHwAFEURpc2FiaWxpdHkgSW5jb21lHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY3HwdnHwhnHwkFBV9zZWxmHwoFEURpc2FiaWxpdHkgSW5jb21lHwsFAjY3ZBQrAAIWEh8EBQ5Mb25nLVRlcm0gQ2FyZR8FZx8ABQ5Mb25nLVRlcm0gQ2FyZR8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD02OB8HZx8IZx8JBQVfc2VsZh8KBQ5Mb25nIFRlcm0gY2FyZR8LBQI2OGQUKwACFhIfBAUEVGVybR8FZx8ABQRUZXJtHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY5HwdnHwhnHwkFBV9zZWxmHwoFBFRlcm0fCwUCNjlkFCsAAhYSHwQFDlVuaXZlcnNhbCBMaWZlHwVnHwAFDlVuaXZlcnNhbCBMaWZlHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTcwHwdnHwhnHwkFBV9zZWxmHwoFDlVuaXZlcnNhbCBMaWZlHwsFAjcwZBQrAAIWEh8EBRdWYXJpYWJsZSBVbml2ZXJzYWwgTGlmZR8FZx8ABRdWYXJpYWJsZSBVbml2ZXJzYWwgTGlmZR8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03MR8HZx8IZx8JBQVfc2VsZh8KBSFWYXJpYWJsZSBVbml2ZXJzYWwgTGlmZSBJbnN1cmFuY2UfCwUCNzFkFCsAAhYSHwQFCldob2xlIExpZmUfBWcfAAUKV2hvbGUgTGlmZR8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03Mh8HZx8IZx8JBQVfc2VsZh8KBRRXaG9sZSBMaWZlIEluc3VyYW5jZR8LBQI3MmQUKwACFhIfBAUQUmV0aXJlbWVudCBQbGFucx8FZx8ABRBSZXRpcmVtZW50IFBsYW5zHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI5NR8HZx8IZx8JBQVfc2VsZh8KBRBSZXRpcmVtZW50IFBsYW5zHwsFAzI5NWQUKwACFhIfBAUSU3RyYXRlZ2ljIFBhcnRuZXJzHwVnHwAFElN0cmF0ZWdpYyBQYXJ0bmVycx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03Mx8HZx8IZx8JBQVfc2VsZh8KBRJTdHJhdGVnaWMgUGFydG5lcnMfCwUCNzNkFCsAAhYSHwQFBUZvcm1zHwVnHwAFBUZvcm1zHwIFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTQfB2cfCGcfCQUFX3NlbGYfCgUFRm9ybXMfCwUBNBQrAAcFNzA6MCwxOjAsMDowLDA6MSwwOjIsMToyLDA6MiwwOjMsMTozLDA6MywwOjQsMDo1LDE6NSwwOjUUKwACFhIfBAUNRm9ybXMgU2VhcmNoIB8FZx8ABQ1Gb3JtcyBTZWFyY2ggHwIFNy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1NlYXJjaC5hc3B4P0ZvbGRlck5hbWU9Rm9ybXMfB2cfCGcfCQUFX3NlbGYfCgUNRm9ybXMgU2VhcmNoIB8LBQIxOGQUKwACFhIfBAURQWR2aXNvcnkgU2VydmljZXMfBWcfAAURQWR2aXNvcnkgU2VydmljZXMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTkfB2cfCGcfCQUFX3NlbGYfCgURQWR2aXNvcnkgU2VydmljZXMfCwUCMTlkFCsAAhYSHwQFGExpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbh8FZx8ABRhMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb24fAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9MjEfB2cfCGcfCQUFX3NlbGYfCgUYTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uHwsFAjIxFCsAAgULMDowLDA6MSwxOjEUKwACFhIfBAUgTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEdlbmVyYWwfBWcfAAUgTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEdlbmVyYWwfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzUfB2cfCGcfCQUFX3NlbGYfCgUgTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEdlbmVyYWwfCwUCMzVkFCsAAhYSHwQFDU1pc2NlbGxhbmVvdXMfBWcfAAUNTWlzY2VsbGFuZW91cx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yMh8HZx8IZx8JBQVfc2VsZh8KBQ1NaXNjZWxsYW5lb3VzHwsFAjIyFCsAAwUXMDowLDA6MSwwOjIsMToyLDA6MiwxOjIUKwACFhIfBAUVTWlzY2VsbGFuZW91cyBHZW5lcmFsHwVnHwAFFU1pc2NlbGxhbmVvdXMgR2VuZXJhbB8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zNh8HZx8IZx8JBQVfc2VsZh8KBRVNaXNjZWxsYW5lb3VzIEdlbmVyYWwfCwUCMzZkFCsAAhYSHwQFBUFkbWluHwVnHwAFBUFkbWluHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTM3HwdnHwhnHwkFBV9zZWxmHwoFBUFkbWluHwsFAjM3ZBQrAAIWEh8EBQxOZXcgQnVzaW5lc3MfBWcfAAUMTmV3IEJ1c2luZXNzHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTIzHwdnHwhnHwkFBV9zZWxmHwoFDE5ldyBCdXNpbmVzcx8LBQIyMxQrAAMFBzA6MCwwOjEUKwACFhIfBAUUTmV3IEJ1c2luZXNzIEdlbmVyYWwfBWcfAAUUTmV3IEJ1c2luZXNzIEdlbmVyYWwfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzkfB2cfCGcfCQUFX3NlbGYfCgUUTmV3IEJ1c2luZXNzIEdlbmVyYWwfCwUCMzlkFCsAAhYSHwQFCUluc3VyYW5jZR8FZx8ABQlJbnN1cmFuY2UfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTQ3HwdnHwhnHwkFBV9zZWxmHwoFCUluc3VyYW5jZR8LBQMxNDdkFCsAAhYSHwQFCkZvcm1zIExpc3QfBWcfAAUKRm9ybXMgTGlzdB8CBSkvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Gb3Jtc0xpc3QuYXNweB8HZx8IZx8JBQVfc2VsZh8KBQpGb3JtcyBMaXN0HwsFAzEzOGQUKwACFhIfBAURU2FsZXMgJiBNYXJrZXRpbmcfBWcfAAURU2FsZXMgJiBNYXJrZXRpbmcfAgUuL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9NR8HZx8IZx8JBQVfc2VsZh8KBRFTYWxlcyAmIE1hcmtldGluZx8LBQE1FCsABQUPMDowLDA6MSwwOjIsMDozFCsAAhYSHwQFD0Nvbm5lY3QyQ2xpZW50cx8FZx8ABQ9Db25uZWN0MkNsaWVudHMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9Mjk3HwdnHwhnHwkFBV9zZWxmHwoFD0Nvbm5lY3QyQ2xpZW50cx8LBQMyOTcUKwADBQ8wOjAsMDoxLDE6MSwwOjEUKwACFhIfBAUZQzJDIE1hcmtldGluZyBMaWJyYXJ5IFBybx8FZx8ABRlDMkMgTWFya2V0aW5nIExpYnJhcnkgUHJvHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzMR8HZx8IZx8JBQVfU2VsZh8KBRlDMkMgTWFya2V0aW5nIExpYnJhcnkvUHJvHwsFAzMzMWQUKwACFhIfBAUOQzJDIFVuaXZlcnNpdHkfBWcfAAUOQzJDIFVuaXZlcnNpdHkfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzMzHwdnHwhnHwkFBV9TZWxmHwoFDkMyQyBVbml2ZXJzaXR5HwsFAzMzM2QUKwACFhIfBAUeQ2xpZW50IEFjcXVpc2l0aW9uICYgUmV0ZW50aW9uHwVnHwAFHkNsaWVudCBBY3F1aXNpdGlvbiAmIFJldGVudGlvbh8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yNR8HZx8IZx8JBQVfc2VsZh8KBR5DbGllbnQgQWNxdWlzaXRpb24gJiBSZXRlbnRpb24fCwUCMjUUKwAJBR8wOjAsMDoxLDA6MiwwOjMsMDo0LDA6NSwwOjYsMDo3FCsAAhYSHwQFEEFkdmVydGlzaW5nICYgUFIfBWcfAAUQQWR2ZXJ0aXNpbmcgJiBQUh8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03NR8HZx8IZx8JBQVfc2VsZh8KBRBBZHZlcnRpc2luZyAmIFBSHwsFAjc1ZBQrAAIWEh8EBRJCcm9jaHVyZXMgJiBGbHllcnMfBWcfAAUSQnJvY2h1cmVzICYgRmx5ZXJzHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTc2HwdnHwhnHwkFBV9zZWxmHwoFEkJyb2NodXJlcyAmIEZseWVycx8LBQI3NmQUKwACFhIfBAUJQ2FtcGFpZ25zHwVnHwAFCUNhbXBhaWducx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03Nx8HZx8IZx8JBQVfc2VsZh8KBQlDYW1wYWlnbnMfCwUCNzdkFCsAAhYSHwQFHENsaWVudCAmIFByb3NwZWN0aW5nIExldHRlcnMfBWcfAAUcQ2xpZW50ICYgUHJvc3BlY3RpbmcgTGV0dGVycx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03OB8HZx8IZx8JBQVfc2VsZh8KBRxDbGllbnQgJiBQcm9zcGVjdGluZyBMZXR0ZXJzHwsFAjc4ZBQrAAIWEh8EBQ9DbGllbnQgUmVmZXJyYWwfBWcfAAUPQ2xpZW50IFJlZmVycmFsHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTc5HwdnHwhnHwkFBV9zZWxmHwoFD0NsaWVudCBSZWZlcnJhbB8LBQI3OWQUKwACFhIfBAUUUHJvZ3JhbXMgJiBSZXNvdXJjZXMfBWcfAAUUUHJvZ3JhbXMgJiBSZXNvdXJjZXMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9ODAfB2cfCGcfCQUFX3NlbGYfCgUUUHJvZ3JhbXMgJiBSZXNvdXJjZXMfCwUCODBkFCsAAhYSHwQFH1NhbGVzIElkZWFzICYgVHVybmtleSBTb2x1dGlvbnMfBWcfAAUfU2FsZXMgSWRlYXMgJiBUdXJua2V5IFNvbHV0aW9ucx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD04Mh8HZx8IZx8JBQVfc2VsZh8KBSNTYWxlcyBJZGVhcyAmYW1wOyBUdXJua2V5IFNvbHV0aW9ucx8LBQI4MmQUKwACFhIfBAUIU2VtaW5hcnMfBWcfAAUIU2VtaW5hcnMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9ODMfB2cfCGcfCQUFX3NlbGYfCgUIU2VtaW5hcnMfCwUCODNkFCsAAhYSHwQFDkJyYW5kIElkZW50aXR5HwVnHwAFDkJyYW5kIElkZW50aXR5HwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI2HwdnHwhnHwkFBV9zZWxmHwoFDkJyYW5kIElkZW50aXR5HwsFAjI2FCsAAwUHMDowLDA6MRQrAAIWEh8EBRBCcmFuZCBHdWlkZWxpbmVzHwVnHwAFEEJyYW5kIEd1aWRlbGluZXMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NDgfB2cfCGcfCQUFX3NlbGYfCgUQQnJhbmQgR3VpZGVsaW5lcx8LBQI0OGQUKwACFhIfBAUSTG9nb3MgJiBTdGF0aW9uZXJ5HwVnHwAFEkxvZ29zICYgU3RhdGlvbmVyeR8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD00OR8HZx8IZx8JBQVfc2VsZh8KBRJMb2dvcyAmIFN0YXRpb25lcnkfCwUCNDlkFCsAAhYSHwQFE1Rvb2xzICYgQ2FsY3VsYXRvcnMfBWcfAAUTVG9vbHMgJiBDYWxjdWxhdG9ycx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yNx8HZx8IZx8JBQVfc2VsZh8KBRNUb29scyAmIENhbGN1bGF0b3JzHwsFAjI3FCsADwVLMDowLDA6MSwxOjEsMDoxLDA6MiwwOjMsMDo0LDA6NSwxOjUsMDo1LDA6NiwwOjcsMDo4LDA6OSwwOjEwLDA6MTEsMDoxMiwwOjEzFCsAAhYSHwQFH0Fkdmlzb3J5IE9ubGluZSBBY2NvdW50IE9wZW5pbmcfBWcfAAUfQWR2aXNvcnkgT25saW5lIEFjY291bnQgT3BlbmluZx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMjIfB2cfCGcfCQUFX3NlbGYfCgUfQWR2aXNvcnkgT25saW5lIEFjY291bnQgT3BlbmluZx8LBQMyMjJkFCsAAhYSHwQFIEJyb2tlcmFnZSBPbmxpbmUgQWNjb3VudCBPcGVuaW5nHwVnHwAFIEJyb2tlcmFnZSBPbmxpbmUgQWNjb3VudCBPcGVuaW5nHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNB8HZx8IZx8JBQVfc2VsZh8KBSBCcm9rZXJhZ2UgT25saW5lIEFjY291bnQgT3BlbmluZx8LBQMyMjRkFCsAAhYSHwQFC0NhbGN1bGF0b3JzHwVnHwAFC0NhbGN1bGF0b3JzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNR8HZx8IZx8JBQVfc2VsZh8KBQtDYWxjdWxhdG9ycx8LBQMyMjVkFCsAAhYSHwQFDkNSTSBJbnRlZ2F0aW9uHwVnHwAFDkNSTSBJbnRlZ2F0aW9uHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNh8HZx8IZx8JBQVfc2VsZh8KBQ5DUk0gSW50ZWdhdGlvbh8LBQMyMjZkFCsAAhYSHwQFCEZlYXR1cmVzHwVnHwAFCEZlYXR1cmVzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNx8HZx8IZx8JBQVfc2VsZh8KBQhGZWF0dXJlcx8LBQMyMjdkFCsAAhYSHwQFHkludmVzdG1lbnQgJiBSZXNlYXJjaCBBbmFseXNpcx8FZx8ABR5JbnZlc3RtZW50ICYgUmVzZWFyY2ggQW5hbHlzaXMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjI5HwdnHwhnHwkFBV9zZWxmHwoFHkludmVzdG1lbnQgJiBSZXNlYXJjaCBBbmFseXNpcx8LBQMyMjlkFCsAAhYSHwQFCExhc2VyQXBwHwVnHwAFCExhc2VyQXBwHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzMB8HZx8IZx8JBQVfc2VsZh8KBQhMYXNlckFwcB8LBQMyMzBkFCsAAhYSHwQFEE1vbmV5R3VpZGVCcm9rZXIfBWcfAAUQTW9uZXlHdWlkZUJyb2tlch8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzEfB2cfCGcfCQUFX3NlbGYfCgUQTW9uZXlHdWlkZUJyb2tlch8LBQMyMzFkFCsAAhYSHwQFDU1vbmV5R3VpZGVQcm8fBWcfAAUNTW9uZXlHdWlkZVBybx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzIfB2cfCGcfCQUFX3NlbGYfCgUNTW9uZXlHdWlkZVBybx8LBQMyMzJkFCsAAhYSHwQFC01vcm5pbmdzdGFyHwVnHwAFC01vcm5pbmdzdGFyHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzMx8HZx8IZx8JBQVfc2VsZh8KBQtNb3JuaW5nc3Rhch8LBQMyMzNkFCsAAhYSHwQFCE5ldFggMzYwHwVnHwAFCE5ldFggMzYwHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzNB8HZx8IZx8JBQVfc2VsZh8KBQhOZXRYIDM2MB8LBQMyMzRkFCsAAhYSHwQFDFRyYWRlIFJldmlldx8FZx8ABQxUcmFkZSBSZXZpZXcfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjM1HwdnHwhnHwkFBV9zZWxmHwoFDFRyYWRlIFJldmlldx8LBQMyMzVkFCsAAhYSHwQFDVZBIENvbXBhcmlzb24fBWcfAAUNVkEgQ29tcGFyaXNvbh8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzYfB2cfCGcfCQUFX3NlbGYfCgUNVkEgQ29tcGFyaXNvbh8LBQMyMzZkFCsAAhYSHwQFEFBvcnRmb2xpbyBBY2Nlc3MfBWcfAAUQUG9ydGZvbGlvIEFjY2Vzcx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zMzgfB2cfCGcfCQUFX3NlbGYfCgUQUG9ydGZvbGlvIEFjY2Vzcx8LBQMzMzhkFCsAAhYSHwQFCkNvbXBsaWFuY2UfBWcfAAUKQ29tcGxpYW5jZR8CBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD02HwdnHwhnHwkFBV9zZWxmHwoFCkNvbXBsaWFuY2UfCwUBNhQrAAQFEzA6MCwxOjAsMDowLDA6MSwwOjIUKwACFhIfBAUUTWFudWFscyAmIEd1aWRlbGluZXMfBWcfAAUUTWFudWFscyAmIEd1aWRlbGluZXMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjkfB2cfCGcfCQUFX3NlbGYfCgUUTWFudWFscyAmIEd1aWRlbGluZXMfCwUCMjlkFCsAAhYSHwQFEE5vdGljZXMgJiBBbGVydHMfBWcfAAUQTm90aWNlcyAmIEFsZXJ0cx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0zMB8HZx8IZx8JBQVfc2VsZh8KBRBOb3RpY2VzICYgQWxlcnRzHwsFAjMwFCsABAULMDowLDA6MSwwOjIUKwACFhIfBAURQ29tcGxpYW5jZSBBbGVydHMfBWcfAAURQ29tcGxpYW5jZSBBbGVydHMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTIfB2cfCGcfCQUFX3NlbGYfCgURQ29tcGxpYW5jZSBBbGVydHMfCwUCNTJkFCsAAhYSHwQFEkNvbXBsaWFuY2UgTm90aWNlcx8FZx8ABRJDb21wbGlhbmNlIE5vdGljZXMfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTMfB2cfCGcfCQUFX3NlbGYfCgUSQ29tcGxpYW5jZSBOb3RpY2VzHwsFAjUzZBQrAAIWEh8EBQlCdWxsZXRpbnMfBWcfAAUJQnVsbGV0aW5zHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTg5HwdnHwhnHwkFBV9zZWxmHwoFCUJ1bGxldGlucx8LBQI4OWQUKwACFhIfBAUVUG9saWNpZXMgJiBQcm9jZWR1cmVzHwVnHwAFFVBvbGljaWVzICYgUHJvY2VkdXJlcx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zMR8HZx8IZx8JBQVfc2VsZh8KBRVQb2xpY2llcyAmIFByb2NlZHVyZXMfCwUCMzFkFCsAAhYSHwQFCEFkdmlzb3J5HwVnHwAFCEFkdmlzb3J5HwIFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTcfB2cfCGcfCQUFX3NlbGYfCgUIQWR2aXNvcnkfCwUBNxQrAAYFEzA6MCwwOjEsMDoyLDA6MywwOjQUKwACFhIfBAUPR2V0dGluZyBTdGFydGVkHwVnHwAFD0dldHRpbmcgU3RhcnRlZB8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD05MB8HZx8IZx8JBQVfc2VsZh8KBQ9HZXR0aW5nIFN0YXJ0ZWQfCwUCOTBkFCsAAhYSHwQFEVByb2dyYW0gT2ZmZXJpbmdzHwVnHwAFEVByb2dyYW0gT2ZmZXJpbmdzHwIFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTkxHwdnHwhnHwkFBV9zZWxmHwoFEVByb2dyYW0gT2ZmZXJpbmdzHwsFAjkxFCsABAUrMDowLDE6MCwwOjAsMTowLDA6MCwwOjEsMDoyLDE6MiwwOjIsMToyLDA6MhQrAAIWEh8EBRtQb3J0Zm9saW8gQWR2aXNvcnkgU2VydmljZXMfBWcfAAUbUG9ydGZvbGlvIEFkdmlzb3J5IFNlcnZpY2VzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzNR8HZx8IZx8JBQVfc2VsZh8KBRtQb3J0Zm9saW8gQWR2aXNvcnkgU2VydmljZXMfCwUDMzM1ZBQrAAIWEh8EBRxQcmVtaWVyIFBvcnRmb2xpbyBNYW5hZ2VtZW50HwVnHwAFHFByZW1pZXIgUG9ydGZvbGlvIE1hbmFnZW1lbnQfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzM2HwdnHwhnHwkFBV9zZWxmHwoFHFByZW1pZXIgUG9ydGZvbGlvIE1hbmFnZW1lbnQfCwUDMzM2ZBQrAAIWEh8EBRhNYW5hZ2VkIFdlYWx0aCBBRFZBTlRBR0UfBWcfAAUYTWFuYWdlZCBXZWFsdGggQURWQU5UQUdFHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzNx8HZx8IZx8JBQVfc2VsZh8KBRhNYW5hZ2VkIFdlYWx0aCBBRFZBTlRBR0UfCwUDMzM3ZBQrAAIWEh8EBQVUb29scx8FZx8ABQVUb29scx8CBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD05Mh8HZx8IZx8JBQVfc2VsZh8KBQVUb29scx8LBQI5MmQUKwACFhIfBAUUVHJhaW5pbmcgJiBFZHVjYXRpb24fBWcfAAUUVHJhaW5pbmcgJiBFZHVjYXRpb24fAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9OTMfB2cfCGcfCQUFX3NlbGYfCgUUVHJhaW5pbmcgJiBFZHVjYXRpb24fCwUCOTNkFCsAAhYSHwQFFUdyb3dpbmcgWW91ciBCdXNpbmVzcx8FZx8ABRVHcm93aW5nIFlvdXIgQnVzaW5lc3MfAgUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9OTQfB2cfCGcfCQUFX3NlbGYfCgUVR3Jvd2luZyBZb3VyIEJ1c2luZXNzHwsFAjk0ZBQrAAIWEh8EBQhSZXNlYXJjaB8FZx8ABQhSZXNlYXJjaB8CBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD04HwdnHwhnHwkFBV9zZWxmHwoFCFJlc2VhcmNoHwsFATgUKwAFBQ8wOjAsMDoxLDA6MiwwOjMUKwACFhIfBAUbQXNzZXQgQWxsb2NhdGlvbiBQb3J0Zm9saW9zHwVnHwAFG0Fzc2V0IEFsbG9jYXRpb24gUG9ydGZvbGlvcx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yOTYfB2cfCGcfCQUFX3NlbGYfCgUbQXNzZXQgQWxsb2NhdGlvbiBQb3J0Zm9saW9zHwsFAzI5NmQUKwACFhIfBAUTSW52ZXN0bWVudCBSZXNlYXJjaB8FZx8ABRNJbnZlc3RtZW50IFJlc2VhcmNoHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI0OR8HZx8IZx8JBQVfc2VsZh8KBRNJbnZlc3RtZW50IFJlc2VhcmNoHwsFAzI0ORQrAAQFEzA6MCwxOjAsMDowLDA6MSwwOjIUKwACFhIfBAUERVRGcx8FZx8ABQRFVEZzHwIFPC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI1NyZTU089RVRGX1JFUx8HZx8IZx8JBQVfc2VsZh8KBQRFVEZzHwsFAzI1N2QUKwACFhIfBAUQTXV0dWFsIEZ1bmQgTmV3cx8FZx8ABRBNdXR1YWwgRnVuZCBOZXdzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI2MB8HZx8IZx8JBQVfc2VsZh8KBRBNdXR1YWwgRnVuZCBOZXdzHwsFAzI2MGQUKwACFhIfBAUUUmVzZWFyY2ggU2VsZWN0IExpc3QfBWcfAAUUUmVzZWFyY2ggU2VsZWN0IExpc3QfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjYxHwdnHwhnHwkFBV9zZWxmHwoFFFJlc2VhcmNoIFNlbGVjdCBMaXN0HwsFAzI2MWQUKwACFhIfBAUQSW52ZXN0bWVudCBUb29scx8FZx8ABRBJbnZlc3RtZW50IFRvb2xzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI1MB8HZx8IZx8JBQVfc2VsZh8KBRBJbnZlc3RtZW50IFRvb2xzHwsFAzI1MBQrAAcFFzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1FCsAAhYSHwQFC0NhbGN1bGF0b3JzHwVnHwAFC0NhbGN1bGF0b3JzHwIFQS9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNSZSZWZlcmVyPVJlc2VhcmNoHwdnHwhnHwkFBV9zZWxmHwoFC0NhbGN1bGF0b3JzHwsFAzI1MmQUKwACFhIfBAUTRklOUkEgRnVuZCBBbmFseXplch8FZx8ABRNGSU5SQSBGdW5kIEFuYWx5emVyHwIFOC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0NvbW1vbi5hc3B4P0NvbnRlbnRJZD0xMDIxMjI0HwdnHwhnHwkFBV9zZWxmHwoFE0ZJTlJBIEZ1bmQgQW5hbHl6ZXIfCwUDMjUzZBQrAAIWEh8EBQ9Nb3JuaW5nc3RhciBBV1MfBWcfAAUPTW9ybmluZ3N0YXIgQVdTHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI1NB8HZx8IZx8JBQVfc2VsZh8KBQ9Nb3JuaW5nc3RhciBBV1MfCwUDMjU0ZBQrAAIWEh8EBR9Nb3JuaW5nc3RhciBQb3J0Zm9saW8gU25hcFNob3QgHwVnHwAFH01vcm5pbmdzdGFyIFBvcnRmb2xpbyBTbmFwU2hvdCAfAgUtL1dvcmtzdGF0aW9uL1NTTy9NU3Rhci9Qb3J0Zm9saW9TbmFwc2hvdC5hc3B4HwdnHwhnHwkFBV9zZWxmHwoFH01vcm5pbmdzdGFyIFBvcnRmb2xpbyBTbmFwU2hvdCAfCwUDMjU1ZBQrAAIWEh8EBQ5TdG9jayBTY3JlZW5lch8FZx8ABQ5TdG9jayBTY3JlZW5lch8CBRovV29ya3N0YXRpb24vU2NyZWVuZXIuaHRtbB8HZx8IZx8JBQVfc2VsZh8KBQ5TdG9jayBTY3JlZW5lch8LBQMyNTZkFCsAAhYSHwQFElZBIENvbXBhcmlzb24gVG9vbB8FZx8ABRJWQSBDb21wYXJpc29uIFRvb2wfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjcyHwdnHwhnHwkFBV9zZWxmHwoFElZBIENvbXBhcmlzb24gVG9vbB8LBQMyNzJkFCsAAhYSHwQFE01hcmtldCBDb21tZW50YXJpZXMfBWcfAAUTTWFya2V0IENvbW1lbnRhcmllcx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yNjUfB2cfCGcfCQUFX3NlbGYfCgUTTWFya2V0IENvbW1lbnRhcmllcx8LBQMyNjUUKwAHBRcwOjAsMDoxLDA6MiwwOjMsMDo0LDA6NRQrAAIWEh8EBRVEYWlseSBNYXJrZXQgQnJpZWZpbmcfBWcfAAUVRGFpbHkgTWFya2V0IEJyaWVmaW5nHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI2Nh8HZx8IZx8JBQVfc2VsZh8KBRVEYWlseSBNYXJrZXQgQnJpZWZpbmcfCwUDMjY2ZBQrAAIWEh8EBR9NYXJrZXQgQnVsbGV0aW5zICYgV2hpdGUgUGFwZXJzHwVnHwAFH01hcmtldCBCdWxsZXRpbnMgJiBXaGl0ZSBQYXBlcnMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjY3HwdnHwhnHwkFBV9zZWxmHwoFH01hcmtldCBCdWxsZXRpbnMgJiBXaGl0ZSBQYXBlcnMfCwUDMjY3ZBQrAAIWEh8EBRZNb250aGx5IE1hcmtldCBNb25pdG9yHwVnHwAFFk1vbnRobHkgTWFya2V0IE1vbml0b3IfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjY4HwdnHwhnHwkFBV9zZWxmHwoFFk1vbnRobHkgTWFya2V0IE1vbml0b3IfCwUDMjY4ZBQrAAIWEh8EBRhRdWFydGVybHkgTWFya2V0IE91dGxvb2sfBWcfAAUYUXVhcnRlcmx5IE1hcmtldCBPdXRsb29rHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI2OR8HZx8IZx8JBQVfc2VsZh8KBRhRdWFydGVybHkgTWFya2V0IE91dGxvb2sfCwUDMjY5ZBQrAAIWEh8EBQ9RdWFydGVybHkgUmVjYXAfBWcfAAUPUXVhcnRlcmx5IFJlY2FwHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI3MB8HZx8IZx8JBQVfc2VsZh8KBQ9RdWFydGVybHkgUmVjYXAfCwUDMjcwZBQrAAIWEh8EBR9UaGlyZCBQYXJ0eSBNYXJrZXQgQ29tbWVudGFyaWVzHwVnHwAFH1RoaXJkIFBhcnR5IE1hcmtldCBDb21tZW50YXJpZXMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjcxHwdnHwhnHwkFBV9zZWxmHwoFH1RoaXJkIFBhcnR5IE1hcmtldCBDb21tZW50YXJpZXMfCwUDMjcxZBQrAAIWEh8EBRRFZHVjYXRpb24gJiBUcmFpbmluZx8FZx8ABRRFZHVjYXRpb24gJiBUcmFpbmluZx8CBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD05HwdnHwhnHwkFBV9zZWxmHwoFFEVkdWNhdGlvbiAmIFRyYWluaW5nHwsFATkUKwAHBScwOjAsMDoxLDA6MiwxOjIsMDoyLDA6MywwOjQsMDo1LDA6NiwxOjYUKwACFhIfBAUVQ2xpY2sgJ24gUGxheSBMaWJyYXJ5HwVnHwAFFUNsaWNrICduIFBsYXkgTGlicmFyeR8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0xMTMfB2cfCGcfCQUFX3NlbGYfCgUVQ2xpY2sgJ24gUGxheSBMaWJyYXJ5HwsFAzExMxQrAAgFMzA6MCwwOjEsMToxLDA6MSwwOjIsMToyLDA6MiwxOjIsMDoyLDA6MywwOjQsMDo1LDA6NhQrAAIWEh8EBRFBZHZpc29yeSBTZXJ2aWNlcx8FZx8ABRFBZHZpc29yeSBTZXJ2aWNlcx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMjEfB2cfCGcfCQUFX3NlbGYfCgURQWR2aXNvcnkgU2VydmljZXMfCwUDMTIxZBQrAAIWEh8EBQ9BcmNoaXZlZCBFdmVudHMfBWcfAAUPQXJjaGl2ZWQgRXZlbnRzHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTEyMh8HZx8IZx8JBQVfc2VsZh8KBQ9BcmNoaXZlZCBFdmVudHMfCwUDMTIyZBQrAAIWEh8EBQpTbWFydFdvcmtzHwVnHwAFClNtYXJ0V29ya3MfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTI1HwdnHwhnHwkFBV9zZWxmHwoFClNtYXJ0V29ya3MfCwUDMTI1ZBQrAAIWEh8EBQ9Nb25leUd1aWRlU3VpdGUfBWcfAAUPTW9uZXlHdWlkZVN1aXRlHwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI0OB8HZx8IZx8JBQVfc2VsZh8KBQ9Nb25leUd1aWRlU3VpdGUfCwUDMjQ4ZBQrAAIWEh8EBR9Nb3JuaW5nc3RhciBBZHZpc29yIFdvcmtzdGF0aW9uHwVnHwAFH01vcm5pbmdzdGFyIEFkdmlzb3IgV29ya3N0YXRpb24fAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTI2HwdnHwhnHwkFBV9zZWxmHwoFH01vcm5pbmdzdGFyIEFkdmlzb3IgV29ya3N0YXRpb24fCwUDMTI2ZBQrAAIWEh8EBQhOZXRYIDM2MB8FZx8ABQhOZXRYIDM2MB8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMjcfB2cfCGcfCQUFX3NlbGYfCgUITmV0WCAzNjAfCwUDMTI3ZBQrAAIWEh8EBRxUaW1lc2F2aW5nIFRvb2xzICYgUmVzb3VyY2VzHwVnHwAFHFRpbWVzYXZpbmcgVG9vbHMgJiBSZXNvdXJjZXMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTI4HwdnHwhnHwkFBV9zZWxmHwoFHFRpbWVzYXZpbmcgVG9vbHMgJiBSZXNvdXJjZXMfCwUDMTI4ZBQrAAIWEh8EBRNDb21wbGlhbmNlIFRyYWluaW5nHwVnHwAFE0NvbXBsaWFuY2UgVHJhaW5pbmcfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTE0HwdnHwhnHwkFBV9zZWxmHwoFE0NvbXBsaWFuY2UgVHJhaW5pbmcfCwUDMTE0ZBQrAAIWEh8EBRBHdWlkZXMgJiBNYW51YWxzHwVnHwAFEEd1aWRlcyAmIE1hbnVhbHMfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTE2HwdnHwhnHwkFBV9zZWxmHwoFEEd1aWRlcyAmIE1hbnVhbHMfCwUDMTE2ZBQrAAIWEh8EBRRKb2IgQWlkcyAmIEVaIEd1aWRlcx8FZx8ABRRKb2IgQWlkcyAmIEVaIEd1aWRlcx8CBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMTcfB2cfCGcfCQUFX3NlbGYfCgUUSm9iIEFpZHMgJiBFWiBHdWlkZXMfCwUDMTE3ZBQrAAIWEh8EBRVUZWNobm9sb2d5ICYgU2VjdXJpdHkfBWcfAAUVVGVjaG5vbG9neSAmIFNlY3VyaXR5HwIFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI4OB8HZx8IZx8JBQVfc2VsZh8KBRVUZWNobm9sb2d5ICYgU2VjdXJpdHkfCwUDMjg4ZBQrAAIWEh8EBRZUcmFpbmluZyAmIERldmVsb3BtZW50HwVnHwAFFlRyYWluaW5nICYgRGV2ZWxvcG1lbnQfAgUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTE5HwdnHwhnHwkFBV9zZWxmHwoFFlRyYWluaW5nICYgRGV2ZWxvcG1lbnQfCwUDMTE5ZBQrAAIWDh8ABTAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsfBAUwJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7HwdnHwhnHwsFAzEzNx8FZx8JBQVfc2VsZmRkAikPZBYCAgMPEGQPFgFmFgEQBRktLSBTZWxlY3QgYSBRdWljayBMaW5rIC0tBQEwZ2RkAi0PZBYEAgsPD2QWAh4HT25DbGljawUgamF2YXNjcmlwdDogcmV0dXJuIENoZWNrSW5wdXRzKClkAhEPPCsAEQIADxYCHghQYWdlU2l6ZQJkZAEQFgAWABYAZAIvDxYCHgRocmVmBScuLi9Qb3J0YWwvQ29tbW9uLmFzcHg/Q29udGVudElkPTIwMDAwMTRkGAIFKGN0bDAwJENvbnRlbnRQbGFjZUhvbGRlcjEkZ3ZTZWFyY2hSZXN1bHQPZ2QFDmN0bDAwJG1haW5NZW51Dw9kBQRIb21lZCbvVPzvv7YWu3rDc7C6O5KsZ2gdTAIqAzlg/wzvrQjz" />
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
<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWKgL++p21AgLNhejVDQKn9MynDgL654WhBQLw5IG1BQK9ptSgAgKTqejUAgK8g5iLDALureOmDwKSq5bsCgLytOfLBwKl4uiJDALdpOHGBwLYvKvECwKj7Kz3CgKdua/LCQKK/7r0BQKJqNfDDAKMkJfsDALu+6L2DgLSxb35DAKmlLyYBwLG9oTGDgL9vee5DwLDnJ2RBwL/n/q/BQKY9IjSDQKSwdCtDwKL4ZKXDAK9tr/9DAKrv8H9AQKbp9H8CwLBhdObBAKdxLjlDQKEtJirCQLozcS4CQL4j8nLDwKTqISWCQL3uvOGAgKdg+fnBALsurX6CAKRvtiDBnUEUclmi51fUUPU82gi6VPACAJfh7zwluciviZCfykE" />
</div>
    <div id="container">
        <!-- ################  Start #header ################ -->
        <div id="header">
            <div class="logo">
                <div id="menuSmallUser" style="float:right;padding-top:20px;">
                    <span id="ctl00_lblUserName" class="toolBar">Welcome IVAN SONG</span>
                    &nbsp;&nbsp;</div>
                <a id="ctl00_bdlogo" href="/BrokerDealerCenter/Portal/Home.aspx"><img src="../resources/CFS_LOGO.png" alt="" style="border-width:0px;" /></a>
            </div>
            <hr />
            <div id="menuSmall">
                <div id="menuSmallLeft">
                    <span id="ctl00_lblMainMenu">&nbsp;|&nbsp;<a id="hypMyProfile" href="/TotalAccess/Auth/userprofile.aspx" class="func_link" Target='frmContent' >My Profile</a>&nbsp;|&nbsp;<a id="hypContactUs" href="../Portal/Common.aspx?ContentId=28591417" class="func_link" Target='_self' >Contact Us</a>&nbsp;|&nbsp;<a id="hypSiteMap" href="../Portal/Sitemap.aspx" class="func_link" Target='_self' >Site Map</a>&nbsp;|&nbsp;<a id="hypAdmin" href="../Portal/ChangeProfile.aspx" class="func_link" Target='_self' >Admin</a>&nbsp;|&nbsp;<a id="hypSmartworks" href="javascript:windowHandle = launch_smartworks();" class="func_link" Target='_self' >SmartWorks</a>&nbsp;|&nbsp;<a id="hypLogOut" href="javascript:windowHandle = logout();" class="func_link" Target='_self' >Log Out</a>&nbsp;</span>
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
                    <a href="#ctl00_mainMenu_SkipLink"><img alt="Skip Navigation Links" src="/BrokerDealerCenter/WebResource.axd?d=YLiJR8e62OlQ8g61meT6oQ2&amp;t=634869908874485606" width="0" height="0" style="border-width:0px;" /></a><table id="ctl00_mainMenu" class="Writing menu ctl00_mainMenu_5 ctl00_mainMenu_2" cellpadding="0" cellspacing="0" border="0">
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
<span id="ctl00_BreadCrumb1_SiteMapPathNavigation"><a href="#ctl00_BreadCrumb1_SiteMapPathNavigation_SkipLink"><img alt="Skip Navigation Links" height="0" width="0" src="/BrokerDealerCenter/WebResource.axd?d=YLiJR8e62OlQ8g61meT6oQ2&amp;t=634869908874485606" style="border-width:0px;" /></a><a id="ctl00_BreadCrumb1_SiteMapPathNavigation_SkipLink"></a></span>

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
            
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="height: 5px">
            </td>
        </tr>
        <tr>
            <td class="SectionHeader">
                Change Profile&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="TableWebPart" width="100%">
                    <tr>
                        <td height="10px" colspan="2"></td>
                    </tr> 
                    <tr>
                        <td class="SectionData" width="25%" >
                            Profile ID:
                        </td>
                        <td width="75%" >
                            <input name="ctl00$ContentPlaceHolder1$txtProfileId" type="text" id="ctl00_ContentPlaceHolder1_txtProfileId" />
                        </td>
                   </tr>
                   <tr>
                        <td class="SectionData">
                            Last Name:
                        </td>
                    
                        <td>
                            <input name="ctl00$ContentPlaceHolder1$txtLastName" type="text" id="ctl00_ContentPlaceHolder1_txtLastName" />&nbsp;<span class="pvExample">[% = wildcard]</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="SectionData">
                            First Name:
                        </td>
                        <td><input name="ctl00$ContentPlaceHolder1$txtFirstName" type="text" id="ctl00_ContentPlaceHolder1_txtFirstName" />&nbsp;<span class="pvExample">[% = wildcard]</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="SectionData">
                            SSN/TaxID:
                        </td>
                        <td>
                            <input name="ctl00$ContentPlaceHolder1$txtSSN" type="text" id="ctl00_ContentPlaceHolder1_txtSSN" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SectionData">
                            BD Rep Number:
                        </td>
                        <td>
                            <input name="ctl00$ContentPlaceHolder1$txtRepNumber" type="text" id="ctl00_ContentPlaceHolder1_txtRepNumber" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <input type="submit" name="ctl00$ContentPlaceHolder1$btnSearch" value="Search" onclick="javascript: return CheckInputs();" id="ctl00_ContentPlaceHolder1_btnSearch" class="button" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                   <tr>
                        <td align="right" colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div>
                                <div>

</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan"2">
                            
                        </td>
                    </tr>
                    <tr height="50px">
                        <td colspan="2"></td>
                    </tr>
                 </table>   
            </td>
        </tr>
    </table>

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
    $create(AjaxControlToolkit.ModalPopupBehavior, {"BackgroundCssClass":"GrayedOut","CancelControlID":"ctl00_btnCancel","OkControlID":"ctl00_btnOk","OnCancelScript":"onCancel()","OnOkScript":"onOk()","PopupControlID":"ctl00_pnlPopup","dynamicServicePath":"/BrokerDealerCenter/Portal/ChangeProfile.aspx","id":"ctl00_ModalPopupExtender1"}, null, null, $get("ctl00_lnkBtnPopup"));
});
//]]>
</script>
</form>
</body>
</html>
      
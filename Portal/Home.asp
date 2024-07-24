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
	Broker-Dealer Home
</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
 
    <script type="text/javascript">
    function MinimizeRestore()
    {
        var divFavorites=document.getElementById('ctl00_ContentPlaceHolder1_divFavorites');
        var imgMinimizeRestore=document.getElementById('ctl00_ContentPlaceHolder1_imgMinimizeRestore');
        var tblHomeFavorites=document.getElementById('ctl00_ContentPlaceHolder1_tblHomeFavorites');
        var hfFavoritePortlet=document.getElementById('ctl00_ContentPlaceHolder1_hfFavoritePortlet');
        
        if (divFavorites.style.display=='block')
        {
            divFavorites.style.display='none';
            hfFavoritePortlet.value='none';
            imgMinimizeRestore.src='../resources/2397851.gif';
            tblHomeFavorites.className='';
        }
        else
        {
            divFavorites.style.display='block';
            hfFavoritePortlet.value='block';
            imgMinimizeRestore.src='../resources/2397886.gif';
            tblHomeFavorites.className='PartStyle';
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
	.ctl00_ContentPlaceHolder1_wpHighlights_0 { border-color:Black;border-width:1px;border-style:Solid; }
	.ctl00_ContentPlaceHolder1_wpHighlights_1 {  }
 
</style></head>
<body>
    <form name="aspnetForm" method="post" action="Home.asp" id="aspnetForm">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTQyNzk2OTE5NQ9kFgJmD2QWBAIBD2QWAgIDD2QWAgUPZ3dwdWNIaWdobGlnaHRzD2QWAmYPZBYEAgMPFgIeB1Zpc2libGVnFgICAQ8WAh4LXyFJdGVtQ291bnQCAxYGZg9kFgQCAQ9kFgICAQ8PFgIeCEltYWdlVXJsBRguLi9yZXNvdXJjZXMvMTA2NzkyNC5qcGdkZAICDxUGIEJ5IHRoZSBOdW1iZXJzIC0gMS8xNC8xMyBFZGl0aW9uAAgyOTA2MTQ3MAN5ZXMACkxlYXJuIE1vcmVkAgEPZBYEAgEPFgIfAGhkAgIPFQY8RmlzY2FsIENsaWZmaGFuZ2VyOiBUaGUgQW1lcmljYW4gVGF4cGF5ZXIgUmVsaWVmIEFjdCBvZiAyMDEyAAgyOTUyODI5NQJubwAKTGVhcm4gTW9yZWQCAg9kFgQCAQ9kFgICAQ8PFgIfAgUZLi4vcmVzb3VyY2VzLzI4MzQ3NTA2LnBuZ2RkAgIPFQYPUmVicmFuZCBDZW50cmFs7AFSZWJyYW5kIENlbnRyYWwgaXMgeW91ciBvbmUtc3RvcC1zaG9wIGZvciBldmVyeXRoaW5nIHlvdSBuZWVkIHRvIHByZXBhcmUgZm9yIEdlbndvcnRoJ3MgbmFtZSBjaGFuZ2UgdG8gQ2V0ZXJhIEZpbmFuY2lhbCBTcGVjaWFsaXN0cy4gR2V0IGRldGFpbGVkIGluZm8sIGFubm91bmNlbWVudHMsIEZBUXMsIGltcG9ydGFudCBkYXRlcywgZGV0YWlscyBvbiB0aGUgcmVpbWJ1cnNlbWVudCBwcm9ncmFtIGFuZCBtb3JlLggyODk2MTc3NgJubwAKTGVhcm4gTW9yZWQCBQ9kFgICBQ88KwARAgAPFgIeCFBhZ2VTaXplAhRkARAWABYAFgBkAgMPZBYOAgEPDxYCHgRUZXh0BRFXZWxjb21lIElWQU4gU09OR2RkAgUPDxYEHwIFGS4uL3Jlc291cmNlcy9DRlNfTE9HTy5wbmceC05hdmlnYXRlVXJsBSQvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Ib21lLmFzcHhkZAIHDw8WAh8EBeIFJm5ic3A7fCZuYnNwOzxhIGlkPSJoeXBNeVByb2ZpbGUiIGhyZWY9Ii9Ub3RhbEFjY2Vzcy9BdXRoL3VzZXJwcm9maWxlLmFzcHgiIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nZnJtQ29udGVudCcgPk15IFByb2ZpbGU8L2E+Jm5ic3A7fCZuYnNwOzxhIGlkPSJoeXBDb250YWN0VXMiIGhyZWY9Ii4uL1BvcnRhbC9Db21tb24uYXNweD9Db250ZW50SWQ9Mjg1OTE0MTciIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nX3NlbGYnID5Db250YWN0IFVzPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwU2l0ZU1hcCIgaHJlZj0iLi4vUG9ydGFsL1NpdGVtYXAuYXNweCIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdfc2VsZicgPlNpdGUgTWFwPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwQWRtaW4iIGhyZWY9Ii4uL1BvcnRhbC9DaGFuZ2VQcm9maWxlLmFzcHgiIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nX3NlbGYnID5BZG1pbjwvYT4mbmJzcDt8Jm5ic3A7PGEgaWQ9Imh5cFNtYXJ0d29ya3MiIGhyZWY9ImphdmFzY3JpcHQ6d2luZG93SGFuZGxlID0gbGF1bmNoX3NtYXJ0d29ya3MoKTsiIGNsYXNzPSJmdW5jX2xpbmsiIFRhcmdldD0nX3NlbGYnID5TbWFydFdvcmtzPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwTG9nT3V0IiBocmVmPSJqYXZhc2NyaXB0OndpbmRvd0hhbmRsZSA9IGxvZ291dCgpOyIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdfc2VsZicgPkxvZyBPdXQ8L2E+Jm5ic3A7ZGQCEQ88KwANAgAPFgIeC18hRGF0YUJvdW5kZ2QMFCsACwUnMDowLDA6MSwwOjIsMDozLDA6NCwwOjUsMDo2LDA6NywwOjgsMDo5FCsAAhYUHgVWYWx1ZQUESG9tZR4JRGF0YUJvdW5kZx4IU2VsZWN0ZWRnHwQFBEhvbWUfBQUtL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvSG9tZS5hc3B4P01lbnVJZD0xHgdFbmFibGVkZx4KU2VsZWN0YWJsZWceBlRhcmdldAUFX3NlbGYeB1Rvb2xUaXAFBEhvbWUeCERhdGFQYXRoBQExZBQrAAIWEh8HBQtNeSBCdXNpbmVzcx8IZx8EBQtNeSBCdXNpbmVzcx8FBQEjHwpnHwtoHwwFBV9zZWxmHw0FC015IEJ1c2luZXNzHw4FATIUKwAEBUswOjAsMDoxLDA6MiwxOjIsMDoyLDE6MiwwOjIsMDozLDE6MywwOjMsMTozLDA6MywxOjMsMDozLDE6MywwOjMsMTozLDA6MywxOjMUKwACFhIfBwUUQnJva2VyYWdlIE9wZXJhdGlvbnMfCGcfBAUUQnJva2VyYWdlIE9wZXJhdGlvbnMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9MTAfCmcfC2cfDAUFX3NlbGYfDQUUQnJva2VyYWdlIE9wZXJhdGlvbnMfDgUCMTAUKwAFBS8wOjAsMDoxLDE6MSwwOjEsMDoyLDA6MywxOjMsMDozLDE6MywwOjMsMDo0LDE6NBQrAAIWEh8HBQ9HZXR0aW5nIFN0YXJ0ZWQfCGcfBAUPR2V0dGluZyBTdGFydGVkHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzOB8KZx8LZx8MBQVfc2VsZh8NBQ9HZXR0aW5nIFN0YXJ0ZWQfDgUDMjM4ZBQrAAIWEh8HBQxOZXcgQWNjb3VudHMfCGcfBAUMTmV3IEFjY291bnRzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTE3NR8KZx8LZx8MBQVfc2VsZh8NBQxOZXcgQWNjb3VudHMfDgUDMTc1FCsABwUXMDowLDA6MSwwOjIsMDozLDA6NCwwOjUUKwACFhIfBwUVQWNjb3VudCBFc3RhYmxpc2htZW50HwhnHwQFFUFjY291bnQgRXN0YWJsaXNobWVudB8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNzcfCmcfC2cfDAUFX3NlbGYfDQUVQWNjb3VudCBFc3RhYmxpc2htZW50Hw4FAzE3N2QUKwACFhIfBwUTQWNjb3VudCBNYWludGVuYW5jZR8IZx8EBRNBY2NvdW50IE1haW50ZW5hbmNlHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIwNB8KZx8LZx8MBQVfc2VsZh8NBRNBY2NvdW50IE1haW50ZW5hbmNlHw4FAzIwNGQUKwACFhIfBwUTQWRkaXRpb25hbCBTZXJ2aWNlcx8IZx8EBRNBZGRpdGlvbmFsIFNlcnZpY2VzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE3Nh8KZx8LZx8MBQVfc2VsZh8NBRNBZGRpdGlvbmFsIFNlcnZpY2VzHw4FAzE3NmQUKwACFhIfBwUJQU1MIFJ1bGVzHwhnHwQFCUFNTCBSdWxlcx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xODAfCmcfC2cfDAUFX3NlbGYfDQUJQU1MIFJ1bGVzHw4FAzE4MGQUKwACFhIfBwUTUHJvaGliaXRlZCBBY2NvdW50cx8IZx8EBRNQcm9oaWJpdGVkIEFjY291bnRzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4MR8KZx8LZx8MBQVfc2VsZh8NBRNQcm9oaWJpdGVkIEFjY291bnRzHw4FAzE4MWQUKwACFhIfBwUeUmV0aXJlbWVudCBBY2NvdW50IEluZm9ybWF0aW9uHwhnHwQFHlJldGlyZW1lbnQgQWNjb3VudCBJbmZvcm1hdGlvbh8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNzgfCmcfC2cfDAUFX3NlbGYfDQUeUmV0aXJlbWVudCBBY2NvdW50IEluZm9ybWF0aW9uHw4FAzE3OGQUKwACFhIfBwUNTmV3cyAmIEFsZXJ0cx8IZx8EBQ1OZXdzICYgQWxlcnRzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4Mh8KZx8LZx8MBQVfc2VsZh8NBQ1OZXdzICYgQWxlcnRzHw4FAzE4MmQUKwACFhIfBwUHVHJhZGluZx8IZx8EBQdUcmFkaW5nHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTE4NB8KZx8LZx8MBQVfc2VsZh8NBQdUcmFkaW5nHw4FAzE4NBQrAA0FMTA6MCwwOjEsMDoyLDA6MywwOjQsMDo1LDA6NiwwOjcsMDo4LDA6OSwwOjEwLDA6MTEUKwACFhIfBwUVQW5udWl0aWVzIChTdWJzY3JpYmUpHwhnHwQFFUFubnVpdGllcyAoU3Vic2NyaWJlKR8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMDgfCmcfC2cfDAUFX3NlbGYfDQUVQW5udWl0aWVzIChTdWJzY3JpYmUpHw4FAzIwOGQUKwACFhIfBwUgQiBhbmQgQyBTaGFyZSAtIENsYXNzIEV4ZW1wdGlvbnMfCGcfBAUgQiBhbmQgQyBTaGFyZSAtIENsYXNzIEV4ZW1wdGlvbnMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTg1HwpnHwtnHwwFBV9zZWxmHw0FIEIgYW5kIEMgU2hhcmUgLSBDbGFzcyBFeGVtcHRpb25zHw4FAzE4NWQUKwACFhIfBwUcQiBhbmQgQyBTaGFyZSAtIENsYXNzIFBvbGljeR8IZx8EBRxCIGFuZCBDIFNoYXJlIC0gQ2xhc3MgUG9saWN5HwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4Nh8KZx8LZx8MBQVfc2VsZh8NBRxCIGFuZCBDIFNoYXJlIC0gQ2xhc3MgUG9saWN5Hw4FAzE4NmQUKwACFhIfBwUQRFZQIChDT0Qgb3IgUlZQKR8IZx8EBRBEVlAgKENPRCBvciBSVlApHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4Nx8KZx8LZx8MBQVfc2VsZh8NBRBEVlAgKENPRCBvciBSVlApHw4FAzE4N2QUKwACFhIfBwUORXJyb3IgQWNjb3VudHMfCGcfBAUORXJyb3IgQWNjb3VudHMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTg4HwpnHwtnHwwFBV9zZWxmHw0FDkVycm9yIEFjY291bnRzHw4FAzE4OGQUKwACFhIfBwUMRml4ZWQgSW5jb21lHwhnHwQFDEZpeGVkIEluY29tZR8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xODkfCmcfC2cfDAUFX3NlbGYfDQUMRml4ZWQgSW5jb21lHw4FAzE4OWQUKwACFhIfBwUMTXV0dWFsIEZ1bmRzHwhnHwQFDE11dHVhbCBGdW5kcx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOTAfCmcfC2cfDAUFX3NlbGYfDQUMTXV0dWFsIEZ1bmRzHw4FAzE5MGQUKwACFhIfBwUeTm8gVHJhbnNhY3Rpb24gRmVlIChOVEYpIEZ1bmRzHwhnHwQFHk5vIFRyYW5zYWN0aW9uIEZlZSAoTlRGKSBGdW5kcx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOTEfCmcfC2cfDAUFX3NlbGYfDQUeTm8gVHJhbnNhY3Rpb24gRmVlIChOVEYpIEZ1bmRzHw4FAzE5MWQUKwACFhIfBwULT3BlbiBPcmRlcnMfCGcfBAULT3BlbiBPcmRlcnMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTkyHwpnHwtnHwwFBV9zZWxmHw0FC09wZW4gT3JkZXJzHw4FAzE5MmQUKwACFhIfBwUOU2VjdXJpdHkgU2V0dXAfCGcfBAUOU2VjdXJpdHkgU2V0dXAfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTkzHwpnHwtnHwwFBV9zZWxmHw0FDlNlY3VyaXR5IFNldHVwHw4FAzE5M2QUKwACFhIfBwUZU3lzdGVtYXRpYyBCdXlzIGFuZCBTZWxscx8IZx8EBRlTeXN0ZW1hdGljIEJ1eXMgYW5kIFNlbGxzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE5NB8KZx8LZx8MBQVfc2VsZh8NBRlTeXN0ZW1hdGljIEJ1eXMgYW5kIFNlbGxzHw4FAzE5NGQUKwACFhIfBwUUVGhyZXNob2xkIFNlY3VyaXRpZXMfCGcfBAUUVGhyZXNob2xkIFNlY3VyaXRpZXMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTk1HwpnHwtnHwwFBV9zZWxmHw0FFFRocmVzaG9sZCBTZWN1cml0aWVzHw4FAzE5NWQUKwACFhIfBwUXQWR2YW5jZWQgUGxhbm5pbmcgR3JvdXAfCGcfBAUXQWR2YW5jZWQgUGxhbm5pbmcgR3JvdXAfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9MTEfCmcfC2cfDAUFX3NlbGYfDQUXQWR2YW5jZWQgUGxhbm5pbmcgR3JvdXAfDgUCMTEUKwAEBQswOjAsMDoxLDA6MhQrAAIWEh8HBQ9UYXggSW5mb3JtYXRpb24fCGcfBAUPVGF4IEluZm9ybWF0aW9uHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIxNR8KZx8LZx8MBQVfc2VsZh8NBQ9UYXggSW5mb3JtYXRpb24fDgUDMjE1ZBQrAAIWEh8HBQ9JUkEgSW5mb3JtYXRpb24fCGcfBAUPSVJBIEluZm9ybWF0aW9uHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIxNx8KZx8LZx8MBQVfc2VsZh8NBQ9JUkEgSW5mb3JtYXRpb24fDgUDMjE3ZBQrAAIWEh8HBQ1NaXNjZWxsYW5lb3VzHwhnHwQFDU1pc2NlbGxhbmVvdXMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjE4HwpnHwtnHwwFBV9zZWxmHw0FDU1pc2NlbGxhbmVvdXMfDgUDMjE4ZBQrAAIWEh8HBRlMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb25zHwhnHwQFGUxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbnMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9MTQfCmcfC2cfDAUFX3NlbGYfDQUZTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucx8OBQIxNBQrAAQFCzA6MCwwOjEsMDoyFCsAAhYSHwcFCFJlbmV3YWxzHwhnHwQFCFJlbmV3YWxzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE1Mh8KZx8LZx8MBQVfc2VsZh8NBQdSZW5ld2FsHw4FAzE1MmQUKwACFhIfBwUeTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEZvcm1zHwhnHwQFHkxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbiBGb3Jtcx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNTMfCmcfC2cfDAUFX3NlbGYfDQUeTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEZvcm1zHw4FAzE1M2QUKwACFhIfBwUhTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucyBHZW5lcmFsHwhnHwQFIUxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbnMgR2VuZXJhbB8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yNDIfCmcfC2cfDAUFX3NlbGYfDQUhTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucyBHZW5lcmFsHw4FAzI0MmQUKwACFhIfBwUTUHJvZHVjdCBJbmZvcm1hdGlvbh8IZx8EBRNQcm9kdWN0IEluZm9ybWF0aW9uHwUFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTMfCmcfC2cfDAUFX3NlbGYfDQUTUHJvZHVjdCBJbmZvcm1hdGlvbh8OBQEzFCsACAUjMDowLDA6MSwwOjIsMDozLDA6NCwwOjUsMDo2LDA6NywxOjcUKwACFhIfBwUWQXBwcm92ZWQgUHJvZHVjdCBMaXN0cx8IZx8EBRZBcHByb3ZlZCBQcm9kdWN0IExpc3RzHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTU0HwpnHwtnHwwFBV9zZWxmHw0FFkFwcHJvdmVkIFByb2R1Y3QgTGlzdHMfDgUCNTRkFCsAAhYSHwcFCEFkdmlzb3J5HwhnHwQFCEFkdmlzb3J5HwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTU1HwpnHwtnHwwFBV9zZWxmHw0FCEFkdmlzb3J5Hw4FAjU1ZBQrAAIWEh8HBQlBbm51aXRpZXMfCGcfBAUJQW5udWl0aWVzHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTU3HwpnHwtnHwwFBV9zZWxmHw0FCUFubnVpdGllcx8OBQI1NxQrAAMFBzA6MCwwOjEUKwACFhIfBwUFRml4ZWQfCGcfBAUFRml4ZWQfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTgfCmcfC2cfDAUFX3NlbGYfDQUFRml4ZWQfDgUCNThkFCsAAhYSHwcFCFZhcmlhYmxlHwhnHwQFCFZhcmlhYmxlHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTU5HwpnHwtnHwwFBV9zZWxmHw0FCFZhcmlhYmxlHw4FAjU5ZBQrAAIWEh8HBQtJbnZlc3RtZW50cx8IZx8EBQtJbnZlc3RtZW50cx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD02MB8KZx8LZx8MBQVfc2VsZh8NBQtJbnZlc3RtZW50cx8OBQI2MBQrAAYFEzA6MCwwOjEsMDoyLDA6MywwOjQUKwACFhIfBwUXQWx0ZXJuYXRpdmUgSW52ZXN0bWVudHMfCGcfBAUXQWx0ZXJuYXRpdmUgSW52ZXN0bWVudHMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjEfCmcfC2cfDAUFX3NlbGYfDQUXQWx0ZXJuYXRpdmUgSW52ZXN0bWVudHMfDgUCNjFkFCsAAhYSHwcFFERlZmluZWQgQ29udHJpYnV0aW9uHwhnHwQFFERlZmluZWQgQ29udHJpYnV0aW9uHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTYyHwpnHwtnHwwFBV9zZWxmHw0FFERlZmluZWQgQ29udHJpYnV0aW9uHw4FAjYyZBQrAAIWEh8HBQxNdXR1YWwgRnVuZHMfCGcfBAUMTXV0dWFsIEZ1bmRzHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTYzHwpnHwtnHwwFBV9zZWxmHw0FDE11dHVhbCBGdW5kcx8OBQI2M2QUKwACFhIfBwURU2VjdGlvbiA1MjkgUGxhbnMfCGcfBAURU2VjdGlvbiA1MjkgUGxhbnMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjQfCmcfC2cfDAUFX3NlbGYfDQURU2VjdGlvbiA1MjkgUGxhbnMfDgUCNjRkFCsAAhYSHwcFEU90aGVyIEludmVzdG1lbnRzHwhnHwQFEU90aGVyIEludmVzdG1lbnRzHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY1HwpnHwtnHwwFBV9zZWxmHw0FEU90aGVyIEludmVzdG1lbnRzHw4FAjY1ZBQrAAIWEh8HBQlJbnN1cmFuY2UfCGcfBAUJSW5zdXJhbmNlHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTY2HwpnHwtnHwwFBV9zZWxmHw0FCUluc3VyYW5jZR8OBQI2NhQrAAcFFzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1FCsAAhYSHwcFEURpc2FiaWxpdHkgSW5jb21lHwhnHwQFEURpc2FiaWxpdHkgSW5jb21lHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY3HwpnHwtnHwwFBV9zZWxmHw0FEURpc2FiaWxpdHkgSW5jb21lHw4FAjY3ZBQrAAIWEh8HBQ5Mb25nLVRlcm0gQ2FyZR8IZx8EBQ5Mb25nLVRlcm0gQ2FyZR8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD02OB8KZx8LZx8MBQVfc2VsZh8NBQ5Mb25nIFRlcm0gY2FyZR8OBQI2OGQUKwACFhIfBwUEVGVybR8IZx8EBQRUZXJtHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY5HwpnHwtnHwwFBV9zZWxmHw0FBFRlcm0fDgUCNjlkFCsAAhYSHwcFDlVuaXZlcnNhbCBMaWZlHwhnHwQFDlVuaXZlcnNhbCBMaWZlHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTcwHwpnHwtnHwwFBV9zZWxmHw0FDlVuaXZlcnNhbCBMaWZlHw4FAjcwZBQrAAIWEh8HBRdWYXJpYWJsZSBVbml2ZXJzYWwgTGlmZR8IZx8EBRdWYXJpYWJsZSBVbml2ZXJzYWwgTGlmZR8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03MR8KZx8LZx8MBQVfc2VsZh8NBSFWYXJpYWJsZSBVbml2ZXJzYWwgTGlmZSBJbnN1cmFuY2UfDgUCNzFkFCsAAhYSHwcFCldob2xlIExpZmUfCGcfBAUKV2hvbGUgTGlmZR8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03Mh8KZx8LZx8MBQVfc2VsZh8NBRRXaG9sZSBMaWZlIEluc3VyYW5jZR8OBQI3MmQUKwACFhIfBwUQUmV0aXJlbWVudCBQbGFucx8IZx8EBRBSZXRpcmVtZW50IFBsYW5zHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI5NR8KZx8LZx8MBQVfc2VsZh8NBRBSZXRpcmVtZW50IFBsYW5zHw4FAzI5NWQUKwACFhIfBwUSU3RyYXRlZ2ljIFBhcnRuZXJzHwhnHwQFElN0cmF0ZWdpYyBQYXJ0bmVycx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03Mx8KZx8LZx8MBQVfc2VsZh8NBRJTdHJhdGVnaWMgUGFydG5lcnMfDgUCNzNkFCsAAhYSHwcFBUZvcm1zHwhnHwQFBUZvcm1zHwUFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTQfCmcfC2cfDAUFX3NlbGYfDQUFRm9ybXMfDgUBNBQrAAcFNzA6MCwxOjAsMDowLDA6MSwwOjIsMToyLDA6MiwwOjMsMTozLDA6MywwOjQsMDo1LDE6NSwwOjUUKwACFhIfBwUNRm9ybXMgU2VhcmNoIB8IZx8EBQ1Gb3JtcyBTZWFyY2ggHwUFNy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1NlYXJjaC5hc3B4P0ZvbGRlck5hbWU9Rm9ybXMfCmcfC2cfDAUFX3NlbGYfDQUNRm9ybXMgU2VhcmNoIB8OBQIxOGQUKwACFhIfBwURQWR2aXNvcnkgU2VydmljZXMfCGcfBAURQWR2aXNvcnkgU2VydmljZXMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTkfCmcfC2cfDAUFX3NlbGYfDQURQWR2aXNvcnkgU2VydmljZXMfDgUCMTlkFCsAAhYSHwcFGExpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbh8IZx8EBRhMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb24fBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9MjEfCmcfC2cfDAUFX3NlbGYfDQUYTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uHw4FAjIxFCsAAgULMDowLDA6MSwxOjEUKwACFhIfBwUgTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEdlbmVyYWwfCGcfBAUgTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEdlbmVyYWwfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzUfCmcfC2cfDAUFX3NlbGYfDQUgTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEdlbmVyYWwfDgUCMzVkFCsAAhYSHwcFDU1pc2NlbGxhbmVvdXMfCGcfBAUNTWlzY2VsbGFuZW91cx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yMh8KZx8LZx8MBQVfc2VsZh8NBQ1NaXNjZWxsYW5lb3VzHw4FAjIyFCsAAwUXMDowLDA6MSwwOjIsMToyLDA6MiwxOjIUKwACFhIfBwUVTWlzY2VsbGFuZW91cyBHZW5lcmFsHwhnHwQFFU1pc2NlbGxhbmVvdXMgR2VuZXJhbB8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zNh8KZx8LZx8MBQVfc2VsZh8NBRVNaXNjZWxsYW5lb3VzIEdlbmVyYWwfDgUCMzZkFCsAAhYSHwcFBUFkbWluHwhnHwQFBUFkbWluHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTM3HwpnHwtnHwwFBV9zZWxmHw0FBUFkbWluHw4FAjM3ZBQrAAIWEh8HBQxOZXcgQnVzaW5lc3MfCGcfBAUMTmV3IEJ1c2luZXNzHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTIzHwpnHwtnHwwFBV9zZWxmHw0FDE5ldyBCdXNpbmVzcx8OBQIyMxQrAAMFBzA6MCwwOjEUKwACFhIfBwUUTmV3IEJ1c2luZXNzIEdlbmVyYWwfCGcfBAUUTmV3IEJ1c2luZXNzIEdlbmVyYWwfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzkfCmcfC2cfDAUFX3NlbGYfDQUUTmV3IEJ1c2luZXNzIEdlbmVyYWwfDgUCMzlkFCsAAhYSHwcFCUluc3VyYW5jZR8IZx8EBQlJbnN1cmFuY2UfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTQ3HwpnHwtnHwwFBV9zZWxmHw0FCUluc3VyYW5jZR8OBQMxNDdkFCsAAhYSHwcFCkZvcm1zIExpc3QfCGcfBAUKRm9ybXMgTGlzdB8FBSkvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Gb3Jtc0xpc3QuYXNweB8KZx8LZx8MBQVfc2VsZh8NBQpGb3JtcyBMaXN0Hw4FAzEzOGQUKwACFhIfBwURU2FsZXMgJiBNYXJrZXRpbmcfCGcfBAURU2FsZXMgJiBNYXJrZXRpbmcfBQUuL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9NR8KZx8LZx8MBQVfc2VsZh8NBRFTYWxlcyAmIE1hcmtldGluZx8OBQE1FCsABQUPMDowLDA6MSwwOjIsMDozFCsAAhYSHwcFD0Nvbm5lY3QyQ2xpZW50cx8IZx8EBQ9Db25uZWN0MkNsaWVudHMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9Mjk3HwpnHwtnHwwFBV9zZWxmHw0FD0Nvbm5lY3QyQ2xpZW50cx8OBQMyOTcUKwADBQ8wOjAsMDoxLDE6MSwwOjEUKwACFhIfBwUZQzJDIE1hcmtldGluZyBMaWJyYXJ5IFBybx8IZx8EBRlDMkMgTWFya2V0aW5nIExpYnJhcnkgUHJvHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzMR8KZx8LZx8MBQVfU2VsZh8NBRlDMkMgTWFya2V0aW5nIExpYnJhcnkvUHJvHw4FAzMzMWQUKwACFhIfBwUOQzJDIFVuaXZlcnNpdHkfCGcfBAUOQzJDIFVuaXZlcnNpdHkfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzMzHwpnHwtnHwwFBV9TZWxmHw0FDkMyQyBVbml2ZXJzaXR5Hw4FAzMzM2QUKwACFhIfBwUeQ2xpZW50IEFjcXVpc2l0aW9uICYgUmV0ZW50aW9uHwhnHwQFHkNsaWVudCBBY3F1aXNpdGlvbiAmIFJldGVudGlvbh8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yNR8KZx8LZx8MBQVfc2VsZh8NBR5DbGllbnQgQWNxdWlzaXRpb24gJiBSZXRlbnRpb24fDgUCMjUUKwAJBR8wOjAsMDoxLDA6MiwwOjMsMDo0LDA6NSwwOjYsMDo3FCsAAhYSHwcFEEFkdmVydGlzaW5nICYgUFIfCGcfBAUQQWR2ZXJ0aXNpbmcgJiBQUh8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03NR8KZx8LZx8MBQVfc2VsZh8NBRBBZHZlcnRpc2luZyAmIFBSHw4FAjc1ZBQrAAIWEh8HBRJCcm9jaHVyZXMgJiBGbHllcnMfCGcfBAUSQnJvY2h1cmVzICYgRmx5ZXJzHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTc2HwpnHwtnHwwFBV9zZWxmHw0FEkJyb2NodXJlcyAmIEZseWVycx8OBQI3NmQUKwACFhIfBwUJQ2FtcGFpZ25zHwhnHwQFCUNhbXBhaWducx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03Nx8KZx8LZx8MBQVfc2VsZh8NBQlDYW1wYWlnbnMfDgUCNzdkFCsAAhYSHwcFHENsaWVudCAmIFByb3NwZWN0aW5nIExldHRlcnMfCGcfBAUcQ2xpZW50ICYgUHJvc3BlY3RpbmcgTGV0dGVycx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD03OB8KZx8LZx8MBQVfc2VsZh8NBRxDbGllbnQgJiBQcm9zcGVjdGluZyBMZXR0ZXJzHw4FAjc4ZBQrAAIWEh8HBQ9DbGllbnQgUmVmZXJyYWwfCGcfBAUPQ2xpZW50IFJlZmVycmFsHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTc5HwpnHwtnHwwFBV9zZWxmHw0FD0NsaWVudCBSZWZlcnJhbB8OBQI3OWQUKwACFhIfBwUUUHJvZ3JhbXMgJiBSZXNvdXJjZXMfCGcfBAUUUHJvZ3JhbXMgJiBSZXNvdXJjZXMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9ODAfCmcfC2cfDAUFX3NlbGYfDQUUUHJvZ3JhbXMgJiBSZXNvdXJjZXMfDgUCODBkFCsAAhYSHwcFH1NhbGVzIElkZWFzICYgVHVybmtleSBTb2x1dGlvbnMfCGcfBAUfU2FsZXMgSWRlYXMgJiBUdXJua2V5IFNvbHV0aW9ucx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD04Mh8KZx8LZx8MBQVfc2VsZh8NBSNTYWxlcyBJZGVhcyAmYW1wOyBUdXJua2V5IFNvbHV0aW9ucx8OBQI4MmQUKwACFhIfBwUIU2VtaW5hcnMfCGcfBAUIU2VtaW5hcnMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9ODMfCmcfC2cfDAUFX3NlbGYfDQUIU2VtaW5hcnMfDgUCODNkFCsAAhYSHwcFDkJyYW5kIElkZW50aXR5HwhnHwQFDkJyYW5kIElkZW50aXR5HwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI2HwpnHwtnHwwFBV9zZWxmHw0FDkJyYW5kIElkZW50aXR5Hw4FAjI2FCsAAwUHMDowLDA6MRQrAAIWEh8HBRBCcmFuZCBHdWlkZWxpbmVzHwhnHwQFEEJyYW5kIEd1aWRlbGluZXMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NDgfCmcfC2cfDAUFX3NlbGYfDQUQQnJhbmQgR3VpZGVsaW5lcx8OBQI0OGQUKwACFhIfBwUSTG9nb3MgJiBTdGF0aW9uZXJ5HwhnHwQFEkxvZ29zICYgU3RhdGlvbmVyeR8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD00OR8KZx8LZx8MBQVfc2VsZh8NBRJMb2dvcyAmIFN0YXRpb25lcnkfDgUCNDlkFCsAAhYSHwcFE1Rvb2xzICYgQ2FsY3VsYXRvcnMfCGcfBAUTVG9vbHMgJiBDYWxjdWxhdG9ycx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yNx8KZx8LZx8MBQVfc2VsZh8NBRNUb29scyAmIENhbGN1bGF0b3JzHw4FAjI3FCsADwVLMDowLDA6MSwxOjEsMDoxLDA6MiwwOjMsMDo0LDA6NSwxOjUsMDo1LDA6NiwwOjcsMDo4LDA6OSwwOjEwLDA6MTEsMDoxMiwwOjEzFCsAAhYSHwcFH0Fkdmlzb3J5IE9ubGluZSBBY2NvdW50IE9wZW5pbmcfCGcfBAUfQWR2aXNvcnkgT25saW5lIEFjY291bnQgT3BlbmluZx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMjIfCmcfC2cfDAUFX3NlbGYfDQUfQWR2aXNvcnkgT25saW5lIEFjY291bnQgT3BlbmluZx8OBQMyMjJkFCsAAhYSHwcFIEJyb2tlcmFnZSBPbmxpbmUgQWNjb3VudCBPcGVuaW5nHwhnHwQFIEJyb2tlcmFnZSBPbmxpbmUgQWNjb3VudCBPcGVuaW5nHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNB8KZx8LZx8MBQVfc2VsZh8NBSBCcm9rZXJhZ2UgT25saW5lIEFjY291bnQgT3BlbmluZx8OBQMyMjRkFCsAAhYSHwcFC0NhbGN1bGF0b3JzHwhnHwQFC0NhbGN1bGF0b3JzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNR8KZx8LZx8MBQVfc2VsZh8NBQtDYWxjdWxhdG9ycx8OBQMyMjVkFCsAAhYSHwcFDkNSTSBJbnRlZ2F0aW9uHwhnHwQFDkNSTSBJbnRlZ2F0aW9uHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNh8KZx8LZx8MBQVfc2VsZh8NBQ5DUk0gSW50ZWdhdGlvbh8OBQMyMjZkFCsAAhYSHwcFCEZlYXR1cmVzHwhnHwQFCEZlYXR1cmVzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNx8KZx8LZx8MBQVfc2VsZh8NBQhGZWF0dXJlcx8OBQMyMjdkFCsAAhYSHwcFHkludmVzdG1lbnQgJiBSZXNlYXJjaCBBbmFseXNpcx8IZx8EBR5JbnZlc3RtZW50ICYgUmVzZWFyY2ggQW5hbHlzaXMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjI5HwpnHwtnHwwFBV9zZWxmHw0FHkludmVzdG1lbnQgJiBSZXNlYXJjaCBBbmFseXNpcx8OBQMyMjlkFCsAAhYSHwcFCExhc2VyQXBwHwhnHwQFCExhc2VyQXBwHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzMB8KZx8LZx8MBQVfc2VsZh8NBQhMYXNlckFwcB8OBQMyMzBkFCsAAhYSHwcFEE1vbmV5R3VpZGVCcm9rZXIfCGcfBAUQTW9uZXlHdWlkZUJyb2tlch8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzEfCmcfC2cfDAUFX3NlbGYfDQUQTW9uZXlHdWlkZUJyb2tlch8OBQMyMzFkFCsAAhYSHwcFDU1vbmV5R3VpZGVQcm8fCGcfBAUNTW9uZXlHdWlkZVBybx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzIfCmcfC2cfDAUFX3NlbGYfDQUNTW9uZXlHdWlkZVBybx8OBQMyMzJkFCsAAhYSHwcFC01vcm5pbmdzdGFyHwhnHwQFC01vcm5pbmdzdGFyHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzMx8KZx8LZx8MBQVfc2VsZh8NBQtNb3JuaW5nc3Rhch8OBQMyMzNkFCsAAhYSHwcFCE5ldFggMzYwHwhnHwQFCE5ldFggMzYwHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzNB8KZx8LZx8MBQVfc2VsZh8NBQhOZXRYIDM2MB8OBQMyMzRkFCsAAhYSHwcFDFRyYWRlIFJldmlldx8IZx8EBQxUcmFkZSBSZXZpZXcfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjM1HwpnHwtnHwwFBV9zZWxmHw0FDFRyYWRlIFJldmlldx8OBQMyMzVkFCsAAhYSHwcFDVZBIENvbXBhcmlzb24fCGcfBAUNVkEgQ29tcGFyaXNvbh8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzYfCmcfC2cfDAUFX3NlbGYfDQUNVkEgQ29tcGFyaXNvbh8OBQMyMzZkFCsAAhYSHwcFEFBvcnRmb2xpbyBBY2Nlc3MfCGcfBAUQUG9ydGZvbGlvIEFjY2Vzcx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zMzgfCmcfC2cfDAUFX3NlbGYfDQUQUG9ydGZvbGlvIEFjY2Vzcx8OBQMzMzhkFCsAAhYSHwcFCkNvbXBsaWFuY2UfCGcfBAUKQ29tcGxpYW5jZR8FBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD02HwpnHwtnHwwFBV9zZWxmHw0FCkNvbXBsaWFuY2UfDgUBNhQrAAQFEzA6MCwxOjAsMDowLDA6MSwwOjIUKwACFhIfBwUUTWFudWFscyAmIEd1aWRlbGluZXMfCGcfBAUUTWFudWFscyAmIEd1aWRlbGluZXMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjkfCmcfC2cfDAUFX3NlbGYfDQUUTWFudWFscyAmIEd1aWRlbGluZXMfDgUCMjlkFCsAAhYSHwcFEE5vdGljZXMgJiBBbGVydHMfCGcfBAUQTm90aWNlcyAmIEFsZXJ0cx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0zMB8KZx8LZx8MBQVfc2VsZh8NBRBOb3RpY2VzICYgQWxlcnRzHw4FAjMwFCsABAULMDowLDA6MSwwOjIUKwACFhIfBwURQ29tcGxpYW5jZSBBbGVydHMfCGcfBAURQ29tcGxpYW5jZSBBbGVydHMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTIfCmcfC2cfDAUFX3NlbGYfDQURQ29tcGxpYW5jZSBBbGVydHMfDgUCNTJkFCsAAhYSHwcFEkNvbXBsaWFuY2UgTm90aWNlcx8IZx8EBRJDb21wbGlhbmNlIE5vdGljZXMfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTMfCmcfC2cfDAUFX3NlbGYfDQUSQ29tcGxpYW5jZSBOb3RpY2VzHw4FAjUzZBQrAAIWEh8HBQlCdWxsZXRpbnMfCGcfBAUJQnVsbGV0aW5zHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTg5HwpnHwtnHwwFBV9zZWxmHw0FCUJ1bGxldGlucx8OBQI4OWQUKwACFhIfBwUVUG9saWNpZXMgJiBQcm9jZWR1cmVzHwhnHwQFFVBvbGljaWVzICYgUHJvY2VkdXJlcx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zMR8KZx8LZx8MBQVfc2VsZh8NBRVQb2xpY2llcyAmIFByb2NlZHVyZXMfDgUCMzFkFCsAAhYSHwcFCEFkdmlzb3J5HwhnHwQFCEFkdmlzb3J5HwUFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTcfCmcfC2cfDAUFX3NlbGYfDQUIQWR2aXNvcnkfDgUBNxQrAAYFEzA6MCwwOjEsMDoyLDA6MywwOjQUKwACFhIfBwUPR2V0dGluZyBTdGFydGVkHwhnHwQFD0dldHRpbmcgU3RhcnRlZB8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD05MB8KZx8LZx8MBQVfc2VsZh8NBQ9HZXR0aW5nIFN0YXJ0ZWQfDgUCOTBkFCsAAhYSHwcFEVByb2dyYW0gT2ZmZXJpbmdzHwhnHwQFEVByb2dyYW0gT2ZmZXJpbmdzHwUFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTkxHwpnHwtnHwwFBV9zZWxmHw0FEVByb2dyYW0gT2ZmZXJpbmdzHw4FAjkxFCsABAUrMDowLDE6MCwwOjAsMTowLDA6MCwwOjEsMDoyLDE6MiwwOjIsMToyLDA6MhQrAAIWEh8HBRtQb3J0Zm9saW8gQWR2aXNvcnkgU2VydmljZXMfCGcfBAUbUG9ydGZvbGlvIEFkdmlzb3J5IFNlcnZpY2VzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzNR8KZx8LZx8MBQVfc2VsZh8NBRtQb3J0Zm9saW8gQWR2aXNvcnkgU2VydmljZXMfDgUDMzM1ZBQrAAIWEh8HBRxQcmVtaWVyIFBvcnRmb2xpbyBNYW5hZ2VtZW50HwhnHwQFHFByZW1pZXIgUG9ydGZvbGlvIE1hbmFnZW1lbnQfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzM2HwpnHwtnHwwFBV9zZWxmHw0FHFByZW1pZXIgUG9ydGZvbGlvIE1hbmFnZW1lbnQfDgUDMzM2ZBQrAAIWEh8HBRhNYW5hZ2VkIFdlYWx0aCBBRFZBTlRBR0UfCGcfBAUYTWFuYWdlZCBXZWFsdGggQURWQU5UQUdFHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzNx8KZx8LZx8MBQVfc2VsZh8NBRhNYW5hZ2VkIFdlYWx0aCBBRFZBTlRBR0UfDgUDMzM3ZBQrAAIWEh8HBQVUb29scx8IZx8EBQVUb29scx8FBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD05Mh8KZx8LZx8MBQVfc2VsZh8NBQVUb29scx8OBQI5MmQUKwACFhIfBwUUVHJhaW5pbmcgJiBFZHVjYXRpb24fCGcfBAUUVHJhaW5pbmcgJiBFZHVjYXRpb24fBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9OTMfCmcfC2cfDAUFX3NlbGYfDQUUVHJhaW5pbmcgJiBFZHVjYXRpb24fDgUCOTNkFCsAAhYSHwcFFUdyb3dpbmcgWW91ciBCdXNpbmVzcx8IZx8EBRVHcm93aW5nIFlvdXIgQnVzaW5lc3MfBQUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9OTQfCmcfC2cfDAUFX3NlbGYfDQUVR3Jvd2luZyBZb3VyIEJ1c2luZXNzHw4FAjk0ZBQrAAIWEh8HBQhSZXNlYXJjaB8IZx8EBQhSZXNlYXJjaB8FBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD04HwpnHwtnHwwFBV9zZWxmHw0FCFJlc2VhcmNoHw4FATgUKwAFBQ8wOjAsMDoxLDA6MiwwOjMUKwACFhIfBwUbQXNzZXQgQWxsb2NhdGlvbiBQb3J0Zm9saW9zHwhnHwQFG0Fzc2V0IEFsbG9jYXRpb24gUG9ydGZvbGlvcx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yOTYfCmcfC2cfDAUFX3NlbGYfDQUbQXNzZXQgQWxsb2NhdGlvbiBQb3J0Zm9saW9zHw4FAzI5NmQUKwACFhIfBwUTSW52ZXN0bWVudCBSZXNlYXJjaB8IZx8EBRNJbnZlc3RtZW50IFJlc2VhcmNoHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI0OR8KZx8LZx8MBQVfc2VsZh8NBRNJbnZlc3RtZW50IFJlc2VhcmNoHw4FAzI0ORQrAAQFEzA6MCwxOjAsMDowLDA6MSwwOjIUKwACFhIfBwUERVRGcx8IZx8EBQRFVEZzHwUFPC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI1NyZTU089RVRGX1JFUx8KZx8LZx8MBQVfc2VsZh8NBQRFVEZzHw4FAzI1N2QUKwACFhIfBwUQTXV0dWFsIEZ1bmQgTmV3cx8IZx8EBRBNdXR1YWwgRnVuZCBOZXdzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI2MB8KZx8LZx8MBQVfc2VsZh8NBRBNdXR1YWwgRnVuZCBOZXdzHw4FAzI2MGQUKwACFhIfBwUUUmVzZWFyY2ggU2VsZWN0IExpc3QfCGcfBAUUUmVzZWFyY2ggU2VsZWN0IExpc3QfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjYxHwpnHwtnHwwFBV9zZWxmHw0FFFJlc2VhcmNoIFNlbGVjdCBMaXN0Hw4FAzI2MWQUKwACFhIfBwUQSW52ZXN0bWVudCBUb29scx8IZx8EBRBJbnZlc3RtZW50IFRvb2xzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI1MB8KZx8LZx8MBQVfc2VsZh8NBRBJbnZlc3RtZW50IFRvb2xzHw4FAzI1MBQrAAcFFzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1FCsAAhYSHwcFC0NhbGN1bGF0b3JzHwhnHwQFC0NhbGN1bGF0b3JzHwUFQS9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyNSZSZWZlcmVyPVJlc2VhcmNoHwpnHwtnHwwFBV9zZWxmHw0FC0NhbGN1bGF0b3JzHw4FAzI1MmQUKwACFhIfBwUTRklOUkEgRnVuZCBBbmFseXplch8IZx8EBRNGSU5SQSBGdW5kIEFuYWx5emVyHwUFOC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0NvbW1vbi5hc3B4P0NvbnRlbnRJZD0xMDIxMjI0HwpnHwtnHwwFBV9zZWxmHw0FE0ZJTlJBIEZ1bmQgQW5hbHl6ZXIfDgUDMjUzZBQrAAIWEh8HBQ9Nb3JuaW5nc3RhciBBV1MfCGcfBAUPTW9ybmluZ3N0YXIgQVdTHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI1NB8KZx8LZx8MBQVfc2VsZh8NBQ9Nb3JuaW5nc3RhciBBV1MfDgUDMjU0ZBQrAAIWEh8HBR9Nb3JuaW5nc3RhciBQb3J0Zm9saW8gU25hcFNob3QgHwhnHwQFH01vcm5pbmdzdGFyIFBvcnRmb2xpbyBTbmFwU2hvdCAfBQUtL1dvcmtzdGF0aW9uL1NTTy9NU3Rhci9Qb3J0Zm9saW9TbmFwc2hvdC5hc3B4HwpnHwtnHwwFBV9zZWxmHw0FH01vcm5pbmdzdGFyIFBvcnRmb2xpbyBTbmFwU2hvdCAfDgUDMjU1ZBQrAAIWEh8HBQ5TdG9jayBTY3JlZW5lch8IZx8EBQ5TdG9jayBTY3JlZW5lch8FBRovV29ya3N0YXRpb24vU2NyZWVuZXIuaHRtbB8KZx8LZx8MBQVfc2VsZh8NBQ5TdG9jayBTY3JlZW5lch8OBQMyNTZkFCsAAhYSHwcFElZBIENvbXBhcmlzb24gVG9vbB8IZx8EBRJWQSBDb21wYXJpc29uIFRvb2wfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjcyHwpnHwtnHwwFBV9zZWxmHw0FElZBIENvbXBhcmlzb24gVG9vbB8OBQMyNzJkFCsAAhYSHwcFE01hcmtldCBDb21tZW50YXJpZXMfCGcfBAUTTWFya2V0IENvbW1lbnRhcmllcx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yNjUfCmcfC2cfDAUFX3NlbGYfDQUTTWFya2V0IENvbW1lbnRhcmllcx8OBQMyNjUUKwAHBRcwOjAsMDoxLDA6MiwwOjMsMDo0LDA6NRQrAAIWEh8HBRVEYWlseSBNYXJrZXQgQnJpZWZpbmcfCGcfBAUVRGFpbHkgTWFya2V0IEJyaWVmaW5nHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI2Nh8KZx8LZx8MBQVfc2VsZh8NBRVEYWlseSBNYXJrZXQgQnJpZWZpbmcfDgUDMjY2ZBQrAAIWEh8HBR9NYXJrZXQgQnVsbGV0aW5zICYgV2hpdGUgUGFwZXJzHwhnHwQFH01hcmtldCBCdWxsZXRpbnMgJiBXaGl0ZSBQYXBlcnMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjY3HwpnHwtnHwwFBV9zZWxmHw0FH01hcmtldCBCdWxsZXRpbnMgJiBXaGl0ZSBQYXBlcnMfDgUDMjY3ZBQrAAIWEh8HBRZNb250aGx5IE1hcmtldCBNb25pdG9yHwhnHwQFFk1vbnRobHkgTWFya2V0IE1vbml0b3IfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjY4HwpnHwtnHwwFBV9zZWxmHw0FFk1vbnRobHkgTWFya2V0IE1vbml0b3IfDgUDMjY4ZBQrAAIWEh8HBRhRdWFydGVybHkgTWFya2V0IE91dGxvb2sfCGcfBAUYUXVhcnRlcmx5IE1hcmtldCBPdXRsb29rHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI2OR8KZx8LZx8MBQVfc2VsZh8NBRhRdWFydGVybHkgTWFya2V0IE91dGxvb2sfDgUDMjY5ZBQrAAIWEh8HBQ9RdWFydGVybHkgUmVjYXAfCGcfBAUPUXVhcnRlcmx5IFJlY2FwHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI3MB8KZx8LZx8MBQVfc2VsZh8NBQ9RdWFydGVybHkgUmVjYXAfDgUDMjcwZBQrAAIWEh8HBR9UaGlyZCBQYXJ0eSBNYXJrZXQgQ29tbWVudGFyaWVzHwhnHwQFH1RoaXJkIFBhcnR5IE1hcmtldCBDb21tZW50YXJpZXMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjcxHwpnHwtnHwwFBV9zZWxmHw0FH1RoaXJkIFBhcnR5IE1hcmtldCBDb21tZW50YXJpZXMfDgUDMjcxZBQrAAIWEh8HBRRFZHVjYXRpb24gJiBUcmFpbmluZx8IZx8EBRRFZHVjYXRpb24gJiBUcmFpbmluZx8FBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD05HwpnHwtnHwwFBV9zZWxmHw0FFEVkdWNhdGlvbiAmIFRyYWluaW5nHw4FATkUKwAHBScwOjAsMDoxLDA6MiwxOjIsMDoyLDA6MywwOjQsMDo1LDA6NiwxOjYUKwACFhIfBwUVQ2xpY2sgJ24gUGxheSBMaWJyYXJ5HwhnHwQFFUNsaWNrICduIFBsYXkgTGlicmFyeR8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0xMTMfCmcfC2cfDAUFX3NlbGYfDQUVQ2xpY2sgJ24gUGxheSBMaWJyYXJ5Hw4FAzExMxQrAAgFMzA6MCwwOjEsMToxLDA6MSwwOjIsMToyLDA6MiwxOjIsMDoyLDA6MywwOjQsMDo1LDA6NhQrAAIWEh8HBRFBZHZpc29yeSBTZXJ2aWNlcx8IZx8EBRFBZHZpc29yeSBTZXJ2aWNlcx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMjEfCmcfC2cfDAUFX3NlbGYfDQURQWR2aXNvcnkgU2VydmljZXMfDgUDMTIxZBQrAAIWEh8HBQ9BcmNoaXZlZCBFdmVudHMfCGcfBAUPQXJjaGl2ZWQgRXZlbnRzHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTEyMh8KZx8LZx8MBQVfc2VsZh8NBQ9BcmNoaXZlZCBFdmVudHMfDgUDMTIyZBQrAAIWEh8HBQpTbWFydFdvcmtzHwhnHwQFClNtYXJ0V29ya3MfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTI1HwpnHwtnHwwFBV9zZWxmHw0FClNtYXJ0V29ya3MfDgUDMTI1ZBQrAAIWEh8HBQ9Nb25leUd1aWRlU3VpdGUfCGcfBAUPTW9uZXlHdWlkZVN1aXRlHwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI0OB8KZx8LZx8MBQVfc2VsZh8NBQ9Nb25leUd1aWRlU3VpdGUfDgUDMjQ4ZBQrAAIWEh8HBR9Nb3JuaW5nc3RhciBBZHZpc29yIFdvcmtzdGF0aW9uHwhnHwQFH01vcm5pbmdzdGFyIEFkdmlzb3IgV29ya3N0YXRpb24fBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTI2HwpnHwtnHwwFBV9zZWxmHw0FH01vcm5pbmdzdGFyIEFkdmlzb3IgV29ya3N0YXRpb24fDgUDMTI2ZBQrAAIWEh8HBQhOZXRYIDM2MB8IZx8EBQhOZXRYIDM2MB8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMjcfCmcfC2cfDAUFX3NlbGYfDQUITmV0WCAzNjAfDgUDMTI3ZBQrAAIWEh8HBRxUaW1lc2F2aW5nIFRvb2xzICYgUmVzb3VyY2VzHwhnHwQFHFRpbWVzYXZpbmcgVG9vbHMgJiBSZXNvdXJjZXMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTI4HwpnHwtnHwwFBV9zZWxmHw0FHFRpbWVzYXZpbmcgVG9vbHMgJiBSZXNvdXJjZXMfDgUDMTI4ZBQrAAIWEh8HBRNDb21wbGlhbmNlIFRyYWluaW5nHwhnHwQFE0NvbXBsaWFuY2UgVHJhaW5pbmcfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTE0HwpnHwtnHwwFBV9zZWxmHw0FE0NvbXBsaWFuY2UgVHJhaW5pbmcfDgUDMTE0ZBQrAAIWEh8HBRBHdWlkZXMgJiBNYW51YWxzHwhnHwQFEEd1aWRlcyAmIE1hbnVhbHMfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTE2HwpnHwtnHwwFBV9zZWxmHw0FEEd1aWRlcyAmIE1hbnVhbHMfDgUDMTE2ZBQrAAIWEh8HBRRKb2IgQWlkcyAmIEVaIEd1aWRlcx8IZx8EBRRKb2IgQWlkcyAmIEVaIEd1aWRlcx8FBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMTcfCmcfC2cfDAUFX3NlbGYfDQUUSm9iIEFpZHMgJiBFWiBHdWlkZXMfDgUDMTE3ZBQrAAIWEh8HBRVUZWNobm9sb2d5ICYgU2VjdXJpdHkfCGcfBAUVVGVjaG5vbG9neSAmIFNlY3VyaXR5HwUFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI4OB8KZx8LZx8MBQVfc2VsZh8NBRVUZWNobm9sb2d5ICYgU2VjdXJpdHkfDgUDMjg4ZBQrAAIWEh8HBRZUcmFpbmluZyAmIERldmVsb3BtZW50HwhnHwQFFlRyYWluaW5nICYgRGV2ZWxvcG1lbnQfBQUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTE5HwpnHwtnHwwFBV9zZWxmHw0FFlRyYWluaW5nICYgRGV2ZWxvcG1lbnQfDgUDMTE5ZBQrAAIWDh8EBTAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsfBwUwJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7HwpnHwtnHw4FAzEzNx8IZx8MBQVfc2VsZmRkAikPZBYCAgMPEGQPFgFmFgEQBRktLSBTZWxlY3QgYSBRdWljayBMaW5rIC0tBQEwZ2RkAi0PZBYEAgUPZBYCAgEPZBYCAgEPZBYCAgMPFgIfBAXnKjxkaXYgY2xhc3M9InBvcnRsZXQtc2Nyb2xsYmFyIiBzdHlsZT0ib3ZlcmZsb3c6aGlkZGVuOyB3aWR0aDo2OTBweDsiPg0KPHN0eWxlIHR5cGU9InRleHQvY3NzIj4NCiNjb250YWluZXJJbm5lciB7DQoJcG9zaXRpb246IHJlbGF0aXZlOw0KCXdpZHRoOiA2OTBweDsNCgliYWNrZ3JvdW5kOiAjRkZGRkZGOw0KCW1hcmdpbjogMCBhdXRvOw0KCXRleHQtYWxpZ246IGxlZnQ7DQp9DQojY29udEluTGZ0IHsNCglwb3NpdGlvbjogYWJzb2x1dGU7DQoJbGVmdDogMDsNCgl3aWR0aDogMjI0cHg7DQoJaGVpZ2h0OjIxMHB4Ow0KfQ0KI2NvbnRJblJ0IHsNCglwb3NpdGlvbjogYWJzb2x1dGU7DQoJcmlnaHQ6IDA7DQoJd2lkdGg6IDIyNHB4Ow0KCWhlaWdodDoyMTBweDsNCn0NCiNjb250SW5DbnQgew0KCW1hcmdpbjogMCAyMzNweDsNCgloZWlnaHQ6MjEwcHg7DQp9DQouU2VjdGlvbkhlYWRlciB7DQoJZm9udC13ZWlnaHQ6Ym9sZDsNCgljb2xvcjojMDAwMDY2Ow0KfQ0KI21vdmVMaXN0TGVmdCB7DQoJbWFyZ2luLWxlZnQ6LTEwcHg7DQoJcGFkZGluZy1yaWdodDoxMHB4Ow0KfQ0KdWwgew0KCWNvbG9yOiMwMDAwNjY7DQp9DQo8L3N0eWxlPg0KPHNjcmlwdCBzcmM9Ii4uL3Jlc291cmNlcy8xMDY0NDA2LmpzIiB0eXBlPSJ0ZXh0L2phdmFzY3JpcHQiPjwvc2NyaXB0PjwhLS0ganF1ZXJ5LnNsaWRlVmlld2VyUHJvLjEuMC5vcmlnLmpzIC0tPg0KPHNjcmlwdCBzcmM9Ii4uL3Jlc291cmNlcy8xMDY0NDA1LmpzIiB0eXBlPSJ0ZXh0L2phdmFzY3JpcHQiPjwvc2NyaXB0PjwhLS0ganF1ZXJ5LnRpbWVycy0xLjEuMy5qcyAtLT4NCjxzY3JpcHQgc3JjPSIuLi9yZXNvdXJjZXMvMTA2NDQwNC5qcyIgdHlwZT0idGV4dC9qYXZhc2NyaXB0Ij48L3NjcmlwdD48IS0tIGpxdWVyeS5Qcm9tb0V4cGlyYXRpb24uanMgLS0+DQo8c2NyaXB0IHR5cGU9InRleHQvamF2YXNjcmlwdCI+DQokKCIuYmNrLWJ0biIpLnJlbW92ZSgpOyANCiQod2luZG93KS5iaW5kKCJsb2FkIiwgZnVuY3Rpb24oKSB7DQoJJCgiZGl2I2luZ1NsaWRlciIpLnNsaWRlVmlld2VyUHJvKHsNCgkJdGh1bWJzOiA1LA0KCQl0aHVtYnNQZXJjZW50UmVkdWN0aW9uOiAxMiwNCgkJZ2FsQm9yZGVyV2lkdGg6IDEsDQoJCWdhbEJvcmRlckNvbG9yOiAiI2IzYjNiMyIsDQoJCXRodW1ic1RvcE1hcmdpbjogMTMsDQoJCXRodW1ic1JpZ2h0TWFyZ2luOiAxMCwNCgkJdGh1bWJzQm9yZGVyV2lkdGg6IDEsDQoJCXRodW1ic0FjdGl2ZUJvcmRlck9wYWNpdHk6IDAuOCwNCgkJdGh1bWJzQm9yZGVyT3BhY2l0eTogMCwNCgkJYnV0dG9uc1RleHRDb2xvcjogIiM3MDcwNzAiLA0KCQlsZWZ0QnV0dG9uSW5uZXI6ICIiLA0KCQlyaWdodEJ1dHRvbklubmVyOiAiIiwNCgkJYXV0b3NsaWRlOiB0cnVlLCAvL2NoYW5nZSB0byBmYWxzZSB3aGVuIG9ubHkgT05FIHByb21vdGlvbiBleGlzdHMNCgkJdGh1bWJzVmlzOiB0cnVlLCAvL2NoYW5nZSB0byBmYWxzZSB3aGVuIG9ubHkgT05FIHByb21vdGlvbiBleGlzdHMNCgkJZWFzZVRpbWU6IDE1MDAsDQoJCXR5cG9GdWxsT3BhY2l0eTogMC45LCAgLy9jaGFuZ2UgdG8gMS4wIHdoZW4gaXNzdWUgYW4gYWxlcnQgKGRlZmF1bHQgPSAwLjkpDQoJCXRodW1ic0FjdGl2ZUJvcmRlckNvbG9yOiAiI2I1YjViNSIsIC8vY2hhbmdlIHRvICMwMDAgd2hlbiBpc3N1ZSBhbiBhbGVydCAoZGVmYXVsdCA9ICNiNWI1YjUpDQoJCXR5cG86IGZhbHNlLCAvL2NoYW5nZSB0byB0cnVlIHdoZW4gaXNzdWUgYW4gYWxlcnQNCgkJYWxlcnRUZXh0OiAiQWxlcnQiDQoJCS8vYWxlcnRUZXh0OiAiPGEgaHJlZj0iYnRuIiBtY2VfaHJlZj0iLi4vYnJvd3NlL2J0biIgdGFyZ2V0PSdfc2VsZicgc3R5bGU9ImNvbG9yOiNmZmY7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IiBtY2Vfc3R5bGU9ImNvbG9yOiNmZmY7dGV4dC1kZWNvcmF0aW9uOm5vbmU7Ij4mbmJzcDsmbmJzcDs8Yj5QbGVhc2Ugd2FpdCBmb3IgZnVydGhlciBpbnN0cnVjdGlvbnMgJnJhcXVvOzwvYj48L2E+IiAvL2NoYW5nZSBhbGVydCB0ZXh0DQogIH0pOw0KfSk7DQo8L3NjcmlwdD4NCg0KPCEtLSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMgSU1BR0UgU0xJREVSICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMtLT4NCjwhLS0gZGVmYXVsdCBpbWFnZSBqdXN0IGNoYW5nZSBkYXRlIHRvIGFjdGl2YXRlIGlmIG5vIG90aGVyIHByb21vdGlvbnMgYXJlIGFjdGl2ZTogNDg4ODUyNy5qcGcgLS0+DQo8ZGl2IGlkPSJpbmdTbGlkZXIiIGNsYXNzPSJzdndwIj4NCjx1bD4NCiAgICANCg0KDQoNCjxjZGlpbmNsdWRlIHNhbGVzY2hhbm5lbD0iQ2V0ZXJhIEZpbmFuY2lhbCBTcGVjaWFsaXN0cyI+DQoJPGxpPg0KCQk8aW5zIGRhdGV0aW1lPSIxLzIyLzIwMTMiPjwvaW5zPjxhIGhyZWY9Ii9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0NvbW1vbi5hc3B4P0NvbnRlbnRJZD0yOTMzODI1MyI+PGltZyBhbHQ9IiAgIiBzcmM9Ii4uL3Jlc291cmNlcy8yOTQ0NDQyMS5naWYiPjwvYT4NCgk8L2xpPg0KCTxsaT4NCgkJPGlucyBkYXRldGltZT0iMS8xMi8yMDEzIj48L2lucz48YSBocmVmPSIvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9SZW5kZXJDb250ZW50LmFzcHg/Q29udGVudElkPTI5NDIzMzQzIj48aW1nIGFsdD0iICAiIHNyYz0iLi4vcmVzb3VyY2VzLzI5NDIzNjExLmdpZiI+PC9hPg0KCTwvbGk+DQo8L2NkaWluY2x1ZGU+DQoNCg0KDQogICANCjwvdWw+DQo8L2Rpdj4NCjwhLS0jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIElNQUdFIFNMSURFUiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjLS0+IDxicj4gPGJyPg0KPGRpdiBpZD0iY29udGFpbmVySW5uZXIiPg0KICA8ZGl2IGlkPSJjb250SW5MZnQiIGNsYXNzPSJQYXJ0U3R5bGUiPg0KCQk8ZGl2IGNsYXNzPSJTZWN0aW9uSGVhZGVyIj5Eb2luZyBCdXNpbmVzczwvZGl2Pg0KCQkJPGRpdiBpZD0ibW92ZUxpc3RMZWZ0Ij4NCgkJCQk8dWw+DQoJCQkJCTxsaT48YSBocmVmPSIvV29ya1N0YXRpb24vTWFpbi5hc3B4IiB0YXJnZXQ9Il9ibGFuayIgY2xhc3M9ImxpbmtUeXBlMyI+U21hcnRXb3JrczwvYT48aW1nIHNyYz0iLi4vcmVzb3VyY2VzLzI1NjYyNDcuZ2lmIiB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIGFsdD0iIiBib3JkZXI9IjAiPjwvbGk+DQoJCQkJCTxsaT48YSBocmVmPSIvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD0xMCIgdGFyZ2V0PSJfc2VsZiIgY2xhc3M9ImxpbmtUeXBlMyI+QnJva2VyYWdlIE9wZXJhdGlvbnMgUXVpY2sgUmVmZXJlbmNlPC9hPjwvbGk+DQoJCQkJCTxsaT48YSBocmVmPSIvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Db21tb24uYXNweD9Db250ZW50SWQ9NjI4NDkyOCIgdGFyZ2V0PSJfc2VsZiIgY2xhc3M9ImxpbmtUeXBlMyI+QnJva2VyYWdlIE9wZXJhdGlvbnMgUmVxdWVzdCBGb3JtPC9hPjwvbGk+DQoJCQkJCTxsaT48YSBocmVmPSIvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Db21tb24uYXNweD9Db250ZW50SWQ9MTA2MzIwMCIgdGFyZ2V0PSJfc2VsZiIgY2xhc3M9ImxpbmtUeXBlMyI+TWVldGluZ3MgJmFtcDsgRXZlbnRzPC9hPjwvbGk+DQoJCQkJCTxsaT48YSBocmVmPSIvRG9Ob3RDYWxsL0ROQ0hvbWUuYXNweCIgdGFyZ2V0PSJfYmxhbmsiIGNsYXNzPSJsaW5rVHlwZTMiPkRvIE5vdCBDYWxsIExpc3Q8L2E+PGltZyBzcmM9Ii4uL3Jlc291cmNlcy8zMDMwNjM3LmpwZyIgYWx0PSIiIGJvcmRlcj0iMCI+IDxpbWcgc3JjPSIuLi9yZXNvdXJjZXMvMjU2NjI0Ny5naWYiIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgYWx0PSIiIGJvcmRlcj0iMCI+PC9saT4NCgkJCQkJPGxpPjxhIGhyZWY9Ii9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0NvbW1vbi5hc3B4P0NhdGVnb3J5PU5ld3MiIHRhcmdldD0iX3NlbGYiIGNsYXNzPSJsaW5rVHlwZTMiPkFydGljbGUgQXJjaGl2ZTwvYT48L2xpPg0KICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgICAgICAgICAgDQoJCQkJPC91bD4NCgkJCTwvZGl2Pg0KCQk8L2Rpdj4NCgkJPGRpdiBpZD0iY29udEluUnQiIGNsYXNzPSJQYXJ0U3R5bGUiPg0KCQkJPGRpdiBjbGFzcz0iU2VjdGlvbkhlYWRlciI+RmVhdHVyZSBJdGVtczwvZGl2Pg0KCQkJPGRpdiBpZD0ibW92ZUxpc3RMZWZ0Ij4NCgkJCQk8dWw+DQoJCQkJCSAgICAgICANCgkNCiAgICANCgkNCgkJCQkJPGxpPjxhIGhyZWY9Ii9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0NvbW1vbi5hc3B4P0NvbnRlbnRJZD0zODYxNzI0IiB0YXJnZXQ9Il9zZWxmIiBjbGFzcz0ibGlua1R5cGUzIj5TZWN1cmluZyBZb3VyIEFwcGxlJnJlZzsgaVBhZCZ0cmFkZTsvaVBob25lIGZvciBVc2UgaW4gWW91ciBTZWN1cml0aWVzIEJ1c2luZXNzPC9hPjwvbGk+DQogICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgICAgICAgICAgDQoJCQkJCTxsaT48YSBocmVmPSIvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Db21tb24uYXNweD9Db250ZW50SWQ9MTA2NzA1NiIgdGFyZ2V0PSJfc2VsZiIgY2xhc3M9ImxpbmtUeXBlMyI+TmV0WDM2MCBJbmZvcm1hdGlvbjwvYT48L2xpPg0KCQkJCQkNCiAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMjgiIHRhcmdldD0iX3NlbGYiIGNsYXNzPSJsaW5rVHlwZTMiPlNtYXJ0V29ya3MgSW1hZ2luZyBTb2x1dGlvbnM8L2E+PC9saT4NCg0KICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgIA0KCQkJCTwvdWw+DQoJCQk8L2Rpdj4NCgkJPC9kaXY+DQoJCTxkaXYgaWQ9ImNvbnRJbkNudCIgY2xhc3M9IlBhcnRTdHlsZUFkdmlzb3J5Ij4NCgkJCTxkaXYgY2xhc3M9IlNlY3Rpb25IZWFkZXIiPkFkdmlzb3J5IFNlcnZpY2VzPC9kaXY+DQoJCQk8ZGl2IGlkPSJtb3ZlTGlzdExlZnQiPg0KCQkJCTx1bD4NCiAgICAgICAgICAgICAgICANCiAgICANCiAgICANCiAgICANCgkNCgkJCQkJDQogICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvQ29tbW9uLmFzcHg/Q29udGVudElkPTcxMDI0MzQiIHRhcmdldD0iX3NlbGYiIGNsYXNzPSJsaW5rVHlwZTMiPlNtYXJ0d29ya3MgQWR2aXNlcjwvYT48L2xpPg0KDQoJCQkJCTxsaT48YSBocmVmPSIvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9SZW5kZXJDb250ZW50LmFzcHg/Q29udGVudElkPTEwNjQ1MDUiIHRhcmdldD0iX2JsYW5rIiBjbGFzcz0ibGlua1R5cGUzIj5BZHZpc29yeSBTZXJ2aWNlcyBGaWVsZCBTdXBwb3J0IFRlYW08L2E+PC9saT4NCg0KCQ0KCQ0KCQkJCTwvdWw+DQoJCQk8L2Rpdj4NCgkJPC9kaXY+DQoJPC9kaXY+DQo8L2Rpdj5kAgcPZBYCAgEPZBYCAgEPZBYCAgEPZBYCZg9kFgICAQ8WAh4Fc3R5bGUFDWRpc3BsYXk6bm9uZTsWAgIBD2QWBGYPFgIfAGhkAgIPFgIfAGcWAgIBDxYCHwQFnwE8YSBocmVmPScuLi9Qb3J0YWwvTWFuYWdlRmF2b3JpdGVzLmFzcHgnIGNsYXNzPSdsaW5rVHlwZTInPllvdSBoYXZlIG5vdCBhZGRlZCBhbnkgaXRlbXMgdG8geW91ciBIb21lIHBhZ2UgZmF2b3JpdGVzLiAgQ2xpY2sgaGVyZSB0byBtYW5hZ2UgeW91ciBmYXZvcml0aWVzLjwvYT5kAi8PFgIeBGhyZWYFJy4uL1BvcnRhbC9Db21tb24uYXNweD9Db250ZW50SWQ9MjAwMDAxNGQYAgUxY3RsMDAkY3RsMDMkZ3dwdWNIaWdobGlnaHRzJHVjSGlnaGxpZ2h0cyRndkRldGFpbA9nZAUOY3RsMDAkbWFpbk1lbnUPD2QFBEhvbWVkAMKxKECnX9E8ajOdRSP6q3ecxZc734rLmxgqNHSO7lU=" />
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
 
 
<script src="../WebResource_01.js" type="text/javascript"></script>
 
 
<script src="../WebResource_02.js" type="text/javascript"></script>
<script src="../WebResource_02.js" type="text/javascript"></script>
<script src="../WebResource_03.js" type="text/javascript"></script>
<script type="text/javascript"> 
//<![CDATA[
if (typeof(Sys) === 'undefined') throw new Error('ASP.NET Ajax client-side framework failed to load.');
//]]>
</script>
 
<script src="../WebResource_04.js" type="text/javascript"></script>
<script src="../WebResource_05.js" type="text/javascript"></script>
<script src="../WebResource_06.js" type="text/javascript"></script>
<script src="../WebResource_07.js" type="text/javascript"></script>
<script src="../WebResource_08.js"></script>
<script src="../WebResource_09.js" type="text/javascript"></script>
<script src="../WebResource_10.js" type="text/javascript"></script>
<script src="../WebResource_11.js" type="text/javascript"></script>
<script src="../WebResource_12.js" type="text/javascript"></script>
<script src="../WebResource_13.js" type="text/javascript"></script>
    <div id="container">
        <!-- ################  Start #header ################ -->
        <div id="header">
            <div class="logo">
                <div id="menuSmallUser" style="float:right;padding-top:20px;">
                    <span id="ctl00_lblUserName" class="toolBar">Welcome IVAN SONG</span>
                    &nbsp;&nbsp;</div>
                <a id="ctl00_bdlogo" href="../Portal/Home.asp"><img src="../resources/CFS_LOGO.png" alt="" style="border-width:0px;" /></a>
            </div>
            <hr />
            <div id="menuSmall">
                <div id="menuSmallLeft">
                    <span id="ctl00_lblMainMenu"><a id="hypMyProfile" href="/TotalAccess/Auth/userprofile.aspx" class="func_link" Target='frmContent' >My Profile</a>&nbsp;|&nbsp;<a id="hypContactUs" href="../Portal/28591417.asp" class="func_link" Target='_self' >Contact Us</a>&nbsp;|&nbsp;<a id="hypSiteMap" href="../Portal/Sitemap.asp" class="func_link" Target='_self' >Site Map</a>&nbsp;|&nbsp;<a id="hypAdmin" href="../Portal/ChangeProfile.asp" class="func_link" Target='_self' >Admin</a>&nbsp;|&nbsp;<a id="hypSmartworks" href="javascript:windowHandle = launch_smartworks();" class="func_link" Target='_self' >SmartWorks</a>&nbsp;|&nbsp;<a id="hypLogOut" href="javascript:windowHandle = logout();" class="func_link" Target='_self' >Log Out</a>&nbsp;</span>
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
                    <a href="#ctl00_mainMenu_SkipLink"><img alt="Skip Navigation Links" src="../WebResource_SkipNav.gif" width="0" height="0" style="border-width:0px;" /></a><table id="ctl00_mainMenu" class="Writing menu ctl00_mainMenu_5 ctl00_mainMenu_2" cellpadding="0" cellspacing="0" border="0">
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun1ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun10ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun14ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun16ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun11ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun12ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun2ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun43ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun44ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun45ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun3ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun63ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun64ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun65ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun4ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun72ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun73ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun74ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun75ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun5ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun103ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun6ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun109ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun7ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun117ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun118ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun119ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun8ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
		<img src="../WebResource_ScrollUp.gif" alt="Scroll up" />
	</div><div class="submenuitems ctl00_mainMenu_7 ctl00_mainMenu_0" id="ctl00_mainMenun135ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
		<img src="../WebResource_ScrollDown.gif" alt="Scroll down" />
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
        
        <table width="100%">
            <tr>
                <td colspan="2">
                    <input type="hidden" name="ctl00$ContentPlaceHolder1$hfFavoritePortlet" id="ctl00_ContentPlaceHolder1_hfFavoritePortlet" />
                </td>
            </tr>
            <tr>
                <td id="ctl00_ContentPlaceHolder1_tdLeft" valign="top">
                    <div id="ctl00_ContentPlaceHolder1_divContent">
                           
<table cellpadding="0" cellspacing="0">
    <tr>
        <td>
        
        </td>
    </tr>
    <tr>
        <td>
         
            <div class="portlet-scrollbar" style="overflow:visible; width:690px;">
<style type="text/css"> 
#containerInner {
	position: relative;
	width: 690px;
	background: #FFFFFF;
	margin: 0 auto;
	text-align: left;
}
#contInLft {
	position: absolute;
	left: 0;
	width: 224px;
	height:210px;
}
#contInRt {
	position: absolute;
	right: 0;
	width: 224px;
	height:210px;
}
#contInCnt {
	margin: 0 233px;
	height:210px;
}
.SectionHeader {
	font-weight:bold;
	color:#000066;
}
#moveListLeft {
	margin-left:-10px;
	padding-right:10px;
}
ul {
	color:#000066;
}
</style>
<script src="../resources/1064406.js" type="text/javascript"></script><!-- jquery.slideViewerPro.1.0.orig.js -->
<script src="../resources/1064405.js" type="text/javascript"></script><!-- jquery.timers-1.1.3.js -->
<script src="../resources/1064404.js" type="text/javascript"></script><!-- jquery.PromoExpiration.js -->
<script type="text/javascript"> 
$(".bck-btn").remove(); 
$(window).bind("load", function() {
	$("div#ingSlider").slideViewerPro({
		thumbs: 5,
		thumbsPercentReduction: 12,
		galBorderWidth: 1,
		galBorderColor: "#b3b3b3",
		thumbsTopMargin: 13,
		thumbsRightMargin: 10,
		thumbsBorderWidth: 1,
		thumbsActiveBorderOpacity: 0.8,
		thumbsBorderOpacity: 0,
		buttonsTextColor: "#707070",
		leftButtonInner: "",
		rightButtonInner: "",
		autoslide: true, //change to false when only ONE promotion exists
		thumbsVis: true, //change to false when only ONE promotion exists
		easeTime: 1500,
		typoFullOpacity: 0.9,  //change to 1.0 when issue an alert (default = 0.9)
		thumbsActiveBorderColor: "#b5b5b5", //change to #000 when issue an alert (default = #b5b5b5)
		typo: false, //change to true when issue an alert
		alertText: "Alert"
		//alertText: "<a href="btn" mce_href="../browse/btn" target='_self' style="color:#fff;text-decoration:none;" mce_style="color:#fff;text-decoration:none;">&nbsp;&nbsp;<b>Please wait for further instructions &raquo;</b></a>" //change alert text
  });
});
</script>
 
<!--################################## IMAGE SLIDER ###########################################-->
<!-- default image just change date to activate if no other promotions are active: 4888527.jpg -->
<div id="ingSlider" class="svwp">
<ul>
    
 
 
 
<cdiinclude saleschannel="Cetera Financial Specialists">
	<li>
		<ins datetime="1/22/2013"></ins><a href="../Portal/29338253.asp"><img alt="  " src="../resources/29444421.gif"></a>
	</li>
	<li>
		<ins datetime="1/12/2013"></ins><a href="../Portal/29423343.pdf"><img alt="  " src="../resources/29423611.gif"></a>
	</li>
</cdiinclude>
 
 
 
   
</ul>
</div>
<!--################################## IMAGE SLIDER ###########################################--> <br> <br>
<div id="containerInner">
  <div id="contInLft" class="PartStyle">
		<div class="SectionHeader">Doing Business</div>
			<div id="moveListLeft">
				<ul>
					<li><a href="/WorkStation/Main.aspx" target="_blank" class="linkType3">SmartWorks</a><img src="../resources/2566247.gif" width="12" height="12" alt="" border="0"></li>
					<li><a href="/BrokerDealerCenter/Portal/Tier1.aspx?MenuId=10" target="_self" class="linkType3">Brokerage Operations Quick Reference</a></li>
					<li><a href="/BrokerDealerCenter/Portal/Common.aspx?ContentId=6284928" target="_self" class="linkType3">Brokerage Operations Request Form</a></li>
					<li><a href="/BrokerDealerCenter/Portal/Common.aspx?ContentId=1063200" target="_self" class="linkType3">Meetings &amp; Events</a></li>
					<li><a href="/DoNotCall/DNCHome.aspx" target="_blank" class="linkType3">Do Not Call List</a><img src="../resources/3030637.jpg" alt="" border="0"> <img src="../resources/2566247.gif" width="12" height="12" alt="" border="0"></li>
					<li><a href="/BrokerDealerCenter/Portal/Common.aspx?Category=News" target="_self" class="linkType3">Article Archive</a></li>
				</ul>
			</div>
		</div>
		<div id="contInRt" class="PartStyle">
			<div class="SectionHeader">Feature Items</div>
			<div id="moveListLeft">
				<ul>
					<li><a href="/BrokerDealerCenter/Portal/Common.aspx?ContentId=3861724" target="_self" class="linkType3">Securing Your Apple&reg; iPad&trade;/iPhone for Use in Your Securities Business</a></li>
					<li><a href="/BrokerDealerCenter/Portal/Common.aspx?ContentId=1067056" target="_self" class="linkType3">NetX360 Information</a></li>
                    <li><a href="/BrokerDealerCenter/Portal/Tier3.aspx?MenuId=228" target="_self" class="linkType3">SmartWorks Imaging Solutions</a></li>
				</ul>
			</div>
		</div>
		<div id="contInCnt" class="PartStyleAdvisory">
			<div class="SectionHeader">Advisory Services</div>
			<div id="moveListLeft">
				<ul>
                    <li><a href="/BrokerDealerCenter/Portal/Common.aspx?ContentId=7102434" target="_self" class="linkType3">Smartworks Adviser</a></li>
 
					<li><a href="/BrokerDealerCenter/Portal/RenderContent.aspx?ContentId=1064505" target="_blank" class="linkType3">Advisory Services Field Support Team</a></li>
 
	
	
				</ul>
			</div>
		</div>
	</div>
</div>
        </td>
    </tr>
</table>
 
                    </div>
                </td>
 
                <td id="ctl00_ContentPlaceHolder1_tdRight" valign="top" style="width: 250px">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td>
                                <div id="ctl00_ContentPlaceHolder1_divHomeFavorites" style="margin-left: 1.2em; width: 246px;">
                                    <table id="ctl00_ContentPlaceHolder1_tblHomeFavorites" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="SectionHeader" style="cursor: pointer;" onclick="MinimizeRestore();" align="right">
                                                <img src="../resources/2397851.gif" id="ctl00_ContentPlaceHolder1_imgMinimizeRestore" />
                                            </td>
		<td class="SectionHeader" onclick="MinimizeRestore();" width="100%" style="height: 20px;
                                                cursor: pointer;" valign="center" align="left">
                                                <b>My Favorites</b>
                                            </td>
	</tr>
	<tr>
		<td width="100%" colspan="2">
                                                <div id="ctl00_ContentPlaceHolder1_divFavorites" style="display:none;">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td>
                                                                
<div id="ctl00_ContentPlaceHolder1_ucMyFavourites_divNoFavoritesOnHome">
    <table>
        <tr>
            <td>
                <a href='../Portal/ManageFavorites.aspx' class='linkType2'>You have not added any items to your Home page favorites.  Click here to manage your favorities.</a>
            </td>
        </tr>
    </table>
</div>
 
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
	</tr>
</table>
 
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="ctl00_ContentPlaceHolder1_divHighlights" style="margin-left: 1em; width: 250px">
                                    <table cellspacing="0" cellpadding="0" border="0" id="ctl00_ContentPlaceHolder1_wpHighlights" class="PartZone" style="width:100%;">
	<tr>
		<td style="height:100%;"><table cellspacing="0" cellpadding="2" border="0" style="width:100%;height:100%;">
			<tr>
				<td><table cellspacing="0" cellpadding="2" border="0" id="WebPart_gwpucHighlights" style="width:100%;">
					<tr>
						<td class="SectionHeader ctl00_ContentPlaceHolder1_wpHighlights_1"><table cellspacing="0" cellpadding="0" border="0" style="width:100%;">
							<tr>
								<td id="WebPartTitle_gwpucHighlights" style="width:100%;white-space:nowrap;"><span title="Highlights - [Generic Description]">Highlights</span>&nbsp;</td>
							</tr>
						</table></td>
					</tr><tr>
						<td class="PartStyle" style="padding:5px;">
<div>
    </div>
<div id="ctl00_ctl03_gwpucHighlights_ucHighlights_divHighlightsTable">
    
            <table width="100%">
                <tr valign="top">
                    <td id="ctl00_ctl03_gwpucHighlights_ucHighlights_rptHighlights_ctl00_tdImage" rowspan="3">
                        <img id="ctl00_ctl03_gwpucHighlights_ucHighlights_rptHighlights_ctl00_HighlightsImage" src="../resources/1067924.jpg" style="border-width:0px;" />
                    </td>
						
                    <td width="300" class="contentSubtitle">
                        By the Numbers - 1/14/13 Edition
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <a class='linkType2' style="cursor: pointer" href="javascript:OpenLink('29061470','yes','')">
                            Learn More
                            &raquo;</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
            </table>
        
            <table width="100%">
                <tr valign="top">
                    
                    <td width="300" class="contentSubtitle">
                        Fiscal Cliffhanger: The American Taxpayer Relief Act of 2012
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <a class='linkType2' style="cursor: pointer" href="javascript:OpenLink('29528295','no','')">
                            Learn More
                            &raquo;</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
            </table>
        
            <table width="100%">
                <tr valign="top">
                    <td id="ctl00_ctl03_gwpucHighlights_ucHighlights_rptHighlights_ctl02_tdImage" rowspan="3">
                        <img id="ctl00_ctl03_gwpucHighlights_ucHighlights_rptHighlights_ctl02_HighlightsImage" src="../resources/28347506.png" style="border-width:0px;" />
                    </td>
						
                    <td width="300" class="contentSubtitle">
                        Rebrand Central
                    </td>
                </tr>
                <tr>
                    <td>
                        Rebrand Central is your one-stop-shop for everything you need to prepare for Genworth's name change to Cetera Financial Specialists. Get detailed info, announcements, FAQs, important dates, details on the reimbursement program and more.
                    </td>
                </tr>
                <tr>
                    <td>
                        <a class='linkType2' style="cursor: pointer" href="javascript:OpenLink('28961776','no','')">
                            Learn More
                            &raquo;</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
            </table>
        
            <table align="right">
                <tr>
                    <td align="right">
                        <a class='linkType2' href='Common.aspx?Category=Highlights'>View All Highlights</a><a
                            class='linkArrowType1'>&raquo;</a>
                    </td>
                </tr>
            </table>
        
</div>
 
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
                            </td>
                        </tr>
                    </table>
                </td>
 
            </tr>
        </table>
    </div>
 
            <div class="clearfloat">
            </div>
        </div>
        <!-- end #mainContent -->
        <!-- ################  Start #footer ################ -->
        <div id="footer">
            <div id="footerCopyright">
                <p class="fltrt">
                    Cetera Financial Group &copy; 2010. All rights reserved.</p>
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
 
zoneElement = document.getElementById('ctl00_ContentPlaceHolder1_wpHighlights');
if (zoneElement != null) {
    zoneObject = __wpm.AddZone(zoneElement, 'ctl00$ContentPlaceHolder1$wpHighlights', true, false, 'black');
    zoneObject.AddWebPart(document.getElementById('WebPart_gwpucHighlights'), null, false);
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
    $create(AjaxControlToolkit.ModalPopupBehavior, {"BackgroundCssClass":"GrayedOut","CancelControlID":"ctl00_btnCancel","OkControlID":"ctl00_btnOk","OnCancelScript":"onCancel()","OnOkScript":"onOk()","PopupControlID":"ctl00_pnlPopup","dynamicServicePath":"/BrokerDealerCenter/Portal/Home.asp","id":"ctl00_ModalPopupExtender1"}, null, null, $get("ctl00_lnkBtnPopup"));
});
//]]>
</script>
</form>
</body>
</html>
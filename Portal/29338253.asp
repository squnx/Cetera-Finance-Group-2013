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
    <form name="aspnetForm" method="post" action="Common.aspx?ContentId=29338253" id="aspnetForm">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE3OTk2MzE0NDAPZBYCZg9kFgQCAQ9kFgICAw9kFgIFE2d3cHVjQ29udGVudFBvcnRsZXQPZBYCZg9kFgQCAQ9kFgICAw8WAh4EVGV4dAWCwQE8IS0tIGNvYmJsZXI6IDI5MzM4MjUzIC0tPg0KPGxpbmsgdHlwZT0idGV4dC9jc3MiIHJlbD0ic3R5bGVTaGVldCIgaHJlZj0iLi4vcmVzb3VyY2VzLzEwNjQ0MTAuY3NzIj4NCjxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0IiBsYW5ndWFnZT0iamF2YXNjcmlwdCIgc3JjPSIuLi9yZXNvdXJjZXMvMTA2MDA2MC5qcyI+PC9zY3JpcHQ+DQo8c2NyaXB0IHR5cGU9InRleHQvamF2YXNjcmlwdCIgbGFuZ3VhZ2U9ImphdmFzY3JpcHQiIHNyYz0iLi4vcmVzb3VyY2VzLzY5NTkzODAuanMiPjwvc2NyaXB0Pg0KPHNjcmlwdCB0eXBlPSJ0ZXh0L2phdmFzY3JpcHQiIHNyYz0iLi4vcmVzb3VyY2VzLzEwNjI1MTQuanMiPjwvc2NyaXB0PjwhLS0ganF1ZXJ5LnNjcm9sbFRvIC0tPg0KPGxpbmsgaHJlZj0iLi4vcmVzb3VyY2VzLzY5NTkxNTguY3NzIiByZWw9InN0eWxlc2hlZXQiIG1lZGlhPSJwcmludCIgdHlwZT0idGV4dC9jc3MiPg0KPHN0eWxlPg0KI2NvbnRhaW5lck9mU3R1ZmZ7DQoJd2lkdGg6ODYwcHg7CQ0KfQ0KI2NvbnRhaW5lck9mU3R1ZmYgYXsNCgl0ZXh0LXNoYWRvdzowIDFweCAwICNmZmZmZmY7IA0KfQ0KLnJlZ3VsYXJMaW5rIGEgew0KCXRleHQtZGVjb3JhdGlvbjpub25lOw0KCWNvbG9yOiMzMzY2Y2M7DQp9DQoucmVndWxhckxpbmsgYTpmb2N1cywgYTpob3ZlciB7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTsNCgljb2xvcjojMDI5QUZEOw0KfQ0KaDJ7DQoJY29sb3I6IzgxYWE1ZTsNCn0NCi5sYXJnZXsNCgljb2xvcjojNTg4N0IwOw0KCWZvbnQtd2VpZ2h0OmJvbGQ7DQoJZm9udC1zaXplOjE2cHg7DQp9DQoubGFyZ2VGaW5hbCB7DQogICAgY29sb3I6IzU4ODdCMDsNCiAgICBmb250LXNpemU6MTdweDsNCiAgICBmb250LXdlaWdodDpib2xkOw0KICAgIHBhZGRpbmc6MjBweDsNCn0NCmgzew0KCWNvbG9yOiNENDg3NDQ7CQ0KfQ0KcCxvbCBsaSxkaXZ7DQoJY29sb3I6IzRkNGU2NzsNCn0NCi5jb3Vyc2VMaXN0ew0KCXBvc2l0aW9uOnJlbGF0aXZlOw0KCXRvcDowOw0KCWxlZnQ6MDsNCgl3aWR0aDo1MDBweDsNCglib3JkZXI6MXB4IHNvbGlkICM1Zjg3Y2I7Ow0KCWZvbnQtc2l6ZToxOHB4Ow0KCWZvbnQtd2VpZ2h0OmJvbGQ7DQoJcGFkZGluZzoxMHB4IDQwcHggMCAxMHB4Ow0KCWJhY2tncm91bmQ6I0Q5RTNFRjsNCglsaW5lLWhlaWdodDoyZW07DQoJbWFyZ2luLWxlZnQ6MzBweDsNCn0NCi5jb3Vyc2VMaXN0IGRpdnsNCglmb250LXNpemU6MTRweDsNCglsaW5lLWhlaWdodDoxLjJlbTsNCglmb250LXdlaWdodDpub3JtYWw7DQoJcGFkZGluZzo2cHggNDBweCA2cHggMTJweDsNCgltYXJnaW46MCAtNDBweCAwIC0xMHB4Ow0KCWJhY2tncm91bmQ6I0Y2RjZGNjsgDQoJY29sb3I6IzY2OTsNCglib3JkZXItYm90dG9tOjFweCBzb2xpZCAjZmZmOw0KCWJvcmRlci10b3A6MXB4IHNvbGlkIHRyYW5zcGFyZW50Ow0KfQ0KLmNvdXJzZUxpc3QgZGl2OmhvdmVyew0KCWJhY2tncm91bmQ6I0VGRUZFRjsNCgljb2xvcjojMzM5Ow0KfQ0KLnRpdGxlVGFibGV7DQoJY29sb3I6ICM0YzdiYjE7DQp9DQpkaXYuZ3JlZW5DaGVja3sNCgliYWNrZ3JvdW5kOnVybCguLi9yZXNvdXJjZXMvNjg3MjcyMS5wbmcpIG5vLXJlcGVhdCByaWdodCBjZW50ZXIgI2U0ZTNlMzsJDQoJY29sb3I6IzAzOTsNCglib3JkZXItYm90dG9tOjFweCBzb2xpZCAjZmZmOw0KCWJvcmRlci10b3A6MXB4IHNvbGlkIHRyYW5zcGFyZW50Ow0KfQ0KZGl2LmdyZWVuQ2hlY2s6aG92ZXJ7DQoJYmFja2dyb3VuZDp1cmwoLi4vcmVzb3VyY2VzLzY4NzI3MjEucG5nKSBuby1yZXBlYXQgcmlnaHQgY2VudGVyICNFRkVGRUY7CQ0KCWNvbG9yOiMwMzk7DQp9DQouZlIsZGl2Lmxpc3RIZWFkZXIgZlJ7DQoJZmxvYXQ6cmlnaHQ7CQ0KfQ0KI2NIb2xkZXJ7DQoJYm9yZGVyOjNweCBzb2xpZCAjNGQ0ZTY3Ow0KCWZvbnQtc2l6ZToxM3B4Ow0KCWNvbG9yOiM0ZDRlNjc7DQoJZm9udC13ZWlnaHQ6bm9ybWFsOw0KCXBhZGRpbmc6MTBweDsNCglsaW5lLWhlaWdodDoxLjRlbTsNCglwb3NpdGlvbjpyZWxhdGl2ZTsNCglsZWZ0Oi0yMDAwcHg7CQ0KfQ0KI2NIb2xkZXIgZGl2ew0KCW1hcmdpbjoycHggNDBweCAycHggMjBweDsNCn0NCg0KLmZvcm1XcmFwew0KCWJhY2tncm91bmQ6I2VkZjBmMjsJDQoJcGFkZGluZzogMTBweCAwIDIwcHg7DQoJYm9yZGVyOjFweCBzb2xpZCAjNTg1ZDYwOw0KfQ0KLmZMYWJlbHsNCgl3aWR0aDoxNzVweDsNCglmb250LXNpemU6MC44ZW07DQoJdGV4dC1hbGlnbjpyaWdodDsNCglkaXNwbGF5OmlubGluZS1ibG9jazsNCglwYWRkaW5nLXJpZ2h0OjVweDsNCn0NCi5mSW5wdXR7DQoJbWFyZ2luLXRvcDoxMHB4Ow0KfQ0KLkFubnVhbENvbXB7DQoJY29sb3I6IzgyQTA2NzsNCiAgICBmb250LXNpemU6MTJweDsNCglwb3NpdGlvbjpyZWxhdGl2ZTsNCgl0b3A6NTNweDsJDQp9DQoubENvbHsNCgltYXJnaW4tcmlnaHQ6MjBweDsNCgl3aWR0aDo1MDBweDsNCglmbG9hdDpsZWZ0Ow0KfQ0KLnJDb2x7DQogICAgYm90dG9tOjQycHg7DQogICAgbWFyZ2luLWxlZnQ6NTUwcHg7DQogICAgcG9zaXRpb246cmVsYXRpdmU7DQogICAgd2lkdGg6MjQwcHg7DQp9DQouckNvbEJ1dHRvbnsNCiAgICBtYXJnaW4tbGVmdDo1NTBweDsNCiAgICB3aWR0aDoyNDBweDsNCn0NCi5yZXF7DQoJY29sb3I6cmVkOw0KCWZvbnQtc2l6ZTowLjhlbTsNCgltYXJnaW4tbGVmdDo2cHg7DQoJZGlzcGxheTpub25lOw0KfQ0KI2NlQ29udGFjdHsNCglwb3NpdGlvbjphYnNvbHV0ZTsNCgl0b3A6LTYwcHg7DQoJbGVmdDo2MjNweDsNCn0NCg0KI3BDb250YWluZXJ7DQoJd2lkdGg6NzYwcHg7DQoJYmFja2dyb3VuZC1jb2xvcjojZmZmOw0KfQ0KLm5hdkJ1dHRvbnsNCiAgICBiYWNrZ3JvdW5kOm5vbmUgcmVwZWF0IHNjcm9sbCAwIDAgI0VDRjFFODsNCiAgICBib3JkZXI6MnB4IHNvbGlkICM4MUFBNUU7DQogICAgY29sb3I6IzgxQUE1RSAhaW1wb3J0YW50Ow0KICAgIGRpc3BsYXk6aW5saW5lLWJsb2NrOw0KICAgIGZvbnQtd2VpZ2h0OmJvbGQ7DQogICAgcGFkZGluZzo0cHg7DQoJdGV4dC1kZWNvcmF0aW9uOm5vbmU7CQ0KICAgIHRleHQtYWxpZ246Y2VudGVyOw0KICAgIHdpZHRoOjEzMHB4Ow0KfQ0KLm5hdkJ1dHRvbjpob3ZlcnsNCgliYWNrZ3JvdW5kOiNlOGVlZjE7DQoJYm9yZGVyOjJweCBzb2xpZCAjNjY4ZGEzOw0KCXRleHQtZGVjb3JhdGlvbjpub25lOw0KICAgIGNvbG9yOiM2NjhkYTMgIWltcG9ydGFudDsJDQp9DQojZ290b1N0ZXAyew0KCXBvc2l0aW9uOnJlbGF0aXZlOw0KfQ0KdGFibGUuZ3JpZHRhYmxlIHsNCglib3JkZXItd2lkdGg6IDFweDsNCglib3JkZXItY29sb3I6ICM2NjY2NjY7DQoJYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsNCn0NCnRhYmxlLmdyaWR0YWJsZSB0aCB7DQoJYm9yZGVyLXdpZHRoOiAxcHg7DQoJcGFkZGluZzogNHB4Ow0KCWJvcmRlci1zdHlsZTogc29saWQ7DQoJYm9yZGVyLWNvbG9yOiAjNjY2NjY2Ow0KCWJhY2tncm91bmQtY29sb3I6ICNkZWRlZGU7DQp9DQp0YWJsZS5ncmlkdGFibGUgdGQgew0KCWJvcmRlci13aWR0aDogMXB4Ow0KCXBhZGRpbmc6IDRweDsNCglib3JkZXItc3R5bGU6IHNvbGlkOw0KCWJvcmRlci1jb2xvcjogIzY2NjY2NjsNCgliYWNrZ3JvdW5kLWNvbG9yOiAjZmZmZmZmOw0KfQ0KPC9zdHlsZT4NCg0KDQoNCjxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0Ij4NCmZ1bmN0aW9uIFByaW50RWxlbShlbGVtKXtQb3B1cCgkKGVsZW0pLmh0bWwoKSk7fQ0KDQpmdW5jdGlvbiBQb3B1cChkYXRhKXsNCiAgICAgICAgdmFyIG15d2luZG93ID0gd2luZG93Lm9wZW4oJycsICdmaXJtQ0VwcmludCcsICdoZWlnaHQ9OTAwLHdpZHRoPTgwMCcpOw0KICAgICAgICBteXdpbmRvdy5kb2N1bWVudC53cml0ZSgnPGh0bWw+PGhlYWQ+PHRpdGxlPkZpcm0gRWxlbWVudCBDRTwvdGl0bGU+Jyk7DQogICAgICAgIG15d2luZG93LmRvY3VtZW50LndyaXRlKCc8bGluayByZWw9InN0eWxlc2hlZXQiIGhyZWY9Ii4uL3Jlc291cmNlcy82OTU5MTU4LmNzcyIgdHlwZT0idGV4dC9jc3MiIC8+Jyk7DQogICAgICAgIG15d2luZG93LmRvY3VtZW50LndyaXRlKCI8c3R5bGU+XG4iKTsNCgkJDQoNCiAgICAgICAgbXl3aW5kb3cuZG9jdW1lbnQud3JpdGUoIiNjSG9sZGVye2JvcmRlcjowcHggc29saWQgI2ZmZiAhaW1wb3J0YW50O31cbiIpOw0KICAgICAgICBteXdpbmRvdy5kb2N1bWVudC53cml0ZSgiPC9zdHlsZT5cbiIpOw0KICAgICAgICBteXdpbmRvdy5kb2N1bWVudC53cml0ZSgnPC9oZWFkPjxib2R5ID4nKTsNCiAgICAgICAgbXl3aW5kb3cuZG9jdW1lbnQud3JpdGUoZGF0YSk7DQogICAgICAgIG15d2luZG93LmRvY3VtZW50LndyaXRlKCc8L2JvZHk+PC9odG1sPicpOw0KICAgICAgICBteXdpbmRvdy5kb2N1bWVudC5jbG9zZSgpOw0KICAgICAgICBteXdpbmRvdy5wcmludCgpOw0KICAgICAgICByZXR1cm4gdHJ1ZTsNCn0NCg0KZnVuY3Rpb24gdG9Qcm9wZXJDYXNlKHMpew0KCXJldHVybiBzLnRvTG93ZXJDYXNlKCkucmVwbGFjZSggL1xiKChtKShhP2MpKT8oXHcpL2csZnVuY3Rpb24oJDEsJDIsJDMsJDQsJDUpew0KCQlpZigkMil7DQoJCQkgcmV0dXJuICQzLnRvVXBwZXJDYXNlKCkrJDQrJDUudG9VcHBlckNhc2UoKTsNCgkJfQ0KCQlyZXR1cm4gJDEudG9VcHBlckNhc2UoKTsgDQoJfSk7DQp9DQoNCmpRdWVyeS52YWxpZGF0b3IuYWRkTWV0aG9kKCJwaG9uZVVTIiwgZnVuY3Rpb24ocGhvbmVfbnVtYmVyLCBlbGVtZW50KXsNCiAgICBwaG9uZV9udW1iZXI9cGhvbmVfbnVtYmVyLnJlcGxhY2UoL1xzKy9nLCAiIik7IA0KCXJldHVybiB0aGlzLm9wdGlvbmFsKGVsZW1lbnQpfHxwaG9uZV9udW1iZXIubGVuZ3RoPjkmJnBob25lX251bWJlci5tYXRjaCgvXigxLT8pPyhcKFsyLTldXGR7Mn1cKXxbMi05XVxkezJ9KS0/WzItOV1cZHsyfS0/XGR7NH0kLyk7DQp9LCJQbGVhc2Ugc3BlY2lmeSBhIHZhbGlkIHBob25lIG51bWJlciIpOw0KDQoNCiQoZG9jdW1lbnQpLnJlYWR5KGZ1bmN0aW9uKCl7DQoJdmFyIGNvdXJzZUNvdW50LGNvdXJzZUxpc3QsY3JlZGl0Q291bnQscGF5Q291cnNlQ291bnQ7DQoJJCgiLmNvdXJzZUxpc3QgZGl2IikuYXR0cigidGl0bGUiLCJjbGljayB0byBhZGQvcmVtb3ZlIGNvdXJzZSIpLmNsaWNrKGZ1bmN0aW9uKCl7DQoJCSQodGhpcykudG9nZ2xlQ2xhc3MoImdyZWVuQ2hlY2siKTsNCgkJY291cnNlQ291bnQ9MDtwYXlDb3Vyc2VDb3VudD0wO2NyZWRpdENvdW50PTA7DQoJCXZhciB0ZW1wQ3JlZGl0PTA7DQoJCXNlbGVjdGVkTGlzdD0iPGRpdj48c3BhbiBzdHlsZT0nZmxvYXQ6cmlnaHQ7Y29sb3I6Izg0MmIzNzt0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO2ZvbnQtd2VpZ2h0OmJvbGQ7cG9zaXRpb246cmVsYXRpdmU7bGVmdDotNDJweDsnPkNyZWRpdHM6PC9zcGFuPjxzcGFuIHN0eWxlPSdjb2xvcjojODQyYjM3O3RleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7Zm9udC13ZWlnaHQ6Ym9sZDtwb3NpdGlvbjpyZWxhdGl2ZTtsZWZ0OjQycHg7Jz5TZWxlY3RlZCBDb3Vyc2VzOjwvc3Bhbj48YnIgLz48YnIgLz4iDQoJCSQoImRpdi5ncmVlbkNoZWNrIikuZWFjaChmdW5jdGlvbigpew0KCQkJY291cnNlQ291bnQrKzsNCgkJCXRlbXBDcmVkaXQ9MDsNCgkJCXRlbXBDcmVkaXQ9cGFyc2VGbG9hdCgkKHRoaXMpLmZpbmQoInNwYW4iKS5odG1sKCksMik7DQoJCQlzZWxlY3RlZExpc3QrPSI8ZGl2IHN0eWxlPSdib3JkZXItdG9wOiAxcHggZG90dGVkICM3MjczOTg7bWFyZ2luOiAycHggNDBweDtwYWRkaW5nOiAzcHggMTJweCAwOyc+PHNwYW4gc3R5bGU9J2Zsb2F0OnJpZ2h0Oyc+Iit0ZW1wQ3JlZGl0LnRvRml4ZWQoMSkrIjwvc3Bhbj4iOw0KCQkJc2VsZWN0ZWRMaXN0Kz0kKHRoaXMpLmNvbnRlbnRzKCkuZmlsdGVyKGZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMubm9kZVR5cGUgPT0gMzt9KS50ZXh0KCk7DQoJCQlzZWxlY3RlZExpc3QrPSI8L2Rpdj4iOw0KCQkJY3JlZGl0Q291bnQrPXRlbXBDcmVkaXQ7DQoJCQlpZih0ZW1wQ3JlZGl0PjApe3BheUNvdXJzZUNvdW50Kys7fQkJCQ0KCQl9KQ0KCQlpZihjb3Vyc2VDb3VudD4wKXskKCIjY291cnNlVGFicyIpLnRhYnMoImVuYWJsZSIsMyk7fQ0KCQlzZWxlY3RlZExpc3QrPSI8ZGl2IHN0eWxlPSdtYXJnaW46MzBweCA1MHB4IDAgNTBweDtib3JkZXI6MDsnPjxwPlRvIGhhdmUgdXMgYXBwbHkgZm9yIENGUCBjcmVkaXRzIG9uIHlvdXIgYmVoYWxmLCBwbGVhc2UgcHJpbnQgdGhpcyBkb2N1bWVudCBhbG9uZyB3aXRoIHRoZSBDb3Vyc2UgQ29tcGxldGlvbiBDZXJ0aWZpY2F0ZSBmb3IgZWFjaCBvZiB0aGUgYWJvdmUtbGlzdGVkIGNvdXJzZShzKSBmb3Igd2hpY2ggeW91IGFyZSBhcHBseWluZyBmb3IgY3JlZGl0KHMpLiBNYWlsIHRoaXMgZG9jdW1lbnQgYW5kIHRoZSBDb3Vyc2UgQ29tcGxldGlvbiBDZXJ0aWZpY2F0ZShzKSB3aXRoIGEgY2hlY2sgbWFkZSBwYXlhYmxlIHRvOjwvcD48dGFibGUgYm9yZGVyPScwJyB3aWR0aD0nMTAwJScgY2VsbHNwYWNpbmc9JzAnIGNlbGxwYWRkaW5nPScwJz48dHI+PHRkIGFsaWduPSdjZW50ZXInPjx0YWJsZSBib3JkZXI9JzAnIGNlbGxzcGFjaW5nPScwJyBjZWxscGFkZGluZz0nMCc+PHRyPjx0ZCBhbGlnbj0nbGVmdCc+Q2V0ZXJhIEZpbmFuY2lhbCBHcm91cDxiciAvPkF0dG46IENFIERlcGFydG1lbnQ8YnIgLz5DdW1iZXJsYW5kIENlbnRlciBJSTxiciAvPjMxMDAgQ3VtYmVybGFuZCBCbHZkLiBTRTxiciAvPlN1aXRlIDEwNDA8YnIgLz5BdGxhbnRhLCBHQSAzMDMzOTwvdGQ+PC90cj48L3RhYmxlPjwvdGQ+PC90cj48L3RhYmxlPjxwPllvdXIgQ0ZQIGNyZWRpdCBhcHBsaWNhdGlvbiB3aWxsIGJlIGZpbGVkIGVsZWN0cm9uaWNhbGx5IHdpdGggdGhlIEJvYXJkIG9uIHRoZSAxNXRoIG9yIHRoZSBsYXN0IGRheSBvZiB0aGUgbW9udGgsIHVwb24gcmVjZWlwdCBvZiB5b3VyIGNoZWNrLiBUaGUgQ0ZQIEJvYXJkIHdpbGwgbm90aWZ5IHlvdSBkaXJlY3RseSB3aGVuIHRoZXkgYXBwbHkgdGhlIENldGVyYSBjb3Vyc2UgY3JlZGl0cyB0byB5b3VyIGFjY291bnQuPC9wPjwvZGl2PiI7DQoJCSQoIiNjSG9sZGVyIikuY3NzKCJsZWZ0IiwiMCIpLmh0bWwoc2VsZWN0ZWRMaXN0KS5wcmVwZW5kKCI8aW1nIHNyYz0iK2xvZ28rIiBib3JkZXI9JzAnIC8+PGJyIC8+PGJyIC8+PHNwYW4gc3R5bGU9J2NvbG9yOiM1ODg3QjA7Zm9udC1zaXplOjE3cHg7Zm9udC13ZWlnaHQ6Ym9sZDsnPkNGUCBDcmVkaXQgQXBwbGljYXRpb24gRm9ybTwvc3Bhbj48YnIgLz48YnIgLz48ZGl2IHN0eWxlPSdtYXJnaW4tbGVmdDozMHB4Oyc+PHRhYmxlIHdpZHRoPSc5MCUnIGJvcmRlcj0nMCcgY2VsbHNwYWNpbmc9JzAnIGNlbGxwYWRkaW5nPScwJz48dHI+PHRkPjx0YWJsZSBib3JkZXI9JzAnIGNlbGxzcGFjaW5nPScwJyBjZWxscGFkZGluZz0nMCc+PHRyPjx0ZD4iK3RvUHJvcGVyQ2FzZSgkKCIjbmFtZSIpLnZhbCgpKSsiPGJyIC8+Iit0b1Byb3BlckNhc2UoJCgiI3N0cmVldCIpLnZhbCgpKSsiPGJyIC8+Iit0b1Byb3BlckNhc2UoJCgiI2NpdHkiKS52YWwoKSkrIiwmbmJzcDsiKyQoIiNzdGF0ZSIpLnZhbCgpLnRvVXBwZXJDYXNlKCkrIiZuYnNwOyZuYnNwOyIrJCgiI3ppcCIpLnZhbCgpKyI8YnIgLz4iKyQoIiNwaG9uZSIpLnZhbCgpKyI8YnIgLz4iKyQoIiNlbWFpbCIpLnZhbCgpKyI8YnIgLz5YWFgtWFgtIiskKCIjbGFzdDQiKS52YWwoKSsiPC90ZD48L3RyPjwvdGFibGU+PC90ZD48dGQgYWxpZ249J3JpZ2h0Jz48dGFibGUgYm9yZGVyPScwJyBjZWxsc3BhY2luZz0nMCcgY2VsbHBhZGRpbmc9JzAnPjx0cj48dGQgYWxpZ249J3JpZ2h0Jz5Ub3RhbCBDb3Vyc2VzOjwvdGQ+PHRkPiZuYnNwOzxiPjxzcGFuIHN0eWxlPSdjb2xvcjojODQyYjM3Oyc+Iitjb3Vyc2VDb3VudCsiPC9zcGFuPjwvdGQ+PC90cj48dHI+PHRkIGFsaWduPSdyaWdodCc+VG90YWwgQ3JlZGl0czo8L3RkPjx0ZD4mbmJzcDs8Yj48c3BhbiBzdHlsZT0nY29sb3I6Izg0MmIzNzsnPiIrY3JlZGl0Q291bnQudG9GaXhlZCgxKSsiPC9zcGFuPjwvYj48L3RkPjwvdHI+PHRyPjx0ZCBhbGlnbj0ncmlnaHQnPlRvdGFsIENvc3Q6PC90ZD48dGQ+Jm5ic3A7PGI+PHNwYW4gc3R5bGU9J2NvbG9yOiM4NDJiMzc7Jz4kIisoMTAuMCpwYXlDb3Vyc2VDb3VudCkrIjwvc3Bhbj4uPHNwYW4gc3R5bGU9J2ZvbnQtc2l6ZTowLjdlbTtwb3NpdGlvbjpyZWxhdGl2ZTt0b3A6LTNweDtjb2xvcjojODQyYjM3Oyc+MDA8L3NwYW4+PC9iPjwvdGQ+PC90cj48L3RhYmxlPjwvdGQ+PC90cj48L3RhYmxlPjwvZGl2PjxiciAvPjxiciBzdHlsZT0nY2xlYXI6Ym90aDsnIC8+Jm5ic3A7Iik7DQoJfSk7DQoJDQoJJCgiI2Fib3V0WW91IikudmFsaWRhdGUoew0KCQlydWxlczp7DQoJCQluYW1lOntyZXF1aXJlZDp0cnVlfSwNCgkJCXN0cmVldDp7cmVxdWlyZWQ6dHJ1ZX0sDQoJCQljaXR5OntyZXF1aXJlZDp0cnVlfSwNCgkJCXN0YXRlOntyZXF1aXJlZDp0cnVlfSwNCgkJCXppcDp7cmVxdWlyZWQ6dHJ1ZX0sDQoJCQlwaG9uZTp7cmVxdWlyZWQ6dHJ1ZSxwaG9uZVVTOnRydWV9LA0KCQkJZW1haWw6e3JlcXVpcmVkOnRydWUsZW1haWw6dHJ1ZX0sDQoJCQlsYXN0NDp7cmVxdWlyZWQ6dHJ1ZSxkaWdpdHM6dHJ1ZSxtaW5sZW5ndGg6NCxtYXhsZW5ndGg6NH0NCiAgICAJfSwNCgkJbWVzc2FnZXM6ew0KCQkJbmFtZToiPHNwYW4gY2xhc3M9J3JlcSc+cmVxdWlyZWQ8L3NwYW4+IiwNCgkJCXN0cmVldDoiPHNwYW4gY2xhc3M9J3JlcSc+cmVxdWlyZWQ8L3NwYW4+IiwNCgkJCWNpdHk6IjxzcGFuIGNsYXNzPSdyZXEnPnJlcXVpcmVkPC9zcGFuPiIsDQoJCQlzdGF0ZToiPHNwYW4gY2xhc3M9J3JlcSc+cmVxdWlyZWQ8L3NwYW4+IiwNCgkJCXppcDoiPHNwYW4gY2xhc3M9J3JlcSc+cmVxdWlyZWQ8L3NwYW4+IiwNCgkJCXBob25lOiI8c3BhbiBjbGFzcz0ncmVxJz5BIHZhbGlkIHBob25lIG51bWJlciBpcyByZXF1aXJlZDwvc3Bhbj4iLA0KCQkJZW1haWw6IjxzcGFuIGNsYXNzPSdyZXEnPnJlcXVpcmVkPC9zcGFuPiIsDQoJCQlsYXN0NDoiPHNwYW4gY2xhc3M9J3JlcSc+cmVxdWlyZWQgLSAobGFzdCA0IGRpZ2l0cyBvbmx5KTwvc3Bhbj4iDQogICAgCX0NCgl9KTsNCgkkKCIjcENvbnRhaW5lciIpLmhpZGUoKTsNCiAgICAkKCIjYkJ1dHRvbiIpLmhpZGUoKTsNCgkkKCIjdGFicyIpLnRhYnMoKTsNCgkkKCIjY291cnNlVGFicyIpLnRhYnMoew0KICAgIAlzZWxlY3Q6ZnVuY3Rpb24oZXZlbnQsIHVpKXsNCiAgICAgICAgCXZhciBpc1ZhbGlkID0kKCIjYWJvdXRZb3UiKS52YWxpZGF0ZSgpLmZvcm0oKTsNCgkJCWlmKCFpc1ZhbGlkKXsNCgkJCQkkKHdpbmRvdykuc2Nyb2xsVG8oe3RvcDonNjMwcHgnLGxlZnQ6JzBweCd9LDgwMCk7DQoJCQl9DQogICAgICAgCSAJcmV0dXJuIGlzVmFsaWQ7DQogICAgCX0NCgl9KTsNCgkkKCIjY291cnNlVGFicyIpLnRhYnMoIm9wdGlvbiIsImRpc2FibGVkIixbMSwyLDMsNCw1LDYsN10pOw0KCSQoJyNnb3RvQWdlbmRhJykuY2xpY2soZnVuY3Rpb24oKXskKCIjdGFicyIpLnRhYnMoJ3NlbGVjdCcsMSk7fSk7DQoJJCgnI2dvdG9TcGVha2VycycpLmNsaWNrKGZ1bmN0aW9uKCl7JCgiI3RhYnMiKS50YWJzKCdzZWxlY3QnLDIpO30pOw0KCSQoJyNnb3RvRXZlbnRzJykuY2xpY2soZnVuY3Rpb24oKXskKCIjdGFicyIpLnRhYnMoJ3NlbGVjdCcsMyk7fSk7DQoJJCgnI2dvdG9FeGhpYml0b3JzJykuY2xpY2soZnVuY3Rpb24oKXskKCIjdGFicyIpLnRhYnMoJ3NlbGVjdCcsNCk7fSk7DQoJJCgnI2dvdG9Ib3RlbCcpLmNsaWNrKGZ1bmN0aW9uKCl7JCgiI3RhYnMiKS50YWJzKCdzZWxlY3QnLDUpO30pOw0KCSQoJyNnb3RvRmVlcycpLmNsaWNrKGZ1bmN0aW9uKCl7JCgiI3RhYnMiKS50YWJzKCdzZWxlY3QnLDYpO30pOw0KCSQoJyNnb3RvRkFRcycpLmNsaWNrKGZ1bmN0aW9uKCl7JCgiI3RhYnMiKS50YWJzKCdzZWxlY3QnLDcpO30pOw0KCSQoJyNnb3RvRmVlczInKS5jbGljayhmdW5jdGlvbigpeyQoIiN0YWJzIikudGFicygnc2VsZWN0Jyw2KTt9KTsNCgkkKCcjZ290b0ZlZXMzJykuY2xpY2soZnVuY3Rpb24oKXskKCIjdGFicyIpLnRhYnMoJ3NlbGVjdCcsNik7fSk7CQ0KCSQoIjppbnB1dCIpLmJsdXIoZnVuY3Rpb24oKXsNCgkJaWYodGhpcy5pZCE9InN0YXRlIil7DQoJCQlpZih0aGlzLmlkIT0iZW1haWwiKXsNCgkJCQl0aGlzLnZhbHVlPXRvUHJvcGVyQ2FzZSh0aGlzLnZhbHVlKTsNCgkJCX0NCgkJfWVsc2V7DQoJCQl0aGlzLnZhbHVlPXRoaXMudmFsdWUudG9VcHBlckNhc2UoKTsNCgkJfQ0KCX0pOw0KDQoJJCgnI2dvdG9TdGVwMicpLmNsaWNrKGZ1bmN0aW9uKCl7DQoJCXZhciBzaG93SXQ9JCgiI2Fib3V0WW91IikudmFsaWRhdGUoKS5mb3JtKCk7DQoJCWlmKHNob3dJdCl7DQoJCQkkKCIjY291cnNlVGFicyIpLnRhYnMoImVuYWJsZSIsMSk7DQoJCQkkKCIjY291cnNlVGFicyIpLnRhYnMoImVuYWJsZSIsMik7DQoJCQkkKCIjY291cnNlVGFicyIpLnRhYnMoJ3NlbGVjdCcsMSk7DQoJCQkkKHdpbmRvdykuc2Nyb2xsVG8oe3RvcDonNjMwcHgnLGxlZnQ6JzBweCd9LDgwMCk7DQoNCgkJfWVsc2V7DQoJCQkkKCIjY291cnNlVGFicyIpLnRhYnMoIm9wdGlvbiIsImRpc2FibGVkIixbMSwyLDNdKTsNCgkJCSQoIi5yZXEiKS5zaG93KCk7DQoJCQkkKHdpbmRvdykuc2Nyb2xsVG8oe3RvcDonNjMwcHgnLGxlZnQ6JzBweCd9LDgwMCk7DQoJCX0NCgl9KTsNCg0KCSQoJyNnb3RvU3RlcDMnKS5jbGljayhmdW5jdGlvbigpew0KCQkkKCIjY291cnNlVGFicyIpLnRhYnMoJ3NlbGVjdCcsMik7DQoJCSQod2luZG93KS5zY3JvbGxUbyh7dG9wOic2MzBweCcsbGVmdDonMHB4J30sODAwKTsNCgl9KTsNCgkkKCcjZ290b1N0ZXA0JykuY2xpY2soZnVuY3Rpb24oKXsNCgkJdmFyIGNvdXJzZUNvdW50PTA7DQoJCSQoImRpdi5ncmVlbkNoZWNrIikuZWFjaChmdW5jdGlvbigpew0KCQkJY291cnNlQ291bnQrKzsNCgkJfSk7DQoJCWlmKGNvdXJzZUNvdW50PjApew0KCQkJJCgiI2NvdXJzZVRhYnMiKS50YWJzKCdzZWxlY3QnLDMpOw0KCQkJJCh3aW5kb3cpLnNjcm9sbFRvKHt0b3A6JzYzMHB4JyxsZWZ0OicwcHgnfSw4MDApOw0KCQkJcmV0dXJuIHRydWU7DQoJCX1lbHNlew0KCQkJYWxlcnQoIllvdSBtdXN0IHNlbGVjdCBhdCBsZWFzdCBvbmUgY291cnNlIHRvIGNvbnRpbnVlLiIpOw0KCQkJcmV0dXJuIGZhbHNlOw0KCQl9DQoJfSk7DQoNCgkkKCcjcEJ1dHRvbiwgI3BCdXR0b24yJykuY2xpY2soZnVuY3Rpb24oKXsNCgkJUHJpbnRFbGVtKCcjY0hvbGRlcicpOw0KICAgIAlyZXR1cm4gZmFsc2U7DQoJfSk7DQp9KTsNCjwvc2NyaXB0Pg0KPC9mb3JtPg0KPGRpdiBzdHlsZT0icGFkZGluZy1ib3R0b206MTBweCI+PGltZyBzcmM9Jy9Ccm9rZXJEZWFsZXJDZW50ZXIvcmVzb3VyY2VzLzI5NDM5NzcxLmpwZycgYm9yZGVyPSIwIj48L2Rpdj4NCjxkaXYgaWQ9ImNvbnRhaW5lck9mU3R1ZmYiIGNsYXNzPSJ1aS1jb3JuZXItYWxsIj4NCiAgICA8ZGl2IGlkPSJ0YWJzIj4NCgkJPHVsIGNsYXNzPSJkb05vdFByaW50Ij4NCgkJCTxsaT48YSBocmVmPSIjdGFicy0xIj5Kb2luIHVzIGluIE5ldyBPcmxlYW5zITwvYT48L2xpPg0KCQkJPGxpPjxhIGhyZWY9IiN0YWJzLTIiPkFnZW5kYTwvYT48L2xpPg0KCQkJPGxpPjxhIGhyZWY9IiN0YWJzLTMiPlNwZWFrZXJzPC9hPjwvbGk+DQoJCQk8bGk+PGEgaHJlZj0iI3RhYnMtNCI+RXZlbnRzPC9hPjwvbGk+DQoJCQk8bGk+PGEgaHJlZj0iI3RhYnMtNSI+RXhoaWJpdG9yczwvYT48L2xpPg0KCQkJPGxpPjxhIGhyZWY9IiN0YWJzLTYiPkhvdGVsIGFuZCBUcmF2ZWw8L2E+PC9saT4NCgkJCTxsaT48YSBocmVmPSIjdGFicy03Ij5GZWVzPC9hPjwvbGk+DQoJCQk8bGk+PGEgaHJlZj0iI3RhYnMtOCI+RkFRczwvYT48L2xpPg0KCQk8L3VsPg0KCQk8ZGl2IGlkPSJ0YWJzLTEiIGNsYXNzPSJkb05vdFByaW50Ij4NCgkJCTxoMj5Kb2luIHVzIGluIE5ldyBPcmxlYW5zITwvaDI+DQoJCQk8ZGl2IGNsYXNzPSJsQ29sIj4NCgkJCQk8cD5FWFBMT1JFIDIwMTMgd2lsbCBiZSBoZWxkIGF0IHRoZSBIeWF0dCBSZWdlbmN5IE5ldyBPcmxlYW5zIE1heSAyMS0yMyBhbmQgaXMgYW4gZXZlbnQgeW91IGRvbid0IHdhbnQgdG8gbWlzcyE8L3A+DQoJCQkJPHA+Q29tbWl0IHRvIGdyb3dpbmcgeW91ciBmaW5hbmNpYWwgc2VydmljZXMgcHJhY3RpY2Ugd2l0aCB0aGUgdmFsdWFibGUgaW5mb3JtYXRpb24geW91J2xsIGxlYXJuIGF0IEVYUExPUkUuPC9wPg0KICAgICAgICAgICAgICAgIDxwPkZvciB0aHJlZSBkYXlzLCBlbmpveSB0b3AtcmF0ZWQga2V5bm90ZSBzcGVha2VycywgZXllLW9wZW5pbmcgYnJlYWtvdXQgc2Vzc2lvbnMsIGZhbnRhc3RpYyBzcGVjaWFsIGV2ZW50cyBhbmQgZW5kbGVzcyBuZXR3b3JraW5nIG9wcG9ydHVuaXRpZXMgd2l0aCBvdXIgZXhoaWJpdG9ycyBhbmQgeW91ciBmZWxsb3cgQ2V0ZXJhIEZpbmFuY2lhbCBTcGVjaWFsaXN0cy48L3A+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9InJDb2wiIHN0eWxlPSJ0ZXh0LWFsaWduOmNlbnRlcjsiPg0KICAgICAgICAgICAgCTwhLS0NCiAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJsYXJnZSI+UGxhY2VIb2xkZXIgQ29sdW1uPC9kaXY+DQogICAgICAgICAgICAgICAgPGltZyBzcmM9Ii4uL3Jlc291cmNlcy82OTgyMDQ5LnBuZyIgYm9yZGVyPSIwIiAvPg0KCQkJCTxiciAvPjxiciAvPg0KICAgICAgICAgICAgICAgIC0tPg0KCQkJCTxhIGhyZWY9Imh0dHBzOi8vd3d3LnJlZ2lzeXMuY29tL0dFMTMvIiB0YXJnZXQ9Il9ibGFuayI+PGltZyBzcmM9Ii4uL3Jlc291cmNlcy8yOTUwMDcxMi5wbmciIGJvcmRlcj0iMCI+PC9hPjxicj48YnI+DQogICAgICAgICAgICAgICAgPGEgaHJlZj0iaHR0cHM6Ly9yZXN3ZWIucGFzc2tleS5jb20vUmVzd2ViLmRvP21vZGU9d2VsY29tZV9laV9uZXcmZXZlbnRJRD05NzA2MjkwIiB0YXJnZXQ9Il9ibGFuayI+PGltZyBzcmM9Ii4uL3Jlc291cmNlcy8yOTUwMjMzMy5wbmciIGJvcmRlcj0iMCI+PC9hPg0KCQkJPC9kaXY+DQoJCQk8YnIgc3R5bGU9ImNsZWFyOmJvdGg7Ij4mbmJzcDsNCgkJCTxicj4mbmJzcDsNCgkJPC9kaXY+DQoJCTxkaXYgaWQ9InRhYnMtMiI+DQoJCQk8aDI+QWdlbmRhPC9oMj4NCgkJCTxkaXYgY2xhc3M9ImxDb2wiPg0KCQkJPHA+QXQgRVhQTE9SRSBMYXMgVmVnYXMgMjAxMiwgd2UgaGFkIG92ZXIgNDAgc2Vzc2lvbnMgaW4gMyB0cmFja3Mgb24gNCBzdWJqZWN0cy4gVGhpcyB5ZWFyJ3MgYWdlbmRhIHdpbGwgZm9sbG93IHRoZSBzYW1lIGZvcm1hdCBhbmQgcHJvbWlzZXMgdG8gYmUgZXZlbiBtb3JlIGVuZ2FnaW5nIGFuZCBpbmZsdWVudGlhbCB0byB5b3VyIHByYWN0aWNlIHRoYW4gbGFzdCB5ZWFyLjwvcD4NCgkJCTxwPkpvaW4gdXMgZm9yIHNlc3Npb25zIHRoYXQgYXJlIHRhaWxvcmVkIHRvIHlvdXIgbGV2ZWwgb2Yga25vd2xlZGdlIGluIGRpZmZlcmVudCBhcmVhcyBvZiBmaW5hbmNpYWwgc2VydmljZXMuIENob29zZSB0byBhdHRlbmQgZm91bmRhdGlvbmFsLCBpbnRlcm1lZGlhdGUgb3IgYWR2YW5jZWQgY2xhc3NlcyBvbiBwcm9kdWN0cywgcHJhY3RpY2UgbWFuYWdlbWVudCwgdGVjaG5vbG9neSBhbmQgZWNvbm9taWMvcmVndWxhdG9yeSBzdWJqZWN0cy48L3A+DQoJCQk8cD5FWFBMT1JFIE5ldyBPcmxlYW5zIDIwMTMgd2lsbCBiZWdpbiBhdCA4OjAwIGEubS4gbG9jYWwgdGltZSBvbiBUdWVzZGF5LCBNYXkgMjEsIGFuZCB3aWxsIGVuZCBhdCAxMjowMCBwLm0uKiBsb2NhbCB0aW1lIG9uIFRodXJzZGF5LCBNYXkgMjMuPC9wPg0KCQkJPHA+VGhlIGxpc3Qgb2Ygc2Vzc2lvbnMgd2lsbCBiZSBhdmFpbGFibGUgaW4gdGhlIHVwY29taW5nIHdlZWtzLiBXZSB3aWxsIGFsZXJ0IHlvdSB2aWEgZW1haWwgd2hlbiBpdCBpcyBwb3N0ZWQuPC9wPg0KCQkJPGRpdiBjbGFzcz0idWktd2lkZ2V0Ij4NCgkJCQk8ZGl2IHN0eWxlPSJtYXJnaW4tdG9wOjIwcHg7cGFkZGluZzowcHQ7Zm9udC1zaXplOjAuN2VtOyIgY2xhc3M9InVpLXN0YXRlLWhpZ2hsaWdodCB1aS1jb3JuZXItYWxsIj4NCgkJCQkJPHA+PHNwYW4gc3R5bGU9ImZsb2F0OmxlZnQ7bWFyZ2luLXJpZ2h0OjAuM2VtO21hcmdpbi10b3A6LTNweDsiIGNsYXNzPSJ1aS1pY29uIHVpLWljb24tY29tbWVudCI+PC9zcGFuPlN1YmplY3QgdG8gY2hhbmdlPC9wPg0KCQkJCTwvZGl2Pg0KCQkJPC9kaXY+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9InJDb2wiIHN0eWxlPSJ0ZXh0LWFsaWduOmNlbnRlcjsiPg0KCQkJCTxhIGhyZWY9Imh0dHBzOi8vd3d3LnJlZ2lzeXMuY29tL0dFMTMvIiB0YXJnZXQ9Il9ibGFuayI+PGltZyBzcmM9Ii4uL3Jlc291cmNlcy8yOTUwMDcxMi5wbmciIGJvcmRlcj0iMCI+PC9hPjxicj48YnI+DQogICAgICAgICAgICAgICAgPGEgaHJlZj0iaHR0cHM6Ly9yZXN3ZWIucGFzc2tleS5jb20vUmVzd2ViLmRvP21vZGU9d2VsY29tZV9laV9uZXcmZXZlbnRJRD05NzA2MjkwIiB0YXJnZXQ9Il9ibGFuayI+PGltZyBzcmM9Ii4uL3Jlc291cmNlcy8yOTUwMjMzMy5wbmciIGJvcmRlcj0iMCI+PC9hPg0KCQkJPC9kaXY+DQoJCQk8YnIgc3R5bGU9ImNsZWFyOmJvdGg7Ij4mbmJzcDsNCgkJCTxicj4mbmJzcDsNCgkJPC9kaXY+DQoJCTxkaXYgaWQ9InRhYnMtMyI+DQoJCQk8aDI+U3BlYWtlcnM8L2gyPg0KCQkJPGRpdiBjbGFzcz0ibENvbCI+DQoJCQkJPHA+V2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhhdCBiYWNrIGJ5IHBvcHVsYXIgZGVtYW5kLCBBbmR5IEZyaWVkbWFuIGlzIGNvbmZpcm1lZCBhcyBhIGtleW5vdGUgc3BlYWtlciBmb3IgRVhQTE9SRSBOZXcgT3JsZWFucyAyMDEzLiBJZiB5b3UgbGlrZWQgQW5keSBsYXN0IHllYXIsIHlvdSB3aWxsIGxvdmUgaGltIHRoaXMgeWVhciBwb3N0IGVsZWN0aW9uITwvcD4NCgkJCQk8cD5Nb3JlIGluZm9ybWF0aW9uIG9uIG91ciBhZGRpdGlvbmFsIGtleW5vdGUgc3BlYWtlcnMgd2lsbCBiZSBtYWRlIGF2YWlsYWJsZSBpbiB0aGUgdXBjb21pbmcgd2Vla3MuIFdlIHdpbGwgYWxlcnQgeW91IGJ5IGVtYWlsIHdoZW4gaXQgaXMgcG9zdGVkLjwvcD4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ickNvbCIgc3R5bGU9InRleHQtYWxpZ246Y2VudGVyOyI+DQoJCQkJPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVnaXN5cy5jb20vR0UxMy8iIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iLi4vcmVzb3VyY2VzLzI5NTAwNzEyLnBuZyIgYm9yZGVyPSIwIj48L2E+PGJyPjxicj4NCiAgICAgICAgICAgICAgICA8YSBocmVmPSJodHRwczovL3Jlc3dlYi5wYXNza2V5LmNvbS9SZXN3ZWIuZG8/bW9kZT13ZWxjb21lX2VpX25ldyZldmVudElEPTk3MDYyOTAiIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iLi4vcmVzb3VyY2VzLzI5NTAyMzMzLnBuZyIgYm9yZGVyPSIwIj48L2E+DQoJCQk8L2Rpdj4NCgkJCTxiciBzdHlsZT0iY2xlYXI6Ym90aDsiPiZuYnNwOw0KCQkJPGJyPiZuYnNwOw0KCQk8L2Rpdj4NCgkJPGRpdiBpZD0idGFicy00Ij4NCgkJCTxoMj5FdmVudHM8L2gyPg0KCQkJPGRpdiBjbGFzcz0ibENvbCI+DQoJCQkJPHA+VGhpcyB5ZWFyJ3Mgc3BlY2lhbCBldmVudHMgd2lsbCBiZSB0aGVtZWQgaW4gdHJ1ZSBCaWcgRWFzeSBzdHlsZeKApmxpdGVyYWxseSEgV2Ugd2lsbCBhbGVydCB5b3UgdmlhIGVtYWlsIHdoZW4gbW9yZSBpbmZvcm1hdGlvbiBpcyBwb3N0ZWQuPC9wPg0KCQkJPC9kaXY+DQoJCQk8ZGl2IGNsYXNzPSJyQ29sIiBzdHlsZT0idGV4dC1hbGlnbjpjZW50ZXI7Ij4NCgkJCQk8YSBocmVmPSJodHRwczovL3d3dy5yZWdpc3lzLmNvbS9HRTEzLyIgdGFyZ2V0PSJfYmxhbmsiPjxpbWcgc3JjPSIuLi9yZXNvdXJjZXMvMjk1MDA3MTIucG5nIiBib3JkZXI9IjAiPjwvYT48YnI+PGJyPg0KICAgICAgICAgICAgICAgIDxhIGhyZWY9Imh0dHBzOi8vcmVzd2ViLnBhc3NrZXkuY29tL1Jlc3dlYi5kbz9tb2RlPXdlbGNvbWVfZWlfbmV3JmV2ZW50SUQ9OTcwNjI5MCIgdGFyZ2V0PSJfYmxhbmsiPjxpbWcgc3JjPSIuLi9yZXNvdXJjZXMvMjk1MDIzMzMucG5nIiBib3JkZXI9IjAiPjwvYT4NCgkJCTwvZGl2Pg0KCQkJPGJyIHN0eWxlPSJjbGVhcjpib3RoOyI+Jm5ic3A7DQoJCQk8YnI+Jm5ic3A7DQoJCTwvZGl2Pg0KCQk8ZGl2IGlkPSJ0YWJzLTUiPg0KCQkJPGgyPkV4aGliaXRvcnM8L2gyPg0KCQkJPGRpdiBjbGFzcz0ibENvbCI+DQoJCQkJPHA+VGhlIGV4aGliaXRvcnMgYXQgRVhQTE9SRSBOZXcgT3JsZWFucyAyMDEzIGhhdmUgYmVlbiBzZWxlY3RlZCBieSB5b3VyIGhvbWUgb2ZmaWNlIHN0YWZmIGFzIHRoZSBwYXJ0bmVycyB3aG8gd2lsbCBicmluZyB0aGUgbW9zdCB2YWx1ZSB0byB5b3VyIGZpbmFuY2lhbCBzZXJ2aWNlcyBwcmFjdGljZS48L3A+DQoJCQkJPHA+VGhlIGV4aGliaXRvciBsaXN0IHdpbGwgYmUgYXZhaWxhYmxlIHNob3J0bHkuIFdlIHdpbGwgYWxlcnQgeW91IHZpYSBlbWFpbCB3aGVuIGl0IGlzIHBvc3RlZC48L3A+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9InJDb2wiIHN0eWxlPSJ0ZXh0LWFsaWduOmNlbnRlcjsiPg0KCQkJCTxhIGhyZWY9Imh0dHBzOi8vd3d3LnJlZ2lzeXMuY29tL0dFMTMvIiB0YXJnZXQ9Il9ibGFuayI+PGltZyBzcmM9Ii4uL3Jlc291cmNlcy8yOTUwMDcxMi5wbmciIGJvcmRlcj0iMCI+PC9hPjxicj48YnI+DQogICAgICAgICAgICAgICAgPGEgaHJlZj0iaHR0cHM6Ly9yZXN3ZWIucGFzc2tleS5jb20vUmVzd2ViLmRvP21vZGU9d2VsY29tZV9laV9uZXcmZXZlbnRJRD05NzA2MjkwIiB0YXJnZXQ9Il9ibGFuayI+PGltZyBzcmM9Ii4uL3Jlc291cmNlcy8yOTUwMjMzMy5wbmciIGJvcmRlcj0iMCI+PC9hPg0KCQkJPC9kaXY+DQoJCQk8YnIgc3R5bGU9ImNsZWFyOmJvdGg7Ij4mbmJzcDsNCgkJCTxicj4mbmJzcDsNCgkJPC9kaXY+DQoJCTxkaXYgaWQ9InRhYnMtNiI+DQoJCQk8aDI+SG90ZWwgYW5kIFRyYXZlbDwvaDI+DQoJCQk8ZGl2IGNsYXNzPSJsQ29sIj4NCgkJCQk8cD5UaGUgaG9zdCBob3RlbCBhbmQgdmVudWUgZm9yIEVYUExPUkUgTmV3IE9ybGVhbnMgMjAxMyBpcyA8YSBocmVmPSJodHRwczovL3Jlc3dlYi5wYXNza2V5LmNvbS9SZXN3ZWIuZG8/bW9kZT13ZWxjb21lX2VpX25ldyZldmVudElEPTk3MDYyOTAiIHRhcmdldD0iX2JsYW5rIj5IeWF0dCBOZXcgT3JsZWFuczwvYT4uIFRoZSBjbG9zZXN0IGFpcnBvcnQgaXMgTG91aXMgQXJtc3Ryb25nIEludGVybmF0aW9uYWwgQWlycG9ydCAoTVNZKS4gQ2FiIGZhcmUgZnJvbSB0aGUgYWlycG9ydCB0byB0aGUgSHlhdHQgaXMgYXBwcm94aW1hdGVseSAkMzMuPC9wPg0KCQkJCTxwPldlIGhhdmUgbmVnb3RpYXRlZCBzcGVjaWFsIHJvb20gcmF0ZSBvZiAkMjE5IHBlciBuaWdodCBmb3IgeW91ciBzdGF5IGF0IEh5YXR0IE5ldyBPcmxlYW5zLiBUaGUgbGFzdCBkYXkgdG8gYm9vayB5b3VyIGhvdGVsIHJvb20gYXQgdGhpcyByYXRlIGlzIEFwcmlsIDI2LCAyMDEzLiBHcm91cCByYXRlIGlzIHF1b3RlZCBleGNsdXNpdmUgb2YgYXBwbGljYWJsZSBzdGF0ZSBhbmQgbG9jYWwgdGF4ZXMgKHdoaWNoIGFyZSBjdXJyZW50bHkgMTMlIHBsdXMgJDMgb2NjdXBhbmN5IHBlciByb29tIHBlciBuaWdodCkgb3IgYXBwbGljYWJsZSBzZXJ2aWNlLCBvciBob3RlbCBzcGVjaWZpYyBmZWVzIGluIGVmZmVjdCBhdCB0aGUgdGltZSBvZiB0aGUgbWVldGluZyBhbmQgc3ViamVjdCB0byBjaGFuZ2UuPC9wPg0KCQkJCTxwPlJlc2VydmUgeW91ciByb29tIG9ubGluZSBieSBjbGlja2luZyBvbiB0aGUgbGluayBhYm92ZSwgb3IgYnkgY2FsbGluZyBIeWF0dCBOZXcgT3JsZWFucyBjZW50cmFsIHJlc2VydmF0aW9uIGRlcGFydG1lbnQgYXQgODg4IDQyMS4xNDQyIGFuZCBtZW50aW9uIHlvdSBhcmUgYSBDZXRlcmEgRmluYW5jaWFsIFNwZWNpYWxpc3RzIGNvbmZlcmVuY2UgYXR0ZW5kZWUuPC9wPg0KCQkJCTxwPlRvIGJvb2sgb3IgdXBncmFkZSB5b3VyIHJvb20gdG8gYSBzdWl0ZSwgeW91IG11c3QgY29udGFjdCB0aGUgcmVzZXJ2YXRpb24gZGVwYXJ0bWVudCBkaXJlY3RseSwgc3RhdGluZyB5b3UgYXJlIHBhcnQgb2YgdGhlIENldGVyYSBGaW5hbmNpYWwgU3BlY2lhbGlzdHMgcm9vbSBibG9jay4gU3VpdGVzIGFyZSBzdWJqZWN0IHRvIGF2YWlsYWJpbGl0eS48L3A+DQoJCQkJPHA+WW91IGFyZSByZXNwb25zaWJsZSBmb3IgYm9va2luZyB5b3VyIG93biBob3RlbCByb29tLiBZb3UgYXJlIGFsc28gcmVzcG9uc2libGUgZm9yIGFsbCB5b3VyIGxvZGdpbmcgYW5kIHRyYXZlbCBleHBlbnNlcy4gVG8gZW5zdXJlIHRoZSB1dG1vc3QgY29udmVuaWVuY2UgYW5kIHRvIHRha2UgYWR2YW50YWdlIG9mIHRoZSBmdWxsIEVYUExPUkUgZXhwZXJpZW5jZSwgd2UgaGlnaGx5IHJlY29tbWVuZCB5b3Ugc2VjdXJlIHlvdXIgYWNjb21tb2RhdGlvbnMgYXMgc29vbiBhcyBwb3NzaWJsZS4NCg0KPC9wPg0KCQkJPC9kaXY+DQoJCQk8ZGl2IGNsYXNzPSJyQ29sIiBzdHlsZT0idGV4dC1hbGlnbjpjZW50ZXI7Ij4NCgkJCQk8YSBocmVmPSJodHRwczovL3d3dy5yZWdpc3lzLmNvbS9HRTEzLyIgdGFyZ2V0PSJfYmxhbmsiPjxpbWcgc3JjPSIuLi9yZXNvdXJjZXMvMjk1MDA3MTIucG5nIiBib3JkZXI9IjAiPjwvYT48YnI+PGJyPg0KICAgICAgICAgICAgICAgIDxhIGhyZWY9Imh0dHBzOi8vcmVzd2ViLnBhc3NrZXkuY29tL1Jlc3dlYi5kbz9tb2RlPXdlbGNvbWVfZWlfbmV3JmV2ZW50SUQ9OTcwNjI5MCIgdGFyZ2V0PSJfYmxhbmsiPjxpbWcgc3JjPSIuLi9yZXNvdXJjZXMvMjk1MDIzMzMucG5nIiBib3JkZXI9IjAiPjwvYT4NCgkJCTwvZGl2Pg0KCQkJPGJyIHN0eWxlPSJjbGVhcjpib3RoOyI+Jm5ic3A7DQoJCQk8YnI+Jm5ic3A7DQoJCTwvZGl2Pg0KCQk8ZGl2IGlkPSJ0YWJzLTciPg0KCQkJPGgyPkZlZXM8L2gyPg0KCQkJPGRpdiBjbGFzcz0ibENvbCI+DQoJCQkJPHRhYmxlIGNsYXNzPSJncmlkdGFibGUiPg0KCQkJCQk8dHI+DQoJCQkJCQk8dGg+PC90aD48dGg+RWFybHkgQmlyZCBSYXRlIChEZWNlbWJlciAxNyAtIEZlYnJ1YXJ5IDE5LCAyMDEzKTwvdGg+PHRoPlJlZ3VsYXIgUmF0ZSAoRmVicnVhcnkgMjAgLUFwcmlsIDI2LCAyMDEzKTwvdGg+DQoJCQkJCTwvdHI+DQoJCQkJCTx0cj4NCgkJCQkJCTx0ZD5GaW5hbmNpYWwgQWR2aXNvcjwvdGQ+PHRkPiQ0OTk8L3RkPjx0ZD4kNjQ5PC90ZD4NCgkJCQkJPC90cj4NCgkJCQkJPHRyPg0KCQkJCQkJPHRkPkNsaWVudCBTZXJ2aWNlIEFzc29jaWF0ZTwvdGQ+PHRkPiQzNDk8L3RkPjx0ZD4kNDk5PC90ZD4NCgkJCQkJPC90cj4NCgkJCQkJPHRyPg0KCQkJCQkJPHRkPlNvY2lhbCBFdmVudCBHdWVzdDwvdGQ+PHRkPiQyOTk8L3RkPjx0ZD4kMjk5PC90ZD4NCgkJCQkJPC90cj4NCgkJCQk8L3RhYmxlPjxicj48YnI+DQogICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibGFyZ2UiPlRoaXMgeWVhciwgd2Ugd2lsbCBub3QgYmUgYWJsZSB0byBhY2NlcHQgYW55IG9uLXNpdGUgcmVnaXN0cmF0aW9ucy4gUGxlYXNlIHBsYW4gYWNjb3JkaW5nbHkuPC9kaXY+DQogICAgICAgICAgICAgICAgPHA+UGF5bWVudCBieSBjcmVkaXQgY2FyZCB3aWxsIGJlIGFjY2VwdGVkIG9ubHkgdmlhIE1hc3RlckNhcmQgb3IgVmlzYSBjcmVkaXQgY2FyZC4gQWxsIHBheW1lbnRzIG11c3QgYmUgbWFkZSBpbiBmdWxsIGJ5IEFwcmlsIDI2LCAyMDEzLiBUaGUgZmVlcyBwcm92aWRlZCBvbiB0aGUgZ3JpZCBhYm92ZSBmb3IgdGhlIEZpbmFuY2lhbCBBZHZpc29yIGFuZCBDbGllbnQgU2VydmljZSBBc3NvY2lhdGUgaW5jbHVkZSBhZG1pc3Npb24gdG8gZWR1Y2F0aW9uYWwgc2Vzc2lvbnMsIGhhbmRvdXQgbWF0ZXJpYWxzLCBzY2hlZHVsZWQgZXZlbnRzIGFuZCByZWNlcHRpb25zLCBtZWFscyBhbmQgcmVmcmVzaG1lbnQgYnJlYWtzLjwvcD4NCgkJCQk8ZGl2IGNsYXNzPSJsYXJnZSI+Q2FuY2VsbGF0aW9uIFBvbGljeTwvZGl2Pg0KICAgICAgICAgICAgICAgIDxwPkluIG9yZGVyIHRvIGRlbGl2ZXIgYSBmaXJzdC1jbGFzcyBtZWV0aW5nIGZvciBhbGwgb2Ygb3VyIEZpbmFuY2lhbCBBZHZpc29ycywgY2FuY2VsbGF0aW9uIHJlcXVlc3RzIG11c3QgYmUgcmVjZWl2ZWQgTWFyY2ggMzEsIDIwMTMsIHRvIGJlIHJlZnVuZGVkIGluIGZ1bGwuIFJlcXVlc3RzIGZvciBjYW5jZWxsYXRpb25zIHJlY2VpdmVkIGZyb20gQXByaWwgMSwgMjAxMywgdGhyb3VnaCBBcHJpbCAzMCwgMjAxMyB3aWxsIGJlIHJlZnVuZGVkIGF0IG9ubHkgNTAlLiBUaGVyZSB3aWxsIGJlIG5vIHJlZnVuZHMgZm9yIGNhbmNlbGxhdGlvbnMgcmVjZWl2ZWQgYWZ0ZXIgQXByaWwgMzAsIDIwMTMuPC9wPg0KICAgICAgICAgICAgICAgIDxwPklmIHlvdSBuZWVkIHRvIGNhbmNlbCwgeW91IG11c3QgY2FsbCA4NDUgNDM5LjM4ODcgYW5kIGFzayBmb3IgdGhlIENldGVyYSBGaW5hbmNpYWwgU3BlY2lhbGlzdHMgQWNjb3VudCBSZXByZXNlbnRhdGl2ZS4gUGxlYXNlIGRvIG5vdCBjb250YWN0IHlvdXIgaW50ZXJuYWwgb3IgUmVnaW9uYWwgUGxhbm5pbmcgU3BlY2lhbGlzdCBvciB0aGUgR2Vud29ydGggc3RhZmYgaW4gU2NoYXVtYnVyZy48YnI+PHN0cm9uZz5DYW5jZWxsYXRpb24gcmVxdWVzdHMgcmVjZWl2ZWQgdmlhIGVtYWlsLCBmYXggb3IgcGhvbmUgYnkgYW55IG1lbWJlciBvZiB0aGUgU2NoYXVtYnVyZyBzdGFmZiB3aWxsIG5vdCBiZSBob25vcmVkLjwvc3Ryb25nPjwvcD4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ickNvbCIgc3R5bGU9InRleHQtYWxpZ246Y2VudGVyOyI+DQoJCQkJPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVnaXN5cy5jb20vR0UxMy8iIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iLi4vcmVzb3VyY2VzLzI5NTAwNzEyLnBuZyIgYm9yZGVyPSIwIj48L2E+PGJyPjxicj4NCiAgICAgICAgICAgICAgICA8YSBocmVmPSJodHRwczovL3Jlc3dlYi5wYXNza2V5LmNvbS9SZXN3ZWIuZG8/bW9kZT13ZWxjb21lX2VpX25ldyZldmVudElEPTk3MDYyOTAiIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iLi4vcmVzb3VyY2VzLzI5NTAyMzMzLnBuZyIgYm9yZGVyPSIwIj48L2E+DQoJCQk8L2Rpdj4NCgkJCTxiciBzdHlsZT0iY2xlYXI6Ym90aDsiPiZuYnNwOw0KCQkJPGJyPiZuYnNwOw0KCQk8L2Rpdj4NCgkJPGRpdiBpZD0idGFicy04Ij4NCgkJCTxoMj5GQVFzPC9oMj4NCgkJCTxkaXYgY2xhc3M9ImxDb2wiPg0KCQkJCTxkaXYgY2xhc3M9ImxhcmdlIj5DYW4gYW55b25lIGVsc2UgYXR0ZW5kIEVYUExPUkUgd2l0aCBtZT88L2Rpdj4NCiAgICAgICAgICAgICAgICA8cD5ZZXMsIHdlIGVuY291cmFnZSB5b3UgdG8gYnJpbmcgeW91ciBvZmZpY2Ugc3VwcG9ydCBzdGFmZiwgZmFtaWx5IG1lbWJlciBvciBmcmllbmRzIHRvIEVYUExPUkUuIEFsbCBndWVzdHMgd2lsbCBuZWVkIHRvIHBpY2sgdXAgYSBuYW1lIGJhZGdlIGF0IHRoZSByZWdpc3RyYXRpb24gZGVzayB3aGVuIEVYUExPUkUgYmVnaW5zLiBUbyBzZWUgdGhlIGZlZXMgZm9yIGRpZmZlcmVudCB0eXBlcyBvZiBhdHRlbmRlZXMsIGNsaWNrIDxhIGhyZWY9IiMiIGlkPSJnb3RvRmVlcyIgY2xhc3M9InJlZ3VsYXJMaW5rIiBzdHlsZT0iY29sb3I6IzAyOWFmZCAhaW1wb3J0YW50OyI+aGVyZTwvYT4uPC9wPg0KCQkJCTxkaXYgY2xhc3M9ImxhcmdlIj5XaGF0IGlzIHRoZSBmZWUgdG8gYXR0ZW5kIEVYUExPUkU/PC9kaXY+DQogICAgICAgICAgICAgICAgPHA+VG8gc2VlIHRoZSBmZWVzIGZvciBkaWZmZXJlbnQgdHlwZXMgb2YgYXR0ZW5kZWVzLCBjbGljayA8YSBocmVmPSIjIiBpZD0iZ290b0ZlZXMyIiBjbGFzcz0icmVndWxhckxpbmsiIHN0eWxlPSJjb2xvcjojMDI5YWZkICFpbXBvcnRhbnQ7Ij5oZXJlPC9hPi48L3A+DQoJCQkJPGRpdiBjbGFzcz0ibGFyZ2UiPldoYXQgc2Vzc2lvbnMgYXJlIGJlaW5nIG9mZmVyZWQgdGhpcyB5ZWFyPzwvZGl2Pg0KICAgICAgICAgICAgICAgIDxwPlRvIHNlZSB0aGUgYWdlbmRhIGZvciBFWFBMT1JFIE5ldyBPcmxlYW5zIDIwMTMsIGNsaWNrIDxhIGhyZWY9IiMiIGlkPSJnb3RvQWdlbmRhIiBjbGFzcz0icmVndWxhckxpbmsiIHN0eWxlPSJjb2xvcjojMDI5YWZkICFpbXBvcnRhbnQ7Ij5oZXJlPC9hPi48L3A+DQogICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibGFyZ2UiPkhvdyBkbyBJIGVhcm4gY29udGludWluZyBlZHVjYXRpb24gY3JlZGl0cyBhdCBFWFBMT1JFPzwvZGl2Pg0KICAgICAgICAgICAgICAgIDxwPkFsbCBjb250aW51aW5nIGVkdWNhdGlvbiBob3VycyB3aWxsIGJlIGF3YXJkZWQgYnkgaW5kaXZpZHVhbCBjb3Vyc2UuIEZpbmFsIGhvdXJzIGZvciBhbGwgc2Vzc2lvbnMgd2lsbCBiZSBhbm5vdW5jZWQgYXQgdGhlIGNvbnZlbnRpb24uPC9wPg0KICAgICAgICAgICAgICAgIDxwPkluIG9yZGVyIHRvIHJlY2VpdmUgY3JlZGl0cywgPHN0cm9uZz55b3UgbXVzdCBzaWduIGluIGVhY2ggbW9ybmluZyBvZiB0aGUgY29udmVudGlvbiBpbiBhZGRpdGlvbiB0byBjb21wbGV0aW5nIGFuIGV2YWx1YXRpb24gZm9ybSBmb3IgZWFjaCBzZXNzaW9uIHlvdSBhdHRlbmQ8L3N0cm9uZz4uIElmIHdlIGRvIG5vdCBoYXZlIGEgbGl2ZSBzaWduYXR1cmUsIG5vIGNyZWRpdCB3aWxsIGJlIGF3YXJkZWQuIE5vIGV4Y2VwdGlvbnMgd2lsbCBiZSBncmFudGVkLjwvcD4NCiAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJsYXJnZSI+V2hhdCBzb2NpYWwgZXZlbnRzIGFyZSBwbGFubmVkIGZvciBFWFBMT1JFPzwvZGl2Pg0KICAgICAgICAgICAgICAgIDxwPlRvIHNlZSB0aGUgZGlmZmVyZW50IHNvY2lhbCBldmVudHMsIGNsaWNrIDxhIGhyZWY9IiMiIGlkPSJnb3RvRXZlbnRzIiBjbGFzcz0icmVndWxhckxpbmsiIHN0eWxlPSJjb2xvcjojMDI5YWZkICFpbXBvcnRhbnQ7Ij5oZXJlPC9hPi48L3A+DQogICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibGFyZ2UiPldoYXQgaXMgdGhlIGRyZXNzIGNvZGUgZm9yIEVYUExPUkU/PC9kaXY+DQogICAgICAgICAgICAgICAgPHA+Q29uZmVyZW5jZSBhbmQgc2Vzc2lvbiBhdHRpcmUgaXMgYnVzaW5lc3MgY2FzdWFsLiBQbGVhc2Ugbm90ZSB0aGF0IHRlbXBlcmF0dXJlcyBvZnRlbiB2YXJ5IHNpZ25pZmljYW50bHkgaW4gYnJlYWtvdXQgcm9vbXMsIHNvIHBsYW4gdG8gYnJpbmcgYSBzd2VhdGVyIG9yIGphY2tldCB3aXRoIHlvdSB0byBzZXNzaW9ucywgb3IgZHJlc3MgaW4gbGF5ZXJzLjwvcD4NCiAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJsYXJnZSI+V2hhdCBraW5kIG9mIHdlYXRoZXIgY2FuIEkgZXhwZWN0IGluIE5ldyBPcmxlYW5zIGluIE1heT88L2Rpdj4NCiAgICAgICAgICAgICAgICA8cD5UaGUgYXZlcmFnZSBoaWdoIHRlbXBlcmF0dXJlIGlzIDg3IGRlZ3JlZXMgRmFocmVuaGVpdCwgYW5kIHRoZSBhdmVyYWdlIGxvdyB0ZW1wZXJhdHVyZSBpcyA2OSBkZWdyZWVzIEZhaHJlbmhlaXQuPC9wPg0KICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9ImxhcmdlIj5XaGF0IGlmIEkgaGF2ZSByZWdpc3RlcmVkIGZvciBFWFBMT1JFIGJ1dCBuZWVkIHRvIG1ha2UgY2hhbmdlcyB0byBvciBjYW5jZWwgdGhhdCByZWdpc3RyYXRpb24/PC9kaXY+DQogICAgICAgICAgICAgICAgPHA+VG8gbWFrZSBjaGFuZ2VzIHRvIHlvdXIgY29uZmVyZW5jZSByZWdpc3RyYXRpb24sIGNhbGwgODQ1IDQzOS4zODg3IGFuZCBhc2sgZm9yIHRoZSBDZXRlcmEgRmluYW5jaWFsIFNwZWNpYWxpc3RzIEFjY291bnQgUmVwcmVzZW50YXRpdmUuIFBsZWFzZSBub3RlIHRoYXQgdGhpcyBpcyBhIHRoaXJkLXBhcnR5IHZlbmRvciBhbmQgaXMgbm90IHRoZSBTY2hhdW1idXJnIG9mZmljZS4gRm9yIGluZm9ybWF0aW9uIG9uIHRoZSBjYW5jZWxsYXRpb24gcG9saWN5IGZvciBjb25mZXJlbmNlIHJlZ2lzdHJhdGlvbiwgY2xpY2sgPGEgaHJlZj0iIyIgaWQ9ImdvdG9GZWVzMyIgY2xhc3M9InJlZ3VsYXJMaW5rIiBzdHlsZT0iY29sb3I6IzAyOWFmZCAhaW1wb3J0YW50OyI+aGVyZTwvYT4uPC9wPg0KICAgICAgICAgICAgICAgIDxwPlRvIG1ha2UgY2hhbmdlcyB0byB5b3VyIGhvdGVsIGJvb2tpbmcsIHBsZWFzZSBjb250YWN0IHRoZSBIeWF0dCBOZXcgT3JsZWFucyAgZGlyZWN0bHkgYXQgODg4IDQyMS4xNDQyIGFuZCBoYXZlIHlvdXIgY29uZmlybWF0aW9uIG51bWJlciBoYW5keS4gRm9yIGluZm9ybWF0aW9uIG9uIHRoZSBjYW5jZWxsYXRpb24gcG9saWN5IGZvciB0aGUgaG90ZWwsIGNsaWNrIDxhIGhyZWY9IiMiIGlkPSJnb3RvSG90ZWwiIGNsYXNzPSJyZWd1bGFyTGluayIgc3R5bGU9ImNvbG9yOiMwMjlhZmQgIWltcG9ydGFudDsiPmhlcmU8L2E+LjwvcD4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ickNvbCIgc3R5bGU9InRleHQtYWxpZ246Y2VudGVyOyI+DQoJCQkJPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVnaXN5cy5jb20vR0UxMy8iIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iLi4vcmVzb3VyY2VzLzI5NTAwNzEyLnBuZyIgYm9yZGVyPSIwIj48L2E+PGJyPjxicj4NCiAgICAgICAgICAgICAgICA8YSBocmVmPSJodHRwczovL3Jlc3dlYi5wYXNza2V5LmNvbS9SZXN3ZWIuZG8/bW9kZT13ZWxjb21lX2VpX25ldyZldmVudElEPTk3MDYyOTAiIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iLi4vcmVzb3VyY2VzLzI5NTAyMzMzLnBuZyIgYm9yZGVyPSIwIj48L2E+DQoJCQk8L2Rpdj4NCgkJCTxiciBzdHlsZT0iY2xlYXI6Ym90aDsiPiZuYnNwOw0KCQkJPGJyPiZuYnNwOw0KCQk8L2Rpdj4NCgk8L2Rpdj4NCjwvZGl2Pg0KPGJyIHN0eWxlPSJjbGVhcjpib3RoOyI+ZAIDD2QWAgIBDzwrABIBADwrAAkBAA8WAh4HVmlzaWJsZWhkZAIDD2QWDgIBDw8WAh8ABRFXZWxjb21lIElWQU4gU09OR2RkAgUPDxYEHghJbWFnZVVybAUZLi4vcmVzb3VyY2VzL0NGU19MT0dPLnBuZx4LTmF2aWdhdGVVcmwFJC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0hvbWUuYXNweGRkAgcPDxYCHwAF4gUmbmJzcDt8Jm5ic3A7PGEgaWQ9Imh5cE15UHJvZmlsZSIgaHJlZj0iL1RvdGFsQWNjZXNzL0F1dGgvdXNlcnByb2ZpbGUuYXNweCIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdmcm1Db250ZW50JyA+TXkgUHJvZmlsZTwvYT4mbmJzcDt8Jm5ic3A7PGEgaWQ9Imh5cENvbnRhY3RVcyIgaHJlZj0iLi4vUG9ydGFsL0NvbW1vbi5hc3B4P0NvbnRlbnRJZD0yODU5MTQxNyIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdfc2VsZicgPkNvbnRhY3QgVXM8L2E+Jm5ic3A7fCZuYnNwOzxhIGlkPSJoeXBTaXRlTWFwIiBocmVmPSIuLi9Qb3J0YWwvU2l0ZW1hcC5hc3B4IiBjbGFzcz0iZnVuY19saW5rIiBUYXJnZXQ9J19zZWxmJyA+U2l0ZSBNYXA8L2E+Jm5ic3A7fCZuYnNwOzxhIGlkPSJoeXBBZG1pbiIgaHJlZj0iLi4vUG9ydGFsL0NoYW5nZVByb2ZpbGUuYXNweCIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdfc2VsZicgPkFkbWluPC9hPiZuYnNwO3wmbmJzcDs8YSBpZD0iaHlwU21hcnR3b3JrcyIgaHJlZj0iamF2YXNjcmlwdDp3aW5kb3dIYW5kbGUgPSBsYXVuY2hfc21hcnR3b3JrcygpOyIgY2xhc3M9ImZ1bmNfbGluayIgVGFyZ2V0PSdfc2VsZicgPlNtYXJ0V29ya3M8L2E+Jm5ic3A7fCZuYnNwOzxhIGlkPSJoeXBMb2dPdXQiIGhyZWY9ImphdmFzY3JpcHQ6d2luZG93SGFuZGxlID0gbG9nb3V0KCk7IiBjbGFzcz0iZnVuY19saW5rIiBUYXJnZXQ9J19zZWxmJyA+TG9nIE91dDwvYT4mbmJzcDtkZAIRDzwrAA0CAA8WAh4LXyFEYXRhQm91bmRnZAwUKwALBScwOjAsMDoxLDA6MiwwOjMsMDo0LDA6NSwwOjYsMDo3LDA6OCwwOjkUKwACFhQeBVZhbHVlBQRIb21lHglEYXRhQm91bmRnHghTZWxlY3RlZGcfAAUESG9tZR8DBS0vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9Ib21lLmFzcHg/TWVudUlkPTEeB0VuYWJsZWRnHgpTZWxlY3RhYmxlZx4GVGFyZ2V0BQVfc2VsZh4HVG9vbFRpcAUESG9tZR4IRGF0YVBhdGgFATFkFCsAAhYSHwUFC015IEJ1c2luZXNzHwZnHwAFC015IEJ1c2luZXNzHwMFASMfCGcfCWgfCgUFX3NlbGYfCwULTXkgQnVzaW5lc3MfDAUBMhQrAAQFSzA6MCwwOjEsMDoyLDE6MiwwOjIsMToyLDA6MiwwOjMsMTozLDA6MywxOjMsMDozLDE6MywwOjMsMTozLDA6MywxOjMsMDozLDE6MxQrAAIWEh8FBRRCcm9rZXJhZ2UgT3BlcmF0aW9ucx8GZx8ABRRCcm9rZXJhZ2UgT3BlcmF0aW9ucx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD0xMB8IZx8JZx8KBQVfc2VsZh8LBRRCcm9rZXJhZ2UgT3BlcmF0aW9ucx8MBQIxMBQrAAUFLzA6MCwwOjEsMToxLDA6MSwwOjIsMDozLDE6MywwOjMsMTozLDA6MywwOjQsMTo0FCsAAhYSHwUFD0dldHRpbmcgU3RhcnRlZB8GZx8ABQ9HZXR0aW5nIFN0YXJ0ZWQfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjM4HwhnHwlnHwoFBV9zZWxmHwsFD0dldHRpbmcgU3RhcnRlZB8MBQMyMzhkFCsAAhYSHwUFDE5ldyBBY2NvdW50cx8GZx8ABQxOZXcgQWNjb3VudHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9MTc1HwhnHwlnHwoFBV9zZWxmHwsFDE5ldyBBY2NvdW50cx8MBQMxNzUUKwAHBRcwOjAsMDoxLDA6MiwwOjMsMDo0LDA6NRQrAAIWEh8FBRVBY2NvdW50IEVzdGFibGlzaG1lbnQfBmcfAAUVQWNjb3VudCBFc3RhYmxpc2htZW50HwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE3Nx8IZx8JZx8KBQVfc2VsZh8LBRVBY2NvdW50IEVzdGFibGlzaG1lbnQfDAUDMTc3ZBQrAAIWEh8FBRNBY2NvdW50IE1haW50ZW5hbmNlHwZnHwAFE0FjY291bnQgTWFpbnRlbmFuY2UfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjA0HwhnHwlnHwoFBV9zZWxmHwsFE0FjY291bnQgTWFpbnRlbmFuY2UfDAUDMjA0ZBQrAAIWEh8FBRNBZGRpdGlvbmFsIFNlcnZpY2VzHwZnHwAFE0FkZGl0aW9uYWwgU2VydmljZXMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTc2HwhnHwlnHwoFBV9zZWxmHwsFE0FkZGl0aW9uYWwgU2VydmljZXMfDAUDMTc2ZBQrAAIWEh8FBQlBTUwgUnVsZXMfBmcfAAUJQU1MIFJ1bGVzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4MB8IZx8JZx8KBQVfc2VsZh8LBQlBTUwgUnVsZXMfDAUDMTgwZBQrAAIWEh8FBRNQcm9oaWJpdGVkIEFjY291bnRzHwZnHwAFE1Byb2hpYml0ZWQgQWNjb3VudHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTgxHwhnHwlnHwoFBV9zZWxmHwsFE1Byb2hpYml0ZWQgQWNjb3VudHMfDAUDMTgxZBQrAAIWEh8FBR5SZXRpcmVtZW50IEFjY291bnQgSW5mb3JtYXRpb24fBmcfAAUeUmV0aXJlbWVudCBBY2NvdW50IEluZm9ybWF0aW9uHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE3OB8IZx8JZx8KBQVfc2VsZh8LBR5SZXRpcmVtZW50IEFjY291bnQgSW5mb3JtYXRpb24fDAUDMTc4ZBQrAAIWEh8FBQ1OZXdzICYgQWxlcnRzHwZnHwAFDU5ld3MgJiBBbGVydHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTgyHwhnHwlnHwoFBV9zZWxmHwsFDU5ld3MgJiBBbGVydHMfDAUDMTgyZBQrAAIWEh8FBQdUcmFkaW5nHwZnHwAFB1RyYWRpbmcfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9MTg0HwhnHwlnHwoFBV9zZWxmHwsFB1RyYWRpbmcfDAUDMTg0FCsADQUxMDowLDA6MSwwOjIsMDozLDA6NCwwOjUsMDo2LDA6NywwOjgsMDo5LDA6MTAsMDoxMRQrAAIWEh8FBRVBbm51aXRpZXMgKFN1YnNjcmliZSkfBmcfAAUVQW5udWl0aWVzIChTdWJzY3JpYmUpHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIwOB8IZx8JZx8KBQVfc2VsZh8LBRVBbm51aXRpZXMgKFN1YnNjcmliZSkfDAUDMjA4ZBQrAAIWEh8FBSBCIGFuZCBDIFNoYXJlIC0gQ2xhc3MgRXhlbXB0aW9ucx8GZx8ABSBCIGFuZCBDIFNoYXJlIC0gQ2xhc3MgRXhlbXB0aW9ucx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xODUfCGcfCWcfCgUFX3NlbGYfCwUgQiBhbmQgQyBTaGFyZSAtIENsYXNzIEV4ZW1wdGlvbnMfDAUDMTg1ZBQrAAIWEh8FBRxCIGFuZCBDIFNoYXJlIC0gQ2xhc3MgUG9saWN5HwZnHwAFHEIgYW5kIEMgU2hhcmUgLSBDbGFzcyBQb2xpY3kfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTg2HwhnHwlnHwoFBV9zZWxmHwsFHEIgYW5kIEMgU2hhcmUgLSBDbGFzcyBQb2xpY3kfDAUDMTg2ZBQrAAIWEh8FBRBEVlAgKENPRCBvciBSVlApHwZnHwAFEERWUCAoQ09EIG9yIFJWUCkfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTg3HwhnHwlnHwoFBV9zZWxmHwsFEERWUCAoQ09EIG9yIFJWUCkfDAUDMTg3ZBQrAAIWEh8FBQ5FcnJvciBBY2NvdW50cx8GZx8ABQ5FcnJvciBBY2NvdW50cx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xODgfCGcfCWcfCgUFX3NlbGYfCwUORXJyb3IgQWNjb3VudHMfDAUDMTg4ZBQrAAIWEh8FBQxGaXhlZCBJbmNvbWUfBmcfAAUMRml4ZWQgSW5jb21lHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE4OR8IZx8JZx8KBQVfc2VsZh8LBQxGaXhlZCBJbmNvbWUfDAUDMTg5ZBQrAAIWEh8FBQxNdXR1YWwgRnVuZHMfBmcfAAUMTXV0dWFsIEZ1bmRzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE5MB8IZx8JZx8KBQVfc2VsZh8LBQxNdXR1YWwgRnVuZHMfDAUDMTkwZBQrAAIWEh8FBR5ObyBUcmFuc2FjdGlvbiBGZWUgKE5URikgRnVuZHMfBmcfAAUeTm8gVHJhbnNhY3Rpb24gRmVlIChOVEYpIEZ1bmRzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE5MR8IZx8JZx8KBQVfc2VsZh8LBR5ObyBUcmFuc2FjdGlvbiBGZWUgKE5URikgRnVuZHMfDAUDMTkxZBQrAAIWEh8FBQtPcGVuIE9yZGVycx8GZx8ABQtPcGVuIE9yZGVycx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOTIfCGcfCWcfCgUFX3NlbGYfCwULT3BlbiBPcmRlcnMfDAUDMTkyZBQrAAIWEh8FBQ5TZWN1cml0eSBTZXR1cB8GZx8ABQ5TZWN1cml0eSBTZXR1cB8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOTMfCGcfCWcfCgUFX3NlbGYfCwUOU2VjdXJpdHkgU2V0dXAfDAUDMTkzZBQrAAIWEh8FBRlTeXN0ZW1hdGljIEJ1eXMgYW5kIFNlbGxzHwZnHwAFGVN5c3RlbWF0aWMgQnV5cyBhbmQgU2VsbHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTk0HwhnHwlnHwoFBV9zZWxmHwsFGVN5c3RlbWF0aWMgQnV5cyBhbmQgU2VsbHMfDAUDMTk0ZBQrAAIWEh8FBRRUaHJlc2hvbGQgU2VjdXJpdGllcx8GZx8ABRRUaHJlc2hvbGQgU2VjdXJpdGllcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOTUfCGcfCWcfCgUFX3NlbGYfCwUUVGhyZXNob2xkIFNlY3VyaXRpZXMfDAUDMTk1ZBQrAAIWEh8FBRdBZHZhbmNlZCBQbGFubmluZyBHcm91cB8GZx8ABRdBZHZhbmNlZCBQbGFubmluZyBHcm91cB8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD0xMR8IZx8JZx8KBQVfc2VsZh8LBRdBZHZhbmNlZCBQbGFubmluZyBHcm91cB8MBQIxMRQrAAQFCzA6MCwwOjEsMDoyFCsAAhYSHwUFD1RheCBJbmZvcm1hdGlvbh8GZx8ABQ9UYXggSW5mb3JtYXRpb24fAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjE1HwhnHwlnHwoFBV9zZWxmHwsFD1RheCBJbmZvcm1hdGlvbh8MBQMyMTVkFCsAAhYSHwUFD0lSQSBJbmZvcm1hdGlvbh8GZx8ABQ9JUkEgSW5mb3JtYXRpb24fAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjE3HwhnHwlnHwoFBV9zZWxmHwsFD0lSQSBJbmZvcm1hdGlvbh8MBQMyMTdkFCsAAhYSHwUFDU1pc2NlbGxhbmVvdXMfBmcfAAUNTWlzY2VsbGFuZW91cx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMTgfCGcfCWcfCgUFX3NlbGYfCwUNTWlzY2VsbGFuZW91cx8MBQMyMThkFCsAAhYSHwUFGUxpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbnMfBmcfAAUZTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD0xNB8IZx8JZx8KBQVfc2VsZh8LBRlMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb25zHwwFAjE0FCsABAULMDowLDA6MSwwOjIUKwACFhIfBQUIUmVuZXdhbHMfBmcfAAUIUmVuZXdhbHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTUyHwhnHwlnHwoFBV9zZWxmHwsFB1JlbmV3YWwfDAUDMTUyZBQrAAIWEh8FBR5MaWNlbnNpbmcgJiBSZWdpc3RyYXRpb24gRm9ybXMfBmcfAAUeTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uIEZvcm1zHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTE1Mx8IZx8JZx8KBQVfc2VsZh8LBR5MaWNlbnNpbmcgJiBSZWdpc3RyYXRpb24gRm9ybXMfDAUDMTUzZBQrAAIWEh8FBSFMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb25zIEdlbmVyYWwfBmcfAAUhTGljZW5zaW5nICYgUmVnaXN0cmF0aW9ucyBHZW5lcmFsHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI0Mh8IZx8JZx8KBQVfc2VsZh8LBSFMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb25zIEdlbmVyYWwfDAUDMjQyZBQrAAIWEh8FBRNQcm9kdWN0IEluZm9ybWF0aW9uHwZnHwAFE1Byb2R1Y3QgSW5mb3JtYXRpb24fAwUuL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9Mx8IZx8JZx8KBQVfc2VsZh8LBRNQcm9kdWN0IEluZm9ybWF0aW9uHwwFATMUKwAIBSMwOjAsMDoxLDA6MiwwOjMsMDo0LDA6NSwwOjYsMDo3LDE6NxQrAAIWEh8FBRZBcHByb3ZlZCBQcm9kdWN0IExpc3RzHwZnHwAFFkFwcHJvdmVkIFByb2R1Y3QgTGlzdHMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTQfCGcfCWcfCgUFX3NlbGYfCwUWQXBwcm92ZWQgUHJvZHVjdCBMaXN0cx8MBQI1NGQUKwACFhIfBQUIQWR2aXNvcnkfBmcfAAUIQWR2aXNvcnkfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTUfCGcfCWcfCgUFX3NlbGYfCwUIQWR2aXNvcnkfDAUCNTVkFCsAAhYSHwUFCUFubnVpdGllcx8GZx8ABQlBbm51aXRpZXMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9NTcfCGcfCWcfCgUFX3NlbGYfCwUJQW5udWl0aWVzHwwFAjU3FCsAAwUHMDowLDA6MRQrAAIWEh8FBQVGaXhlZB8GZx8ABQVGaXhlZB8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD01OB8IZx8JZx8KBQVfc2VsZh8LBQVGaXhlZB8MBQI1OGQUKwACFhIfBQUIVmFyaWFibGUfBmcfAAUIVmFyaWFibGUfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NTkfCGcfCWcfCgUFX3NlbGYfCwUIVmFyaWFibGUfDAUCNTlkFCsAAhYSHwUFC0ludmVzdG1lbnRzHwZnHwAFC0ludmVzdG1lbnRzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTYwHwhnHwlnHwoFBV9zZWxmHwsFC0ludmVzdG1lbnRzHwwFAjYwFCsABgUTMDowLDA6MSwwOjIsMDozLDA6NBQrAAIWEh8FBRdBbHRlcm5hdGl2ZSBJbnZlc3RtZW50cx8GZx8ABRdBbHRlcm5hdGl2ZSBJbnZlc3RtZW50cx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD02MR8IZx8JZx8KBQVfc2VsZh8LBRdBbHRlcm5hdGl2ZSBJbnZlc3RtZW50cx8MBQI2MWQUKwACFhIfBQUURGVmaW5lZCBDb250cmlidXRpb24fBmcfAAUURGVmaW5lZCBDb250cmlidXRpb24fAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjIfCGcfCWcfCgUFX3NlbGYfCwUURGVmaW5lZCBDb250cmlidXRpb24fDAUCNjJkFCsAAhYSHwUFDE11dHVhbCBGdW5kcx8GZx8ABQxNdXR1YWwgRnVuZHMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjMfCGcfCWcfCgUFX3NlbGYfCwUMTXV0dWFsIEZ1bmRzHwwFAjYzZBQrAAIWEh8FBRFTZWN0aW9uIDUyOSBQbGFucx8GZx8ABRFTZWN0aW9uIDUyOSBQbGFucx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD02NB8IZx8JZx8KBQVfc2VsZh8LBRFTZWN0aW9uIDUyOSBQbGFucx8MBQI2NGQUKwACFhIfBQURT3RoZXIgSW52ZXN0bWVudHMfBmcfAAURT3RoZXIgSW52ZXN0bWVudHMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjUfCGcfCWcfCgUFX3NlbGYfCwURT3RoZXIgSW52ZXN0bWVudHMfDAUCNjVkFCsAAhYSHwUFCUluc3VyYW5jZR8GZx8ABQlJbnN1cmFuY2UfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9NjYfCGcfCWcfCgUFX3NlbGYfCwUJSW5zdXJhbmNlHwwFAjY2FCsABwUXMDowLDA6MSwwOjIsMDozLDA6NCwwOjUUKwACFhIfBQURRGlzYWJpbGl0eSBJbmNvbWUfBmcfAAURRGlzYWJpbGl0eSBJbmNvbWUfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjcfCGcfCWcfCgUFX3NlbGYfCwURRGlzYWJpbGl0eSBJbmNvbWUfDAUCNjdkFCsAAhYSHwUFDkxvbmctVGVybSBDYXJlHwZnHwAFDkxvbmctVGVybSBDYXJlHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTY4HwhnHwlnHwoFBV9zZWxmHwsFDkxvbmcgVGVybSBjYXJlHwwFAjY4ZBQrAAIWEh8FBQRUZXJtHwZnHwAFBFRlcm0fAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NjkfCGcfCWcfCgUFX3NlbGYfCwUEVGVybR8MBQI2OWQUKwACFhIfBQUOVW5pdmVyc2FsIExpZmUfBmcfAAUOVW5pdmVyc2FsIExpZmUfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NzAfCGcfCWcfCgUFX3NlbGYfCwUOVW5pdmVyc2FsIExpZmUfDAUCNzBkFCsAAhYSHwUFF1ZhcmlhYmxlIFVuaXZlcnNhbCBMaWZlHwZnHwAFF1ZhcmlhYmxlIFVuaXZlcnNhbCBMaWZlHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTcxHwhnHwlnHwoFBV9zZWxmHwsFIVZhcmlhYmxlIFVuaXZlcnNhbCBMaWZlIEluc3VyYW5jZR8MBQI3MWQUKwACFhIfBQUKV2hvbGUgTGlmZR8GZx8ABQpXaG9sZSBMaWZlHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTcyHwhnHwlnHwoFBV9zZWxmHwsFFFdob2xlIExpZmUgSW5zdXJhbmNlHwwFAjcyZBQrAAIWEh8FBRBSZXRpcmVtZW50IFBsYW5zHwZnHwAFEFJldGlyZW1lbnQgUGxhbnMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9Mjk1HwhnHwlnHwoFBV9zZWxmHwsFEFJldGlyZW1lbnQgUGxhbnMfDAUDMjk1ZBQrAAIWEh8FBRJTdHJhdGVnaWMgUGFydG5lcnMfBmcfAAUSU3RyYXRlZ2ljIFBhcnRuZXJzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTczHwhnHwlnHwoFBV9zZWxmHwsFElN0cmF0ZWdpYyBQYXJ0bmVycx8MBQI3M2QUKwACFhIfBQUFRm9ybXMfBmcfAAUFRm9ybXMfAwUuL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9NB8IZx8JZx8KBQVfc2VsZh8LBQVGb3Jtcx8MBQE0FCsABwU3MDowLDE6MCwwOjAsMDoxLDA6MiwxOjIsMDoyLDA6MywxOjMsMDozLDA6NCwwOjUsMTo1LDA6NRQrAAIWEh8FBQ1Gb3JtcyBTZWFyY2ggHwZnHwAFDUZvcm1zIFNlYXJjaCAfAwU3L0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvU2VhcmNoLmFzcHg/Rm9sZGVyTmFtZT1Gb3Jtcx8IZx8JZx8KBQVfc2VsZh8LBQ1Gb3JtcyBTZWFyY2ggHwwFAjE4ZBQrAAIWEh8FBRFBZHZpc29yeSBTZXJ2aWNlcx8GZx8ABRFBZHZpc29yeSBTZXJ2aWNlcx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xOR8IZx8JZx8KBQVfc2VsZh8LBRFBZHZpc29yeSBTZXJ2aWNlcx8MBQIxOWQUKwACFhIfBQUYTGljZW5zaW5nICYgUmVnaXN0cmF0aW9uHwZnHwAFGExpY2Vuc2luZyAmIFJlZ2lzdHJhdGlvbh8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yMR8IZx8JZx8KBQVfc2VsZh8LBRhMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb24fDAUCMjEUKwACBQswOjAsMDoxLDE6MRQrAAIWEh8FBSBMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb24gR2VuZXJhbB8GZx8ABSBMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb24gR2VuZXJhbB8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zNR8IZx8JZx8KBQVfc2VsZh8LBSBMaWNlbnNpbmcgJiBSZWdpc3RyYXRpb24gR2VuZXJhbB8MBQIzNWQUKwACFhIfBQUNTWlzY2VsbGFuZW91cx8GZx8ABQ1NaXNjZWxsYW5lb3VzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTIyHwhnHwlnHwoFBV9zZWxmHwsFDU1pc2NlbGxhbmVvdXMfDAUCMjIUKwADBRcwOjAsMDoxLDA6MiwxOjIsMDoyLDE6MhQrAAIWEh8FBRVNaXNjZWxsYW5lb3VzIEdlbmVyYWwfBmcfAAUVTWlzY2VsbGFuZW91cyBHZW5lcmFsHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTM2HwhnHwlnHwoFBV9zZWxmHwsFFU1pc2NlbGxhbmVvdXMgR2VuZXJhbB8MBQIzNmQUKwACFhIfBQUFQWRtaW4fBmcfAAUFQWRtaW4fAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzcfCGcfCWcfCgUFX3NlbGYfCwUFQWRtaW4fDAUCMzdkFCsAAhYSHwUFDE5ldyBCdXNpbmVzcx8GZx8ABQxOZXcgQnVzaW5lc3MfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9MjMfCGcfCWcfCgUFX3NlbGYfCwUMTmV3IEJ1c2luZXNzHwwFAjIzFCsAAwUHMDowLDA6MRQrAAIWEh8FBRROZXcgQnVzaW5lc3MgR2VuZXJhbB8GZx8ABRROZXcgQnVzaW5lc3MgR2VuZXJhbB8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zOR8IZx8JZx8KBQVfc2VsZh8LBRROZXcgQnVzaW5lc3MgR2VuZXJhbB8MBQIzOWQUKwACFhIfBQUJSW5zdXJhbmNlHwZnHwAFCUluc3VyYW5jZR8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xNDcfCGcfCWcfCgUFX3NlbGYfCwUJSW5zdXJhbmNlHwwFAzE0N2QUKwACFhIfBQUKRm9ybXMgTGlzdB8GZx8ABQpGb3JtcyBMaXN0HwMFKS9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL0Zvcm1zTGlzdC5hc3B4HwhnHwlnHwoFBV9zZWxmHwsFCkZvcm1zIExpc3QfDAUDMTM4ZBQrAAIWEh8FBRFTYWxlcyAmIE1hcmtldGluZx8GZx8ABRFTYWxlcyAmIE1hcmtldGluZx8DBS4vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMS5hc3B4P01lbnVJZD01HwhnHwlnHwoFBV9zZWxmHwsFEVNhbGVzICYgTWFya2V0aW5nHwwFATUUKwAFBQ8wOjAsMDoxLDA6MiwwOjMUKwACFhIfBQUPQ29ubmVjdDJDbGllbnRzHwZnHwAFD0Nvbm5lY3QyQ2xpZW50cx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMi5hc3B4P01lbnVJZD0yOTcfCGcfCWcfCgUFX3NlbGYfCwUPQ29ubmVjdDJDbGllbnRzHwwFAzI5NxQrAAMFDzA6MCwwOjEsMToxLDA6MRQrAAIWEh8FBRlDMkMgTWFya2V0aW5nIExpYnJhcnkgUHJvHwZnHwAFGUMyQyBNYXJrZXRpbmcgTGlicmFyeSBQcm8fAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzMxHwhnHwlnHwoFBV9TZWxmHwsFGUMyQyBNYXJrZXRpbmcgTGlicmFyeS9Qcm8fDAUDMzMxZBQrAAIWEh8FBQ5DMkMgVW5pdmVyc2l0eR8GZx8ABQ5DMkMgVW5pdmVyc2l0eR8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zMzMfCGcfCWcfCgUFX1NlbGYfCwUOQzJDIFVuaXZlcnNpdHkfDAUDMzMzZBQrAAIWEh8FBR5DbGllbnQgQWNxdWlzaXRpb24gJiBSZXRlbnRpb24fBmcfAAUeQ2xpZW50IEFjcXVpc2l0aW9uICYgUmV0ZW50aW9uHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI1HwhnHwlnHwoFBV9zZWxmHwsFHkNsaWVudCBBY3F1aXNpdGlvbiAmIFJldGVudGlvbh8MBQIyNRQrAAkFHzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1LDA6NiwwOjcUKwACFhIfBQUQQWR2ZXJ0aXNpbmcgJiBQUh8GZx8ABRBBZHZlcnRpc2luZyAmIFBSHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTc1HwhnHwlnHwoFBV9zZWxmHwsFEEFkdmVydGlzaW5nICYgUFIfDAUCNzVkFCsAAhYSHwUFEkJyb2NodXJlcyAmIEZseWVycx8GZx8ABRJCcm9jaHVyZXMgJiBGbHllcnMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NzYfCGcfCWcfCgUFX3NlbGYfCwUSQnJvY2h1cmVzICYgRmx5ZXJzHwwFAjc2ZBQrAAIWEh8FBQlDYW1wYWlnbnMfBmcfAAUJQ2FtcGFpZ25zHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTc3HwhnHwlnHwoFBV9zZWxmHwsFCUNhbXBhaWducx8MBQI3N2QUKwACFhIfBQUcQ2xpZW50ICYgUHJvc3BlY3RpbmcgTGV0dGVycx8GZx8ABRxDbGllbnQgJiBQcm9zcGVjdGluZyBMZXR0ZXJzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTc4HwhnHwlnHwoFBV9zZWxmHwsFHENsaWVudCAmIFByb3NwZWN0aW5nIExldHRlcnMfDAUCNzhkFCsAAhYSHwUFD0NsaWVudCBSZWZlcnJhbB8GZx8ABQ9DbGllbnQgUmVmZXJyYWwfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9NzkfCGcfCWcfCgUFX3NlbGYfCwUPQ2xpZW50IFJlZmVycmFsHwwFAjc5ZBQrAAIWEh8FBRRQcm9ncmFtcyAmIFJlc291cmNlcx8GZx8ABRRQcm9ncmFtcyAmIFJlc291cmNlcx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD04MB8IZx8JZx8KBQVfc2VsZh8LBRRQcm9ncmFtcyAmIFJlc291cmNlcx8MBQI4MGQUKwACFhIfBQUfU2FsZXMgSWRlYXMgJiBUdXJua2V5IFNvbHV0aW9ucx8GZx8ABR9TYWxlcyBJZGVhcyAmIFR1cm5rZXkgU29sdXRpb25zHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTgyHwhnHwlnHwoFBV9zZWxmHwsFI1NhbGVzIElkZWFzICZhbXA7IFR1cm5rZXkgU29sdXRpb25zHwwFAjgyZBQrAAIWEh8FBQhTZW1pbmFycx8GZx8ABQhTZW1pbmFycx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD04Mx8IZx8JZx8KBQVfc2VsZh8LBQhTZW1pbmFycx8MBQI4M2QUKwACFhIfBQUOQnJhbmQgSWRlbnRpdHkfBmcfAAUOQnJhbmQgSWRlbnRpdHkfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9MjYfCGcfCWcfCgUFX3NlbGYfCwUOQnJhbmQgSWRlbnRpdHkfDAUCMjYUKwADBQcwOjAsMDoxFCsAAhYSHwUFEEJyYW5kIEd1aWRlbGluZXMfBmcfAAUQQnJhbmQgR3VpZGVsaW5lcx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD00OB8IZx8JZx8KBQVfc2VsZh8LBRBCcmFuZCBHdWlkZWxpbmVzHwwFAjQ4ZBQrAAIWEh8FBRJMb2dvcyAmIFN0YXRpb25lcnkfBmcfAAUSTG9nb3MgJiBTdGF0aW9uZXJ5HwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTQ5HwhnHwlnHwoFBV9zZWxmHwsFEkxvZ29zICYgU3RhdGlvbmVyeR8MBQI0OWQUKwACFhIfBQUTVG9vbHMgJiBDYWxjdWxhdG9ycx8GZx8ABRNUb29scyAmIENhbGN1bGF0b3JzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI3HwhnHwlnHwoFBV9zZWxmHwsFE1Rvb2xzICYgQ2FsY3VsYXRvcnMfDAUCMjcUKwAPBUswOjAsMDoxLDE6MSwwOjEsMDoyLDA6MywwOjQsMDo1LDE6NSwwOjUsMDo2LDA6NywwOjgsMDo5LDA6MTAsMDoxMSwwOjEyLDA6MTMUKwACFhIfBQUfQWR2aXNvcnkgT25saW5lIEFjY291bnQgT3BlbmluZx8GZx8ABR9BZHZpc29yeSBPbmxpbmUgQWNjb3VudCBPcGVuaW5nHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIyMh8IZx8JZx8KBQVfc2VsZh8LBR9BZHZpc29yeSBPbmxpbmUgQWNjb3VudCBPcGVuaW5nHwwFAzIyMmQUKwACFhIfBQUgQnJva2VyYWdlIE9ubGluZSBBY2NvdW50IE9wZW5pbmcfBmcfAAUgQnJva2VyYWdlIE9ubGluZSBBY2NvdW50IE9wZW5pbmcfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjI0HwhnHwlnHwoFBV9zZWxmHwsFIEJyb2tlcmFnZSBPbmxpbmUgQWNjb3VudCBPcGVuaW5nHwwFAzIyNGQUKwACFhIfBQULQ2FsY3VsYXRvcnMfBmcfAAULQ2FsY3VsYXRvcnMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjI1HwhnHwlnHwoFBV9zZWxmHwsFC0NhbGN1bGF0b3JzHwwFAzIyNWQUKwACFhIfBQUOQ1JNIEludGVnYXRpb24fBmcfAAUOQ1JNIEludGVnYXRpb24fAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjI2HwhnHwlnHwoFBV9zZWxmHwsFDkNSTSBJbnRlZ2F0aW9uHwwFAzIyNmQUKwACFhIfBQUIRmVhdHVyZXMfBmcfAAUIRmVhdHVyZXMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjI3HwhnHwlnHwoFBV9zZWxmHwsFCEZlYXR1cmVzHwwFAzIyN2QUKwACFhIfBQUeSW52ZXN0bWVudCAmIFJlc2VhcmNoIEFuYWx5c2lzHwZnHwAFHkludmVzdG1lbnQgJiBSZXNlYXJjaCBBbmFseXNpcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMjkfCGcfCWcfCgUFX3NlbGYfCwUeSW52ZXN0bWVudCAmIFJlc2VhcmNoIEFuYWx5c2lzHwwFAzIyOWQUKwACFhIfBQUITGFzZXJBcHAfBmcfAAUITGFzZXJBcHAfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjMwHwhnHwlnHwoFBV9zZWxmHwsFCExhc2VyQXBwHwwFAzIzMGQUKwACFhIfBQUQTW9uZXlHdWlkZUJyb2tlch8GZx8ABRBNb25leUd1aWRlQnJva2VyHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzMR8IZx8JZx8KBQVfc2VsZh8LBRBNb25leUd1aWRlQnJva2VyHwwFAzIzMWQUKwACFhIfBQUNTW9uZXlHdWlkZVBybx8GZx8ABQ1Nb25leUd1aWRlUHJvHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzMh8IZx8JZx8KBQVfc2VsZh8LBQ1Nb25leUd1aWRlUHJvHwwFAzIzMmQUKwACFhIfBQULTW9ybmluZ3N0YXIfBmcfAAULTW9ybmluZ3N0YXIfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjMzHwhnHwlnHwoFBV9zZWxmHwsFC01vcm5pbmdzdGFyHwwFAzIzM2QUKwACFhIfBQUITmV0WCAzNjAfBmcfAAUITmV0WCAzNjAfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjM0HwhnHwlnHwoFBV9zZWxmHwsFCE5ldFggMzYwHwwFAzIzNGQUKwACFhIfBQUMVHJhZGUgUmV2aWV3HwZnHwAFDFRyYWRlIFJldmlldx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yMzUfCGcfCWcfCgUFX3NlbGYfCwUMVHJhZGUgUmV2aWV3HwwFAzIzNWQUKwACFhIfBQUNVkEgQ29tcGFyaXNvbh8GZx8ABQ1WQSBDb21wYXJpc29uHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTIzNh8IZx8JZx8KBQVfc2VsZh8LBQ1WQSBDb21wYXJpc29uHwwFAzIzNmQUKwACFhIfBQUQUG9ydGZvbGlvIEFjY2Vzcx8GZx8ABRBQb3J0Zm9saW8gQWNjZXNzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMzOB8IZx8JZx8KBQVfc2VsZh8LBRBQb3J0Zm9saW8gQWNjZXNzHwwFAzMzOGQUKwACFhIfBQUKQ29tcGxpYW5jZR8GZx8ABQpDb21wbGlhbmNlHwMFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTYfCGcfCWcfCgUFX3NlbGYfCwUKQ29tcGxpYW5jZR8MBQE2FCsABAUTMDowLDE6MCwwOjAsMDoxLDA6MhQrAAIWEh8FBRRNYW51YWxzICYgR3VpZGVsaW5lcx8GZx8ABRRNYW51YWxzICYgR3VpZGVsaW5lcx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yOR8IZx8JZx8KBQVfc2VsZh8LBRRNYW51YWxzICYgR3VpZGVsaW5lcx8MBQIyOWQUKwACFhIfBQUQTm90aWNlcyAmIEFsZXJ0cx8GZx8ABRBOb3RpY2VzICYgQWxlcnRzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTMwHwhnHwlnHwoFBV9zZWxmHwsFEE5vdGljZXMgJiBBbGVydHMfDAUCMzAUKwAEBQswOjAsMDoxLDA6MhQrAAIWEh8FBRFDb21wbGlhbmNlIEFsZXJ0cx8GZx8ABRFDb21wbGlhbmNlIEFsZXJ0cx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD01Mh8IZx8JZx8KBQVfc2VsZh8LBRFDb21wbGlhbmNlIEFsZXJ0cx8MBQI1MmQUKwACFhIfBQUSQ29tcGxpYW5jZSBOb3RpY2VzHwZnHwAFEkNvbXBsaWFuY2UgTm90aWNlcx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD01Mx8IZx8JZx8KBQVfc2VsZh8LBRJDb21wbGlhbmNlIE5vdGljZXMfDAUCNTNkFCsAAhYSHwUFCUJ1bGxldGlucx8GZx8ABQlCdWxsZXRpbnMfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9ODkfCGcfCWcfCgUFX3NlbGYfCwUJQnVsbGV0aW5zHwwFAjg5ZBQrAAIWEh8FBRVQb2xpY2llcyAmIFByb2NlZHVyZXMfBmcfAAUVUG9saWNpZXMgJiBQcm9jZWR1cmVzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTMxHwhnHwlnHwoFBV9zZWxmHwsFFVBvbGljaWVzICYgUHJvY2VkdXJlcx8MBQIzMWQUKwACFhIfBQUIQWR2aXNvcnkfBmcfAAUIQWR2aXNvcnkfAwUuL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjEuYXNweD9NZW51SWQ9Nx8IZx8JZx8KBQVfc2VsZh8LBQhBZHZpc29yeR8MBQE3FCsABgUTMDowLDA6MSwwOjIsMDozLDA6NBQrAAIWEh8FBQ9HZXR0aW5nIFN0YXJ0ZWQfBmcfAAUPR2V0dGluZyBTdGFydGVkHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTkwHwhnHwlnHwoFBV9zZWxmHwsFD0dldHRpbmcgU3RhcnRlZB8MBQI5MGQUKwACFhIfBQURUHJvZ3JhbSBPZmZlcmluZ3MfBmcfAAURUHJvZ3JhbSBPZmZlcmluZ3MfAwUvL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9OTEfCGcfCWcfCgUFX3NlbGYfCwURUHJvZ3JhbSBPZmZlcmluZ3MfDAUCOTEUKwAEBSswOjAsMTowLDA6MCwxOjAsMDowLDA6MSwwOjIsMToyLDA6MiwxOjIsMDoyFCsAAhYSHwUFG1BvcnRmb2xpbyBBZHZpc29yeSBTZXJ2aWNlcx8GZx8ABRtQb3J0Zm9saW8gQWR2aXNvcnkgU2VydmljZXMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzM1HwhnHwlnHwoFBV9zZWxmHwsFG1BvcnRmb2xpbyBBZHZpc29yeSBTZXJ2aWNlcx8MBQMzMzVkFCsAAhYSHwUFHFByZW1pZXIgUG9ydGZvbGlvIE1hbmFnZW1lbnQfBmcfAAUcUHJlbWllciBQb3J0Zm9saW8gTWFuYWdlbWVudB8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0zMzYfCGcfCWcfCgUFX3NlbGYfCwUcUHJlbWllciBQb3J0Zm9saW8gTWFuYWdlbWVudB8MBQMzMzZkFCsAAhYSHwUFGE1hbmFnZWQgV2VhbHRoIEFEVkFOVEFHRR8GZx8ABRhNYW5hZ2VkIFdlYWx0aCBBRFZBTlRBR0UfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MzM3HwhnHwlnHwoFBV9zZWxmHwsFGE1hbmFnZWQgV2VhbHRoIEFEVkFOVEFHRR8MBQMzMzdkFCsAAhYSHwUFBVRvb2xzHwZnHwAFBVRvb2xzHwMFLy9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTkyHwhnHwlnHwoFBV9zZWxmHwsFBVRvb2xzHwwFAjkyZBQrAAIWEh8FBRRUcmFpbmluZyAmIEVkdWNhdGlvbh8GZx8ABRRUcmFpbmluZyAmIEVkdWNhdGlvbh8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD05Mx8IZx8JZx8KBQVfc2VsZh8LBRRUcmFpbmluZyAmIEVkdWNhdGlvbh8MBQI5M2QUKwACFhIfBQUVR3Jvd2luZyBZb3VyIEJ1c2luZXNzHwZnHwAFFUdyb3dpbmcgWW91ciBCdXNpbmVzcx8DBS8vQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD05NB8IZx8JZx8KBQVfc2VsZh8LBRVHcm93aW5nIFlvdXIgQnVzaW5lc3MfDAUCOTRkFCsAAhYSHwUFCFJlc2VhcmNoHwZnHwAFCFJlc2VhcmNoHwMFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTgfCGcfCWcfCgUFX3NlbGYfCwUIUmVzZWFyY2gfDAUBOBQrAAUFDzA6MCwwOjEsMDoyLDA6MxQrAAIWEh8FBRtBc3NldCBBbGxvY2F0aW9uIFBvcnRmb2xpb3MfBmcfAAUbQXNzZXQgQWxsb2NhdGlvbiBQb3J0Zm9saW9zHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTI5Nh8IZx8JZx8KBQVfc2VsZh8LBRtBc3NldCBBbGxvY2F0aW9uIFBvcnRmb2xpb3MfDAUDMjk2ZBQrAAIWEh8FBRNJbnZlc3RtZW50IFJlc2VhcmNoHwZnHwAFE0ludmVzdG1lbnQgUmVzZWFyY2gfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9MjQ5HwhnHwlnHwoFBV9zZWxmHwsFE0ludmVzdG1lbnQgUmVzZWFyY2gfDAUDMjQ5FCsABAUTMDowLDE6MCwwOjAsMDoxLDA6MhQrAAIWEh8FBQRFVEZzHwZnHwAFBEVURnMfAwU8L0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjU3JlNTTz1FVEZfUkVTHwhnHwlnHwoFBV9zZWxmHwsFBEVURnMfDAUDMjU3ZBQrAAIWEh8FBRBNdXR1YWwgRnVuZCBOZXdzHwZnHwAFEE11dHVhbCBGdW5kIE5ld3MfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjYwHwhnHwlnHwoFBV9zZWxmHwsFEE11dHVhbCBGdW5kIE5ld3MfDAUDMjYwZBQrAAIWEh8FBRRSZXNlYXJjaCBTZWxlY3QgTGlzdB8GZx8ABRRSZXNlYXJjaCBTZWxlY3QgTGlzdB8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yNjEfCGcfCWcfCgUFX3NlbGYfCwUUUmVzZWFyY2ggU2VsZWN0IExpc3QfDAUDMjYxZBQrAAIWEh8FBRBJbnZlc3RtZW50IFRvb2xzHwZnHwAFEEludmVzdG1lbnQgVG9vbHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjIuYXNweD9NZW51SWQ9MjUwHwhnHwlnHwoFBV9zZWxmHwsFEEludmVzdG1lbnQgVG9vbHMfDAUDMjUwFCsABwUXMDowLDA6MSwwOjIsMDozLDA6NCwwOjUUKwACFhIfBQULQ2FsY3VsYXRvcnMfBmcfAAULQ2FsY3VsYXRvcnMfAwVBL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjI1JlJlZmVyZXI9UmVzZWFyY2gfCGcfCWcfCgUFX3NlbGYfCwULQ2FsY3VsYXRvcnMfDAUDMjUyZBQrAAIWEh8FBRNGSU5SQSBGdW5kIEFuYWx5emVyHwZnHwAFE0ZJTlJBIEZ1bmQgQW5hbHl6ZXIfAwU4L0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvQ29tbW9uLmFzcHg/Q29udGVudElkPTEwMjEyMjQfCGcfCWcfCgUFX3NlbGYfCwUTRklOUkEgRnVuZCBBbmFseXplch8MBQMyNTNkFCsAAhYSHwUFD01vcm5pbmdzdGFyIEFXUx8GZx8ABQ9Nb3JuaW5nc3RhciBBV1MfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjU0HwhnHwlnHwoFBV9zZWxmHwsFD01vcm5pbmdzdGFyIEFXUx8MBQMyNTRkFCsAAhYSHwUFH01vcm5pbmdzdGFyIFBvcnRmb2xpbyBTbmFwU2hvdCAfBmcfAAUfTW9ybmluZ3N0YXIgUG9ydGZvbGlvIFNuYXBTaG90IB8DBS0vV29ya3N0YXRpb24vU1NPL01TdGFyL1BvcnRmb2xpb1NuYXBzaG90LmFzcHgfCGcfCWcfCgUFX3NlbGYfCwUfTW9ybmluZ3N0YXIgUG9ydGZvbGlvIFNuYXBTaG90IB8MBQMyNTVkFCsAAhYSHwUFDlN0b2NrIFNjcmVlbmVyHwZnHwAFDlN0b2NrIFNjcmVlbmVyHwMFGi9Xb3Jrc3RhdGlvbi9TY3JlZW5lci5odG1sHwhnHwlnHwoFBV9zZWxmHwsFDlN0b2NrIFNjcmVlbmVyHwwFAzI1NmQUKwACFhIfBQUSVkEgQ29tcGFyaXNvbiBUb29sHwZnHwAFElZBIENvbXBhcmlzb24gVG9vbB8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yNzIfCGcfCWcfCgUFX3NlbGYfCwUSVkEgQ29tcGFyaXNvbiBUb29sHwwFAzI3MmQUKwACFhIfBQUTTWFya2V0IENvbW1lbnRhcmllcx8GZx8ABRNNYXJrZXQgQ29tbWVudGFyaWVzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTI2NR8IZx8JZx8KBQVfc2VsZh8LBRNNYXJrZXQgQ29tbWVudGFyaWVzHwwFAzI2NRQrAAcFFzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1FCsAAhYSHwUFFURhaWx5IE1hcmtldCBCcmllZmluZx8GZx8ABRVEYWlseSBNYXJrZXQgQnJpZWZpbmcfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjY2HwhnHwlnHwoFBV9zZWxmHwsFFURhaWx5IE1hcmtldCBCcmllZmluZx8MBQMyNjZkFCsAAhYSHwUFH01hcmtldCBCdWxsZXRpbnMgJiBXaGl0ZSBQYXBlcnMfBmcfAAUfTWFya2V0IEJ1bGxldGlucyAmIFdoaXRlIFBhcGVycx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yNjcfCGcfCWcfCgUFX3NlbGYfCwUfTWFya2V0IEJ1bGxldGlucyAmIFdoaXRlIFBhcGVycx8MBQMyNjdkFCsAAhYSHwUFFk1vbnRobHkgTWFya2V0IE1vbml0b3IfBmcfAAUWTW9udGhseSBNYXJrZXQgTW9uaXRvch8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yNjgfCGcfCWcfCgUFX3NlbGYfCwUWTW9udGhseSBNYXJrZXQgTW9uaXRvch8MBQMyNjhkFCsAAhYSHwUFGFF1YXJ0ZXJseSBNYXJrZXQgT3V0bG9vax8GZx8ABRhRdWFydGVybHkgTWFya2V0IE91dGxvb2sfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjY5HwhnHwlnHwoFBV9zZWxmHwsFGFF1YXJ0ZXJseSBNYXJrZXQgT3V0bG9vax8MBQMyNjlkFCsAAhYSHwUFD1F1YXJ0ZXJseSBSZWNhcB8GZx8ABQ9RdWFydGVybHkgUmVjYXAfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjcwHwhnHwlnHwoFBV9zZWxmHwsFD1F1YXJ0ZXJseSBSZWNhcB8MBQMyNzBkFCsAAhYSHwUFH1RoaXJkIFBhcnR5IE1hcmtldCBDb21tZW50YXJpZXMfBmcfAAUfVGhpcmQgUGFydHkgTWFya2V0IENvbW1lbnRhcmllcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0yNzEfCGcfCWcfCgUFX3NlbGYfCwUfVGhpcmQgUGFydHkgTWFya2V0IENvbW1lbnRhcmllcx8MBQMyNzFkFCsAAhYSHwUFFEVkdWNhdGlvbiAmIFRyYWluaW5nHwZnHwAFFEVkdWNhdGlvbiAmIFRyYWluaW5nHwMFLi9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIxLmFzcHg/TWVudUlkPTkfCGcfCWcfCgUFX3NlbGYfCwUURWR1Y2F0aW9uICYgVHJhaW5pbmcfDAUBORQrAAcFJzA6MCwwOjEsMDoyLDE6MiwwOjIsMDozLDA6NCwwOjUsMDo2LDE6NhQrAAIWEh8FBRVDbGljayAnbiBQbGF5IExpYnJhcnkfBmcfAAUVQ2xpY2sgJ24gUGxheSBMaWJyYXJ5HwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIyLmFzcHg/TWVudUlkPTExMx8IZx8JZx8KBQVfc2VsZh8LBRVDbGljayAnbiBQbGF5IExpYnJhcnkfDAUDMTEzFCsACAUzMDowLDA6MSwxOjEsMDoxLDA6MiwxOjIsMDoyLDE6MiwwOjIsMDozLDA6NCwwOjUsMDo2FCsAAhYSHwUFEUFkdmlzb3J5IFNlcnZpY2VzHwZnHwAFEUFkdmlzb3J5IFNlcnZpY2VzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTEyMR8IZx8JZx8KBQVfc2VsZh8LBRFBZHZpc29yeSBTZXJ2aWNlcx8MBQMxMjFkFCsAAhYSHwUFD0FyY2hpdmVkIEV2ZW50cx8GZx8ABQ9BcmNoaXZlZCBFdmVudHMfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MTIyHwhnHwlnHwoFBV9zZWxmHwsFD0FyY2hpdmVkIEV2ZW50cx8MBQMxMjJkFCsAAhYSHwUFClNtYXJ0V29ya3MfBmcfAAUKU21hcnRXb3Jrcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMjUfCGcfCWcfCgUFX3NlbGYfCwUKU21hcnRXb3Jrcx8MBQMxMjVkFCsAAhYSHwUFD01vbmV5R3VpZGVTdWl0ZR8GZx8ABQ9Nb25leUd1aWRlU3VpdGUfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9MjQ4HwhnHwlnHwoFBV9zZWxmHwsFD01vbmV5R3VpZGVTdWl0ZR8MBQMyNDhkFCsAAhYSHwUFH01vcm5pbmdzdGFyIEFkdmlzb3IgV29ya3N0YXRpb24fBmcfAAUfTW9ybmluZ3N0YXIgQWR2aXNvciBXb3Jrc3RhdGlvbh8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMjYfCGcfCWcfCgUFX3NlbGYfCwUfTW9ybmluZ3N0YXIgQWR2aXNvciBXb3Jrc3RhdGlvbh8MBQMxMjZkFCsAAhYSHwUFCE5ldFggMzYwHwZnHwAFCE5ldFggMzYwHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTEyNx8IZx8JZx8KBQVfc2VsZh8LBQhOZXRYIDM2MB8MBQMxMjdkFCsAAhYSHwUFHFRpbWVzYXZpbmcgVG9vbHMgJiBSZXNvdXJjZXMfBmcfAAUcVGltZXNhdmluZyBUb29scyAmIFJlc291cmNlcx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMjgfCGcfCWcfCgUFX3NlbGYfCwUcVGltZXNhdmluZyBUb29scyAmIFJlc291cmNlcx8MBQMxMjhkFCsAAhYSHwUFE0NvbXBsaWFuY2UgVHJhaW5pbmcfBmcfAAUTQ29tcGxpYW5jZSBUcmFpbmluZx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMTQfCGcfCWcfCgUFX3NlbGYfCwUTQ29tcGxpYW5jZSBUcmFpbmluZx8MBQMxMTRkFCsAAhYSHwUFEEd1aWRlcyAmIE1hbnVhbHMfBmcfAAUQR3VpZGVzICYgTWFudWFscx8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMTYfCGcfCWcfCgUFX3NlbGYfCwUQR3VpZGVzICYgTWFudWFscx8MBQMxMTZkFCsAAhYSHwUFFEpvYiBBaWRzICYgRVogR3VpZGVzHwZnHwAFFEpvYiBBaWRzICYgRVogR3VpZGVzHwMFMC9Ccm9rZXJEZWFsZXJDZW50ZXIvUG9ydGFsL1RpZXIzLmFzcHg/TWVudUlkPTExNx8IZx8JZx8KBQVfc2VsZh8LBRRKb2IgQWlkcyAmIEVaIEd1aWRlcx8MBQMxMTdkFCsAAhYSHwUFFVRlY2hub2xvZ3kgJiBTZWN1cml0eR8GZx8ABRVUZWNobm9sb2d5ICYgU2VjdXJpdHkfAwUwL0Jyb2tlckRlYWxlckNlbnRlci9Qb3J0YWwvVGllcjMuYXNweD9NZW51SWQ9Mjg4HwhnHwlnHwoFBV9zZWxmHwsFFVRlY2hub2xvZ3kgJiBTZWN1cml0eR8MBQMyODhkFCsAAhYSHwUFFlRyYWluaW5nICYgRGV2ZWxvcG1lbnQfBmcfAAUWVHJhaW5pbmcgJiBEZXZlbG9wbWVudB8DBTAvQnJva2VyRGVhbGVyQ2VudGVyL1BvcnRhbC9UaWVyMy5hc3B4P01lbnVJZD0xMTkfCGcfCWcfCgUFX3NlbGYfCwUWVHJhaW5pbmcgJiBEZXZlbG9wbWVudB8MBQMxMTlkFCsAAhYOHwAFMCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOx8FBTAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsfCGcfCWcfDAUDMTM3HwZnHwoFBV9zZWxmZGQCKQ9kFgICAw8QZA8WAWYWARAFGS0tIFNlbGVjdCBhIFF1aWNrIExpbmsgLS0FATBnZGQCLQ9kFgICAw8WAh8BaBYCAgUPZBYCAgUPFgIfAWcWAgIFDzwrABECAA8WAh4IUGFnZVNpemUCFGQBEBYAFgAWAGQCLw8WAh4EaHJlZgUnLi4vUG9ydGFsL0NvbW1vbi5hc3B4P0NvbnRlbnRJZD0yMDAwMDE0ZBgCBTNjdGwwMCRDb250ZW50UGxhY2VIb2xkZXIxJHVjVmlld0FsbFBvcnRsZXQkZ3ZEZXRhaWwPZ2QFDmN0bDAwJG1haW5NZW51Dw9kBQRIb21lZOu/pjeKMR4cMlFsO85kQRlleeXa3gKfGnKEV4yIPyBM" />
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
		<td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Home" id="ctl00_mainMenun0"><table class="menuitems ctl00_mainMenu_4" cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td style="white-space:nowrap;"><a class="ctl00_mainMenu_1 menuitems ctl00_mainMenu_3" href="/BrokerDealerCenter/Portal/Home.aspx?MenuId=1" target="_self" style="border-style:none;font-size:1em;">Home</a></td>
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
<span id="ctl00_BreadCrumb1_SiteMapPathNavigation"><a href="#ctl00_BreadCrumb1_SiteMapPathNavigation_SkipLink"><img alt="Skip Navigation Links" height="0" width="26" src="../WebResource_SkipNav.gif" style="border-width:0px;" /></a><a id="ctl00_BreadCrumb1_SiteMapPathNavigation_SkipLink"></a></span>
 
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
                        
                            <!-- cobbler: 29338253 -->
<link type="text/css" rel="styleSheet" href="../resources/1064410.css">
<script type="text/javascript" language="javascript" src="../resources/1060060.js"></script>
<script type="text/javascript" language="javascript" src="../resources/6959380.js"></script>
<script type="text/javascript" src="../resources/1062514.js"></script><!-- jquery.scrollTo -->
<link href="../resources/6959158.css" rel="stylesheet" media="print" type="text/css">
<style> 
#containerOfStuff{
	width:860px;	
}
#containerOfStuff a{
	text-shadow:0 1px 0 #ffffff; 
}
.regularLink a {
	text-decoration:none;
	color:#3366cc;
}
.regularLink a:focus, a:hover {
	text-decoration:underline;
	color:#029AFD;
}
h2{
	color:#81aa5e;
}
.large{
	color:#5887B0;
	font-weight:bold;
	font-size:16px;
}
.largeFinal {
    color:#5887B0;
    font-size:17px;
    font-weight:bold;
    padding:20px;
}
h3{
	color:#D48744;	
}
p,ol li,div{
	color:#4d4e67;
}
.courseList{
	position:relative;
	top:0;
	left:0;
	width:500px;
	border:1px solid #5f87cb;;
	font-size:18px;
	font-weight:bold;
	padding:10px 40px 0 10px;
	background:#D9E3EF;
	line-height:2em;
	margin-left:30px;
}
.courseList div{
	font-size:14px;
	line-height:1.2em;
	font-weight:normal;
	padding:6px 40px 6px 12px;
	margin:0 -40px 0 -10px;
	background:#F6F6F6; 
	color:#669;
	border-bottom:1px solid #fff;
	border-top:1px solid transparent;
}
.courseList div:hover{
	background:#EFEFEF;
	color:#339;
}
.titleTable{
	color: #4c7bb1;
}
div.greenCheck{
	background:url(../resources/6872721.png) no-repeat right center #e4e3e3;	
	color:#039;
	border-bottom:1px solid #fff;
	border-top:1px solid transparent;
}
div.greenCheck:hover{
	background:url(../resources/6872721.png) no-repeat right center #EFEFEF;	
	color:#039;
}
.fR,div.listHeader fR{
	float:right;	
}
#cHolder{
	border:3px solid #4d4e67;
	font-size:13px;
	color:#4d4e67;
	font-weight:normal;
	padding:10px;
	line-height:1.4em;
	position:relative;
	left:-2000px;	
}
#cHolder div{
	margin:2px 40px 2px 20px;
}
 
.formWrap{
	background:#edf0f2;	
	padding: 10px 0 20px;
	border:1px solid #585d60;
}
.fLabel{
	width:175px;
	font-size:0.8em;
	text-align:right;
	display:inline-block;
	padding-right:5px;
}
.fInput{
	margin-top:10px;
}
.AnnualComp{
	color:#82A067;
    font-size:12px;
	position:relative;
	top:53px;	
}
.lCol{
	margin-right:20px;
	width:500px;
	float:left;
}
.rCol{
    bottom:42px;
    margin-left:550px;
    position:relative;
    width:240px;
}
.rColButton{
    margin-left:550px;
    width:240px;
}
.req{
	color:red;
	font-size:0.8em;
	margin-left:6px;
	display:none;
}
#ceContact{
	position:absolute;
	top:-60px;
	left:623px;
}
 
#pContainer{
	width:760px;
	background-color:#fff;
}
.navButton{
    background:none repeat scroll 0 0 #ECF1E8;
    border:2px solid #81AA5E;
    color:#81AA5E !important;
    display:inline-block;
    font-weight:bold;
    padding:4px;
	text-decoration:none;	
    text-align:center;
    width:130px;
}
.navButton:hover{
	background:#e8eef1;
	border:2px solid #668da3;
	text-decoration:none;
    color:#668da3 !important;	
}
#gotoStep2{
	position:relative;
}
table.gridtable {
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 4px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 4px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
 
 
 
<script type="text/javascript"> 
function PrintElem(elem){Popup($(elem).html());}
 
function Popup(data){
        var mywindow = window.open('', 'firmCEprint', 'height=900,width=800');
        mywindow.document.write('<html><head><title>Firm Element CE</title>');
        mywindow.document.write('<link rel="stylesheet" href="../resources/6959158.css" type="text/css" />');
        mywindow.document.write("<style>\n");
		
 
        mywindow.document.write("#cHolder{border:0px solid #fff !important;}\n");
        mywindow.document.write("</style>\n");
        mywindow.document.write('</head><body >');
        mywindow.document.write(data);
        mywindow.document.write('</body></html>');
        mywindow.document.close();
        mywindow.print();
        return true;
}
 
function toProperCase(s){
	return s.toLowerCase().replace( /\b((m)(a?c))?(\w)/g,function($1,$2,$3,$4,$5){
		if($2){
			 return $3.toUpperCase()+$4+$5.toUpperCase();
		}
		return $1.toUpperCase(); 
	});
}
 
jQuery.validator.addMethod("phoneUS", function(phone_number, element){
    phone_number=phone_number.replace(/\s+/g, ""); 
	return this.optional(element)||phone_number.length>9&&phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
},"Please specify a valid phone number");
 
 
$(document).ready(function(){
	var courseCount,courseList,creditCount,payCourseCount;
	$(".courseList div").attr("title","click to add/remove course").click(function(){
		$(this).toggleClass("greenCheck");
		courseCount=0;payCourseCount=0;creditCount=0;
		var tempCredit=0;
		selectedList="<div><span style='float:right;color:#842b37;text-decoration:underline;font-weight:bold;position:relative;left:-42px;'>Credits:</span><span style='color:#842b37;text-decoration:underline;font-weight:bold;position:relative;left:42px;'>Selected Courses:</span><br /><br />"
		$("div.greenCheck").each(function(){
			courseCount++;
			tempCredit=0;
			tempCredit=parseFloat($(this).find("span").html(),2);
			selectedList+="<div style='border-top: 1px dotted #727398;margin: 2px 40px;padding: 3px 12px 0;'><span style='float:right;'>"+tempCredit.toFixed(1)+"</span>";
			selectedList+=$(this).contents().filter(function(){return this.nodeType == 3;}).text();
			selectedList+="</div>";
			creditCount+=tempCredit;
			if(tempCredit>0){payCourseCount++;}			
		})
		if(courseCount>0){$("#courseTabs").tabs("enable",3);}
		selectedList+="<div style='margin:30px 50px 0 50px;border:0;'><p>To have us apply for CFP credits on your behalf, please print this document along with the Course Completion Certificate for each of the above-listed course(s) for which you are applying for credit(s). Mail this document and the Course Completion Certificate(s) with a check made payable to:</p><table border='0' width='100%' cellspacing='0' cellpadding='0'><tr><td align='center'><table border='0' cellspacing='0' cellpadding='0'><tr><td align='left'>Cetera Financial Group<br />Attn: CE Department<br />Cumberland Center II<br />3100 Cumberland Blvd. SE<br />Suite 1040<br />Atlanta, GA 30339</td></tr></table></td></tr></table><p>Your CFP credit application will be filed electronically with the Board on the 15th or the last day of the month, upon receipt of your check. The CFP Board will notify you directly when they apply the Cetera course credits to your account.</p></div>";
		$("#cHolder").css("left","0").html(selectedList).prepend("<img src="+logo+" border='0' /><br /><br /><span style='color:#5887B0;font-size:17px;font-weight:bold;'>CFP Credit Application Form</span><br /><br /><div style='margin-left:30px;'><table width='90%' border='0' cellspacing='0' cellpadding='0'><tr><td><table border='0' cellspacing='0' cellpadding='0'><tr><td>"+toProperCase($("#name").val())+"<br />"+toProperCase($("#street").val())+"<br />"+toProperCase($("#city").val())+",&nbsp;"+$("#state").val().toUpperCase()+"&nbsp;&nbsp;"+$("#zip").val()+"<br />"+$("#phone").val()+"<br />"+$("#email").val()+"<br />XXX-XX-"+$("#last4").val()+"</td></tr></table></td><td align='right'><table border='0' cellspacing='0' cellpadding='0'><tr><td align='right'>Total Courses:</td><td>&nbsp;<b><span style='color:#842b37;'>"+courseCount+"</span></td></tr><tr><td align='right'>Total Credits:</td><td>&nbsp;<b><span style='color:#842b37;'>"+creditCount.toFixed(1)+"</span></b></td></tr><tr><td align='right'>Total Cost:</td><td>&nbsp;<b><span style='color:#842b37;'>$"+(10.0*payCourseCount)+"</span>.<span style='font-size:0.7em;position:relative;top:-3px;color:#842b37;'>00</span></b></td></tr></table></td></tr></table></div><br /><br style='clear:both;' />&nbsp;");
	});
	
	$("#aboutYou").validate({
		rules:{
			name:{required:true},
			street:{required:true},
			city:{required:true},
			state:{required:true},
			zip:{required:true},
			phone:{required:true,phoneUS:true},
			email:{required:true,email:true},
			last4:{required:true,digits:true,minlength:4,maxlength:4}
    	},
		messages:{
			name:"<span class='req'>required</span>",
			street:"<span class='req'>required</span>",
			city:"<span class='req'>required</span>",
			state:"<span class='req'>required</span>",
			zip:"<span class='req'>required</span>",
			phone:"<span class='req'>A valid phone number is required</span>",
			email:"<span class='req'>required</span>",
			last4:"<span class='req'>required - (last 4 digits only)</span>"
    	}
	});
	$("#pContainer").hide();
    $("#bButton").hide();
	$("#tabs").tabs();
	$("#courseTabs").tabs({
    	select:function(event, ui){
        	var isValid =$("#aboutYou").validate().form();
			if(!isValid){
				$(window).scrollTo({top:'630px',left:'0px'},800);
			}
       	 	return isValid;
    	}
	});
	$("#courseTabs").tabs("option","disabled",[1,2,3,4,5,6,7]);
	$('#gotoAgenda').click(function(){$("#tabs").tabs('select',1);});
	$('#gotoSpeakers').click(function(){$("#tabs").tabs('select',2);});
	$('#gotoEvents').click(function(){$("#tabs").tabs('select',3);});
	$('#gotoExhibitors').click(function(){$("#tabs").tabs('select',4);});
	$('#gotoHotel').click(function(){$("#tabs").tabs('select',5);});
	$('#gotoFees').click(function(){$("#tabs").tabs('select',6);});
	$('#gotoFAQs').click(function(){$("#tabs").tabs('select',7);});
	$('#gotoFees2').click(function(){$("#tabs").tabs('select',6);});
	$('#gotoFees3').click(function(){$("#tabs").tabs('select',6);});	
	$(":input").blur(function(){
		if(this.id!="state"){
			if(this.id!="email"){
				this.value=toProperCase(this.value);
			}
		}else{
			this.value=this.value.toUpperCase();
		}
	});
 
	$('#gotoStep2').click(function(){
		var showIt=$("#aboutYou").validate().form();
		if(showIt){
			$("#courseTabs").tabs("enable",1);
			$("#courseTabs").tabs("enable",2);
			$("#courseTabs").tabs('select',1);
			$(window).scrollTo({top:'630px',left:'0px'},800);
 
		}else{
			$("#courseTabs").tabs("option","disabled",[1,2,3]);
			$(".req").show();
			$(window).scrollTo({top:'630px',left:'0px'},800);
		}
	});
 
	$('#gotoStep3').click(function(){
		$("#courseTabs").tabs('select',2);
		$(window).scrollTo({top:'630px',left:'0px'},800);
	});
	$('#gotoStep4').click(function(){
		var courseCount=0;
		$("div.greenCheck").each(function(){
			courseCount++;
		});
		if(courseCount>0){
			$("#courseTabs").tabs('select',3);
			$(window).scrollTo({top:'630px',left:'0px'},800);
			return true;
		}else{
			alert("You must select at least one course to continue.");
			return false;
		}
	});
 
	$('#pButton, #pButton2').click(function(){
		PrintElem('#cHolder');
    	return false;
	});
});
</script>
</form>
<div style="padding-bottom:10px"><img src='../resources/29439771.jpg' border="0"></div>
<div id="containerOfStuff" class="ui-corner-all">
    <div id="tabs">
		<ul class="doNotPrint">
			<li><a href="#tabs-1">Join us in New Orleans!</a></li>
			<li><a href="#tabs-2">Agenda</a></li>
			<li><a href="#tabs-3">Speakers</a></li>
			<li><a href="#tabs-4">Events</a></li>
			<li><a href="#tabs-5">Exhibitors</a></li>
			<li><a href="#tabs-6">Hotel and Travel</a></li>
			<li><a href="#tabs-7">Fees</a></li>
			<li><a href="#tabs-8">FAQs</a></li>
		</ul>
		<div id="tabs-1" class="doNotPrint">
			<h2>Join us in New Orleans!</h2>
			<div class="lCol">
				<p>EXPLORE 2013 will be held at the Hyatt Regency New Orleans May 21-23 and is an event you don't want to miss!</p>
				<p>Commit to growing your financial services practice with the valuable information you'll learn at EXPLORE.</p>
                <p>For three days, enjoy top-rated keynote speakers, eye-opening breakout sessions, fantastic special events and endless networking opportunities with our exhibitors and your fellow Cetera Financial Specialists.</p>
			</div>
			<div class="rCol" style="text-align:center;">
            	<!--
                <div class="large">PlaceHolder Column</div>
                <img src="../resources/6982049.png" border="0" />
				<br /><br />
                -->
				<a href="https://www.regisys.com/GE13/" target="_blank"><img src="../resources/29500712.png" border="0"></a><br><br>
                <a href="https://resweb.passkey.com/Resweb.do?mode=welcome_ei_new&eventID=9706290" target="_blank"><img src="../resources/29502333.png" border="0"></a>
			</div>
			<br style="clear:both;">&nbsp;
			<br>&nbsp;
		</div>
		<div id="tabs-2">
			<h2>Agenda</h2>
			<div class="lCol">
			<p>At EXPLORE Las Vegas 2012, we had over 40 sessions in 3 tracks on 4 subjects. This year's agenda will follow the same format and promises to be even more engaging and influential to your practice than last year.</p>
			<p>Join us for sessions that are tailored to your level of knowledge in different areas of financial services. Choose to attend foundational, intermediate or advanced classes on products, practice management, technology and economic/regulatory subjects.</p>
			<p>EXPLORE New Orleans 2013 will begin at 8:00 a.m. local time on Tuesday, May 21, and will end at 12:00 p.m.* local time on Thursday, May 23.</p>
			<p>The list of sessions will be available in the upcoming weeks. We will alert you via email when it is posted.</p>
			<div class="ui-widget">
				<div style="margin-top:20px;padding:0pt;font-size:0.7em;" class="ui-state-highlight ui-corner-all">
					<p><span style="float:left;margin-right:0.3em;margin-top:-3px;" class="ui-icon ui-icon-comment"></span>Subject to change</p>
				</div>
			</div>
			</div>
			<div class="rCol" style="text-align:center;">
				<a href="https://www.regisys.com/GE13/" target="_blank"><img src="../resources/29500712.png" border="0"></a><br><br>
                <a href="https://resweb.passkey.com/Resweb.do?mode=welcome_ei_new&eventID=9706290" target="_blank"><img src="../resources/29502333.png" border="0"></a>
			</div>
			<br style="clear:both;">&nbsp;
			<br>&nbsp;
		</div>
		<div id="tabs-3">
			<h2>Speakers</h2>
			<div class="lCol">
				<p>We are pleased to announce that back by popular demand, Andy Friedman is confirmed as a keynote speaker for EXPLORE New Orleans 2013. If you liked Andy last year, you will love him this year post election!</p>
				<p>More information on our additional keynote speakers will be made available in the upcoming weeks. We will alert you by email when it is posted.</p>
			</div>
			<div class="rCol" style="text-align:center;">
				<a href="https://www.regisys.com/GE13/" target="_blank"><img src="../resources/29500712.png" border="0"></a><br><br>
                <a href="https://resweb.passkey.com/Resweb.do?mode=welcome_ei_new&eventID=9706290" target="_blank"><img src="../resources/29502333.png" border="0"></a>
			</div>
			<br style="clear:both;">&nbsp;
			<br>&nbsp;
		</div>
		<div id="tabs-4">
			<h2>Events</h2>
			<div class="lCol">
				<p>This year's special events will be themed in true Big Easy style...literally! We will alert you via email when more information is posted.</p>
			</div>
			<div class="rCol" style="text-align:center;">
				<a href="https://www.regisys.com/GE13/" target="_blank"><img src="../resources/29500712.png" border="0"></a><br><br>
                <a href="https://resweb.passkey.com/Resweb.do?mode=welcome_ei_new&eventID=9706290" target="_blank"><img src="../resources/29502333.png" border="0"></a>
			</div>
			<br style="clear:both;">&nbsp;
			<br>&nbsp;
		</div>
		<div id="tabs-5">
			<h2>Exhibitors</h2>
			<div class="lCol">
				<p>The exhibitors at EXPLORE New Orleans 2013 have been selected by your home office staff as the partners who will bring the most value to your financial services practice.</p>
				<p>The exhibitor list will be available shortly. We will alert you via email when it is posted.</p>
			</div>
			<div class="rCol" style="text-align:center;">
				<a href="https://www.regisys.com/GE13/" target="_blank"><img src="../resources/29500712.png" border="0"></a><br><br>
                <a href="https://resweb.passkey.com/Resweb.do?mode=welcome_ei_new&eventID=9706290" target="_blank"><img src="../resources/29502333.png" border="0"></a>
			</div>
			<br style="clear:both;">&nbsp;
			<br>&nbsp;
		</div>
		<div id="tabs-6">
			<h2>Hotel and Travel</h2>
			<div class="lCol">
				<p>The host hotel and venue for EXPLORE New Orleans 2013 is <a href="https://resweb.passkey.com/Resweb.do?mode=welcome_ei_new&eventID=9706290" target="_blank">Hyatt New Orleans</a>. The closest airport is Louis Armstrong International Airport (MSY). Cab fare from the airport to the Hyatt is approximately $33.</p>
				<p>We have negotiated special room rate of $219 per night for your stay at Hyatt New Orleans. The last day to book your hotel room at this rate is April 26, 2013. Group rate is quoted exclusive of applicable state and local taxes (which are currently 13% plus $3 occupancy per room per night) or applicable service, or hotel specific fees in effect at the time of the meeting and subject to change.</p>
				<p>Reserve your room online by clicking on the link above, or by calling Hyatt New Orleans central reservation department at 888 421.1442 and mention you are a Cetera Financial Specialists conference attendee.</p>
				<p>To book or upgrade your room to a suite, you must contact the reservation department directly, stating you are part of the Cetera Financial Specialists room block. Suites are subject to availability.</p>
				<p>You are responsible for booking your own hotel room. You are also responsible for all your lodging and travel expenses. To ensure the utmost convenience and to take advantage of the full EXPLORE experience, we highly recommend you secure your accommodations as soon as possible.
 
</p>
			</div>
			<div class="rCol" style="text-align:center;">
				<a href="https://www.regisys.com/GE13/" target="_blank"><img src="../resources/29500712.png" border="0"></a><br><br>
                <a href="https://resweb.passkey.com/Resweb.do?mode=welcome_ei_new&eventID=9706290" target="_blank"><img src="../resources/29502333.png" border="0"></a>
			</div>
			<br style="clear:both;">&nbsp;
			<br>&nbsp;
		</div>
		<div id="tabs-7">
			<h2>Fees</h2>
			<div class="lCol">
				<table class="gridtable">
					<tr>
						<th></th><th>Early Bird Rate (December 17 - February 19, 2013)</th><th>Regular Rate (February 20 -April 26, 2013)</th>
					</tr>
					<tr>
						<td>Financial Advisor</td><td>$499</td><td>$649</td>
					</tr>
					<tr>
						<td>Client Service Associate</td><td>$349</td><td>$499</td>
					</tr>
					<tr>
						<td>Social Event Guest</td><td>$299</td><td>$299</td>
					</tr>
				</table><br><br>
                <div class="large">This year, we will not be able to accept any on-site registrations. Please plan accordingly.</div>
                <p>Payment by credit card will be accepted only via MasterCard or Visa credit card. All payments must be made in full by April 26, 2013. The fees provided on the grid above for the Financial Advisor and Client Service Associate include admission to educational sessions, handout materials, scheduled events and receptions, meals and refreshment breaks.</p>
				<div class="large">Cancellation Policy</div>
                <p>In order to deliver a first-class meeting for all of our Financial Advisors, cancellation requests must be received March 31, 2013, to be refunded in full. Requests for cancellations received from April 1, 2013, through April 30, 2013 will be refunded at only 50%. There will be no refunds for cancellations received after April 30, 2013.</p>
                <p>If you need to cancel, you must call 845 439.3887 and ask for the Cetera Financial Specialists Account Representative. Please do not contact your internal or Regional Planning Specialist or the Genworth staff in Schaumburg.<br><strong>Cancellation requests received via email, fax or phone by any member of the Schaumburg staff will not be honored.</strong></p>
			</div>
			<div class="rCol" style="text-align:center;">
				<a href="https://www.regisys.com/GE13/" target="_blank"><img src="../resources/29500712.png" border="0"></a><br><br>
                <a href="https://resweb.passkey.com/Resweb.do?mode=welcome_ei_new&eventID=9706290" target="_blank"><img src="../resources/29502333.png" border="0"></a>
			</div>
			<br style="clear:both;">&nbsp;
			<br>&nbsp;
		</div>
		<div id="tabs-8">
			<h2>FAQs</h2>
			<div class="lCol">
				<div class="large">Can anyone else attend EXPLORE with me?</div>
                <p>Yes, we encourage you to bring your office support staff, family member or friends to EXPLORE. All guests will need to pick up a name badge at the registration desk when EXPLORE begins. To see the fees for different types of attendees, click <a href="#" id="gotoFees" class="regularLink" style="color:#029afd !important;">here</a>.</p>
				<div class="large">What is the fee to attend EXPLORE?</div>
                <p>To see the fees for different types of attendees, click <a href="#" id="gotoFees2" class="regularLink" style="color:#029afd !important;">here</a>.</p>
				<div class="large">What sessions are being offered this year?</div>
                <p>To see the agenda for EXPLORE New Orleans 2013, click <a href="#" id="gotoAgenda" class="regularLink" style="color:#029afd !important;">here</a>.</p>
                <div class="large">How do I earn continuing education credits at EXPLORE?</div>
                <p>All continuing education hours will be awarded by individual course. Final hours for all sessions will be announced at the convention.</p>
                <p>In order to receive credits, <strong>you must sign in each morning of the convention in addition to completing an evaluation form for each session you attend</strong>. If we do not have a live signature, no credit will be awarded. No exceptions will be granted.</p>
                <div class="large">What social events are planned for EXPLORE?</div>
                <p>To see the different social events, click <a href="#" id="gotoEvents" class="regularLink" style="color:#029afd !important;">here</a>.</p>
                <div class="large">What is the dress code for EXPLORE?</div>
                <p>Conference and session attire is business casual. Please note that temperatures often vary significantly in breakout rooms, so plan to bring a sweater or jacket with you to sessions, or dress in layers.</p>
                <div class="large">What kind of weather can I expect in New Orleans in May?</div>
                <p>The average high temperature is 87 degrees Fahrenheit, and the average low temperature is 69 degrees Fahrenheit.</p>
                <div class="large">What if I have registered for EXPLORE but need to make changes to or cancel that registration?</div>
                <p>To make changes to your conference registration, call 845 439.3887 and ask for the Cetera Financial Specialists Account Representative. Please note that this is a third-party vendor and is not the Schaumburg office. For information on the cancellation policy for conference registration, click <a href="#" id="gotoFees3" class="regularLink" style="color:#029afd !important;">here</a>.</p>
                <p>To make changes to your hotel booking, please contact the Hyatt New Orleans  directly at 888 421.1442 and have your confirmation number handy. For information on the cancellation policy for the hotel, click <a href="#" id="gotoHotel" class="regularLink" style="color:#029afd !important;">here</a>.</p>
			</div>
			<div class="rCol" style="text-align:center;">
				<a href="https://www.regisys.com/GE13/" target="_blank"><img src="../resources/29500712.png" border="0"></a><br><br>
                <a href="https://resweb.passkey.com/Resweb.do?mode=welcome_ei_new&eventID=9706290" target="_blank"><img src="../resources/29502333.png" border="0"></a>
			</div>
			<br style="clear:both;">&nbsp;
			<br>&nbsp;
		</div>
	</div>
</div>
<br style="clear:both;">
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
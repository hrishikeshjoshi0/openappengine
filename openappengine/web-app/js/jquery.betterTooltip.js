
$(function()
{
  var hideDelay = 500;  
  var currentID;
  var hideTimer = null;

  // One instance that's reused to show info for the current person
  var container = $('<div id="toolTipContainer" class="tooltip">'
      + '</div>');

  $('body').append(container);

  $('.toolTipTrigger').live('mouseover', function()
  {
      // format of 'rel' tag: pageid,personguid
      var productID = $(this).attr('rel');
      currentID = productID;

      // If no guid in url rel tag, don't popup blank
      if (currentID == '')
          return;

      if (hideTimer)
          clearTimeout(hideTimer);

      var pos = $(this).offset();
      var width = $(this).width();
      container.css({
          left: (pos.left + width) + 'px',
          top: pos.top - 5 + 'px'
      });

      $('#personPopupContent').html('&nbsp;');

      $.ajax({
    	  beforeSend: function() {
				$("#personPopupContent").fadeIn(5000);
		  },
		  complete: function(){
				//$("#overlay").fadeOut(5000);
		  },		
          type: 'GET',
          url: '/openappengine/product/viewDetailJSON/' + productID,
          success: function(data)
          {
              // Verify that we're pointed to a page that returned the expected results.
              /*
        	  if (data.indexOf('personPopupResult') < 0)
              {
                  $('#personPopupContent').html('<span >Page ' + pageID + ' did not return a valid result for person ' + currentID + '.<br />Please have your administrator check the error log.</span>');
              }*/

              // Verify requested person is this person since we could have multiple ajax
              // requests out if the server is taking a while.
        	  $('#toolTipContainer').html('');
        	  
        	  var d = '<table>'
        		  + '<tr><td>Name: </td><td>' + data.pdProductName + '</td></tr>'
                  + '<tr><td>Introduction Date: </td><td>' + data.pdIntroductionDate + '</td></tr>'
                  + '<tr><td>Discontinuation Date:</td><td>' + data.pdSalesDiscontinuationDate + '</td></tr>'
                  + '<tr><td>Price : </td><td>' + data.pdPrice + '</td></tr>'
              + '</table>';
        	  
        	  $("productDetailTooltipTemplate").tmpl(data).appendTo("#toolTipContainer"); 
      	
        	  //$(d).appendTo('#toolTipContainer');
          }
      });

      container.css('display', 'block');
  });

  $('.toolTipTrigger').live('mouseout', function()
  {
      if (hideTimer)
          clearTimeout(hideTimer);
      hideTimer = setTimeout(function()
      {
          container.css('display', 'none');
      }, hideDelay);
  });

  // Allow mouse over of details without hiding details
  $('#personPopupContainer').mouseover(function()
  {
      if (hideTimer)
          clearTimeout(hideTimer);
  });

  // Hide after mouseout
  $('#personPopupContainer').mouseout(function()
  {
      if (hideTimer)
          clearTimeout(hideTimer);
      hideTimer = setTimeout(function()
      {
          container.css('display', 'none');
      }, hideDelay);
  });
});
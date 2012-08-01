//ajax jquery pagination
function updateNavLinks() {
	if($("#currentPage").val() == '1') {
	  $("#previous").hide();	
	  $("#first").hide();
	} else {
		$("#previous").show();
		$("#first").show();
	}

	if($("#currentPage").val() == $("#totalPages").val()) {
	  $("#next").hide();	
	  $("#last").hide();
	} else {
		$("#next").show();
		$("#last").show();
	}
	
	$("#pageNoSpan").text($("#currentPage").val());
	$("#totalPagesSpan").text($("#totalPages").val());
}

function paginate(tableId) {
	
	updateNavLinks();
	
	$("#previous").click(function(event) {
		  event.preventDefault();
		  var itemsPerPage = $("#itemsPerPage").val();
		  
		  var currPage = parseInt($("#currentPage").val(),10);
		  currPage = currPage - 1;
		  $("#currentPage").val(currPage);

		  var offset = currPage*itemsPerPage - itemsPerPage;

		  var href = this.href + "?offset="+offset+"&max=" + itemsPerPage
		  $('#' + tableId).load(href + ' #' + tableId);
		  
		  updateNavLinks();
	});

	$("#next").click(function(event) {
		  event.preventDefault();

		  var currPage = parseInt($("#currentPage").val(),10);
		  var itemsPerPage = $("#itemsPerPage").val();
		  var offset = currPage*itemsPerPage;

		  var href = this.href + "?offset="+offset+"&max=" + itemsPerPage
		  $('#' + tableId).load(href + ' #' + tableId);

		  currPage = currPage + 1;
		  $("#currentPage").val(currPage);

		  updateNavLinks();
	});
	
	$("#last").click(function(event) {
		  event.preventDefault();
		  
		  var currPage = parseInt($("#totalPages").val(),10);
		  var itemsPerPage = $("#itemsPerPage").val();
		  var offset = (currPage - 1)*itemsPerPage;

		  var href = this.href + "?offset="+offset+"&max=" + itemsPerPage
		  $('#' + tableId).load(href + ' #' + tableId);

		  $("#currentPage").val(currPage);
		  updateNavLinks();
	});
	
	$("#first").click(function(event) {
		  event.preventDefault();
		  
		  var currPage = 1;
		  var itemsPerPage = $("#itemsPerPage").val();
		  var offset = 0;

		  var href = this.href + "?offset="+offset+"&max=" + itemsPerPage
		  $('#' + tableId).load(href + ' #' + tableId);

		  $("#currentPage").val(currPage);
		  updateNavLinks();
	});
}
//ajax jquery pagination
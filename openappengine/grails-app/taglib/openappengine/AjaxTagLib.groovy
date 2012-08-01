package openappengine

class AjaxTagLib {
	
	static namespace = "ajax"
	
	/**
	 * Uses the default Grails server-side support i.e.list action and list view to fetch the records.
	 * The javascript that does the actual pagination is in the js/pager.js file.
	 */
	def paginate = {attrs, body ->
		def out = out
		def name = attrs.name //The name attribute is required for the tag to work seamlessly with grails
		def id = attrs.id ?: name
		def totalRecords = attrs.totalRecords
		def itemsPerPage = attrs.itemsPerPage?:10
		def url = attrs.url
		def tableId = attrs.tableId
		
		int totalPages = totalRecords/itemsPerPage
		if(totalRecords%itemsPerPage != 0) {
			totalPages += 1
		}
		
		def prevImg = resource(dir:'images/skin',file:'previous.png')
		def nextImg = resource(dir:'images/skin',file:'next.png')
		
		def firstImg = resource(dir:'images/skin',file:'first.png')
		def lastImg = resource(dir:'images/skin',file:'last.png')
		
		out << "<div style='${attrs.style}'>"
			out << "<form id=\"paginationForm\">"
			out << "	<input id=\"currentPage\" type=\"hidden\" value='1' " + "/>"
			out << "	<input id=\"offset\" type=\"hidden\" />"
			out << "	<input id=\"totalPages\" type=\"hidden\" value=\"" + totalPages + "\" />"
			out << "	<input id=\"itemsPerPage\" type=\"hidden\" value=\"" + itemsPerPage + "\" />"
			out << "	<div id='pagination_nav_controls'>"
					//Fast Rewind
					out << "	<a id=\"first\" href='${url}'>"
					out << " 		<img src=\"${firstImg}\" title='First' alt='First' />"
					out << "	</a>"
					//Prev
					out << "	<a id=\"previous\" href='${url}'>"
					out << " 		<img src=\"${prevImg}\" title='Previous' alt='Previous' />"
					out << "	</a>"
					//Next
					out << "	<a id=\"next\" href='${url}'>"
					out << " 		<img src=\"${nextImg}\" title='Next' alt='Next'/>"
					out << "	</a>"
					//Fast Forward
					out << "	<a id=\"last\" href='${url}'>"
					out << " 		<img src=\"${lastImg}\" title='Last' alt='Last'/>"
					out << "	</a>"
				out << "	<span>"
				out << "		Page <b><span id=\"pageNoSpan\"></span></b> of <b><span id=\"totalPagesSpan\"></span></b>"
				out << "	</span>"
			out << "	</div>"
			out << "</form>"
		out << "</div>"
		
		out << "<script type='text/javascript'>"
			out << "\$(document).ready(function() { "
				out << "paginate('" + tableId + "');"
			out << "});"
		out << "</script>"
	
	}

}

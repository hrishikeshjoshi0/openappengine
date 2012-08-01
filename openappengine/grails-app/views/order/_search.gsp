<%@page import="com.openappengine.master.OrderStatus"%>
<div>
			<g:formRemote name="searchForm" on404="alert('not found!')" update="list-ohOrderHeader"
	              url="[action:'filter']" class="search-form">
	            <table style="width:auto;">
	            	<thead>
						<tr>
							<th colspan="6">
									Search
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Order Number:</td>
							<td><input id="orderNumber" name="orderNumber" type="text" /></td>
						</tr>
						<tr>
							<td>Status:</td>
							<td>
								<g:select name="status" from="${OrderStatus?.values()}"
										noSelection="${['ALL':'ALL']}"
										value="${params?.status}" optionKey="key" />
							</td>
						</tr>
						<tr>	
							<td>From Date:</td>
							<td>
								<g:datePicker name="fromDate" precision="day" value="${params.fromDate }"/>
							</td>
							
							<td>To Date:</td>
							<td>
								<g:datePicker name="toDate" precision="day" value="${params.toDate }"/>
							</td>
						</tr>
						<tr>
		            		<td colspan="6">
		            			<input type="submit" value="Search" />			
		            		</td>
		            	</tr>
					</tbody>
	            </table>  
			</g:formRemote>
		</div>
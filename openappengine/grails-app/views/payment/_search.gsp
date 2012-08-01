<div>
			<g:formRemote name="searchForm" on404="alert('not found!')" update="list-fmPayment"
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
							<td>Payment Number:</td>
							<td><input id="paymentNumber" name="paymentNumber" type="text" /></td>
						</tr>
						<tr>
							<td>Order Number:</td>
							<td><input id="orderNumber" name="orderNumber" type="text" /></td>
						</tr>
						<tr>
							<td>Contract Number:</td>
							<td><input id="contractExternalId" name="contractExternalId" type="text" /></td>
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
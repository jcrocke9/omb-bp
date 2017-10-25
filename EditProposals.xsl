<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:SharePoint="Microsoft.SharePoint.WebControls" xmlns:ddwrt2="urn:frontpage:internal">
	<xsl:output method="html" indent="no"/>
	<xsl:decimal-format NaN=""/>
	<xsl:param name="dvt_apos">&apos;</xsl:param>
	<xsl:param name="ManualRefresh"></xsl:param>
	<xsl:variable name="dvt_1_automode">0</xsl:variable>
	<xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:SharePoint="Microsoft.SharePoint.WebControls">

		<script type="text/javascript" src="/sites/OMBEnterprise/bp/Scripts/joeScript.js"></script>



		<xsl:choose>
			<xsl:when test="($ManualRefresh = 'True')">
				<table  border="0" cellpadding="0" cellspacing="0"> <!-- width="100%"-->
					
					<tr>
						<td valign="top">
							<xsl:call-template name="dvt_1"/>
						</td>
						<td class="ms-vb" valign="top"> <!-- width="1%"  -->
							<img src="/_layouts/15/images/staticrefresh.gif" id="ManualRefresh" border="0" onclick="javascript: {ddwrt:GenFireServerEvent('__cancel')}" alt="Click here to refresh the dataview."/>
						</td>
						</tr>
					</table>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="dvt_1"/>
						</xsl:otherwise>
					</xsl:choose>
					<script type="text/javascript" src="/sites/OMBEnterprise/bp/Scripts/SPAEdit.js"></script>
					
					</xsl:template>
	
					<xsl:template name="dvt_1">
						<xsl:variable name="dvt_StyleName">ListForm</xsl:variable>
					
						<xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row"/>
					

					<div>
						<span id="part1">
						<table >
							<xsl:call-template name="dvt_1.body">
								<xsl:with-param name="Rows" select="$Rows"/>
								
							</xsl:call-template>
						</table>
						</span>
						<SharePoint:AttachmentUpload runat="server" ControlMode="Edit"/>
						
						<SharePoint:ItemHiddenVersion runat="server" ControlMode="Edit"/>
						
					</div>
		
		
					</xsl:template>
					<xsl:template name="dvt_1.body">
						<xsl:param name="Rows"/>
						<xsl:param name="dataBind">click: function (data, event) { createOrgObjBatch(orgobj) }</xsl:param>
					
					<tr>
						<td class="ms-toolbar" nowrap="nowrap">
						<!--<table>
					<tr>
						<td width="99%" class="ms-toolbar" nowrap="nowrap"><IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="nowrap">
							<SharePoint:SaveButton runat="server" ControlMode="Edit" id="savebutton1"/>
						</td>
						<td class="ms-separator">&#160;</td>
						<td class="ms-toolbar" nowrap="nowrap" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="Edit" id="gobackbutton1"/>
						</td>
					</tr>
				</table>-->
						</td>
					</tr>
					<tr>
						<td class="ms-toolbar" nowrap="nowrap">
						<SharePoint:FormToolBar runat="server" ControlMode="Edit"/>
						
						<SharePoint:ItemValidationFailedMessage runat="server" ControlMode="Edit"/>
						
						</td>
					</tr>
						<xsl:call-template name="dvt_1.rowedit"/>
						<tr>
							<td class="ms-toolbar" nowrap="nowrap">
							<table>
								<tr>
									<td width="99%" class="ms-toolbar" nowrap="nowrap"><IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/></td>
									
									<td class="ms-toolbar" nowrap="nowrap">
									
									<SharePoint:SaveButton runat="server" ControlMode="Edit" id="savebutton2"/>
									
									</td>
									<td class="ms-separator">&#160;</td>
									<td class="ms-toolbar" nowrap="nowrap" align="right">
									
									<SharePoint:GoBackButton runat="server" ControlMode="Edit" id="gobackbutton2"/>
									
									</td>
								</tr>
							</table>
							</td>
						</tr>
						</xsl:template>
						<xsl:template name="dvt_1.rowedit">
							<xsl:param name="Pos" select="position()"/>
							<xsl:param name="dataBind">click: function (data, event) { createOrgObjBatch(orgobj) }</xsl:param>
						
						<tr>
							<td>
							<table class="joeTable" border="0" cellspacing="0"  >
								
								<tr>
									<td colspan="2" valign="top" class="ms-formlabel">
									
									<H3 class="ms-standardheader">
									Proposed Short Title
									</H3>
									</td>
								</tr>
								<tr>
									<td colspan="2" valign="top" class="ms-formbody">
									
									<SharePoint:FormField runat="server" id="ff1{$Pos}" ControlMode="Edit" FieldName="Title" __designer:bind="{ddwrt:DataBind('u',concat('ff1',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Title')}"/>
																
									</td>
								</tr>
							</table>
							<div  ><!-- data-bind="visible: shortTitle.hasError" -->
								
								<div>
									<span><b>Summary Data</b></span>
								</div>

								<div >
									
									<table class="joeTable" border="0" cellspacing="0" width="100%">
										
										<tr>
											<td><SharePoint:FormField runat="server" id="ff8{$Pos}" ControlMode="Edit" FieldName="ombpDept2" __designer:bind="{ddwrt:DataBind('u',concat('ff8',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpDept2')}"/></td>
											
										</tr>
										<tr>
											<td><SharePoint:FormField runat="server" id="ff9{$Pos}" ControlMode="Edit" FieldName="ombpProgram" __designer:bind="{ddwrt:DataBind('u',concat('ff9',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpProgram')}"/></td>
											
										</tr>
										<tr>
											<td>
											<SharePoint:FormField runat="server" id="ff26{$Pos}" ControlMode="Edit" FieldName="ombpFocusArea" __designer:bind="{ddwrt:DataBind('u',concat('ff26',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpFocusArea')}"/>
											
											</td>
										</tr>
										<tr>
											<td>
											<SharePoint:FormField runat="server" id="ff7{$Pos}" ControlMode="Edit" FieldName="ombpProposalType" __designer:bind="{ddwrt:DataBind('u',concat('ff7',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpProposalType')}"/>
											
											</td>
										</tr>
										<tr>
											<td colspan="2">
											<table class="joeIntroTable">
												
												<thead>
													<tr>
														<td>FTE Impact</td>
														
														<td>Expenditure Fund</td>
														
														<td>Revenue</td>
														
														<td>Expenditure/<span style="color:red">Savings</span></td>
														
														<td>Net General Fund Impact</td>
														
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><SharePoint:FormField runat="server" id="ff3{$Pos}" ControlMode="Edit" FieldName="ombp" __designer:bind="{ddwrt:DataBind('u',concat('ff3',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombp')}"/></td>
														
														<td><SharePoint:FormField runat="server" id="ff2{$Pos}" ControlMode="Edit" FieldName="ombpExpenditureFund" __designer:bind="{ddwrt:DataBind('u',concat('ff2',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpExpenditureFund')}"/></td>
														
														<td><xsl:text disable-output-escaping="yes">$ </xsl:text><SharePoint:FormField runat="server" id="ff4{$Pos}" ControlMode="Edit" FieldName="ombpRevenue" __designer:bind="{ddwrt:DataBind('u',concat('ff4',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpRevenue')}"/></td>
														
														<td><xsl:text disable-output-escaping="yes">$ </xsl:text><SharePoint:FormField runat="server" id="ff5{$Pos}" ControlMode="Edit" FieldName="ombpExpenditure" __designer:bind="{ddwrt:DataBind('u',concat('ff5',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpExpenditure')}"/></td>
														
														<td><xsl:text disable-output-escaping="yes">$ </xsl:text><SharePoint:FormField runat="server" id="ff51{$Pos}" ControlMode="Edit" FieldName="ombpNet" __designer:bind="{ddwrt:DataBind('u',concat('ff51',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpNet')}"/></td>
														
													</tr>
												</tbody>
											</table>
											</td>
										</tr>
										<tr>
											<td width="100px" valign="top" class="ms-formlabel">
											
											<H3 class="ms-standardheader">
											
											<nobr>Proposal Category</nobr>
											</H3>
											</td>
											<td valign="top" class="ms-formbody">
											
											<SharePoint:FormField runat="server" id="ff6{$Pos}" ControlMode="Edit" FieldName="ombpProposalCategory" __designer:bind="{ddwrt:DataBind('u',concat('ff6',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpProposalCategory')}"/>
											
											<SharePoint:FieldDescription runat="server" id="ff6description{$Pos}" FieldName="ombpProposalCategory" ControlMode="Edit"/>
											
											</td>
										</tr>
									</table>
								</div>
								<div ><!-- id="joeHideUntilTypeChoose" -->
									<div>
										<span><b>Questions</b></span>
									</div>
									<table class="joeTable">				
										<tr class="joeRowSup">
											<td valign="top">
											<h4>Supplemental Request</h4>
											
											<SharePoint:FieldDescription runat="server" id="ff58description{$Pos}" FieldName="ombpQuestionSA" ControlMode="Edit"/><br />
											
											<SharePoint:FormField runat="server" id="ff58{$Pos}" ControlMode="Edit" FieldName="ombpQuestionSA" __designer:bind="{ddwrt:DataBind('u',concat('ff58',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestionSA')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowSup">
						<td valign="top" class="joeClear joeHeaderRow">
							<h2>Supplemental Request Criteria</h2>
							<p>Describe the rationale for this supplemental budget request using the following 5 criteria</p>
						</td>
					</tr>
										<tr class="joeRowSup">
											<td valign="top">
											<h4>Relevance to Results</h4>
											
											<SharePoint:FieldDescription runat="server" id="ff53description{$Pos}" FieldName="ombpQuestionSB" ControlMode="Edit"/><br />
											
											<SharePoint:FormField runat="server" id="ff53{$Pos}" ControlMode="Edit" FieldName="ombpQuestionSB" __designer:bind="{ddwrt:DataBind('u',concat('ff53',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestionSB')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowSup">
											<td valign="top">
											<h4>Program mandate</h4>
											
											<SharePoint:FieldDescription runat="server" id="ff12description{$Pos}" FieldName="ombpQuestion01" ControlMode="Edit"/><br />
											
											<SharePoint:FormField runat="server" id="ff12{$Pos}" ControlMode="Edit" FieldName="ombpQuestion01" __designer:bind="{ddwrt:DataBind('u',concat('ff12',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion01')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowSup">
											<td valign="top" >
											<h4>Reliance on City to Provide Program or Service</h4>
											<SharePoint:FieldDescription runat="server" id="ff13description{$Pos}" FieldName="ombpQuestion02" ControlMode="Edit"/><br/>
											
											<SharePoint:FormField runat="server" id="ff13{$Pos}" ControlMode="Edit" FieldName="ombpQuestion02" __designer:bind="{ddwrt:DataBind('u',concat('ff13',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion02')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowSup">
											<td valign="top" >
											<h4>Number of residents served</h4>	
											<div>
												<SharePoint:FieldDescription runat="server" id="ff14description{$Pos}" FieldName="ombpQuestion03" ControlMode="Edit"/>
												
														</div>
											<div>

												<SharePoint:FormField runat="server" id="ff14{$Pos}" ControlMode="Edit" FieldName="ombpQuestion03" __designer:bind="{ddwrt:DataBind('u',concat('ff14',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion03')}"/>
												
											</div>
											</td>
										</tr>
										<tr class="joeRowSup">
											<td valign="top" >
											<div>
												<h4>Change in Demand for Service</h4>
												
											</div>
											<div>
												<SharePoint:FieldDescription runat="server" id="ff15description{$Pos}" FieldName="ombpQuestion04" ControlMode="Edit"/>
												
											</div>
											<div>
												<SharePoint:FormField runat="server" id="ff15{$Pos}" ControlMode="Edit" FieldName="ombpQuestion04" __designer:bind="{ddwrt:DataBind('u',concat('ff15',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion04')}"/>
												
											</div>
											</td>
										</tr>
										<tr class="joeRowSup">
						<td valign="top" class="joeClear joeHeaderRow">
							<h2>Supplemental Request Details</h2>
						</td>
					</tr>
										<tr class="joeRowSup">
											<td valign="top" >
											<h4>Physical Description</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff16description{$Pos}" FieldName="ombpQuestion05" ControlMode="Edit"/><br />
											
											<SharePoint:FormField runat="server" id="ff16{$Pos}" ControlMode="Edit" FieldName="ombpQuestion05" __designer:bind="{ddwrt:DataBind('u',concat('ff16',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion05')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowSup">
											<td valign="top" >
											<h4>Implementation Schedule</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff17description{$Pos}" FieldName="ombpQuestion06" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff17{$Pos}" ControlMode="Edit" FieldName="ombpQuestion06" __designer:bind="{ddwrt:DataBind('u',concat('ff17',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion06')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowSup">
											<td valign="top" >
											<h4>Associated Reductions</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff18description{$Pos}" FieldName="ombpQuestion07" ControlMode="Edit"/>
											
											<br />
											<SharePoint:FormField runat="server" id="ff18{$Pos}" ControlMode="Edit" FieldName="ombpQuestion07" __designer:bind="{ddwrt:DataBind('u',concat('ff18',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion07')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowSup">
											<td valign="top" >
											<h4>Impact on Other Departments</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff19description{$Pos}" FieldName="ombpQuestion08" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff19{$Pos}" ControlMode="Edit" FieldName="ombpQuestion08" __designer:bind="{ddwrt:DataBind('u',concat('ff19',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion08')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Description of Reduction</h4>
											<SharePoint:FieldDescription runat="server" id="ff57description{$Pos}" FieldName="ombpQuestion10" ControlMode="Edit"/>
											<br />							
											<SharePoint:FormField runat="server" id="ff57{$Pos}" ControlMode="Edit" FieldName="ombpQuestion10" __designer:bind="{ddwrt:DataBind('u',concat('ff57',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion10')}"/>
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" class="joeClear joeHeaderRow">
												<h2>Proposed Reduction Criteria</h2>
												<p>Describe the rationale for this reduction request using the following 5 criteria</p>
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Program mandate</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff54description{$Pos}" FieldName="ombpQuestionRA" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff54{$Pos}" ControlMode="Edit" FieldName="ombpQuestionRA" __designer:bind="{ddwrt:DataBind('u',concat('ff54',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestionRA')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Reliance on City to Provide Program or Service</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff55description{$Pos}" FieldName="ombpQuestionRB" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff55{$Pos}" ControlMode="Edit" FieldName="ombpQuestionRB" __designer:bind="{ddwrt:DataBind('u',concat('ff55',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestionRB')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Number of residents served</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff56description{$Pos}" FieldName="ombpQuestionRC" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff56{$Pos}" ControlMode="Edit" FieldName="ombpQuestionRC" __designer:bind="{ddwrt:DataBind('u',concat('ff56',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestionRC')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Change in Demand for Service</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff20description{$Pos}" FieldName="ombpQuestion11" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff20{$Pos}" ControlMode="Edit" FieldName="ombpQuestion11" __designer:bind="{ddwrt:DataBind('u',concat('ff20',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion11')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Relevance to Results</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff21description{$Pos}" FieldName="ombpQuestion12" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff21{$Pos}" ControlMode="Edit" FieldName="ombpQuestion12" __designer:bind="{ddwrt:DataBind('u',concat('ff21',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion12')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" class="joeClear joeHeaderRow">
												<h2>Proposed Reduction Details</h2>
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Physical Description</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff24description{$Pos}" FieldName="ombpQuestion13" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff24{$Pos}" ControlMode="Edit" FieldName="ombpQuestion13" __designer:bind="{ddwrt:DataBind('u',concat('ff24',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion13')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Implementation Schedule</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff48description{$Pos}" FieldName="ombpQuestion14" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff48{$Pos}" ControlMode="Edit" FieldName="ombpQuestion14" __designer:bind="{ddwrt:DataBind('u',concat('ff48',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion14')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Associated Supplemental</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff49description{$Pos}" FieldName="ombpQuestion15" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff49{$Pos}" ControlMode="Edit" FieldName="ombpQuestion15" __designer:bind="{ddwrt:DataBind('u',concat('ff49',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion15')}"/>
											
							
											</td>
										</tr>
										<tr class="joeRowRed">
											<td valign="top" >
											<h4>Impact on Other Departments</h4>
												
											<SharePoint:FieldDescription runat="server" id="ff50description{$Pos}" FieldName="ombpQuestion16" ControlMode="Edit"/>
											
											<br />
							
											<SharePoint:FormField runat="server" id="ff50{$Pos}" ControlMode="Edit" FieldName="ombpQuestion16" __designer:bind="{ddwrt:DataBind('u',concat('ff50',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpQuestion16')}"/>
											
							
											</td>
										</tr>					
									</table>
				
									
								</div>
								<div>
									<div>
										<span><b>Financials</b></span>
									</div>
									<table class="joeTable">
										<tr><td><table>
											<thead>
												<tr>
													<th>Impact (in $)</th>
																			
													<th>FY 2019</th>
													<th>FY 2020</th>
													<th>FY 2021</th>
													<th>FY 2022</th>
													<th>FY 2023</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Revenues</td>
													<td>
													<SharePoint:FormField runat="server" id="ff28{$Pos}" ControlMode="Edit" FieldName="ombpImpactRev01" __designer:bind="{ddwrt:DataBind('u',concat('ff28',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactRev01')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff29{$Pos}" ControlMode="Edit" FieldName="ombpImpactRev02" __designer:bind="{ddwrt:DataBind('u',concat('ff29',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactRev02')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff30{$Pos}" ControlMode="Edit" FieldName="ombpImpactRev03" __designer:bind="{ddwrt:DataBind('u',concat('ff30',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactRev03')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff31{$Pos}" ControlMode="Edit" FieldName="ombpImpactRev04" __designer:bind="{ddwrt:DataBind('u',concat('ff31',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactRev04')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff32{$Pos}" ControlMode="Edit" FieldName="ombpImpactRev05" __designer:bind="{ddwrt:DataBind('u',concat('ff32',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactRev05')}"/>
													
													</td>							
												</tr>
												<tr>
													<td>Expenditures</td>
													
													<td>
													<SharePoint:FormField runat="server" id="ff33{$Pos}" ControlMode="Edit" FieldName="ombpImpactExp01" __designer:bind="{ddwrt:DataBind('u',concat('ff33',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactExp01')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff34{$Pos}" ControlMode="Edit" FieldName="ombpImpactExp02" __designer:bind="{ddwrt:DataBind('u',concat('ff34',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactExp02')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff35{$Pos}" ControlMode="Edit" FieldName="ombpImpactExp03" __designer:bind="{ddwrt:DataBind('u',concat('ff35',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactExp03')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff36{$Pos}" ControlMode="Edit" FieldName="ombpImpactExp04" __designer:bind="{ddwrt:DataBind('u',concat('ff36',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactExp04')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff37{$Pos}" ControlMode="Edit" FieldName="ombpImpactExp05" __designer:bind="{ddwrt:DataBind('u',concat('ff37',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactExp05')}"/>
													
													</td>							
												</tr>
												<tr>
													<td>Net General Fund Impact</td>
													
													<td>
													<SharePoint:FormField runat="server" id="ff38{$Pos}" ControlMode="Edit" FieldName="ombpImpactNet01" __designer:bind="{ddwrt:DataBind('u',concat('ff38',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactNet01')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff39{$Pos}" ControlMode="Edit" FieldName="ombpImpactNet02" __designer:bind="{ddwrt:DataBind('u',concat('ff39',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactNet02')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff40{$Pos}" ControlMode="Edit" FieldName="ombpImpactNet03" __designer:bind="{ddwrt:DataBind('u',concat('ff40',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactNet03')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff41{$Pos}" ControlMode="Edit" FieldName="ombpImpactNet04" __designer:bind="{ddwrt:DataBind('u',concat('ff41',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactNet04')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff42{$Pos}" ControlMode="Edit" FieldName="ombpImpactNet05" __designer:bind="{ddwrt:DataBind('u',concat('ff42',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactNet05')}"/>
													
													</td>							
												</tr>
												<tr>
													<td>FTEs</td>
													<td>
													<span dir="none"><input class="ms-input" size="11" data-bind="value: fte" style="ime-mode: inactive;" type="text" /><br/></span>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff44{$Pos}" ControlMode="Edit" FieldName="ombpImpactFte02" __designer:bind="{ddwrt:DataBind('u',concat('ff44',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactFte02')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff45{$Pos}" ControlMode="Edit" FieldName="ombpImpactFte03" __designer:bind="{ddwrt:DataBind('u',concat('ff45',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactFte03')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff46{$Pos}" ControlMode="Edit" FieldName="ombpImpactFte04" __designer:bind="{ddwrt:DataBind('u',concat('ff46',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactFte04')}"/>
													
													</td>
													<td>
													<SharePoint:FormField runat="server" id="ff47{$Pos}" ControlMode="Edit" FieldName="ombpImpactFte05" __designer:bind="{ddwrt:DataBind('u',concat('ff47',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpImpactFte05')}"/>
													
													</td>							
												</tr>
					
											</tbody>
											</table></td></tr>
 <tr><td>
											
											<table>
												<tr><td>This is only to add new Munis data; your Munis data from the New form is already saved and not visible below.</td></tr>
												<tr>
													<td>
													<table>
							 <thead><tr>
							 <th>Org</th><th>Object</th><th>Amount</th><th></th>
															
							 </tr></thead>
							 <tbody data-bind="foreach: orgobj">
															
							 <tr>
																
							 <td><input data-bind="value: ombpMdOrg" /></td>
							 
																
							 <td><input data-bind="value: ombpMdObj" /></td>
							 
																
							 <td><input data-bind="value: ombpMdAmt" /></td>
							 <td><a href="#" data-bind="click: $root.removeOrgobj">Remove</a></td>
																
							 </tr>
															
							 <tr>
																

							 </tr>
															
							 </tbody>
													</table>
							
													<button data-bind="click: addOrgobj">Add another line
													</button>
						 <input style="visibility:hidden;display:none;" name="tasks" data-bind="value: ko.toJSON(orgobj)" />
						 							<button data-bind="{$dataBind}">Save Munis data
													</button>
													</td>
												</tr>
											</table>
											</td></tr>
											<tr>
											<td >
				<div> <!--  id="joePrivateDiv" -->
					<div> <!--  id="joeSidebar" -->
						<p>OMB Notes</p>
						<SharePoint:FormField runat="server" id="ff52{$Pos}" ControlMode="Edit" FieldName="ombpOmbNotes" __designer:bind="{ddwrt:DataBind('u',concat('ff52',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ombpOmbNotes')}"/>
					</div>
				</div>
			</td>
											</tr>
									</table>
								</div>
							</div>
							<table>
								<tr id="idAttachmentsRow">
									<td nowrap="true" valign="top" class="ms-formlabel" width="20%">
									
									<SharePoint:FieldLabel ControlMode="Edit" FieldName="Attachments" runat="server"/>
									
									</td>
									<td valign="top" class="ms-formbody" width="80%">
									
									<SharePoint:FormField runat="server" id="AttachmentsField" ControlMode="Edit" FieldName="Attachments" __designer:bind="{ddwrt:DataBind('u','AttachmentsField','Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Attachments')}"/>
									
									<script>
          var elm = document.getElementById(&quot;idAttachmentsTable&quot;);
          if (elm == null || elm.rows.length == 0)
          document.getElementById(&quot;idAttachmentsRow&quot;).style.display=&apos;none&apos;;
        </script>
 
									</td>
								</tr>
								<xsl:if test="$dvt_1_automode = '1'" ddwrt:cf_ignore="1">
								
								<tr>
									<td colspan="99" class="ms-vb">
									<span ddwrt:amkeyfield="ID" ddwrt:amkeyvalue="ddwrt:EscapeDelims(string(@ID))" ddwrt:ammode="view"></span>
									
									</td>
								</tr>
								</xsl:if>
							</table>
							</td>
										

						</tr>
						
		
						<script type="text/javascript" src="/sites/OMBEnterprise/bp/Scripts/munisEdit.js"></script>
						
						</xsl:template>
						</xsl:stylesheet>
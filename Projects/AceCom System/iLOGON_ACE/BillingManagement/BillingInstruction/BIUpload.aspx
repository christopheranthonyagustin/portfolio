<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BIUpload.aspx.cs" Inherits="iWMS.Web.BillingManagement.BillingInstruction.BIUpload" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
    <head id="Head1" runat="server">
        <title>BIUpload</title>
	    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
	    <meta content="C#" name="CODE_LANGUAGE">
	    <meta content="JavaScript" name="vs_defaultClientScript">
	    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	    <LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    </head>
<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server" style="Z-INDEX: 0">
			<table  id="FormTable" border="0" cellSpacing="0" cellPadding="0" width="100%" runat="server">
                <tr>
                    <td width="20%"><asp:label id="headerLbl1" Runat="server" CssClass="pagetitle">Upload BI :</asp:label><br /><br /></td>
			        <td width="40%"></td>
			        <td width="40%"></td>
                </tr>
                <tr>
			        <td>
			            <asp:label id="excelLbl" Runat="server">File Location:</asp:label>
			        </td>
			        <td>
			            <asp:FileUpload ID="excelFile" runat="server" />
			        </td>
			        <td rowspan="6" valign="top">
                        <asp:Label ID="lblErrLog" Runat="server" CssClass="BlackText" 
                            ForeColor="#FF0000" Visible="False"></asp:Label>
                    </td>
		        </tr>
		        <tr>
		            <td></td>
		            <td>
                        <asp:Label ID="lblnote" 
                            Text="Note : Only Microsoft Excel files can be Uploaded." runat="server"></asp:Label><br /><br />
                        <asp:Button id="excelSend" Text=" SEND TO SERVER " runat="server" OnClick="excelSend_Click"/>
						</td>
		        </tr>
		       	<tr>
					<td><asp:label id="excelssLbl" Runat="server" Visible="false">Spreadsheet Name:</asp:label></td>
					<td>
					    <asp:dropdownlist id="excelssDDL" Runat="server" AutoPostBack="True" 
                            onselectedindexchanged="excelssDDL_SelectedIndexChanged" Visible="false" />
                        <br />
					    <asp:button id="excelssBtn" Text="Get WorkSheet" Runat="server" CssClass="formbtn" visible="false"/>
					    <asp:label id="warningLbl" CssClass="BlackText" Runat="server" Visible = "false">Please close excel file (if still open) before clicking Get Worksheet</asp:label>
					    <br />
					</td>						                        
				</tr>
				<tr>
					<td>
						&nbsp;</td>
					<td>
						<asp:button id="retrieveBtn" Text=" RETRIEVE " Runat="server"  CssClass="formbtn"
                            onclick="retrieveBtn_Click" />
						<asp:regularexpressionvalidator id="excelVal" Runat="server" 
                            ControlToValidate="excelFile" ErrorMessage="This is not a valid file type"
							ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.xls|.XLS)$" 
                            Visible="False" />
						<br />
						<asp:label id="lblErrRetrieve" CssClass="BlackText" Runat="server" Visible="False" ForeColor="#ff0000"></asp:label><br />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><asp:button id="uploadBtn" CssClass="formbtn" Text=" UPLOAD " Runat="server" 
                            onclick="uploadBtn_Click" />
                            <br /><asp:label id="lblErrUpload" CssClass="BlackText" Runat="server" Visible="False" ForeColor="#FF0000">Please fill in all information before clicking upload.</asp:label>
                    <br /><br />
                    </td>
				</tr>
            </table>
            <br />
            <div id="div-datagrid" style="HEIGHT:60%">
                <asp:datagrid id="ResultDG" Runat="server" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
			        <ItemStyle CssClass="DGItem"></ItemStyle>
			        <HeaderStyle Wrap="False"></HeaderStyle>
				</asp:datagrid>
		    </div>
    </form>
</body>
</html>

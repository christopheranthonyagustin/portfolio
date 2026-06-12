
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Job.TransferJobAcc.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="HEAD1" runat="server">
    <title>Search</title>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            height: 45px;
        }
        .style2
        {
            width: 113px;
        }
        .style3
        {
            height: 45px;
            width: 113px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table style="z-index: 0; margin-right: 0px;" id="Table1" border="0" cellspacing="2"
        cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table id="Table2">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <%--<TD vAlign="top" width="30%">
						<table id="Table2" width="100%">
							<tr>
								<td width="40%">
									From Account :
								</td>
								<td width="60%">
								    <asp:DropDownList ID="TEXT_fromacid" runat="server" Width="80%" />
								</td>
							</tr>
							<tr>
								<td width="40%">
									From Job No :
								</td>
								<td width="60%">
								    <asp:Textbox ID="TEXT_fromjbno" runat="server" Width="80%" />
								</td>
							</tr>
							<tr>
								<td width="40%">
									To Account :
								</td>
								<td width="60%">
								    <asp:DropDownList ID="TEXT_toacid" runat="server" Width="80%" />
								</td>
							</tr>
							<tr>
								<td width="40%">
									To Account :
								</td>
								<td width="60%">
								    <asp:DropDownList ID="DropDownList1" runat="server" Width="80%" />
								</td>
							</tr>
						</table>
					</TD>--%>
            <td valign="top" class="style2">
                <table id="Table3" border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
                 <asp:Button ID="RetrieveBtn" runat="server" Text="Retrieve"  OnClick="RetrieveBtn_Click" 
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />  
                &nbsp;
                 <asp:Button ID="TransferBtn" runat="server" Text="Transfer"  OnClick="TransferBtn_Click" 
                     OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" /> 
                &nbsp;
                <asp:Button ID="ResetBtn" runat="server" Text="Reset"  OnClick="ResetBtn_Click" 
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />  
                &nbsp;
                <br />
            </td>
            <td class="style3">
                &nbsp;<br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

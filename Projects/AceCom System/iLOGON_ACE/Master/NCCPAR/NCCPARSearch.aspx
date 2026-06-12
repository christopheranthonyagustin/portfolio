<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NCCPARSearch.aspx.cs" Inherits="iWMS.Web.Master.NCCPAR.NCCPARSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>NCCPAR Report</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        // <!CDATA[

        function tab4_onclick() {

        }

        // ]]>
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server" defaultbutton="Button1">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" /> 
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
        <asp:Button ID="Button1" CssClass="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Search"></asp:Button>
                <br />
                <table id="resultTable" runat="server">
                    <tr>
                        <td><br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>                        
                        <td valign="top">     <br />                       
                            <asp:Label ID="PolicyLbl" runat="server" Text="Policy/Procedure/Standards/Instructions" /><br />
                            <asp:CheckBox ID="PolicyID" runat="server" /><br />

                             <asp:Label ID="ProductLbl" runat="server" Text="Product Services by Suppliers/Vendors" /><br />
                            <asp:CheckBox ID="ProductID" runat="server" /><br />
                        
                            <asp:Label ID="UnsafeLbl" runat="server" Text="Unsafe Conditions" /><br />
                            <asp:CheckBox ID="UnsafeID" runat="server" /><br />

                            <asp:Label ID="IncidentsLbl" runat="server" Text="Incidents/Accident" /><br />
                            <asp:CheckBox ID="IncidentsID" runat="server" /><br />

                             <asp:Label ID="InternalLbl" runat="server" Text="Internal Support Service Failure" /><br />
                            <asp:CheckBox ID="InternalID" runat="server" /><br />
                        
                            <asp:Label ID="CustomerLbl" runat="server" Text="Customer Service Failures/Complaints" /><br />
                            <asp:CheckBox ID="CustomerID" runat="server"  /><br />
                        </td>                        
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    </form>
</body>
</html>


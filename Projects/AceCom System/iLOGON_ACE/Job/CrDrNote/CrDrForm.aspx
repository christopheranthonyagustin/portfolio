<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="CrDrForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.CrDrNote.CrDrForm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CrDrForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>

    <style type="text/css">
        .style1 {
            width: 953px;
        }

        .style2 {
            height: 62px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="False" AutoPostBack="True" SelectedIndex="0"
            Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server"
                    Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Line" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="150" runat="server">
                </telerik:RadTab>
                <%--   
               <telerik:RadTab id="tab1" Text="Main" readonly="readonly" runat="server" onclick='clickRow(1, "table1");'>
                </telerik:RadTab>
                
                <telerik:RadTab id="tab2" Text="Detail" readonly="readonly" runat="server" onclick='clickRow(2, "table1");'>
                </telerik:RadTab>
                
                <telerik:RadTab  id="tab3" Text="Log" readonly="readonly" runat="server" onclick='clickRow(3, "table1");'>
                </telerik:RadTab>--%>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />&nbsp;
                    <asp:Label ID="DescrLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table>
                    <tr>
                        <td colspan="2" class="style1"><br />&nbsp;    
                                <%--<asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="../../Image/Update.png"
                 BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                ImageAlign="AbsMiddle" ToolTip="Update" OnClick="UpdateBtn_Click" />--%> 
                                    <%--<asp:ImageButton ID="PrintBtn" runat="server" ImageUrl="../../Image/Print.png"
                 BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                ImageAlign="AbsMiddle" ToolTip="Update" OnClick="print_Click" />--%> 

                            <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" ToolTip="Update" />
                            &nbsp;
                            <asp:Button ID="PrintBtn" class="white" runat="server" OnClick="print_Click" Visible="true"  
                                Text="Print" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Print" />
                            <table>
                                <tr>
                                    <td valign="top"><br />
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="DetailRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>


        <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
            DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
            CssClass="RedText" />
    </form>
</body>
</html>

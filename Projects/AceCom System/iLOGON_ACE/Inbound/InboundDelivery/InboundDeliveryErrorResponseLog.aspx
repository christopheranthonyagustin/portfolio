<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundDeliveryErrorResponseLog.aspx.cs" Inherits="iWMS.Web.Inbound.InboundDelivery.InboundDeliveryErrorResponseLog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Error Response Log</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked
                }
            }
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .style1 {          
            width: 150px;
        }


    </style>
</head>

<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="580px" ID="ErrorresponseRecordsRadPageView">
                <br />
                <table>
                    <tr class="graytitle">
                        <td class="style1">
                            <asp:Label ID="Label1" runat="server" >Receipt Number</asp:Label>
                        </td>
                        <td>:
                        </td>
                        <td>
                            <asp:Label ID="ReceiptNumberLbl" runat="server" ></asp:Label>
                        </td>
                    </tr>

                     <tr class="graytitle">
                        <td class="style1">
                            <asp:Label ID="Label2" runat="server" >Order Number</asp:Label>
                        </td>
                        <td>:
                        </td>
                        <td>
                            <asp:Label ID="OrderNumberLbl" runat="server" ></asp:Label>
                        </td>
                    </tr>

                     <tr class="graytitle">
                        <td class="style1">
                            <asp:Label ID="Label3" runat="server" >SKU Code</asp:Label>
                        </td>
                        <td>:
                        </td>
                        <td>
                            <asp:Label ID="SKUCodeLbl" runat="server" ></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                            
                        </td>
                        <td>
                             <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                          
                        </td>
                        <td><asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" CssClass="Pagetitle"></asp:Label></td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />                       
                    </MasterTableView>
                </telerik:RadGrid>

            </telerik:RadPageView>

        </telerik:RadMultiPage>

    </form>
</body>
</html>

<%@ Page Language="c#" CodeBehind="TransportInvHistory.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterLD.TransportInvHistory" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportInvHistory</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

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
    </script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle" align="left">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                    Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="billingtype" SortExpression="billingtype" HeaderText="BillingType"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                
                 <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNo"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                
                 <telerik:GridBoundColumn DataField="invdate" SortExpression="invdate" HeaderText="InvoiceDate" DataFormatString="{0:dd/MMM/yyyy}"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                
                 <telerik:GridBoundColumn DataField="frdate" SortExpression="frdate" HeaderText="FrDate" DataFormatString="{0:dd/MMM/yyyy}"
                    ItemStyle-Wrap="false" Display="false">
                </telerik:GridBoundColumn>
                
                 <telerik:GridBoundColumn DataField="todate" SortExpression="todate" HeaderText="ToDate" DataFormatString="{0:dd/MMM/yyyy}"
                    ItemStyle-Wrap="false" Display="false">
                </telerik:GridBoundColumn>
                
                 <telerik:GridBoundColumn DataField="billingamt" SortExpression="billingamt" HeaderText="BillingAmt"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                
                 <telerik:GridBoundColumn DataField="invstatusdescr" SortExpression="invstatusdescr" HeaderText="InvStatus"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                
                 <telerik:GridBoundColumn DataField="drheadadduser" SortExpression="drheadadduser" HeaderText="AddUser"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

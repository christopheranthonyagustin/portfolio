<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightBillableWBUnpostedSalesInvoice.aspx.cs" Inherits="iWMS.Web.FreightManagement.FreightBillableWorkbench.FreightBillableWBUnpostedSalesInvoice" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightBillableWBForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

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
            function OnRowDragStarted(sender, eventArgs) {
                var tableView = eventArgs.get_tableView();
                if (eventArgs.get_tableView().get_name() != "ChildGrid") {
                    eventArgs.set_cancel(true)
                }
            }

        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>

        <style type="text/css">
            .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
                border-left: solid 1px gray !important;
                border-bottom: solid 1px gray !important;
            }
            /*body
        {
            overflow: hidden;
        }*/
        </style>
    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" 
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight">
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">            
            <telerik:RadPageView runat="server" Height="90px" ID="SalesInvoiceUnpostedRadPageView">
                <br />
                <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="PostBtn" runat="server" CssClass="white" Text="Approve"
                                    OnClick="PostBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;&nbsp;

                                <asp:Button ID="PrintInvBtn" runat="server" CssClass="LongLabelBlue" Text="&nbsp; Print &nbsp;&nbsp;&nbsp;&nbsp; Invoice &nbsp;" CausesValidation="false"
                                    OnClick="PrintInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadGrid ID="ResultDG1" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                                        OnNeedDataSource="ResultDG1_NeedDataSource" OnDetailTableDataBind="ResultDG1_DetailTableDataBind"
                                        OnItemDataBound="ResultDG1_ItemDataBound"
                                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="True"></AlternatingItemStyle>
                                        <ItemStyle Wrap="True"></ItemStyle>
                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                                            <Selecting AllowRowSelect="true" />
                                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                        </ClientSettings>
                                        <HeaderStyle Wrap="false" />
                                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" PageSize="50" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                                            HierarchyLoadMode="Client" HierarchyDefaultExpanded="false">
                                            <Columns>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="Invoice" ItemStyle-HorizontalAlign="Center"
                                                    HeaderText="Invoice">
                                                    <ItemTemplate>
                                                        <br />
                                                        <%# string.Format("<b>{0:}</b>" + "<br/><br/>" + "{1:}" + "<br/><br/>" + "{2:dd/MMM/yyyy}",Eval("InvNo"), Eval("DRStatusDescr"), Eval("InvDate")) %>
                                                        <br />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="Job" ItemStyle-HorizontalAlign="Center" HeaderText="Job">
                                                    <ItemTemplate>
                                                        <br />
                                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("JobNo"), Eval("JobStatusDescr")) %>
                                                        <br />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="Account" ItemStyle-HorizontalAlign="Center" HeaderText="Entity <br/> Account">
                                                    <ItemTemplate>
                                                        <br />
                                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("EntityName"), Eval("ACCode")) %>
                                                        <br />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="Branch" ItemStyle-HorizontalAlign="Center" HeaderText="Branch <br/> Department/ProductCode">
                                                    <ItemTemplate>
                                                        <br />
                                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("BranchDescr"), Eval("DepartmentDescr")) %>
                                                        <br />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="MBL" ItemStyle-HorizontalAlign="Center" HeaderText="MBL <br/> HBL">
                                                    <ItemTemplate>
                                                        <br />
                                                        <%# string.Format("<b>{0:}</b>"+ "<br/><br/>" + "{1:}" + "{2}",Eval("TransportMode"), Eval("MAWB"),Eval("BOL")) %>
                                                        <br />
                                                        <br />
                                                        <%# string.Format("{0:}",Eval("HouseBill")) %>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="POL" ItemStyle-HorizontalAlign="Center" HeaderText="POL <br/> ETA">
                                                    <ItemTemplate>
                                                        <br />
                                                        <%# string.Format("{0:}",Eval("POLDescr")) %>
                                                        <br />
                                                        <br />
                                                        <%# string.Format("{0:dd/MMM/yyyy}",Eval("ETA")) %>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="POD" ItemStyle-HorizontalAlign="Center" HeaderText="POD <br/> ETD">
                                                    <ItemTemplate>
                                                        <br />
                                                        <%# string.Format("{0:}",Eval("PODDescr")) %>
                                                        <br />
                                                        <br />
                                                        <%# string.Format("{0:dd/MMM/yyyy}",Eval("ETD")) %>
                                                        <br />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="Shipper" ItemStyle-HorizontalAlign="Center" HeaderText="Consol <br/> Carrier">
                                                    <ItemTemplate>
                                                        <br />
                                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("ConsolNo"),Eval("CarrierName")) %>
                                                        <br />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="Shipper" ItemStyle-HorizontalAlign="Center" HeaderText="Shipper <br/> Consignee">
                                                    <ItemTemplate>
                                                        <br />
                                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("shippername"),Eval("Consigneename")) %>
                                                        <br />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="invno" UniqueName="invno" Display="False">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="DRHId" UniqueName="DRHId" Display="False">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="False">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                            <DetailTables>
                                                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" BorderColor="WhiteSmoke" BorderWidth="20px" BorderStyle="Double"
                                                    HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="None" EditMode="InPlace" RetainExpandStateOnRebind="true"
                                                    InsertItemDisplay="Bottom" AllowAutomaticInserts="true">
                                                    <ParentTableRelation>
                                                        <telerik:GridRelationFields DetailKeyField="FMJOBId" MasterKeyField="id" />
                                                    </ParentTableRelation>
                                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" />
                                                    <ItemStyle Wrap="true" />
                                                    <AlternatingItemStyle Wrap="true" />
                                                    <Columns>
                                                        <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                                                            <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                                            <HeaderTemplate>
                                                                SeqNo                                                             
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%# DataBinder.Eval(Container.DataItem, "SeqNo")%>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="Account" HeaderText="Entity <br/> Account">
                                                            <ItemTemplate>
                                                                <%# string.Format("{0:}" + "<br/><br/>" + "{1:}", Eval("EntityName"), Eval("AcName")) %>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="Description" HeaderText="Description">
                                                            <ItemTemplate>
                                                                <%# DataBinder.Eval(Container.DataItem, "ChargeCode")%>
                                                            </br>
                                                            </br>
                                                            <%# DataBinder.Eval(Container.DataItem, "ChargeDescr")%>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="ChargeAmt" HeaderText="Charge">
                                                            <ItemTemplate>
                                                                <%# Eval("ChargeAmt", "{0:n}") %>
                                                            &nbsp;&nbsp;
                                                            <%# DataBinder.Eval(Container.DataItem, "ChargeCurrCode")%>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn UniqueName="Branch" HeaderText="Branch <br/> Department/ProductCode">
                                                            <ItemTemplate>
                                                                <%# string.Format("{0:}",Eval("BranchDescr")) %>
                                                                <br />
                                                                <%# string.Format("{0:}",Eval("DepartmentDescr")) %>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="AddOn" UniqueName="AddDate" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                                            <ItemTemplate>
                                                                <br />
                                                                <%# string.Format("{0:dd/MMM/yyyy}",Eval("AddDate")) %>
                                                                <br />
                                                                <%# DataBinder.Eval(Container.DataItem, "AddUser")%>
                                                                <br />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridTemplateColumn HeaderText="ModifiedOn" UniqueName="EditDate" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                                            <ItemTemplate>
                                                                <br />
                                                                <%# string.Format("{0:dd/MMM/yyyy}",Eval("EditDate")) %>
                                                                <br />
                                                                <%# DataBinder.Eval(Container.DataItem, "EditUser")%>
                                                                <br />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="FMJobId" UniqueName="FMJobId" Display="false"></telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="DrDtId" UniqueName="DrDtId" Display="false"></telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="drid" UniqueName="drid" Display="false"></telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="BillToAcId" UniqueName="BillToAcId" Display="false"></telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="EntId" UniqueName="EntId" Display="false"></telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="ChargeCurrCode" UniqueName="ChargeCurrCode" Display="false"></telerik:GridBoundColumn>
                                                    </Columns>
                                                </telerik:GridTableView>
                                            </DetailTables>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </td>
                            </tr>
                        </table>
                        <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
          
        </telerik:RadMultiPage>
    </form>
</body>
</html>

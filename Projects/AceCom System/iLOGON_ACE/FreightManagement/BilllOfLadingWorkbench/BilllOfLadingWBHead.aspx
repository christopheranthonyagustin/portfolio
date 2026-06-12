<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BilllOfLadingWBHead.aspx.cs" Inherits="iWMS.Web.FreightManagement.BilllOfLadingWorkbench.BilllOfLadingWBHead" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BilllOfLadingWBHead</title>
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
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
        <script type="text/javascript">
            function RadMenuClientOnClick(sender, args) {
                if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                    args.set_cancel(true);
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Id="PayableTab" Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true" Width="100%">
            <telerik:RadPageView runat="server" Height="90px" ID="GeneralRadPageView">
                <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td>
                                <telerik:RadMenu ID="RadMenu_Print" runat="server" ShowToggleHandle="false" ClickToOpen="true" CssClass="mainMenu" Width="90px"
                                    OnItemClick="RadMenu_Print_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;Print" PostBack="false" CssClass="WrappingItem" BackColor="#b0e0e6" Font-Bold="true">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DraftBL" Text="DraftBL"
                                                    Visible="true" BackColor="White" />
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ExcelBL" Text="ExcelBL"
                                                    Visible="true" BackColor="White" />
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="FFWCertofReceipt" Text="FFW Cert of Receipt"
                                                    Visible="true" BackColor="White" />
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PrintBL" Text="PrintBL"
                                                    Visible="true" BackColor="White" />
                                            </Items>
                                        </telerik:RadMenuItem>
                                    </Items>
                                </telerik:RadMenu>
                            </td>
                            <td>
                                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel" CausesValidation="false"
                                     OnClick="CancelBtn_Click"  OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="UnlockBtn" runat="server" CssClass="white" Text="Unlock" CausesValidation="false"
                                    OnClick="UnlockBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false"
                        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                        AllowPaging="true" AllowSorting="true" Skin="Office2007" Height="600px">
                        <ClientSettings AllowColumnsReorder="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" PageSize="10" HeaderStyle-HorizontalAlign="Center">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                        &nbsp;
                                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                            ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                            OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>                                    
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn UniqueName="Consol" ItemStyle-HorizontalAlign="Center" HeaderText="Consol <br/> JobNo">
                                    <ItemTemplate>
                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("ConsolNo"),Eval("JobNo")) %>
                                        <br />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="MBL" ItemStyle-HorizontalAlign="Center" HeaderText="MBL <br/> HBL">
                                    <ItemTemplate>
                                        <%# string.Format("<b>{0:}</b>",Eval("MBLNo")) %>
                                        <br />
                                        <br />
                                        <%# string.Format("{0:}",Eval("BLNo")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="POL" ItemStyle-HorizontalAlign="Center" HeaderText="POL <br/> POD">
                                    <ItemTemplate>
                                        <%# string.Format("{0:}",Eval("POLDescr")) %>
                                        <br />
                                        <br />
                                       <%# string.Format("{0:}",Eval("PODDescr")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Flight" ItemStyle-HorizontalAlign="Center" HeaderText="Flight <br/> AircraftRegNo">
                                    <ItemTemplate>
                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("Flight"),Eval("AircraftRegNo")) %>
                                        <br />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Vessel" ItemStyle-HorizontalAlign="Center" HeaderText="Vessel <br/> Voyage">
                                    <ItemTemplate>
                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("Vessel"),Eval("Voyage")) %>
                                        <br />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="Shipper" ItemStyle-HorizontalAlign="Center" HeaderText="Shipper <br/> Consignee">
                                    <ItemTemplate>
                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("shippername"),Eval("ConsigneeName")) %>
                                        <br />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="NotifyParty" ItemStyle-HorizontalAlign="Center" HeaderText="NotifyParty <br/> DeliveryAgent">
                                    <ItemTemplate>
                                        <%# string.Format("{0:}" + "<br/><br/>" + "{1:}",Eval("NotifyPartyName"),Eval("DeliveryAgentName")) %>
                                        <br />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="ModifiedOn" ItemStyle-HorizontalAlign="Center" HeaderText="ModifiedOn">
                                    <ItemTemplate>
                                         <%# string.Format("{0:dd/MMM/yyyy}",Eval("editdate")) %>
                                        <br />
                                        <br />                                       
                                        <%# string.Format("{0:}",Eval("edituser")) %>
                                        <br />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="PrintFlag" DataField="printflag" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="NoOfPackages" DataField="noofpackages" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NoOfOriginalBL" UniqueName="NoOfOriginalBL" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NoOfCopyBL" UniqueName="NoOfCopyBL" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TransportMode" UniqueName="TransportMode" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bltype" UniqueName="bltype" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="fmcslid" UniqueName="fmcslid" Display="False">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="fmjobid" UniqueName="fmjobid" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="False">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                </asp:Panel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

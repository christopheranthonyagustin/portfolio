<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportBookingOrderForm.aspx.cs" Inherits="iWMS.Web.Job.TransportBookingOrder.TransportBookingOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportBookingOrderForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
     <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
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
    </telerik:RadCodeBlock>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <style type="text/css">
            .center {
                display: block;
                margin-left: auto;
                margin-right: auto;
            }

            .wrap {
                white-space: normal;
                width: 90px;
                height: auto;
                text-align: center;
                font-size: 100%;
            }
        </style>
    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <%-- *** to check in code side for Tab SelectedIndex if we will add more Tabs *** --%>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Billable" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Payable" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="P&L" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="QRCode" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="350" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="formCtl_BKO" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                        Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;   
                <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                    Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                              
                &nbsp;
                <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                    Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp; 
                <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                    Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBTripId" Name="MainGrid" AllowFilteringByColumn="false" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ID="Add" ImageUrl="../../image/add.png"
                                        Width="15" Height="15" AlternateText="Add" BackColor="Transparent" OnClick="AddIcon_Click"
                                        BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="shtype" HeaderText="ShipmentType <br> JobType" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("shtype")) %>
                                    <br />
                                    <br />
                                    <%# string.Format("{0:}",Eval("jobtype")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="BillSizeType" HeaderText="BillSizeType <br> BillOption1" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("BillSizeType")) %>
                                    <br />
                                    <br />
                                    <%# string.Format("{0:}",Eval("BillOption1")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                              <telerik:GridTemplateColumn UniqueName="frexpdate" HeaderText="TripDate" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy}",Eval("frexpdate")) %>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                              <telerik:GridTemplateColumn UniqueName="Time" HeaderText="FromTime<br/>ToTime" ItemStyle-Width="80px" HeaderStyle-Width="80px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TripFrTime")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("triptotime")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle <br> Driver" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("VehNoDescr")) %>
                                    <br />
                                    <br />
                                    <%# string.Format("{0:}",Eval("name")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="DONo" UniqueName="DONo" SortExpression="DONo" HeaderText="DO Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("FrServicePt")) %>
                                  
                                    <%# (string.IsNullOrEmpty(string.Format("{0:}",Eval("FrServicePt"))) || string.IsNullOrEmpty(string.Format("{0:}",Eval("FrAddr")))) ? "":"<br /><br />"%>
                                    <%# string.Format("{0:}",Eval("FrAddr")) %>
                                   
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("ToServicePt")) %>
                                    <%# (string.IsNullOrEmpty(string.Format("{0:}",Eval("ToServicePt"))) || string.IsNullOrEmpty(string.Format("{0:}",Eval("ToAddr")))) ? "":"<br /><br />"%>
                                    <%# string.Format("{0:}",Eval("ToAddr")) %>
                                  
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="ActPkg" UniqueName="ActPkg" SortExpression="ActPkg" HeaderText="Packages" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EqpGoodsDescr" UniqueName="EqpGoodsDescr" SortExpression="EqpGoodsDescr" HeaderText="TripDescription">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EqpSpecialInstruction" UniqueName="EqpSpecialInstruction" SortExpression="EqpSpecialInstruction" HeaderText="SpecialInstruction">
                            </telerik:GridBoundColumn>
                            
                            <telerik:GridTemplateColumn UniqueName="StatusDescr" HeaderText="TripType <br/> Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("type")) %>
                                    <br /><br />
                                    <%# string.Format("{0:}",Eval("StatusDescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                          
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" />
                             <telerik:GridBoundColumn DataField="jbid" UniqueName="jbid" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="70%" ID="BillableRadPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="PayableRadPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="PAndLRadPadeView" />
            <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="QRCodeRadPageView">
                <br />
                <table width="100%">
                    <tr>
                        <td valign="top" align="left">
                            <asp:PlaceHolder ID="JbId_QRCode" runat="server" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
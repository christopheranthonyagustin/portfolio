<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vehicle.aspx.cs" Inherits="iWMS.Web.Adm.User.Vehicle" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div id="div-datagrid" style="height: 100%">
            <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td style="padding-bottom: 8px; width: 700px">
                        <asp:Button ID="RemovBtn" class="white" runat="server" OnClick="RemovBtn_Click"
                            Text="Remove" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                    <td style="padding-bottom: 8px; padding-left: 15px;">
                        <asp:Label ID="Combolbl" runat="server" Text="Operations Unit"> 
                        </asp:Label>
                        <br />
                        <telerik:RadComboBox ID="OpsUnitCombo" runat="server" Width="155px" Skin="WebBlue" AllowCustomText="false" RenderMode="Lightweight" Filter="Contains" OnSelectedIndexChanged="OpsUnitCombo_SelectedIndexChanged" AutoPostBack="true">
                        </telerik:RadComboBox>

                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 5px; width: 700px">
                        <asp:Label ID="Label1" runat="server" Text="Assigned Vehicles" Font-Bold="true" Font-Size="Medium"/>
                    </td>
                    <td style="padding-bottom: 5px; padding-left: 15px;">

                        <asp:Label ID="Label2" runat="server" Text="Active Vehicles Not Assigned" Font-Bold="true" Font-Size="Medium"/>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="width: 680px " >

                        <telerik:RadGrid ID="ResultDGAssigned" runat="server" AutoGenerateColumns="false" GridLines="None" Height="480px"
                            EnableLinqExpressions="false"  Skin="Metro" AllowSorting="true" 
                            AllowFilteringByColumn="false" OnNeedDataSource="ResultDGAssigned_NeedDataSource"  AllowMultipleRowSelection="true" OnItemDataBound="ResultDGAssigned_ItemDataBound" AllowMultiRowSelection="True">
                            <ClientSettings AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true" >
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                                 <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>

                                    <telerik:GridBoundColumn DataField="refvalue" SortExpression="refvalue" HeaderText="VehNo"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="usrdef01" SortExpression="usrdef01" HeaderText="Type"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="usrdef02" SortExpression="usrdef02" HeaderText="OpsUnit"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="usrdef03" SortExpression="usrdef03" HeaderText="Driver"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="RouteDescr" SortExpression="RouteDescr" HeaderText="Route"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="usrdef04" SortExpression="usrdef04" HeaderText="Statusdescr"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                          <telerik:GridBoundColumn DataField="usrdef05" SortExpression="usrdef05" HeaderText="usrdef05" Display="false"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>                                   
                                    <telerik:GridBoundColumn Display="false" DataField="vstatuscolor">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                    <td valign="top" style="padding-left: 15px;width: 400px">

                        <telerik:RadGrid ID="ResultDGUnAssigned" runat="server" AutoGenerateColumns="false" GridLines="None" Height="480px"
                            EnableLinqExpressions="false" Skin="Metro" AllowSorting="true" OnRowDrop="ResultDGAssigned_RowDrop"
                          UseAccessibleHeader="true" AllowFilteringByColumn="false" OnNeedDataSource="ResultDGUnAssigned_NeedDataSource"  AllowMultiRowSelection="true" >
                               <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true" >
                                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" >
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="Vehno"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="Type" SortExpression="Type" HeaderText="Type"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="opsunitcode" SortExpression="opsunitcode" HeaderText="OpsUnit"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        </div>
    </form>
</body>
</html>

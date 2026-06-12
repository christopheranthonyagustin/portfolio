<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingManagementForm.aspx.cs" Inherits="iWMS.Web.Job.BookingManagement.BookingManagementForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ExportOrderForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
    <style type="text/css">
        body {
            padding: 20px;
        }

        .whole {
            width: auto;
            height: auto;
        }

        #eachLine {
            width: auto;
            padding: 5px;
            height: auto;
            display: table;
        }

        .tile {
            height: 35px;
            width: 120px;
            float: left;
            margin: 0 15px 20px 0;
            padding: 2px;
            overflow-wrap: break-word;
            word-wrap: break-word;
            hyphens: auto;
            position: relative;
            border-radius: 5px;
            transition: all 0.3s linear;
        }

            .tile:hover {
                transform: scale(1.05, 1.05);
                box-shadow: 0 5px 5px rgba(0, 0, 0, 0.1);
            }

                .tile:hover::after {
                    opacity: 1;
                }

        .tileLarge {
            width: 210px;
        }

        .small {
        }

        .tileText {
            color: white;
            font-weight: bold;
            font-size: 10pt;
        }
        /*color:#5c5c5c;*/
    </style>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            CausesValidation="false" AutoPostBack="True" OnTabClick="RadTabStrip1_TabClick" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Text="Receipt" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Vessel" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                &nbsp;
                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />

                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />    
                <asp:Button ID="AssignBtn" runat="server" CssClass="white" Text="Assign"
                    OnClick="AssignBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="false" />
                &nbsp;&nbsp;
                <asp:Button ID="CompleteBtn" runat="server" CssClass="white" Text="Complete"
                    OnClick="CompleteBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="false" />
                &nbsp;&nbsp;
                <asp:Button ID="DeliveryBtn" runat="server" CssClass="white" Text="Delivery"
                    OnClick="DeliveryBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                &nbsp;&nbsp;
                <asp:Button ID="CollectionBtn" runat="server" CssClass="white" Text="Collection"
                    OnClick="CollectionBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                &nbsp;&nbsp;
                <asp:Button ID="AddBoxBtn" runat="server" CssClass="white" Text="AddBox "
                    OnClick="AddBoxBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                &nbsp;&nbsp;
                <asp:Button ID="TransferBoxBtn" runat="server" CssClass="white" Text="TransferBox"
                    OnClick="TransferBoxBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                    AllowFilteringByColumn="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id"  EditMode="InPlace">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <%-- <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>--%>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="30px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerAddrEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="DeleteJBCtnrTrip" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Trips"
                                            align="middle" runat="server"></a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="FromDateTime">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker ID="FrdatetxtDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-Display="true" Skin="Sunset">
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator ID="FrdateReqVal" runat="server" ControlToValidate="FrdatetxtDatePicker"
                                        ErrorMessage="*" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="ToDateTime">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "toexpdate", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker ID="TodatetxtDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-Display="true" Skin="Sunset">
                                    </telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator ID="TodateReqVal" runat="server" ControlToValidate="TodatetxtDatePicker"
                                        ErrorMessage="*" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="typedesr" HeaderText="TripType">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "typedesr") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="TripTypeDDL" runat="server" Skin="WebBlue" DataSource='<%# TripTypeDS %>' DataTextField="descr" DataValueField="item"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripTypeDS, DataBinder.Eval(Container.DataItem, "typedesr").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripPostalCode" HeaderText="Postal Code">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripPostalCode")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="PostalCodeTxt" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "TripPostalCode") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripAddr" HeaderText="Address">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripAddr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="AddressTxt" Skin="WebBlue" TextMode="MultiLine"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "TripAddr") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="vehno" UniqueName="vehno" HeaderText="Vehicle">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "vehnodescr") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="VehicleDDL" runat="server" Skin="WebBlue" DataSource='<%# VehicleDS %>' DataTextField="descr" DataValueField="vehno"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(VehicleDS, DataBinder.Eval(Container.DataItem, "vehno").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="perid" UniqueName="perid" HeaderText="Driver">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PerName") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="DriverDDL" runat="server" Skin="WebBlue" DataSource='<%# DriverDS %>' DataTextField="name" DataValueField="id"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(DriverDS, DataBinder.Eval(Container.DataItem, "perid").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn SortExpression="route" UniqueName="route" HeaderText="Route">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "routedescr") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="RouteDDL" runat="server" Skin="WebBlue" DataSource='<%# RouteDS %>' DataTextField="descr" DataValueField="route"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(RouteDS,DataBinder.Eval(Container.DataItem, "route").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="statusdescr" HeaderText="Status">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "statusdescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="StatusDDL" runat="server" Skin="WebBlue" DataSource='<%# StatusDS %>' DataTextField="descr" DataValueField="item"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(StatusDS,DataBinder.Eval(Container.DataItem, "statusdescr").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <asp:Panel ID="SKUTileListPanel" runat="server">
                    <div class="whole">
                        <div id="eachLine" class="all-tiles">
                        </div>
                    </div>
                    <script type="text/javascript">
                        <%="" %>
                        <%
                        string[][] SKUList = (string[][])Session["jbCtnrItem_SKUList"];
                        %> 
                        <%
                        if (SKUList != null)
                        {
                            for (int i = 0; i < SKUList.Length; i++)
                            {
                                string[] t = SKUList[i];
                            %>
                        var divName = "<%=t[0]%>"
                        var iDiv = document.createElement('div');
                        iDiv.id = divName;
                        iDiv.className = "tile small";
                        iDiv.style.backgroundColor = "<%=t[3]%>"
                            iDiv.style.cursor = "pointer";
                            document.getElementById("eachLine").appendChild(iDiv);

                            var iSpan = document.createElement("span");
                            iSpan.className = "tileText";
                            iSpan.id = divName;
                            iSpan.innerHTML = "<%=t[2]%>"
                            document.getElementById(divName).appendChild(iSpan);
                        <%}%>
            
                            <%for (int i = 0; i < SKUList.Length; i++)
                        {
                            string[] t = SKUList[i];
                                %>
                        var skuId = "<%=t[0]%>";

                        document.getElementById(skuId).addEventListener('click', function (event) {
                            var id = event.target.id;
                            var descr = document.getElementById(id).firstChild.innerHTML;
                            var code = "<%=t[1]%>";

                                    AddJBCtnrItem(id);
                                });
                            <%}
                        }%>

                        function AddJBCtnrItem(id) {
                            document.getElementById('hiddenSKUtxt').value = id;
                            __doPostBack('AddJBCtnrItemBtn', '');
                        }
                    </script>

                    <div style="display: none">
                        <asp:Button ID="AddJBCtnrItemBtn" runat="server" Text="AddJBCtnrItem" OnClick="AddJBCtnrItemBtn_Click" />
                        <input type="hidden" id="hiddenSKUtxt" runat="server" />
                    </div>
                </asp:Panel>
                <telerik:RadGrid ID="ResultDGItem" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" OnEditCommand="ResultDGItem_EditCommand"
                    AllowPaging="false" Skin="Office2007" OnNeedDataSource="RadDGItem_NeedDataSource" OnCancelCommand="ResultDGItem_Cancel"
                    OnItemDataBound="ResultDGItem_ItemDataBound" OnUpdateCommand="ResultDGItem_Update" OnItemCommand="ResultDGItem_ItemCommand">

                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="checkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerAddrEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="DeleteJBCTNRItem" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Trips"
                                            align="middle" runat="server"></a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDGItem_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDGItem_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>                            
                            <telerik:GridTemplateColumn SortExpression="skudescr" UniqueName="skudescr" HeaderText="BoxSize">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "skudescr") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="BoxSizeTxt" runat="server" Skin="WebBlue" DataSource='<%# SKUDS %>' DataTextField="descr" DataValueField="id"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SKUDS, DataBinder.Eval(Container.DataItem, "skudescr").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="noofpkg" HeaderText="Quantity">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "noofpkg")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="QuantityTxt" Skin="WebBlue" Enabled="false"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "noofpkg") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TrackingNo" HeaderText="TrackingNo">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TrackingNo")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TrackingNoTxt" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "TrackingNo") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="UnitRate" HeaderText="UnitRate">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "uprice")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="UnitRateTxt" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "uprice") %>'>
                                    </telerik:RadTextBox>
                                    <asp:CompareValidator ID="UnitRateTxtReqVal" runat="server" Operator="DataTypeCheck"
                                            Type="Double" ControlToValidate="UnitRateTxt" ErrorMessage="#" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn HeaderText="DeliveryDate">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "deliverydate", "{0:dd/MMM/yyyy}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="DeliveryDate" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset">
                                    </telerik:RadDatePicker>                                   
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn HeaderText="CollectionDate">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "collectiondate", "{0:dd/MMM/yyyy}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="CollectionDate" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset">
                                    </telerik:RadDatePicker>                                   
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="M3" HeaderText="M3">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "vol")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="M3Txt" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "vol") %>'>
                                    </telerik:RadTextBox>
                                    <asp:CompareValidator ID="M3TxtReqVal" runat="server" Operator="DataTypeCheck"
                                            Type="Double" ControlToValidate="M3Txt" ErrorMessage="#" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>                            
                            <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "wt")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="WeightTxt" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "wt") %>'>
                                    </telerik:RadTextBox>
                                    <asp:CompareValidator ID="WeightTxtReqVal" runat="server" Operator="DataTypeCheck"
                                            Type="Double" ControlToValidate="WeightTxt" ErrorMessage="#" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Statusdescr" HeaderText="Status">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Statusdescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="StatusTxt" Skin="WebBlue" Enabled="false"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "Statusdescr") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn SortExpression="jbctnrid" DataField="jbctnrid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="700px" ID="ReceiptRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="VesselRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

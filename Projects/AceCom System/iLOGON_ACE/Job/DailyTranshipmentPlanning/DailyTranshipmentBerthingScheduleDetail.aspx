<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTranshipmentBerthingScheduleDetail.aspx.cs"
    Inherits="iWMS.Web.Job.DailyTranshipmentPlanning.DailyTranshipmentBerthingScheduleDetail" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TranshipmentBerthingDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
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
     <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="30" topmargin="30" rightmargin="30">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <asp:Label Style="z-index: 0" ID="Label2" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
    
        <telerik:RadGrid RenderMode="Lightweight" ID="ResultHeadDG" runat="server" AutoGenerateColumns="true" Skin="Office2007" Width="60%"/>

        <br />
        <br />
        <br />
        <br />

        <h2>DISCHARGING VESSEL</h2>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
         OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand" OnEditCommand="ResultDG_Edit"
            AllowSorting="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnUpdateCommand="ResultDG_Update"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JCId" PageSize="50" Name="ParentGrid" EditMode="InPlace" HierarchyLoadMode="Client" TableLayout="Fixed">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                <%--Ticket #5929: SMPL : Enhancement to Job Register - [BerthingSchedule]--%>
                <%--Pencil Icon--%>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="60px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PerHeadEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <%--End of Pencil Icon--%>
                
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="JobNo" SortExpression="JobNo" HeaderText="JobNo" ItemStyle-Wrap="false" HeaderStyle-Width="90px">
                        <ItemTemplate>
                            <asp:Label ID="JobNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "JobNo")%>'></asp:Label> 
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="75px" Enabled="false" runat="server" ID="JobNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "JobNo") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>            
                
                    <telerik:GridTemplateColumn DataField="OrderBy" SortExpression="OrderBy" HeaderText="OrderBy" ItemStyle-Wrap="false">
                         <ItemTemplate>
                            <asp:Label ID="OrderByLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OrderBy")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="OrderByTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OrderBy") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OrderNo" SortExpression="OrderNo" HeaderText="OrderNo" ItemStyle-Wrap="false">
                         <ItemTemplate>
                            <asp:Label ID="OrderNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OrderNo")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="OrderNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OrderNo") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="Size" SortExpression="Size" HeaderText="Size" ItemStyle-Wrap="false" HeaderStyle-Width="90px">
                         <ItemTemplate>
                            <asp:Label ID="SizeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Size")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%--<telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="SizeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "Size") %>'></telerik:RadTextBox>--%>
                            <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" DataSource='<%# BillSizeTypeDS%>' Skin="Sunset" Width="75px"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "Size").ToString())%>'
                                DropDownWidth="140px">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="BillSizeTypeReqVal" runat="server" ControlToValidate="BillSizeTypeDDL" ErrorMessage="*" ForeColor="Red" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                
                    <telerik:GridTemplateColumn DataField="Weight" SortExpression="Weight" HeaderText="Weight" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="WeightLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Weight")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="WeightTxt" Text='<%# DataBinder.Eval(Container.DataItem, "Weight") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="ContainerNo" SortExpression="ContainerNo" HeaderText="ContainerNo" ItemStyle-Wrap="false">
                         <ItemTemplate>
                            <asp:Label ID="ContainerNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="ContainerNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="DischargeCell" SortExpression="DischargeCell" HeaderText="DischargeCell" ItemStyle-Wrap="false" HeaderStyle-Width="100px">
                         <ItemTemplate>
                            <asp:Label ID="DischargeCellLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DischargeCell")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="90px" Enabled="true" runat="server" ID="DischargeCellTxt" Text='<%# DataBinder.Eval(Container.DataItem, "DischargeCell") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OH" SortExpression="OH" HeaderText="OH" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OHLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OH")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OHTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OH") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OWL" SortExpression="OWL" HeaderText="OWL" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OWLLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OWL")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OWLTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OWL") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OWR" SortExpression="OWR" HeaderText="OWR" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OWRLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OWR")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OWRTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OWR") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OLF" SortExpression="OLF" HeaderText="OLF" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OLFLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OLF")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OLFTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OLF") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OLR" SortExpression="OLR" HeaderText="OLR" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OLRLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OLR")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OLRTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OLR") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                      <telerik:GridTemplateColumn DataField="ConnVessel" SortExpression="ConnVessel" HeaderText="LoadVessel" ItemStyle-Wrap="false">
                         <ItemTemplate>
                            <asp:Label ID="ConnVesselLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ConnVessel")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                      <telerik:GridTemplateColumn DataField="ConnVoyage" SortExpression="ConnVoyage" HeaderText="LoadVoyage" ItemStyle-Wrap="false" HeaderStyle-Width="90px">
                         <ItemTemplate>
                            <asp:Label ID="ConnVoyageLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ConnVoyage")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                      <telerik:GridTemplateColumn DataField="ConnETA" SortExpression="LoadETA" HeaderText="LoadETA" ItemStyle-Wrap="false" HeaderStyle-Width="125px">
                         <ItemTemplate>
                            <asp:Label ID="ConnETALbl" runat="server" Text='<%# Eval("ConnETA", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="BerthNo" SortExpression="BerthNo" HeaderText="LoadBerth" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="BerthNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BerthNo")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="ConnCellNo" SortExpression="LoadCell" HeaderText="LoadCell" ItemStyle-Wrap="false" HeaderStyle-Width="90px">
                         <ItemTemplate>
                            <asp:Label ID="ConnCellNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ConnCellNo")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                
                    <telerik:GridBoundColumn DataField="AssignStatusColor" UniqueName="AssignStatusColor" Display="false">
                    </telerik:GridBoundColumn>

                </Columns>          
            </MasterTableView>
        </telerik:RadGrid>

        <br />
        <br />

        <h2>LOADING VESSEL</h2>
        <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click"
                            Text="Update" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <br /><br />
        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
         OnCancelCommand="ResultDG2_Cancel" OnItemCommand="ResultDG2_ItemCommand" OnEditCommand="ResultDG2_Edit"
            AllowSorting="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource" OnUpdateCommand="ResultDG2_Update"
            OnItemDataBound="ResultDG2_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JCId" PageSize="50" Name="ParentGrid" EditMode="InPlace" HierarchyLoadMode="Client" TableLayout="Fixed">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                <%--Ticket #5929: SMPL : Enhancement to Job Register - [BerthingSchedule]--%>
                <%--Pencil Icon--%>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="60px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PerHeadEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ParentCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <%--End of Pencil Icon--%>
                
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="JobNo" SortExpression="JobNo" HeaderText="JobNo" ItemStyle-Wrap="false" HeaderStyle-Width="90px">
                        <ItemTemplate>
                            <asp:Label ID="JobNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "JobNo")%>'></asp:Label> 
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="75px" Enabled="false" runat="server" ID="JobNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "JobNo") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                
                    <telerik:GridTemplateColumn DataField="OrderBy" SortExpression="OrderBy" HeaderText="OrderBy" ItemStyle-Wrap="false">
                         <ItemTemplate>
                            <asp:Label ID="OrderByLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OrderBy")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="OrderByTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OrderBy") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OrderNo" SortExpression="OrderNo" HeaderText="OrderNo" ItemStyle-Wrap="false">
                         <ItemTemplate>
                            <asp:Label ID="OrderNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OrderNo")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="OrderNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OrderNo") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="TrailerNo" SortExpression="TrailerNo" HeaderText="TrailerNo" ItemStyle-Wrap="false" HeaderStyle-Width="150px">
                         <ItemTemplate>
                            <asp:Label ID="TrailerNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TrailerNo")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="TrailerNoCBB" runat="server" DataTextField="descr" DataValueField="item"
                                DataSource='<%# TrailerNoDS%>' Skin="WebBlue" Width="140px"
                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" EmptyMessage="TrailerNo"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TrailerNoDS,DataBinder.Eval(Container.DataItem, "TrailerNo").ToString())%>'>
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="Location" SortExpression="Location" HeaderText="Location" ItemStyle-Wrap="false">
                         <ItemTemplate>
                            <asp:Label ID="LocationLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Location")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="LocationTxt" Text='<%# DataBinder.Eval(Container.DataItem, "Location") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="Size" SortExpression="Size" HeaderText="Size" ItemStyle-Wrap="false" HeaderStyle-Width="90px">
                         <ItemTemplate>
                            <asp:Label ID="SizeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Size")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%--<telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="SizeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "Size") %>'></telerik:RadTextBox>--%>
                            <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                DataValueField="Item" DataSource='<%# BillSizeTypeDS%>' Skin="Sunset" Width="75px"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "Size").ToString())%>'
                                DropDownWidth="140px">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="BillSizeTypeReqVal" runat="server" ControlToValidate="BillSizeTypeDDL" ErrorMessage="*" ForeColor="Red" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                
                    <telerik:GridTemplateColumn DataField="Weight" SortExpression="Weight" HeaderText="Weight" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="WeightLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Weight")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="WeightTxt" Text='<%# DataBinder.Eval(Container.DataItem, "Weight") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="ContainerNo" SortExpression="ContainerNo" HeaderText="ContainerNo" ItemStyle-Wrap="false">
                         <ItemTemplate>
                            <asp:Label ID="ContainerNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="110px" Enabled="true" runat="server" ID="ContainerNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="LoadingCell" SortExpression="ConnCellNo" HeaderText="LoadingCell" ItemStyle-Wrap="false" HeaderStyle-Width="100px">
                         <ItemTemplate>
                            <asp:Label ID="LoadingCellLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LoadingCell")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="90px" Enabled="true" runat="server" ID="LoadingCellTxt" Text='<%# DataBinder.Eval(Container.DataItem, "LoadingCell") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OH" SortExpression="OH" HeaderText="OH" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OHLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OH")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OHTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OH") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OWL" SortExpression="OWL" HeaderText="OWL" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OWLLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OWL")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OWLTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OWL") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OWR" SortExpression="OWR" HeaderText="OWR" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OWRLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OWR")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OWRTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OWR") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OLF" SortExpression="OLF" HeaderText="OLF" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OLFLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OLF")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OLFTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OLF") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="OLR" SortExpression="OLR" HeaderText="OLR" ItemStyle-Wrap="false" HeaderStyle-Width="75px">
                         <ItemTemplate>
                            <asp:Label ID="OLRLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OLR")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox Width="60px" Enabled="true" runat="server" ID="OLRTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OLR") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                
                    <telerik:GridBoundColumn DataField="AssignStatusColor" UniqueName="AssignStatusColor" Display="false">
                    </telerik:GridBoundColumn>

                </Columns>          
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

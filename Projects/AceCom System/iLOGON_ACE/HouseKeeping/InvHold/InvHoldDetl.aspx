<%@ Page Language="c#" CodeBehind="InvHoldDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.InvHold.InvHoldDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>InvHoldDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("SelectCB").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("SelectCB").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <style type="text/css">
        /* The switch - the box around the slider */
        .switch {
            position: relative;
            display: inline-block;
            width: 33px;
            height: 17px;
        }

            /* Hide default HTML checkbox */
            .switch input {
                display: none;
            }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #A8A8A8;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 11px;
                width: 14px;
                left: 3px;
                bottom: 3px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #393;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #393;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(13px);
            -ms-transform: translateX(13px);
            transform: translateX(13px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 5px;
        }

            .slider.round:before {
                border-radius: 20%;
            }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <asp:Panel ID="AddDetailPanel" runat="server" Visible="False">
                <tr style="height: 10px">
                </tr>
                <tr>
                    <td style="width: 5px"></td>
                    <td style="height: 4px">
                        <asp:Button ID="AddDetailBtn" runat="server" Text="New" Visible="True" UseSubmitBehavior="false" CssClass="white" OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;&nbsp;
                    </td>
                </tr>
            </asp:Panel>
            <asp:Panel ID="RadMenuPanel" runat="server">
                <tr style="height: 4px">
                </tr>
                <tr>
                    <td style="width: 5px"></td>
                    <td style="width: 90px">
                        <telerik:RadMenu ID="QCProcessRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                            OnItemClick="QCProcessRadMenu_ItemClick">
                            <Items>
                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="QCProcess" PostBack="false"
                                    Value="QCProcess">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="fillsampleqty" Text="Fill Sample Qty" />
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="fillrejectqty" Text="Fill Reject Qty" />
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="requestreject" Text="Request Reject" />
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="reject" Text="Reject" />
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="close" Text="Close" />
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="sendinspectionresult" Text="Send Inspection Result" />
                                    </Items>
                                </telerik:RadMenuItem>
                            </Items>
                        </telerik:RadMenu>
                    </td>
                    <td style="width: 5px"></td>
                    <td>
                        <telerik:RadMenu ID="QCPrintRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                            OnItemClick="QCPrintRadMenu_ItemClick">
                            <Items>
                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="QCPrint" PostBack="false"
                                    Value="QCPrint">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="printqcdocument" Text="Print QC Document" />
                                    </Items>
                                </telerik:RadMenuItem>
                            </Items>
                        </telerik:RadMenu>
                        &nbsp;
                        <asp:Button ID="SaveBtn" runat="server" Text="Save" UseSubmitBehavior="false" CssClass="white"
                            OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id,false)"></asp:Button>
                        &nbsp;
                        <asp:Button ID="ConfirmHoldBtn" runat="server" Text="Confirm Hold" UseSubmitBehavior="false" CssClass="LongLabelWhite"
                            OnClick="ConfirmHoldBtn_Click" OnClientClick="disableBtn(this.id,false)"></asp:Button>
                        &nbsp;
                        <asp:Button ID="DeleteItemBtn" runat="server" Text="Delete Item" UseSubmitBehavior="false" CssClass="LongLabelWhite"
                            OnClick="DeleteItemBtn_Click" OnClientClick="disableBtn(this.id,false)"></asp:Button>
                        &nbsp;
                    </td>
                </tr>
            </asp:Panel>
        </table>
        <br>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling ScrollHeight="450px" AllowScroll="true" />
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:CheckBox ID="SelectAllCB" runat="server" onclick="CheckAll(this);" AutoPostBack="false" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCB" runat="server" ValidationGroup="normal" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        <ItemTemplate>
                            <a id="lnkHold" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Hold Inventory?')"
                                onserverclick="IHDetl_Hold" runat="server">
                                <img id="holdImg" src="../../image/hold.png" width="15" height="15" border="0" alt="Hold Inventory"
                                    runat="server" visible="false"></a> <a id="lnkUnhold" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        onclick="return confirm('Confirm Release Inventory?')" onserverclick="IHDetl_Unhold"
                                        runat="server">
                                        <img id="unholdImg" src="../../image/unhold.png" width="15" height="15" border="0"
                                            alt="Release Inventory" runat="server" visible="false"></a> <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onclick="return confirm('Confirm delete Inv.Hold detail?')" onserverclick="IHDetl_Delete"
                                                runat="server">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Inv.Hold Detail"
                                                    runat="server" /></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SKUDescription">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="heldqty" SortExpression="heldqty" HeaderText="Qty">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="SampleQty" HeaderStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="sampleqtyTxt" Text='<%# DataBinder.Eval(Container.DataItem, "sampleqty", "{0:#.##}") %>'
                                Skin="WebBlue" OnTextChanged="ResultDG_sampleqtyTextChanged" AutoPostBack="true" Width="80">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="sampleqtyTxtCompVal" runat="server" ControlToValidate="sampleqtyTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" CssClass="errorLabel" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="AcceptQty" HeaderStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="acceptqtyTxt" Text='<%# DataBinder.Eval(Container.DataItem, "acceptqty", "{0:#.##}") %>'
                                Skin="WebBlue" Width="80">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="AcceptLocation" HeaderStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadComboBox ID="AcceptLocationCombo" runat="server" RenderMode="Lightweight" Skin="WebBlue" DataTextField="Code" DataValueField="Code" Filter="Contains"
                                EnableAutomaticLoadOnDemand="true" ItemsPerRequest="20" AutoPostBack="true" CausesValidation="false" DropDownAutoWidth="Enabled" EnableVirtualScrolling="true" ShowMoreResultsBox="true"
                                OnLoad="AcceptLocationCombo_Load">
                            </telerik:RadComboBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="RejectQty" HeaderStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="rejectqtyTxt" Text='<%# DataBinder.Eval(Container.DataItem, "rejectqty", "{0:#.##}") %>'
                                Skin="WebBlue" Width="80">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="rejectqtyTxtCompVal" runat="server" ControlToValidate="rejectqtyTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" CssClass="errorLabel" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="RejectLocation" HeaderStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadComboBox ID="RejectLocationCombo" runat="server" RenderMode="Lightweight" Skin="WebBlue" DataTextField="Code" DataValueField="Code" Filter="Contains"
                                EnableAutomaticLoadOnDemand="true" ItemsPerRequest="20" AutoPostBack="true" CausesValidation="false" DropDownAutoWidth="Enabled" EnableVirtualScrolling="true" ShowMoreResultsBox="true"
                                OnLoad="RejectLocationCombo_Load">
                            </telerik:RadComboBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Reason" HeaderStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadDropDownList ID="qcreasonDdl" runat="server" DropDownHeight="150px" Skin="WebBlue"
                                DataSource='<%# QCReasonListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(QCReasonListDS,DataBinder.Eval(Container.DataItem, "qcreasoncode").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="QCRemarks" HeaderStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="qcremarkTxt" Text='<%# DataBinder.Eval(Container.DataItem, "qcremark") %>'
                                TextMode="MultiLine" Rows="2" Skin="WebBlue">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="QCMeasurement" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <label class="switch">
                                <input id="qcmeasurementToggle" runat="server" type="checkbox" name="switch" value='<%# DataBinder.Eval(Container.DataItem, "qcmeasurement") %>'>
                                <div class="slider round"></div>
                            </label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="QCVisual" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <label class="switch">
                                <input id="qcvisualToggle" runat="server" type="checkbox" name="switch" value='<%# DataBinder.Eval(Container.DataItem, "qcvisual") %>'>
                                <div class="slider round"></div>
                            </label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="QCComp" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <label class="switch">
                                <input id="qccompToggle" runat="server" type="checkbox" name="switch" value='<%# DataBinder.Eval(Container.DataItem, "qccomp") %>'>
                                <div class="slider round"></div>
                            </label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="QCOthers" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <label class="switch">
                                <input id="qcothersToggle" runat="server" type="checkbox" name="switch" value='<%# DataBinder.Eval(Container.DataItem, "qcothers") %>'>
                                <div class="slider round"></div>
                            </label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="QCSpecs" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                        <ItemTemplate>
                            <label class="switch">
                                <input id="qcspecsToggle" runat="server" type="checkbox" name="switch" value='<%# DataBinder.Eval(Container.DataItem, "qcspecs") %>'>
                                <div class="slider round"></div>
                            </label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="qccount" SortExpression="qccount" HeaderText="QCCount">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="inspectionlotno" SortExpression="inspectionlotno" HeaderText="InspectionLotNo">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 4">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'
                                ID="FrLot4Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 1">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot1") %>'
                                ID="FrLot1Lbl" DataFormatString="{0:dd/MMM/yyyy}" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 5">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>'
                                ID="FrLot5Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 6">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>'
                                ID="FrLot6Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 7">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'
                                ID="FrLot7Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 2">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2") %>'
                                ID="FrLot2Lbl" DataFormatString="{0:dd/MMM/yyyy}" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 3">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3") %>'
                                ID="FrLot3Lbl" DataFormatString="{0:dd/MMM/yyyy}" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 8">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>'
                                ID="FrLot8Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot9" HeaderText="Lot9" SortExpression="lot9">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot9") %>'
                                ID="FrLot9Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot10" HeaderText="Lot10" SortExpression="lot10">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot10") %>'
                                ID="FrLot10Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot11" HeaderText="Lot11" SortExpression="lot11">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot11") %>'
                                ID="FrLot11Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot12" HeaderText="Lot12" SortExpression="lot12">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot12") %>'
                                ID="FrLot12Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot13" HeaderText="Lot13" SortExpression="lot13">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot13") %>'
                                ID="FrLot13Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot14" HeaderText="Lot14" SortExpression="lot14">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot14") %>'
                                ID="FrLot14Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot15" HeaderText="Lot15" SortExpression="lot15">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot15") %>'
                                ID="FrLot15Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot16" HeaderText="Lot16" SortExpression="lot16">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot16") %>'
                                ID="FrLot16Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot17" HeaderText="Lot17" SortExpression="lot17">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot17") %>'
                                ID="FrLot17Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot18" HeaderText="Lot18" SortExpression="lot18">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot18") %>'
                                ID="FrLot18Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot19" HeaderText="Lot19" SortExpression="lot19">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot19") %>'
                                ID="FrLot19Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot20" HeaderText="Lot20" SortExpression="lot20">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot20") %>'
                                ID="FrLot20Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot21" HeaderText="Lot21" SortExpression="lot21">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot21") %>'
                                ID="FrLot21Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot22" HeaderText="Lot22" SortExpression="lot22">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot22") %>'
                                ID="FrLot22Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot23" HeaderText="Lot23" SortExpression="lot23">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot23") %>'
                                ID="FrLot23Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot24" HeaderText="Lot24" SortExpression="lot24">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot24") %>'
                                ID="FrLot24Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot25" HeaderText="Lot25" SortExpression="lot25">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot25") %>'
                                ID="FrLot25Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot26" HeaderText="Lot26" SortExpression="lot26">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot26") %>'
                                ID="FrLot26Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot27" HeaderText="Lot27" SortExpression="lot27">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot27") %>'
                                ID="FrLot27Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot28" HeaderText="Lot28" SortExpression="lot28">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot28") %>'
                                ID="FrLot28Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot29" HeaderText="Lot29" SortExpression="lot29">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot29") %>'
                                ID="FrLot29Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot30" HeaderText="Lot30" SortExpression="lot30">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot30") %>'
                                ID="FrLot30Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot31" HeaderText="Lot31" SortExpression="lot31">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot31") %>'
                                ID="FrLot31Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot32" HeaderText="Lot32" SortExpression="lot32">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot32") %>'
                                ID="FrLot32Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot33" HeaderText="Lot33" SortExpression="lot33">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot33") %>'
                                ID="FrLot33Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot34" HeaderText="Lot34" SortExpression="lot34">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot34") %>'
                                ID="FrLot34Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot35" HeaderText="Lot35" SortExpression="lot35">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot35") %>'
                                ID="FrLot35Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot36" HeaderText="Lot36" SortExpression="lot36">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot36") %>'
                                ID="FrLot36Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot37" HeaderText="Lot37" SortExpression="lot37">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot37") %>'
                                ID="FrLot37Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot38" HeaderText="Lot38" SortExpression="lot38">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot38") %>'
                                ID="FrLot38Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot39" HeaderText="Lot39" SortExpression="lot39">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot39") %>'
                                ID="FrLot39Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot40" HeaderText="Lot40" SortExpression="lot40">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot40") %>'
                                ID="FrLot40Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot41" HeaderText="Lot41" SortExpression="lot41">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot41") %>'
                                ID="FrLot41Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot42" HeaderText="Lot42" SortExpression="lot42">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot42") %>'
                                ID="FrLot42Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot43" HeaderText="Lot43" SortExpression="lot43">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot43") %>'
                                ID="FrLot43Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot44" HeaderText="Lot44" SortExpression="lot44">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot44") %>'
                                ID="FrLot44Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot45" HeaderText="Lot45" SortExpression="lot45">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot45") %>'
                                ID="FrLot45Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot46" HeaderText="Lot46" SortExpression="lot46">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot46") %>'
                                ID="FrLot46Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot47" HeaderText="Lot47" SortExpression="lot47">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot47") %>'
                                ID="FrLot47Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot48" HeaderText="Lot48" SortExpression="lot48">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot48") %>'
                                ID="FrLot48Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot49" HeaderText="Lot49" SortExpression="lot49">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot49") %>'
                                ID="FrLot49Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot50" HeaderText="Lot50" SortExpression="lot50">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot50") %>'
                                ID="FrLot50Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot51" HeaderText="Lot51" SortExpression="lot51">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot51") %>'
                                ID="FrLot51Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot52" HeaderText="Lot52" SortExpression="lot52">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot52") %>'
                                ID="FrLot52Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot53" HeaderText="Lot53" SortExpression="lot53">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot53") %>'
                                ID="FrLot53Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot54" HeaderText="Lot54" SortExpression="lot54">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot54") %>'
                                ID="FrLot54Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot55" HeaderText="Lot55" SortExpression="lot55">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot55") %>'
                                ID="FrLot55Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot56" HeaderText="Lot56" SortExpression="lot56">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot56") %>'
                                ID="FrLot56Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot57" HeaderText="Lot57" SortExpression="lot57">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot57") %>'
                                ID="FrLot57Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot58" HeaderText="Lot58" SortExpression="lot58">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot58") %>'
                                ID="FrLot58Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot59" HeaderText="Lot59" SortExpression="lot59">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot59") %>'
                                ID="FrLot59Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="lot60" HeaderText="Lot60" SortExpression="lot60">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot60") %>'
                                ID="FrLot60Lbl" /><br>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TuNo1">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TuNo2">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="slltid" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="qcmeasurement" SortExpression="qcmeasurement">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="qcvisual" SortExpression="qcvisual">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="qccomp" SortExpression="qccomp">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="qcothers" SortExpression="qcothers">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="qcspecs" SortExpression="qcspecs">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AcceptLocCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RejectLocCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolorcode" Display="false"></telerik:GridBoundColumn>
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
            </MasterTableView>
        </telerik:RadGrid>

    </form>
</body>
</html>

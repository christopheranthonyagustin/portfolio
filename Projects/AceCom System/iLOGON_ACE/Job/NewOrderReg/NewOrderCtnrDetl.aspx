
<%@ Page Language="c#" CodeBehind="NewOrderCtnrDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.NewOrderReg.NewOrderCtnrDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>NewOrderCtnrDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <style type="text/css">
        .style1
        {
            height: 39px;
        }
        .style2
        {
            width: 180px;
        }
        .style3
        {
            height: 39px;
            width: 180px;
        }
    </style>
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload="if (document.getElementById('CtnrNoTxt')!= null) document.getElementById('CtnrNoTxt').focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td align="left">
                <asp:Button ID="AddDetailBtn" runat="server" Text="NewLine" Visible="False" CssClass="detailButton"
                    OnClick="AddDetailBtn_Click"></asp:Button>&nbsp; 
                    <asp:Button ID="switchEqpBtn" runat="server" Text="Switch-Eqp" Visible="False" CssClass="detailButton"
                    OnClick="switchBtn_Click"></asp:Button>&nbsp;
                <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/dustbin.png" Width="30" Height="30"
                    Visible="false" OnClick="DeleteAllBtn_Click" BackColor="Transparent" BorderWidth="0"
                    ImageAlign="AbsMiddle" ToolTip="Delete Selected Container(s)" />
            &nbsp;
                <asp:Button ID="PopFromSpBtn" runat="server" Text="Populate From ShipPlan" Visible="False" CssClass="detailButton"
                    OnClick="PopFromSpBtn_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="AddPanel" runat="server" Visible="False">
                    <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td colspan="3" align="left">
                                <asp:Button ID="SaveNextBtn" runat="server" CssClass="detailButton" OnClick="SaveNextBtn_Click"
                                    Text="Save &amp; Next" />
                                &nbsp;<asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" OnClick="SaveBtn_Click"
                                    Text=" Save " />
                                <asp:Button ID="ClosePanelBtn" runat="server" CausesValidation="False" CssClass="detailButton"
                                    OnClick="ClosePanelBtn_Click" Text="ShowAllLines" />
                            </td>
                            <td colspan="3">
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                            <td align="right" class="style2">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="EqpTypelbl" runat="server">EquipmentType</asp:Label>
                                <asp:RequiredFieldValidator ID="EqpTypeReq" runat="server" ControlToValidate="EqpTypeList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <br />
                                <asp:DropDownList ID="EqpTypeList" runat="server" BackColor="Yellow" OnSelectedIndexChanged="EqpTypeList_SelectedIndexChanged"
                                    AutoPostBack="True" DataTextField="Descr" DataValueField="item" Enabled="True"
                                    Width="155px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="JobTypelbl" runat="server">JobType</asp:Label>
                                <asp:RequiredFieldValidator ID="JobTypeReq" runat="server" ControlToValidate="JobTypeList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <br />
                                <asp:DropDownList ID="JobTypeList" runat="server" AutoPostBack="True" BackColor="Yellow"
                                    DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="TptTypelbl" runat="server">TransportType</asp:Label>
                                <asp:RequiredFieldValidator ID="TptTypeReq" runat="server" ControlToValidate="TptTypeList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <br />
                                <asp:DropDownList ID="TptTypeList" runat="server" AutoPostBack="True" BackColor="Yellow"
                                    DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="expdatelbl" runat="server">StartDate</asp:Label>
                                <asp:CalendarExtender ID="expDateTxt_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="expDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                    Format="dd/MMM/yyyy">
                                </asp:CalendarExtender>
                                <asp:RequiredFieldValidator Style="z-index: 0" ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="expDateTxt" ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <asp:TextBox ID="expDateTxt" runat="server" BackColor="Yellow" Width="155px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="exptimelbl" runat="server">StartTime</asp:Label>
                                <asp:RequiredFieldValidator ID="ExpTimeReq" runat="server" ControlToValidate="ExpTimeList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <asp:DropDownList ID="ExpTimeList" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" BackColor="Yellow" Width="155px">
                                </asp:DropDownList>
                            </td>
                            <td class="style1">
                                <asp:Label ID="bkRefLbl" runat="server">BookingRef</asp:Label><br />
                                <asp:TextBox ID="bkRefTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="ooglbl" runat="server">OutOfGauge</asp:Label><br />
                                <asp:DropDownList ID="OOGList" runat="server" Enabled="True" DataTextField="" DataValueField="item"
                                    Width="155px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap class="style1">
                                <asp:Label ID="sizetypelbl" runat="server">BillSizeType</asp:Label>
                                <asp:RequiredFieldValidator ID="SizeTypeReq" runat="server" ControlToValidate="SizeTypeList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <asp:DropDownList ID="SizeTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" BackColor="Yellow" Width="155px">
                                </asp:DropDownList>
                            </td>
                            <td nowrap class="style1">
                                <asp:Label ID="ctnrwtlbl" runat="server">ContainerWt</asp:Label>
                                <%--<asp:RequiredFieldValidator style="Z-INDEX: 0" id="WeightReq" runat="server" ControlToValidate="WeightTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
										<asp:comparevalidator style="Z-INDEX: 0" id="WeightCompareVal" runat="server" ControlToValidate="WeightTxt"
											ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:comparevalidator>--%><br>
                                <asp:TextBox ID="WeightTxt" runat="server" Width="155px"></asp:TextBox>
                            </td>
                            <td nowrap class="style1">
                                <asp:Label ID="ctnrvollbl" runat="server">ContainerVol</asp:Label>
                                <%--<asp:RequiredFieldValidator style="Z-INDEX: 0" id="VolumeReq" runat="server" ControlToValidate="VolumeTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
										<asp:comparevalidator style="Z-INDEX: 0" id="VolumeCompareVal" runat="server" ControlToValidate="VolumeTxt"
											ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:comparevalidator>--%><br>
                                <asp:TextBox ID="VolumeTxt" runat="server" Width="155px"></asp:TextBox>
                                <br>
                            </td>
                            <td>
                                <asp:Label ID="enddatelbl" runat="server">EndDate</asp:Label>
                                <asp:CalendarExtender ID="endDateTxt_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="endDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                    Format="dd/MMM/yyyy">
                                </asp:CalendarExtender><br />
                                <asp:TextBox ID="endDateTxt" runat="server" Width="155px"></asp:TextBox>
                            </td>
                            <td class="style1">
                                <asp:Label ID="endtimelbl" runat="server">EndTime</asp:Label><br />
                                <asp:DropDownList ID="EndTimeList" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" Width="155px">
                                </asp:DropDownList>
                            </td>
                            <td class="style1">
                                <asp:Label ID="orgbkrefLbl" runat="server">OriginalBookingRef</asp:Label><br />
                                <asp:TextBox ID="orgbkRefTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                            </td>
                            <td class="style1">
                                <asp:Label ID="overhtlbl" runat="server">OverHeight</asp:Label>
                                <br />
                                <asp:TextBox ID="OverHtTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap>
                                <asp:Label ID="ctnrnolbl" runat="server">EquipmentReference</asp:Label>
                                <asp:RequiredFieldValidator Style="z-index: 0" ID="CtnrNoReq" runat="server" ControlToValidate="CtnrNoTxt"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <asp:TextBox ID="CtnrNoTxt" runat="server" BackColor="Yellow" Width="155px"></asp:TextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="goodswtlbl" runat="server">GoodsWt</asp:Label>
                                <%-- <asp:RequiredFieldValidator style="Z-INDEX: 0" id="GoodsWeightReq" runat="server" ControlToValidate="GoodsWeightTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
										<asp:comparevalidator style="Z-INDEX: 0" id="GoodsWeightCompareVal" runat="server" ControlToValidate="GoodsWeightTxt"
											ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:comparevalidator>--%><br>
                                <asp:TextBox ID="GoodsWeightTxt" runat="server" Width="155px"></asp:TextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="goodsvollbl" runat="server">GoodsVol</asp:Label>
                                <%--<asp:RequiredFieldValidator style="Z-INDEX: 0" id="GoodsVolumeReq" runat="server" ControlToValidate="GoodsVolumeTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
										<asp:comparevalidator style="Z-INDEX: 0" id="GoodsVolumeCompareVal" runat="server" ControlToValidate="GoodsVolumeTxt"
											ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:comparevalidator>--%><br>
                                <asp:TextBox ID="GoodsVolumeTxt" runat="server" Width="155px"></asp:TextBox>
                            </td>
                            <td nowrap class="style3">
                                <asp:Label ID="TransporterLbl" runat="server">VendorOpCode</asp:Label><br />
                                <asp:TextBox ID="TransporterCodeTxt" runat="server" AutoPostBack="True" OnTextChanged="TransporterCodeTxt_TextChanged"
                                    Width="155px"></asp:TextBox>
                                <asp:LinkButton ID="LookupBtn" runat="server" CausesValidation="False">
                                        <img align="absmiddle" border="0" src="../../image/icon-lookup.gif"></asp:LinkButton>
                            </td>
                            <td nowrap class="style2">
                                <asp:Label ID="TransporternameLbl" runat="server">VendorOpName</asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
                                <asp:TextBox ID="TransporterNameTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="style1">
                                <asp:Label ID="quaycranelbl" runat="server">QuayCrane</asp:Label><br />
                                <asp:TextBox ID="QuayCraneTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                            </td>
                            <td class="style1">
                                <asp:Label ID="overwtlbl" runat="server">OverWidth</asp:Label>
                                <br />
                                <asp:TextBox ID="OverWtTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap valign="top">
                                <asp:Label ID="sealnolbl" runat="server">SealNo</asp:Label>
                                <br />
                                <asp:TextBox ID="SealNoTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                                <br />
                                <asp:Label ID="remarkslbl" runat="server">Remarks</asp:Label>
                                <br>
                                <asp:TextBox Style="z-index: 0" ID="remarksTxt" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="155px" Height="80px"></asp:TextBox>
                            </td>
                            <td nowrap valign="top">
                                <asp:Label ID="qtyLbl" runat="server">Qty</asp:Label>
                                <asp:CompareValidator Style="z-index: 0" ID="Comparevalidator1" runat="server" ControlToValidate="QtyTxt"
                                    ErrorMessage="#" Type="Integer" ValueToCompare="0" Operator="GreaterThanEqual"></asp:CompareValidator><br>
                                <asp:TextBox ID="QtyTxt" runat="server" Width="155px"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label1" runat="server">Description</asp:Label>
                                <br>
                                <asp:TextBox Style="z-index: 0" ID="descrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="155px" Height="80px"></asp:TextBox>
                            </td>
                            <td nowrap valign="top">
                                <asp:Label ID="frserviceptlbl" runat="server">CollectFrom</asp:Label>
                                <%--<asp:RequiredFieldValidator id="FrServiceTypeReq" runat="server" ControlToValidate="FrServicePointList" ErrorMessage="*"></asp:RequiredFieldValidator>--%><br>
                                <asp:DropDownList ID="FrServicePointList" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" OnSelectedIndexChanged="FrServicePointList_SelectedIndexChanged"
                                    AutoPostBack="True" Width="155px">
                                </asp:DropDownList>
                                <%--<asp:Label ID="fraddrlbl" runat="server">From Address</asp:Label>--%>
                                <br />
                                <br />
                                <asp:TextBox Style="z-index: 0" ID="FrAddrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="155px" Height="80px"></asp:TextBox>
                            </td>
                            <td nowrap valign="top" class="style2">
                                <asp:Label ID="toserviceptlbl" runat="server">DeliverTo</asp:Label>
                                <%--<asp:RequiredFieldValidator id="ToServiceTypeReq" runat="server" ControlToValidate="ToServicePointList" ErrorMessage="*"></asp:RequiredFieldValidator>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;<br>
                                <asp:DropDownList ID="ToServicePointList" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" OnSelectedIndexChanged="ToServicePointList_SelectedIndexChanged"
                                    AutoPostBack="True" Width="155px">
                                </asp:DropDownList>
                                <%--<asp:Label ID="toaddrlbl" runat="server">To Address</asp:Label>--%>&nbsp;&nbsp;&nbsp;
                                <br />
                                <br />
                                <asp:TextBox Style="z-index: 0" ID="ToAddrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="155px" Height="80px"></asp:TextBox>
                            </td>
                            <td class="style1" valign="top">
                                <asp:Label ID="NoofPackagesLbl0" runat="server">NoOfPackages</asp:Label>
                                <br />
                                <asp:TextBox ID="NoofPackagesTxt0" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="NoofPalletLbl1" runat="server">NoOfPallets</asp:Label>
                                <br />
                                <asp:TextBox ID="NoofPalletsTxt1" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="NoOfTripsLbl" runat="server">NoOfTrips</asp:Label>
                                <br />
                                <asp:TextBox ID="NoOfTripsTxt" runat="server" Style="z-index: 0" 
                                    Width="155px"></asp:TextBox>
                            </td>
                            <td class="style1" valign="top">
                                <asp:Label ID="cellnolbl" runat="server">CellNo</asp:Label><br />
                                <asp:TextBox ID="CellNoTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                                <br />
                                <asp:Label ID="NoOfHoursLbl" runat="server">NoOfHours</asp:Label>
                                <br />
                                <asp:TextBox ID="NoOfHoursTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                                <br />
                                <asp:Label ID="NoOfHeadCountLbl" runat="server">NoOfHeadCount</asp:Label>
                                <br />
                                <asp:TextBox ID="NoOfHeadCountTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                            </td>
                            <td valign="top">
                                <asp:Label ID="overlenlbl" runat="server">OverLength</asp:Label>
                                <br />
                                <asp:TextBox ID="OverLenTxt" runat="server" Style="z-index: 0" Width="155px"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="TransporterIdTxt" runat="server" Style="z-index: 0" Visible="false"
                                    Width="155px"></asp:TextBox>
                                <asp:Label ID="PoliceEsc_Lbl" runat="server">PoliceEscort</asp:Label><br />
                                <asp:DropDownList ID="PolEsc_ddl" runat="server" Enabled="True" Width="155px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br>

     <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
             EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007"  AllowSorting ="true" 
              AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound"  OnNeedDataSource="ResultDG_NeedDataSource"  >
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false" >
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="Detail_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                runat="server"></a>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false" >
                     <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="eqptypedescr" SortExpression="eqptypedescr" HeaderText="EqpType"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="eqptype" SortExpression="eqptype" Display="false"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ctnrtypedescr" SortExpression="ctnrtypedescr" HeaderText="BillSizeType"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="jobtypedescr" SortExpression="jobtypedescr" HeaderText="JobType"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="tpttypedescr" SortExpression="tpttypedescr" HeaderText="TptType"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="EqpRef"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ctnrsealno" SortExpression="ctnrsealno" HeaderText="Seal"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ctnrwt" SortExpression="ctnrwt" HeaderText="CtnrWt" DataFormatString="{0:#,0.000}"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ctnrvol" SortExpression="ctnrvol" HeaderText="CtnrVol"
                    DataFormatString="{0:#,0.000}"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="frservicept" SortExpression="frservicept" HeaderText="FrServicePt"
                    Display="false"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="toservicept" SortExpression="toservicept" HeaderText="ToServicePt"
                    Display="false"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="frserviceptdescr" SortExpression="frserviceptdescr" HeaderText="FrSvcPt"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="FrAddr"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="toserviceptdescr" SortExpression="toserviceptdescr" HeaderText="ToSvcPt"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="ToAddr"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Descr"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="tpterid" SortExpression="tpterid" HeaderText="TransporterId"
                   Display="false"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="tptercode" SortExpression="tptercode" HeaderText="Vendor"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="tptername" SortExpression="tptername" HeaderText="Name"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="cellno" SortExpression="cellno" HeaderText="CellNo"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sno" Display="False"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="policeescort" Display="False"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jobtype" Display="false"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tpttype" Display="false"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    
                     </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>














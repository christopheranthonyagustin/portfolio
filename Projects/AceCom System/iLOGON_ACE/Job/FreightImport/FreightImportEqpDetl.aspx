<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightImportEqpDetl.aspx.cs"
    Inherits="iWMS.Web.Job.FreightImport.FreightImportEqpDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TransportCtnrDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1 {
            height: 39px;
        }

        .style2 {
            width: 180px;
        }

        .style3 {
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
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload="if (document.getElementById('CtnrNoTxt')!= null) document.getElementById('CtnrNoTxt').focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Container" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Upload" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td align="left">
                            <br />
                            <asp:Button ID="AddDetailBtn" runat="server" Text="New" Visible="False" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="AddDetailBtn_Click"></asp:Button>
                            &nbsp;
                    <asp:Button ID="DelImgBtn" runat="server" CssClass="white" OnClick="DeleteAllBtn_Click" UseSubmitBehavior="false"
                        Text="Delete" Visible="false" OnClientClick="disableBtn(this.id,false)" />
                            &nbsp;
                    <asp:Button ID="PopToTPRBtn" runat="server" CssClass="green" Text="Transport" OnClick="PopToTPRBtn_Click"
                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="AddPanel" runat="server" Visible="False">
                                <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                                    <tr>
                                        <td colspan="3" align="left">
                                            <asp:Button ID="SaveNextBtn" runat="server" CssClass="white" Text="Save &amp; Next" UseSubmitBehavior="false"
                                                OnClick="SaveNextBtn_Click" OnClientClick="disableBtn(this.id,true)"></asp:Button>&nbsp;
                                    <asp:Button ID="SaveBtn" runat="server" CssClass="white" UseSubmitBehavior="false"
                                        OnClientClick="disableBtn(this.id,true)" Text="Save" OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                                   <asp:Button ID="ClosePanelBtn" runat="server" CssClass="white" Text="- Hide" UseSubmitBehavior="false"
                                       CausesValidation="False" OnClick="ClosePanelBtn_Click" OnClientClick="disableBtn(this.id,false)"></asp:Button>
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td align="right" class="style2"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="EqpTypelbl" runat="server">EquipmentType</asp:Label>
                                            <asp:RequiredFieldValidator ID="EqpTypeReq" runat="server" ControlToValidate="EqpTypeList"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <telerik:RadDropDownList ID="EqpTypeList" runat="server" Skin="Sunset" BackColor="#ded7c6" OnSelectedIndexChanged="EqpTypeList_SelectedIndexChanged"
                                                AutoPostBack="True" DataTextField="Descr" DataValueField="item" Enabled="True" CausesValidation="false"
                                                Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="JobTypelbl" runat="server">JobType</asp:Label>
                                            <asp:RequiredFieldValidator ID="JobTypeReq" runat="server" ControlToValidate="JobTypeList"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <telerik:RadDropDownList ID="JobTypeList" runat="server" AutoPostBack="True" Skin="Sunset" BackColor="#ded7c6"
                                                DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="TptTypelbl" runat="server">TransportType</asp:Label>
                                            <asp:RequiredFieldValidator ID="TptTypeReq" runat="server" ControlToValidate="TptTypeList"
                                                ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <telerik:RadDropDownList ID="TptTypeList" runat="server" AutoPostBack="True" Skin="Sunset" BackColor="#ded7c6"
                                                DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="expdatelbl" runat="server">StartDate</asp:Label>
                                            <br />
                                            <telerik:RadDatePicker ID="expDateTxtT" runat="server" Width="155" Skin="Sunset"
                                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator Style="z-index: 0" ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="expDateTxtT" ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                        </td>
                                        <td>
                                            <asp:Label ID="exptimelbl" runat="server">StartTime</asp:Label>
                                            <asp:RequiredFieldValidator ID="ExpTimeReq" runat="server" ControlToValidate="ExpTimeList"
                                                ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                            <telerik:RadDropDownList ID="ExpTimeList" runat="server" Enabled="True" DataTextField="Descr"
                                                DataValueField="item" Skin="Sunset" BackColor="#ded7c6" Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td class="style1">
                                            <asp:Label ID="bkRefLbl" runat="server">BookingRef</asp:Label><br />
                                            <telerik:RadTextBox ID="bkRefTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="ooglbl" runat="server">OutOfGauge</asp:Label><br />
                                            <telerik:RadDropDownList ID="OOGList" runat="server" Enabled="True" DataTextField="" DataValueField="item"
                                                Skin="WebBlue" Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap class="style1">
                                            <asp:Label ID="BillOption1lbl" runat="server">BillOption1</asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BillOption1List"
                                                ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                            <telerik:RadDropDownList ID="BillOption1List" runat="server" Enabled="True" DataTextField="Descr"
                                                DataValueField="item" Skin="Sunset" BackColor="#ded7c6" Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td nowrap class="style1">
                                            <asp:Label ID="BillOption2lbl" runat="server">BillOption2</asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="BillOption2List"
                                                ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                            <telerik:RadDropDownList ID="BillOption2List" runat="server" Enabled="True" DataTextField="Descr"
                                                DataValueField="item" Skin="Sunset" BackColor="#ded7c6" Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap class="style1">
                                            <asp:Label ID="sizetypelbl" runat="server">BillSizeType</asp:Label>
                                            <asp:RequiredFieldValidator ID="SizeTypeReq" runat="server" ControlToValidate="SizeTypeList"
                                                ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                            <telerik:RadDropDownList ID="SizeTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                                DataValueField="item" Skin="Sunset" BackColor="#ded7c6" Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td nowrap class="style1">
                                            <asp:Label ID="ctnrwtlbl" runat="server">ContainerWt</asp:Label>
                                            <<br>
                                            <telerik:RadTextBox ID="WeightTxt" runat="server" Skin="WebBlue" Width="155px"></telerik:RadTextBox>
                                        </td>
                                        <td nowrap class="style1">
                                            <asp:Label ID="ctnrvollbl" runat="server">ContainerVol</asp:Label>
                                            <br>
                                            <telerik:RadTextBox ID="VolumeTxt" runat="server" Skin="WebBlue" Width="155px"></telerik:RadTextBox>
                                            <br>
                                        </td>
                                        <td>
                                            <asp:Label ID="enddatelbl" runat="server">EndDate</asp:Label>
                                            <br />
                                            <telerik:RadDatePicker ID="EndDateTxtT" runat="server" Width="155"
                                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td class="style1">
                                            <asp:Label ID="endtimelbl" runat="server">EndTime</asp:Label><br />
                                            <telerik:RadDropDownList ID="EndTimeList" runat="server" Skin="WebBlue" Enabled="True" DataTextField="Descr"
                                                DataValueField="item" Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td class="style1">
                                            <asp:Label ID="orgbkrefLbl" runat="server">OriginalBookingRef</asp:Label><br />
                                            <telerik:RadTextBox ID="orgbkRefTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                        </td>
                                        <td class="style1">
                                            <asp:Label ID="overhtlbl" runat="server">OverHeight</asp:Label>
                                            <br />
                                            <telerik:RadTextBox ID="OverHtTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap>
                                            <asp:Label ID="ctnrnolbl" runat="server">EquipmentReference</asp:Label>
                                            <asp:RequiredFieldValidator Style="z-index: 0" ID="CtnrNoReq" runat="server" ControlToValidate="CtnrNoTxt"
                                                ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                            <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155px"></telerik:RadTextBox>
                                        </td>
                                        <td nowrap>
                                            <asp:Label ID="goodswtlbl" runat="server">GoodsWt</asp:Label>
                                            <br>
                                            <telerik:RadTextBox ID="GoodsWeightTxt" runat="server" Skin="WebBlue" Width="155px"></telerik:RadTextBox>
                                        </td>
                                        <td nowrap>
                                            <asp:Label ID="goodsvollbl" runat="server">GoodsVol</asp:Label>
                                            <br>
                                            <telerik:RadTextBox ID="GoodsVolumeTxt" runat="server" Skin="WebBlue" Width="155px"></telerik:RadTextBox>
                                        </td>
                                        <td nowrap class="style3">
                                            <asp:Label ID="TransporterLbl" runat="server">VendorOpCode</asp:Label><br />
                                            <telerik:RadTextBox ID="TransporterCodeTxt" runat="server" Skin="WebBlue" Visible="false" AutoPostBack="True" OnTextChanged="TransporterCodeTxt_TextChanged"
                                                Width="155px">
                                            </telerik:RadTextBox>
                                            <asp:LinkButton ID="LookupBtn" runat="server" CausesValidation="False" OnClick="LookupBtn_Click" Visible="false">
                                        <img align="absmiddle" border="0" src="../../image/icon-lookup.gif" Visible="false"></asp:LinkButton>

                                            <telerik:RadComboBox ID="VendorOpCodeList" runat="server" Skin="WebBlue" AutoPostBack="True"
                                                RenderMode="Lightweight" Filter="Contains" CausesValidation="false" OnSelectedIndexChanged="VendorOpCodeList_SelectedIndexChanged"
                                                AllowCustomText="false" Width="155px" DropDownWidth="350px">
                                            </telerik:RadComboBox>

                                        </td>
                                        <td nowrap class="style2">
                                            <asp:Label ID="TransporternameLbl" runat="server">VendorOpName</asp:Label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
                                            <telerik:RadTextBox ID="TransporterNameTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                            &nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td class="style1">
                                            <asp:Label ID="quaycranelbl" runat="server">QuayCrane</asp:Label><br />
                                            <telerik:RadTextBox ID="QuayCraneTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                        </td>
                                        <td class="style1">
                                            <asp:Label ID="overwtlbl" runat="server">OverWidth</asp:Label>
                                            <br />
                                            <telerik:RadTextBox ID="OverWtTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap valign="top">
                                            <asp:Label ID="sealnolbl" runat="server">SealNo</asp:Label>
                                            <br />
                                            <telerik:RadTextBox ID="SealNoTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                            <br />
                                            <asp:Label ID="remarkslbl" runat="server">Remarks</asp:Label>
                                            <br>
                                            <telerik:RadTextBox Style="z-index: 0" ID="remarksTxt" runat="server" Skin="WebBlue" Rows="3" TextMode="MultiLine"
                                                Width="155px" Height="80px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td nowrap valign="top">
                                            <asp:Label ID="qtyLbl" runat="server">Qty</asp:Label>
                                            <asp:CompareValidator Style="z-index: 0" ID="Comparevalidator1" runat="server" ControlToValidate="QtyTxt"
                                                ErrorMessage="#" Type="Integer" ValueToCompare="0" Operator="GreaterThanEqual"></asp:CompareValidator><br>
                                            <telerik:RadTextBox ID="QtyTxt" runat="server" Skin="WebBlue" Width="155px"></telerik:RadTextBox>
                                            <br />
                                            <asp:Label ID="Label1" runat="server">Description</asp:Label>
                                            <br>
                                            <telerik:RadTextBox Style="z-index: 0" ID="descrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                                Skin="WebBlue" Width="155px" Height="80px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td nowrap valign="top">
                                            <asp:Label ID="frserviceptlbl" runat="server">CollectFrom</asp:Label>
                                            <%--<asp:RequiredFieldValidator id="FrServiceTypeReq" runat="server" ControlToValidate="FrServicePointList" ErrorMessage="*"></asp:RequiredFieldValidator>--%><br>
                                            <telerik:RadComboBox ID="FrServicePointList" runat="server" Skin="WebBlue" Enabled="True" DataTextField="Descr"
                                                DataValueField="item" Width="155px" AutoPostBack="true" RenderMode="Lightweight" Filter="Contains" CausesValidation="false"
                                                OnSelectedIndexChanged="FrServicePointList_SelectedIndexChanged" AllowCustomText="false" DropDownWidth="350px">
                                            </telerik:RadComboBox>
                                            <%--<asp:Label ID="fraddrlbl" runat="server">From Address</asp:Label>--%>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox Style="z-index: 0" ID="FrAddrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                                Skin="WebBlue" Width="155px" Height="80px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td nowrap valign="top" class="style2">
                                            <asp:Label ID="toserviceptlbl" runat="server">DeliverTo</asp:Label>
                                            <%--<asp:RequiredFieldValidator id="ToServiceTypeReq" runat="server" ControlToValidate="ToServicePointList" ErrorMessage="*"></asp:RequiredFieldValidator>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;<br>
                                            <telerik:RadComboBox ID="ToServicePointList" runat="server" Skin="WebBlue" Enabled="True" DataTextField="Descr"
                                                DataValueField="item" Width="155px" AutoPostBack="true" RenderMode="Lightweight" Filter="Contains" CausesValidation="false"
                                                OnSelectedIndexChanged="ToServicePointList_SelectedIndexChanged" AllowCustomText="false" DropDownWidth="350px">
                                            </telerik:RadComboBox>
                                            <%--<asp:Label ID="toaddrlbl" runat="server">To Address</asp:Label>--%>&nbsp;&nbsp;&nbsp;
                                <br />
                                            <br />
                                            <telerik:RadTextBox Style="z-index: 0" ID="ToAddrTxt" runat="server" Skin="WebBlue" Rows="3" TextMode="MultiLine"
                                                Width="155px" Height="80px">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td class="style1" valign="top">
                                            <asp:Label ID="NoofPackagesLbl0" runat="server">NoOfPackages</asp:Label>
                                            <br />
                                            <telerik:RadTextBox ID="NoofPackagesTxt0" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <asp:Label ID="NoofPalletLbl1" runat="server">NoOfPallets</asp:Label>
                                            <br />
                                            <telerik:RadTextBox ID="NoofPalletsTxt1" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                        </td>
                                        <td class="style1" valign="top">
                                            <asp:Label ID="cellnolbl" runat="server">CellNo</asp:Label><br />
                                            <telerik:RadTextBox ID="CellNoTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="overlenlbl" runat="server">OverLength</asp:Label>
                                            <br />
                                            <telerik:RadTextBox ID="OverLenTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Width="155px"></telerik:RadTextBox>
                                            <br />
                                            <telerik:RadTextBox ID="TransporterIdTxt" runat="server" Skin="WebBlue" Style="z-index: 0" Visible="false"
                                                Width="155px">
                                            </telerik:RadTextBox>
                                            <asp:Label ID="PoliceEsc_Lbl" runat="server">PoliceEscort</asp:Label><br />
                                            <telerik:RadDropDownList ID="PolEsc_ddl" runat="server" Skin="WebBlue" Enabled="True" Width="155px">
                                            </telerik:RadDropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <br>
                <div style="height: 80%; top: 0px; left: 0px;" id="div-datagrid">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                            <Selecting AllowRowSelect="true"></Selecting>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
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
                                <telerik:GridTemplateColumn AllowFiltering="false">
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
                                <telerik:GridTemplateColumn AllowFiltering="false">
                                    <HeaderTemplate>
                                        S/N
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="eqptypedescr" SortExpression="eqptypedescr" HeaderText="EqpType"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="eqptype" SortExpression="eqptype" Display="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="billoption1descr" SortExpression="billoption1descr" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="billoption2descr" SortExpression="billoption2descr" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="BillSizeType"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="jobtypedescr" SortExpression="jobtypedescr" HeaderText="JobType"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="ContainerNo"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrsealno" SortExpression="ctnrsealno" HeaderText="SealNo"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrwt" SortExpression="ctnrwt" HeaderText="CtnrWt"
                                    DataFormatString="{0:#,0.000}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrvol" SortExpression="ctnrvol" HeaderText="CtnrVol"
                                    DataFormatString="{0:#,0.000}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="goodswt" SortExpression="goodswt" HeaderText="GoodsWt"
                                    DataFormatString="{0:#,0.000}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="goodsvol" SortExpression="goodsvol" HeaderText="GoodsVol"
                                    DataFormatString="{0:#,0.000}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="noofpkg" HeaderText="Packages" SortExpression="noofpkg"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="noofplt" HeaderText="Pallets" SortExpression="noofplt"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="frservicept" SortExpression="frservicept" HeaderText="FrServicePt"
                                    Display="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="toservicept" SortExpression="toservicept" HeaderText="ToServicePt"
                                    Display="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="StartDate"
                                    DataFormatString="{0:dd-MMM-yy}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exptime" HeaderText="StartTime" Display="true"
                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="enddate" HeaderText="EndDate" Display="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="endtime" HeaderText="EndTime" Display="true"
                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="frserviceptdescr" SortExpression="frserviceptdescr"
                                    HeaderText="FrSvcPt" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="toserviceptdescr" SortExpression="toserviceptdescr"
                                    HeaderText="ToSvcPt" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bkref" SortExpression="bkref" HeaderText="BookingRef"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bkreforiginal" SortExpression="bkreforiginal"
                                    HeaderText="OriginalBookingRef" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Descr"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tpterid" SortExpression="tpterid" HeaderText="TransporterId"
                                    Visible="false" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tptercode" SortExpression="tptercode" HeaderText="Vendor"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tptername" SortExpression="tptername" HeaderText="Name"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="oog" SortExpression="oog" HeaderText="OOG" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="overht" SortExpression="overht" HeaderText="OverHt"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="overwt" SortExpression="overwt" HeaderText="OverWt"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="overlen" SortExpression="overlen" HeaderText="OverLen"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="quaycrane" SortExpression="quaycrane" HeaderText="QuayCrane"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="cellno" SortExpression="cellno" HeaderText="CellNo"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sno" Display="False" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="policeescort" Display="False" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                                    HeaderText="EditUser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="jobtype" Display="false" HeaderText="EditUser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tpttype" Display="false" HeaderText="EditUser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrno" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrsealno" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="remarks" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="toaddr" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tpttypedescr" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="fraddr" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="Upload" Height="500px" />
        </telerik:RadMultiPage>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </form>
</body>
</html>

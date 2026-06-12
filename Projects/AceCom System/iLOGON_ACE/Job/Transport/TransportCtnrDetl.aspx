<%@ Page Language="c#" CodeBehind="TransportCtnrDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Transport.TransportCtnrDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportCtnrDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <style type="text/css">
        .style3
        {
            width: 297px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload="if (document.getElementById('CtnrNoTxt')!= null) document.getElementById('CtnrNoTxt').focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
            </td>
            <td align="right">
                <asp:Button ID="AddDetailBtn" runat="server" Text="+ Detail" Visible="False" CssClass="detailButton"
                    OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="AddPanel" runat="server" Visible="False">
                    <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:Button ID="SaveNextBtn" runat="server" CssClass="detailButton" Text="Save &amp; Next"
                                    OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;
                                <asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" Text=" Save " OnClick="SaveBtn_Click">
                                </asp:Button>&nbsp;
                                <asp:Button ID="ClosePanelBtn" runat="server" CssClass="detailButton" Text="- Hide"
                                    CausesValidation="False" OnClick="ClosePanelBtn_Click"></asp:Button>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td nowrap>
                                <asp:Label ID="ctnrnolbl" runat="server">Container No.</asp:Label>
                                <asp:RequiredFieldValidator Style="z-index: 0" ID="CtnrNoReq" runat="server" ControlToValidate="CtnrNoTxt"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <asp:TextBox ID="CtnrNoTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="ctnrwtlbl" runat="server">Ctnr Wt</asp:Label>
                                <asp:RequiredFieldValidator Style="z-index: 0" ID="WeightReq" runat="server" ControlToValidate="WeightTxt"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:CompareValidator Style="z-index: 0" ID="WeightCompareVal" runat="server" ControlToValidate="WeightTxt"
                                    ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:CompareValidator><br>
                                <asp:TextBox ID="WeightTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="ctnrvollbl" runat="server">Ctnr Vol</asp:Label>
                                <asp:RequiredFieldValidator Style="z-index: 0" ID="VolumeReq" runat="server" ControlToValidate="VolumeTxt"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:CompareValidator Style="z-index: 0" ID="VolumeCompareVal" runat="server" ControlToValidate="VolumeTxt"
                                    ErrorMessage="#" Type="Double" ValueToCompare="0" Operator="GreaterThanEqual"></asp:CompareValidator><br>
                                <asp:TextBox ID="VolumeTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                                <br>
                            </td>
                            <td nowrap class="style3">
                                <asp:Label ID="TransporterLbl" runat="server">Transporter Code</asp:Label><br />
                                <asp:TextBox ID="TransporterCodeTxt" runat="server" AutoPostBack="True" OnTextChanged="TransporterCodeTxt_TextChanged"></asp:TextBox>
                                <asp:LinkButton ID="LookupBtn" runat="server" CausesValidation="False">
                                        <img align="absmiddle" border="0" src="../../image/icon-lookup.gif"></asp:LinkButton>
                                <asp:TextBox ID="TransporterIdTxt" runat="server" Style="z-index: 0" Visible="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap>
                                <asp:Label ID="sizetypelbl" runat="server">Size/Type</asp:Label>
                                <asp:RequiredFieldValidator ID="SizeTypeReq" runat="server" ControlToValidate="SizeTypeList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <asp:DropDownList ID="SizeTypeList" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" BackColor="Yellow">
                                </asp:DropDownList>
                            </td>
                            <td nowrap>
                                <asp:Label ID="goodswtlbl" runat="server">Goods Wt</asp:Label>
                                <asp:RequiredFieldValidator Style="z-index: 0" ID="GoodsWeightReq" runat="server"
                                    ControlToValidate="GoodsWeightTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:CompareValidator Style="z-index: 0" ID="GoodsWeightCompareVal" runat="server"
                                    ControlToValidate="GoodsWeightTxt" ErrorMessage="#" Type="Double" ValueToCompare="0"
                                    Operator="GreaterThanEqual"></asp:CompareValidator><br>
                                <asp:TextBox ID="GoodsWeightTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="goodsvollbl" runat="server">Goods Vol/Literage</asp:Label>
                                <asp:RequiredFieldValidator Style="z-index: 0" ID="GoodsVolumeReq" runat="server"
                                    ControlToValidate="GoodsVolumeTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:CompareValidator Style="z-index: 0" ID="GoodsVolumeCompareVal" runat="server"
                                    ControlToValidate="GoodsVolumeTxt" ErrorMessage="#" Type="Double" ValueToCompare="0"
                                    Operator="GreaterThanEqual"></asp:CompareValidator><br>
                                <asp:TextBox ID="GoodsVolumeTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="TransporternameLbl" runat="server">Transporter Name</asp:Label>
                                <br>
                                <asp:TextBox ID="TransporterNameTxt" runat="server" Style="z-index: 0"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap colspan="2">
                                <asp:Label ID="frserviceptlbl" runat="server">From Service Point</asp:Label>
                                <br>
                                <asp:DropDownList ID="FrServicePointList" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" AutoPostBack="True" OnSelectedIndexChanged="FrServicePointList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td nowrap>
                                <asp:Label ID="fraddrlbl" runat="server">From Address</asp:Label>
                                <br>
                                <asp:TextBox Style="z-index: 0" ID="FrAddrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="210px"></asp:TextBox>
                                <%--<asp:TextBox style="Z-INDEX: 0" ID="FrAddrTxt" runat="server"
                                        Rows="3" TextMode="MultiLine" 
                                            Width="210px></asp:TextBox>  --%>
                            </td>
                            <td nowrap>
                                <asp:Label ID="sealnolbl" runat="server">Seal No.</asp:Label>
                                <br>
                                <asp:TextBox ID="SealNoTxt" runat="server" Style="z-index: 0"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap colspan="2" valign="top">
                                <asp:Label ID="toserviceptlbl" runat="server">To Service Point</asp:Label>
                                <br>
                                <asp:DropDownList ID="ToServicePointList" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" AutoPostBack="True" OnSelectedIndexChanged="ToServicePointList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td nowrap valign="top">
                                <asp:Label ID="toaddrlbl" runat="server">To Address</asp:Label>
                                <br>
                                <asp:TextBox Style="z-index: 0" ID="ToAddrTxt" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="210px"></asp:TextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="remarkslbl" runat="server">Remarks</asp:Label>
                                <br>
                                <asp:TextBox Style="z-index: 0" ID="remarksTxt" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="210px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br>
    <div style="height: 80%" id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" PageSize="8" GridLines="Both" CellPadding="2"
            AutoGenerateColumns="False" DataKeyField="id" OnItemCommand="Detail_Edit" AllowSorting="True"
            UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="Detail_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                runat="server"></a>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="Container No.">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrsealno" SortExpression="ctnrsealno" HeaderText="Seal No.">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="Size/Type">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrwt" SortExpression="ctnrwt" HeaderText="Ctnr Wt"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrvol" SortExpression="ctnrvol" HeaderText="Ctnr Vol"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="goodswt" SortExpression="goodswt" HeaderText="Goods Wt"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="goodsvol" SortExpression="goodsvol" HeaderText="Goods Vol/Ltr"
                    DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="frservicept" SortExpression="frservicept" HeaderText="FrServicePt"
                    Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="toservicept" SortExpression="toservicept" HeaderText="ToServicePt"
                    Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="frserviceptdescr" SortExpression="frserviceptdescr" HeaderText="FrServicePt">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="FrAddr">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="toserviceptdescr" SortExpression="toserviceptdescr" HeaderText="ToServicePt">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="ToAddr">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="tpterid" SortExpression="tpterid" HeaderText="TransporterId"
                    Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="tptercode" SortExpression="tptercode" HeaderText="TransporterCode">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="tptername" SortExpression="tptername" HeaderText="TransporterName">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="TopAndBottom" Mode="NumericPages">
            </PagerStyle>
        </asp:DataGrid></div>
    </form>
</body>
</html>

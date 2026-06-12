<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForecastingWHSSearch.aspx.cs" Inherits="iWMS.Web.HouseKeeping.ForecastingWHS.ForecastingWHSSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Forecasting Warehouse Inbound & Outbound</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <table id="table1" width="100%" border="0">
            <tr>
                <td width="50%">
                    <br />
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td align="left" width="10%">
                    <telerik:RadButton ID="RetrieveBtn" runat="server" OnClick="RetrieveBtn_Click" Text=" Retrieve "
                        Width="80px" Skin="WebBlue">
                    </telerik:RadButton>
                </td>
                <td align="left">
                    <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                        <img id="excelImg" border="0" alt="Export to Excel" align="left" src="../../Image/Excel.png"
                            runat="server">
                    </a>
                </td>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" AllowPaging="true"
            GridLines="Both" Skin="Office2007" GroupPanelPosition="Top" OnItemDataBound="ResultDG_ItemDataBound"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemCommand="ResultDG_ItemCommand" OnGridExporting="RadGrid1_GridExporting" Width="100%">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top"
                PageSize="50" ShowHeadersWhenNoRecords="true" EditMode="InPlace" Name="ParentGrid">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="edit" Reorderable="false" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                Width="15" Height="15" AlternateText="Edit PV Detail" ToolTip="Edit PV Detail"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0" CausesValidation="false"></asp:ImageButton>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="ForecastDetail_Delete" runat="server">
                                <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                    title="Delete Detail" runat="server" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderText="S/No">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="id" ColumnGroupName="id" SortExpression="id"
                        UniqueName="id" Reorderable="true" ReadOnly="True" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="Number" HeaderText="Number" Display="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "TransNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadLabel runat="server" ID="TransNoLbl" Skin="Office2007" Width="100px"
                                Visible="false">
                            </telerik:RadLabel>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="ReferenceNo" HeaderText="ReferenceNo" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "RefNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="ReferenceNoTxt" Skin="Office2007" Width="200px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day01" HeaderText="Day01" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day01")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day01Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal1" runat="server" ControlToValidate="Day01Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day02" HeaderText="Day02" AllowFiltering="false"
                        HeaderStyle-Width="30px">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day02")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day02Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal2" runat="server" ControlToValidate="Day02Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day03" HeaderText="Day03" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day03")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day03Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal3" runat="server" ControlToValidate="Day03Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day04" HeaderText="Day04" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day04")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day04Txt" Skin="Office2007">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal4" runat="server" ControlToValidate="Day04Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day05" HeaderText="Day05" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day05")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day05Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal5" runat="server" ControlToValidate="Day05Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day06" HeaderText="Day06" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day06")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day06Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal6" runat="server" ControlToValidate="Day06Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day07" HeaderText="Day07" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day07")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day07Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal7" runat="server" ControlToValidate="Day07Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day08" HeaderText="Day08" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day08")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day08Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal8" runat="server" ControlToValidate="Day08Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day09" HeaderText="Day09">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day09")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day09Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal9" runat="server" ControlToValidate="Day09Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day10" HeaderText="Day10">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day10")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day10Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal10" runat="server" ControlToValidate="Day10Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day11" HeaderText="Day11">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day11")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day11Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal11" runat="server" ControlToValidate="Day11Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day12" HeaderText="Day12">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day12")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day12Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal12" runat="server" ControlToValidate="Day12Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day13" HeaderText="Day13">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day13")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day13Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal13" runat="server" ControlToValidate="Day13Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day14" HeaderText="Day14">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day14")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day14Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal14" runat="server" ControlToValidate="Day14Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day15" HeaderText="Day15">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day15")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day15Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal15" runat="server" ControlToValidate="Day15Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day16" HeaderText="Day16">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day16")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day16Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal16" runat="server" ControlToValidate="Day16Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day17" HeaderText="Day17">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day17")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day17Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal17" runat="server" ControlToValidate="Day17Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day18" HeaderText="Day18">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day18")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day18Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal18" runat="server" ControlToValidate="Day18Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day19" HeaderText="Day19">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day19")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day19Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal19" runat="server" ControlToValidate="Day19Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day20" HeaderText="Day20">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day20")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day20Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal20" runat="server" ControlToValidate="Day20Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day21" HeaderText="Day21">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day21")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day21Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal21" runat="server" ControlToValidate="Day21Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day22" HeaderText="Day22">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day22")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day22Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal22" runat="server" ControlToValidate="Day22Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day23" HeaderText="Day23">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day23")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day23Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal23" runat="server" ControlToValidate="Day23Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day24" HeaderText="Day24">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day24")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day24Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal24" runat="server" ControlToValidate="Day24Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day25" HeaderText="Day25">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day25")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day25Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal25" runat="server" ControlToValidate="Day25Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day26" HeaderText="Day26">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day26")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day26Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal26" runat="server" ControlToValidate="Day26Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day27" HeaderText="Day27">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day27")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day27Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal27" runat="server" ControlToValidate="Day27Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day28" HeaderText="Day28">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day28")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day28Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal28" runat="server" ControlToValidate="Day28Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day29" HeaderText="Day29">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day29")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day29Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal29" runat="server" ControlToValidate="Day29Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day30" HeaderText="Day30">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day30")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day30Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal30" runat="server" ControlToValidate="Day30Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day31" HeaderText="Day31">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day31")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day31Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal31" runat="server" ControlToValidate="Day31Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Remarks")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="RemarksTxt" Skin="Office2007" Width="350px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" AllowPaging="true"
            GridLines="Both" Skin="Office2007" GroupPanelPosition="Top" OnItemDataBound="ResultDG2_ItemDataBound"
            OnUpdateCommand="ResultDG2_Update" OnEditCommand="ResultDG2_Edit" OnNeedDataSource="ResultDG2_NeedDataSource"
            OnItemCommand="ResultDG2_ItemCommand" OnGridExporting="RadGrid2_GridExporting" Width="100%">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top"
                PageSize="50" ShowHeadersWhenNoRecords="true" EditMode="InPlace" Name="ParentGrid">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="edit" Reorderable="false" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                Width="15" Height="15" AlternateText="Edit PV Detail" ToolTip="Edit PV Detail"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0" CausesValidation="false"></asp:ImageButton>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="ForecastDetail_Delete" runat="server">
                                <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                    title="Delete Detail" runat="server" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderText="S/No">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="id" ColumnGroupName="id" SortExpression="id"
                        UniqueName="id" Reorderable="true" ReadOnly="True" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="Number" HeaderText="Number" Display="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "TransNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadLabel runat="server" ID="TransNoLbl" Skin="Office2007" Width="100px"
                                Visible="false">
                            </telerik:RadLabel>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="ReferenceNo" HeaderText="ReferenceNo" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "RefNo")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="ReferenceNoTxt" Skin="Office2007" Width="200px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day01" HeaderText="Day01" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day01")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day01Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal1" runat="server" ControlToValidate="Day01Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day02" HeaderText="Day02" AllowFiltering="false"
                        HeaderStyle-Width="30px">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day02")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day02Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal2" runat="server" ControlToValidate="Day02Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day03" HeaderText="Day03" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day03")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day03Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal3" runat="server" ControlToValidate="Day03Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day04" HeaderText="Day04" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day04")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day04Txt" Skin="Office2007">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal4" runat="server" ControlToValidate="Day04Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day05" HeaderText="Day05" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day05")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day05Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal5" runat="server" ControlToValidate="Day05Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day06" HeaderText="Day06" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day06")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day06Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal6" runat="server" ControlToValidate="Day06Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day07" HeaderText="Day07" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day07")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day07Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal7" runat="server" ControlToValidate="Day07Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day08" HeaderText="Day08" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day08")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day08Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal8" runat="server" ControlToValidate="Day08Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day09" HeaderText="Day09">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day09")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day09Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal9" runat="server" ControlToValidate="Day09Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day10" HeaderText="Day10">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day10")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day10Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal10" runat="server" ControlToValidate="Day10Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day11" HeaderText="Day11">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day11")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day11Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal11" runat="server" ControlToValidate="Day11Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day12" HeaderText="Day12">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day12")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day12Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal12" runat="server" ControlToValidate="Day12Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day13" HeaderText="Day13">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day13")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day13Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal13" runat="server" ControlToValidate="Day13Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day14" HeaderText="Day14">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day14")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day14Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal14" runat="server" ControlToValidate="Day14Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day15" HeaderText="Day15">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day15")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day15Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal15" runat="server" ControlToValidate="Day15Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day16" HeaderText="Day16">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day16")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day16Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal16" runat="server" ControlToValidate="Day16Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day17" HeaderText="Day17">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day17")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day17Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal17" runat="server" ControlToValidate="Day17Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day18" HeaderText="Day18">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="100px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day18")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day18Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal18" runat="server" ControlToValidate="Day18Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day19" HeaderText="Day19">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day19")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day19Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal19" runat="server" ControlToValidate="Day19Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day20" HeaderText="Day20">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day20")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day20Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal20" runat="server" ControlToValidate="Day20Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day21" HeaderText="Day21">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day21")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day21Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal21" runat="server" ControlToValidate="Day21Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day22" HeaderText="Day22">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day22")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day22Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal22" runat="server" ControlToValidate="Day22Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day23" HeaderText="Day23">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day23")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day23Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal23" runat="server" ControlToValidate="Day23Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day24" HeaderText="Day24">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day24")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day24Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal24" runat="server" ControlToValidate="Day24Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day25" HeaderText="Day25">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day25")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day25Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal25" runat="server" ControlToValidate="Day25Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day26" HeaderText="Day26">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day26")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day26Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal26" runat="server" ControlToValidate="Day26Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day27" HeaderText="Day27">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day27")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day27Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal27" runat="server" ControlToValidate="Day27Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day28" HeaderText="Day28">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day28")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day28Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal28" runat="server" ControlToValidate="Day28Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day29" HeaderText="Day29">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day29")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day29Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal29" runat="server" ControlToValidate="Day29Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day30" HeaderText="Day30">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day30")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day30Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal30" runat="server" ControlToValidate="Day30Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Day31" HeaderText="Day31">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Day31")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Day31Txt" Skin="Office2007" Width="100px">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="DayTxtCompVal31" runat="server" ControlToValidate="Day31Txt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Remarks")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="RemarksTxt" Skin="Office2007" Width="350px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
   
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrReleaseOrderHead.aspx.cs"
    Inherits="iWMS.Web.Outbound.CtnrReleaseOrder.CtnrReleaseOrderHead" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>ReleaseOrderHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

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
    
    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td>
                <asp:Button ID="Searchbtn" runat="server" Text="Cancel" OnClick="cancelImgBtn_Clicked"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Cancel" UseSubmitBehavior="false" CssClass="white" />
                &nbsp; &nbsp;
                 <%--<a id="A1" runat="server" onserverclick="ExportExcel">
                    <img id="Img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.png"
                        width="87" height="27" runat="server"></a> --%>             
            </td>
                <%--<td align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
                </td>--%>
        </tr>
    </table>
    <p>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
    </p>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true" FileName="ReleaseOrder">
            <Excel Format="Html" />
        </ExportSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                    <HeaderTemplate>
                        <label id="completelbl">
                        </label>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                        <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu> 
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Depot">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReleaseOrderNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                </telerik:GridBoundColumn>
                <%--Ticket #6001: TAA : Enhancement to Release Order (ISHEAD)  add by XM 03/08/2016--%>
                <telerik:GridBoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="SizeType ">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="totalqty" SortExpression="totalqty" HeaderText="Total " AllowFiltering="false" 
                ItemStyle-HorizontalAlign="Center" DataFormatString="{0:G2}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ReleasedQty " SortExpression="ReleasedQty " HeaderText="Released " AllowFiltering="false" ItemStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="OSQty" SortExpression="OSQty" HeaderText="O/S" AllowFiltering="false" 
                ItemStyle-HorizontalAlign="Center" DataFormatString="{0:G2}">
                </telerik:GridBoundColumn>
                <%--end of add--%>
                <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rcno" SortExpression="rcno" HeaderText="StoringOrderNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="poldescr" SortExpression="poldescr" HeaderText="POL">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="poddescr" SortExpression="poddescr" HeaderText="POD">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="acid">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="id">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>    
    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkshiftManagerUpload.aspx.cs" Inherits="iWMS.Web.Job.WorkshiftManager.WorkshiftManagerUpload" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Transhipment Upload</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />    
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
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

        .popupHeaderR {
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            background: #859DD4;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            border-top: 2px solid GREY;
            border-right: 2px solid GREY;
            border-left: 2px solid GREY;
        }

            .popupHeaderR span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
                margin-top: 5px;
            }

            .popupHeaderR a {
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
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">                
            <tr>
                <td class="style1">                 
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />                               
                    <br />
                    <br />                  
                </td>
                <td class="style1">&nbsp;
                <asp:DropDownList ID="ExcelDDL" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>                                
                    <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click" Visible="true"  
                                Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />   
                    &nbsp;
                    <asp:Button ID="TemplateBtn" CssClass="white" runat="server" OnClick="TemplateBtn_Click" Visible="true" Text="Template" />                   
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="GridPanel" runat="server">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
                Skin="Office2007" GridLines="Both" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="true" />
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <ExportSettings UseItemStyles="True">
                </ExportSettings>
                <MasterTableView AllowSorting="true" AllowMultiColumnSorting="true" AllowPaging="true" PageSize="50" AllowFilteringByColumn="true">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                </MasterTableView>
            </telerik:RadGrid>
        </asp:Panel>      
    </form>
</body>
</html>
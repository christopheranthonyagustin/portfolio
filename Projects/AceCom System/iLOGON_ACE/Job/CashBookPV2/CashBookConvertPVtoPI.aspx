<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookConvertPVtoPI.aspx.cs"
    Inherits="iWMS.Web.Job.CashBookPV2.CashBookConvertPVtoPI" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ConvertPVtoPI</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self">
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
<body>

    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }

    </script>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        <br />
                        <asp:Label ID="RecordsLbl"  runat="server"></asp:Label>
                          <br /> <br />
                        <asp:Button ID="ChangeBtn" runat="server" Text="Add" Visible="true"
                            OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white"
                            OnClick="ChangeBtn_Click"></asp:Button>
                        <%--                    <telerik:RadButton Style="z-index: 0" ID="ChangeBtn" runat="server" Text="ProceedToChange"
                        Visible="true" CssClass="detailButton" OnClick="ChangeBtn_Click">
                    </telerik:RadButton>--%>
                        <asp:Button ID="Cancel" runat="server" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white"
                            Visible="True" Text="Cancel" OnClick="CancelBtn_Click" CausesValidation="false"></asp:Button>
                        <%--   <telerik:RadButton Style="z-index: 0" ID="Cancel" runat="server" CssClass="detailButton"
                        Visible="True" Text="Cancel" OnClick="CancelBtn_Click" CausesValidation="false">
                    </telerik:RadButton>--%>
                    </td>
                </tr>
            </table>
            &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
                CssClass="errorLabel"></asp:Label>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurgeAccount.aspx.cs" Inherits="iWMS.Web.Master.Account.PurgeAccount" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purge Account</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .ReasonStyle
		    {
			    float:right;
		    }
        .PasswordStyle
		    {
			    background-color:white;
                width:155px;
		    }
    </style>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <asp:Panel ID="Panel" runat="server">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="acclbl" runat="server">Account</asp:Label>
                            <br />
                             <asp:TextBox ID="Accounttxt" BackColor="White" runat="server" Width="155px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="namelbl" runat="server">Name</asp:Label>
                            <br />
                            <asp:TextBox ID="Nametxt" BackColor="White" runat="server" Width="155px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:RequiredFieldValidator ID="ReasonTxtReqVal" runat="server" ControlToValidate="ReasonTxt"
                                ErrorMessage="*" ForeColor="Red" CssClass="ReasonStyle"/>
                            <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                            <br />
                            <asp:TextBox ID="ReasonTxt" BackColor="White" runat="server" Width="155px"
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
							<asp:Label ID="Passwordlbl" runat="server">Password</asp:Label>
                            <br />
							<input id="password" type="password" name="password" runat="server" class="PasswordStyle"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="IncludeSKULbl" runat="server">Include SKU</asp:Label>
                            <br />
                            <asp:CheckBox ID="IncludeSKU" runat="server" />                        
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="OkayBtn" runat="server" OnClick="OkayBtn_Click"
                                Text="Submit" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

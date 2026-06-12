<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MergeServiceRegister.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.MergeServiceRegister" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MergeServiceRegister</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
        <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

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
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">            
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="JobTypelbl" runat="server">JobType</asp:Label>
                    <asp:RequiredFieldValidator ID="JobTypeReq" runat="server" ControlToValidate="JobTypeList"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <br />
                    <telerik:RadDropDownList ID="JobTypeList" runat="server" AutoPostBack="True" CausesValidation="false"
                        DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px" Skin="Sunset"
                        BackColor="Yellow">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="TptTypelbl" runat="server">TransportType</asp:Label>
                    <asp:RequiredFieldValidator ID="TptTypeReq" runat="server" ControlToValidate="TptTypeList"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <br />
                    <telerik:RadDropDownList ID="TptTypeList" runat="server" AutoPostBack="True" CausesValidation="false"
                        DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px" Skin="Sunset"
                        BackColor="Yellow" >
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="BillSizeTypelbl" runat="server">BillSizeType</asp:Label>
                    <asp:RequiredFieldValidator ID="BillSizeTypeReq" runat="server" ControlToValidate="BillSizeTypeList"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <br />
                    <telerik:RadDropDownList ID="BillSizeTypeList" runat="server" AutoPostBack="True" CausesValidation="false"
                        DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px" Skin="Sunset"
                        BackColor="Yellow">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td>
                <br />
                    &nbsp;&nbsp;     
                    <asp:Button ID="OkayBtn" class="white" runat="server" OnClick="OkayBtn_Click" 
                        Text="Merge"  />  
                    &nbsp; 
                    <asp:Button ID="CloseBtn" CausesValidation="false" class="white" runat="server" OnClick="CloseBtn_Click" 
                        Text="Cancel"  />                      
                </td>            
            </tr> 
        </table>
        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
            CssClass="errorLabel"></asp:Label>
        </div> 
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Merge Job" runat="server" Style="size: 15px"></asp:Label>
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
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
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

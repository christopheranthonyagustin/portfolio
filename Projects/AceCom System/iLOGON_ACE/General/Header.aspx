<%@ Page Language="c#" CodeBehind="Header.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Security.Header" %>

<html>
<head>
    <title>Welcome to iWMS</title>

    <script type="text/javascript">

        var sessionTimeout = '<%=ConfigurationManager.AppSettings["sessionTimeout"] %>';
        if (sessionTimeout == "Y") {
            var sessionTimeoutWarning = '<%=ConfigurationManager.AppSettings["sessionTimeoutWarning"] %>';
            var sessionTimeout = "<%= Session.Timeout %>";
            var sTimeout = parseInt(sessionTimeoutWarning) * 60 * 1000;
            setTimeout('SessionWarning()', sTimeout);
        }

        function SessionWarning() {
            var currenttime = new Date().toTimeString().split(" ")[0];
            var message = "Your session will expire in another " +
                (parseInt(sessionTimeout) - parseInt(sessionTimeoutWarning)) +
                " mins!" + " [" + currenttime + "].Press [OK] to continue the session.";
            var ans = confirm(message);
            if (ans) {
                location = location;
                setTimeout('SessionWarning()', sTimeout);
            }
        }

        // 20091008 Jonathan - To Minimise, Expand Columns
        var expanded = false;

        function Show() {
            if (parent.document.getElementById("menu") != null) {
                var vStyle = (expanded) ? "200,*" : "5,*";

                parent.document.getElementById("menu").cols = vStyle;

                expanded = !expanded;
            }
        }

        function CountUserMessage(MessageCount) {
            if (MessageCount == "0") {
                window.parent.document.title = 'iLOGON';
            }
            else {
                window.parent.document.title = '(' + MessageCount + ')' + ' iLOGON';
            }
        }
    </script>

    <style>
        .NumberCircle {
            display: inline-block;
            line-height: 0px;
            border-radius: 50%;
            border: 2px solid red;
            font-size: x-small;
            position: absolute;
            background-color: red;
        }

            .NumberCircle span {
                display: inline-block;
                margin-left: 3px;
                margin-right: 3px;
                padding-top: 40%;
                padding-bottom: 40%;
                color: white;
                text-align: center;
            }

        .NotiBellCSS {
            padding-top: 1px;
            margin-left: -10px;
        }
    </style>

    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <meta http-equiv="Page-Exit" content="BlendTrans(Duration=0)" />
    <meta http-equiv="Page-Enter" content="BlendTrans(Duration=0)" />
    <link rel="stylesheet" type="text/css" href="../css/iWMS.css" />
    <link rel="stylesheet" href="../css/FontAwesome/css/all.min.css" />
    <script src="../js/jquery_3.6.1.js" type="text/javascript"></script>

</head>
<body style="overflow: hidden; background: #05538c;">
    <form id="Login" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:Timer ID="RefreshTimer" runat="server" OnTick="RefreshTimer_Tick"></asp:Timer>
        <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="menu" style="background: #05538c; margin-top: -2px;">
                    <div class="box-contents1" style="padding-bottom: 2px; padding-top: 2px; margin-right: -17px;">
                        <div>
                            <img src="../Image/URL Logo WhiteText.png" width="116" style="margin-top: 5px; width: 70px;" onclick='Show();' alt="iLOGON" />
                        </div>

                        <div style="float: right; margin-top: -28px">
                            <table>
                                <tr>
                                    <td>
                                        <span class="NumberCircle" id="NumberCircle" runat="server" onclick="ShowUserMessage()"><span id="MessageCount" runat="server" onclick="ShowUserMessage()"></span></span>
                                        <i id="NotiBell" class="fa-regular fa-bell NotiBellCSS" onclick="ShowUserMessage()" style="font-size: 20px; color: white;" />
                                    </td>

                                    <td style="color: #fff; padding-left: 20px;">
                                        <asp:Label ID="lblWelcome" runat="server">Welcome</asp:Label>
                                        <asp:LinkButton CssClass="headerlnk" ID="lnkUser" runat="server" OnClick="lnkUser_Click"></asp:LinkButton>&nbsp;|
                                        <asp:DropDownList ID="accountList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="accountList_SelectedIndexChanged"
                                            Width="155px">
                                        </asp:DropDownList>
                                        
                                        <asp:LinkButton Style="z-index: 0" ID="lnkRefresh" runat="server" CssClass="headerlnk"
                                            ToolTip="Refresh Account List" OnClick="lnkRefresh_Click"><img src="../Image/reload.png" alt="Reload" border="0" /></asp:LinkButton>&nbsp;|
                                        <asp:LinkButton CssClass="headerlnk" ID="SettingBtn" runat="server" OnClientClick="OpenSettingWindow()">Settings &nbsp;|</asp:LinkButton>
                                        <asp:LinkButton CssClass="headerlnk" ID="lnkLogout" runat="server" OnClick="lnkLogout_Click">Logout</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="RefreshTimer" EventName="Tick" />
                <asp:AsyncPostBackTrigger ControlID="lnkUser" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="lnkRefresh" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="lnkLogout" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
    <script type="text/javascript">

        function OpenSettingWindow() {
            window.open('Setting.aspx');
        }

        function ShowUserMessage() {
            $.ajax({
                url: '../App/Profile/ProfileHome.aspx/NotiBellClicked',
                data: JSON.stringify({
                    NotiBellClicked: "Clicked"
                }),
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    if (result.d) {
                        console.log(result.d);
                        window.parent.frames[2].location.href = '../App/Profile/Profile.htm';
                    }
                }
            });
        }
    </script>
</body>
</html>

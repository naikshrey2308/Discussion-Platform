<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="DiscussionPanel.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="styles/base.css"/>
</head>
<body class="row gx-0 bg-base-gradient position-relative min-vh-100">
    <form id="form1" style="transform: translate(-50%, -50%)" class="bg-white form col-12 col-md-8 col-lg-6 col-xl-4 position-absolute top-50 start-50 border p-5" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="p-0 text-center">
                        <img alt="" src="images/2.png" width="300" /><br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
            <asp:TextBox placeholder="Email" ID="LoginEmail" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
            <asp:TextBox placeholder="Password" ID="LoginPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="text-end">
                        <asp:HyperLink ID="LoginToRegister" runat="server" NavigateUrl="~/RegisterPage.aspx" Font-Underline="False" EnableTheming="True" Font-Size="Small">Don&#39;t have an account? Join us</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:Button ID="LoginBtn" CssClass="btn btn-base" runat="server" OnClick="LoginBtn_Click" Text="Login" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

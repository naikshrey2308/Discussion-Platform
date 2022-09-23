<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="DiscussionPanel.ProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
    <link rel="stylesheet" href="styles/base.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>
<body class="row gx-0">
    <form id="form1" style="transform:translate(-50%, -50%)" class="col-12 col-md-8 col-lg-6 col-xl-4 border p-3 position-absolute top-50 start-50" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Email</td>
                    <td class="auto-style1">
                        <asp:TextBox CssClass="form-control" ID="ProfileEmail" runat="server" ReadOnly="True"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="ProfileName" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="ProfilePassword" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:RadioButtonList CssClass="form-control" ID="ProfileGender" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="LogoutBtn" CssClass="btn btn-danger" runat="server" OnClick="LogoutBtn_Click" Text="Logout" />
                    </td>
                    <td class="text-end">
                        <asp:Button ID="updateProfileBtn" CssClass="btn btn-base" runat="server" OnClick="updateProfileBtn_Click" Text="Update My Profile" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

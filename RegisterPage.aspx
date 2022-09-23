<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="DiscussionPanel.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="styles/base.css"/>
</head>
<body class="min-vh-100 position-relative bg-base-gradient">
    <div style="transform:translate(-50%,-50%)" class="br-10 position-absolute mx-auto top-50 start-50 bg-white d-flex col-12 col-md-8 col-lg-6 border-end">
    <div class="bg-black br-start-10 d-flex flex-column justify-content-center">
        <img src="images/1.png" class="d-block my-auto" width="300" />
    </div>
    <form id="form1" class="br-end-10 w-100 bg-white border p-5" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="RegisterEmail" ErrorMessage="The email entered seems incorrect. Please enter a valid email." Font-Size="Small" ForeColor="Red" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                        <asp:TextBox placeholder="Email" CssClass="form-control" ID="RegisterEmail" runat="server" required="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> 
                        <asp:RegularExpressionValidator ID="NameRegexValidator" runat="server" ControlToValidate="RegisterName" ErrorMessage="Please enter a valid name." Font-Size="Small" ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox placeholder="Name" CssClass="form-control" ID="RegisterName" runat="server" required="true" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> 
                        <br />
                        <asp:TextBox placeholder="Password" CssClass="form-control" ID="RegisterPassword" runat="server" required="true" TextMode="Password"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td> 
                        <br />
                        <asp:TextBox placeholder="Retype Your Password" CssClass="form-control" ID="RegisterCPassword" runat="server" required="true" TextMode="Password"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td>
                        <br />
            How do you identify yourself? <br /><br /> <asp:RadioButtonList ID="RegisterGender" CssClass="input-control" runat="server" AutoPostBack="False" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem class="form-control d-inline-block mx-3"> &nbsp;Male</asp:ListItem>
                <asp:ListItem class="form-control d-inline-block mx-3"> &nbsp;Female</asp:ListItem>
            </asp:RadioButtonList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="text-end">
                        <br />
                        <br />
            <asp:Button ID="RegisterBtn" runat="server" OnClick="RegisterBtn_Click" CssClass="btn btn-base" Text="Create My Account" />
                        &nbsp;<br />
                        <asp:HyperLink ID="HyperLink1" Font-Underline="False" runat="server" Font-Size="Small" NavigateUrl="~/LoginPage.aspx">Already registered? Login here</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
    </form>
    </div>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DiscussionPanel.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="styles/base.css"/>
</head>
<body class="position-relative">
    <form id="form1" runat="server">
    <div class="min-vh-100 row gx-0">
       <!-- #include file="~/Navbar.html" -->
        <div class="col-2">&nbsp;</div>
        <div class="col-7 mx-auto p-5 br-10 my-5">
            <asp:DataList ID="DataList1" CssClass="w-100" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div onclick="window.location.href='Thread.aspx?id=<%# Eval("Id") %>'" class="p-3 my-2 discuss-item container border br-10">
                        <div class="d-flex">
                            <asp:Label ID="HeadingLabel" CssClass="w-100" runat="server" Text='<%# Eval("Heading") %>' />
                            <p class="text-end"><span class="rounded-pill bg-success badge"><%# Eval("Category") %></span></p>
                        </div>
                        <div class="text-end">
                            <asp:Label ID="CreatorLabel" CssClass="fst-italic text-secondary small" runat="server" Text='<%# Eval("Creator") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
        <p>
            &nbsp;</p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserDiscussionsConn %>" SelectCommand="SELECT * FROM [Doubts] ORDER BY [Id] DESC">
            </asp:SqlDataSource>
        </p>
    </form>
</body>
</html>

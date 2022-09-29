<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Thread.aspx.cs" Inherits="DiscussionPanel.Thread" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="styles/base.css"/>
</head>
<body class="position-relative">
    <form id="form1" class="w-100" runat="server">
        <div class="min-vh-100 row gx-0">
            <!-- #include file="~/Navbar.html" -->
            <div class="col-2">&nbsp;</div>
                <div class="col-7 mx-auto p-5 br-10 my-5">
                    <h3>Discussion Thread #<%# Request.QueryString["id"] %></h3>
                    <asp:DataList ID="DataList1" CssClass="w-100" runat="server" DataKeyField="Id" DataSourceID="ReplayDataSource">
                        <ItemTemplate>
                            <div class="p-3 my-2 w-100 container bg-dark text-light border br-10">
                                <div class="d-flex">
                                    <asp:Label ID="HeadingLabel" CssClass="w-100" runat="server" Text='<%# Eval("Heading") %>' />
                                    <p class="text-end"><span class="rounded-pill bg-success badge"><%# Eval("Category") %></span></p>
                                </div>
                                <div class="my-1 text-secondary">
                                    <p><%# Eval("Content") %></p>
                                </div>
                                <div class="text-end">
                                    <asp:Label ID="CreatorLabel" CssClass="fst-italic text-secondary small" runat="server" Text='<%# Eval("Creator") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
        
                    <asp:SqlDataSource ID="ReplayDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UserDiscussionsConn %>" SelectCommand="SELECT * FROM [Doubts] WHERE ([Id] = @Id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <table style="width:100%;" class="ms-5 p-3 mt-5">
                        <tr class="p-3">
                            <td>
                                <asp:TextBox placeholder="Have a reply? Why not write it here!" ID="ReplyContent" CssClass="textarea form-control" Rows="4" Columns="90" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="p-3">
                            <td>
                                <asp:Button CssClass="float-end btn btn-base my-3" ID="ReplyBtn" runat="server" OnClick="ReplyBtn_Click" Text="Reply" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1"></td>
                        </tr>
                    </table>

                    <h3>Other Replies</h3>
                    <asp:DataList ID="DataList2" CssClass="w-100 ms-5" runat="server" DataKeyField="Id" DataSourceID="ShowReplies">
                        <ItemTemplate>
                            <div class="p-3 my-2 w-100 container border br-10">
                                <div class="d-flex">
                                    <p><%# Eval("Content") %></p>
                                </div>
                                <div class="text-end">
                                    <asp:Label ID="CreatorLabel" CssClass="fst-italic text-secondary small" runat="server" Text='<%# Eval("Replier") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="ShowReplies" runat="server" ConnectionString="<%$ ConnectionStrings:UserDiscussionsConn %>" SelectCommand="SELECT * FROM [Reply] WHERE ([Doubt] = @Doubt) ORDER BY [Id] DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Doubt" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </div>
            </div>
    </form>
</body>
</html>

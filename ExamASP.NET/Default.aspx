<%@ Page Title="Home Page" Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ExamASP.NET._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h1>News</h1>
    </div>

    <div class=".panel-heading">
        <h2>Most popular articles</h2>
    </div>

    <asp:ListView runat="server"
        ItemType="ExamASP.NET.Models.Article"
        SelectMethod="ListViewArticles_GetData"
        ID="ListViewArticles"
        DataKeyNames="ID"
        GroupItemCount="3">
        <GroupTemplate>
            <div>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="panel-heading">
                <asp:HyperLink ID="AnonimousDetails" NavigateUrl='<%# string.Format("~/DetailsArticle.aspx?id={0}",Item.ID) %>' Text='<%#string.Format("<h3> {0}</h3>", Item.Title)%>' runat="server" />                
                <asp:Label Text="<%# Item.Category.Name %>" runat="server" />
            </div>
            <div>
                <asp:Literal Text="<%#:Item.Content %>" runat="server" />
                <asp:Literal Text='<%# string.Format("<br/>Likes: {0}", Item.Likes.Value) %>' runat="server" />
                <asp:Literal Text=' <%# string.Format("<i>by {0} on {1}</i>",Item.Author.UserName,Item.DateCreated) %>' runat="server" />

            </div>
        </ItemTemplate>
    </asp:ListView>

    <div class="panel-heading">
        <h2>All Categories</h2>
    </div>

    <asp:ListView runat="server"
        ID="ListViewCategory"
        ItemType="ExamASP.NET.Models.Category"
        SelectMethod="ListViewCategory_GetData">
        <GroupTemplate>
            <div>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="pannel-body">
                <h2><%#: Item.Name %></h2>
                <asp:ListView
                    ID="ListViewArticlesInCategories"
                    ItemType="ExamASP.NET.Models.Article"
                    DataSource="<%# Item.Articles %>"
                    runat="server">
                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink runat="server" Text="<%# Item.Title %>" />
                        </li>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No article
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </ItemTemplate>
    </asp:ListView>


</asp:Content>

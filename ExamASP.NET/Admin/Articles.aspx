<%@ Page Title="Articles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="ExamASP.NET.Admin.Articles" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server"
        ID="ListViewEditArticle"
        DataKeyNames="ID"
        ItemType="ExamASP.NET.Models.Article"
        SelectMethod="ListViewEditArticle_GetData"
        DeleteMethod="ListViewEditArticle_DeleteItem"
        UpdateMethod="ListViewEditArticle_UpdateItem"
        InsertMethod="ListViewEditArticle_InsertItem"
        InsertItemPosition="LastItem">
        <LayoutTemplate>
            <div class="row">
                <asp:Button Text="Sort by Title" CssClass="btn btn-default" ID="SortByTitle" runat="server" CommandName="Sort" CommandArgument="Title" />
                <asp:Button Text="Sort by Date" CssClass="btn btn-default" ID="SortByDate" runat="server" CommandName="Sort" CommandArgument="DateCreated" />
                <asp:Button Text="Sort by Category" CssClass="btn btn-default" ID="SortByCategory" runat="server" CommandName="Sort" CommandArgument="Category.Name" />
                <asp:Button Text="Sort by Likes" CssClass="btn btn-default" ID="SortByLikes" runat="server" CommandName="Sort" CommandArgument="Likes.Value" />
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                <asp:DataPager runat="server" ID="DataPagerCategories" PagedControlID="ListViewEditArticle" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                            ShowNextPageButton="false" />
                        <asp:NumericPagerField ButtonType="Link" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class=".panel-heading">
                <asp:Label CssClass=".panel-title" Text='<%# string.Format("<h2>{0}</h2>", Item.Title) %>' runat="server" />
                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="LinkButtonEdit" Text="Edit" CommandName="Edit" />
                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="LinkButtonDelete" Text="Delete" CommandName="Delete" />
            </div>
            <div class="panel-body">
                <asp:Label CssClass="navbar-text" Text='<%# string.Format("Category: {0}",Item.Category.Name) %>' runat="server" />
                <asp:Label CssClass="navbar-text" Text='<%# string.Format("<p>{0}</p>",Item.Content) %>' runat="server" />

                <asp:Label CssClass="navbar-text" Text='<%# string.Format("Likes count: {0}",Item.Likes.Value) %>' runat="server" />
                <asp:Label CssClass="navbar-text" Text=' <%# string.Format("<i>by {0} on {1}</i>",Item.Author.UserName,Item.DateCreated) %>' runat="server" />

            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="input-group">
                <div class="panel-heading">
                    <asp:TextBox runat="server" ID="TextBoxName" Text="<%#: BindItem.Title %>" />
                    <asp:LinkButton runat="server" CssClass="btn btn-default" ID="LinkButtonEdit" Text="Save" CommandName="Update" />
                    <asp:LinkButton runat="server" CssClass="btn btn-default" ID="LinkButtonDelete" Text="Cancel" CommandName="Cancel" />
                </div>
                <div class="panel-body">
                    <asp:DropDownList runat="server" ID="DropDownListCategoriesEdit"
                        CssClass="dropdown-menu"
                        SelectMethod="DropDownListCategoriesEdit_GetData"
                        ItemType="ExamASP.NET.Models.Category"
                        DataTextField="Name"
                        DataValueField="ID"
                        SelectedValue="<%# BindItem.CategoryId%>">
                    </asp:DropDownList><br />
                    <asp:TextBox runat="server" ID="TextBoxContext" TextMode="MultiLine" MaxLength="300" Text="<%#: BindItem.Content %>" />
                </div>
                <div class="panel-body">
                    <asp:Label CssClass="navbar-text" Text='<%# string.Format("Likes count: {0}",Item.Likes.Value) %>' runat="server" /><br />
                    <asp:Label CssClass="navbar-text" Text=' <%# string.Format("<i>by {0} on {1}</i>",Item.Author.UserName,Item.DateCreated) %>' runat="server" />
                </div>
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Insert</h3>
                </div>
                <div class="panel-body">
                    <asp:TextBox  CssClass="navbar-text pull-left" runat="server" ID="TextBoxName" Text="<%#: BindItem.Title %>" />
                    <asp:DropDownList runat="server"
                        CssClass="dropdown pull-left"
                        ID="DropDownListCategoriesInsert"
                        ItemType="ExamASP.NET.Models.Category"
                        DataTextField="Name"
                        DataValueField="ID"
                        SelectMethod="DropDownListCategoriesInsert_GetData"
                        SelectedValue="<%# BindItem.CategoryId %>">
                    </asp:DropDownList><br />

                    <asp:TextBox CssClass="navbar-text pull-left" runat="server" ID="TextBoxContext" TextMode="MultiLine" Text="<%#: BindItem.Content %>" />

                    <asp:LinkButton runat="server" CssClass="btn btn-default pull-left" ID="LinkButtonEdit" Text="Insert" CommandName="Insert" />
                    <asp:LinkButton runat="server" CssClass="btn btn-default pull-left" ID="LinkButtonDelete" Text="Cancel" CommandName="Cancel" />
                </div>
            </div>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>

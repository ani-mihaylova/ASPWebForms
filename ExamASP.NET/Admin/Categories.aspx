<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ExamASP.NET.Admin.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server"
         ID="ListViewEditCatagory"
         ItemType="ExamASP.NET.Models.Category"
         SelectMethod="ListViewEditCatagory_GetData"
         DeleteMethod="ListViewEditCatagory_DeleteItem"
         UpdateMethod="ListViewEditCatagory_UpdateItem"
         InsertMethod="ListViewEditCatagory_InsertItem"
         InsertItemPosition="LastItem"
         DataKeyNames="ID" >
        <LayoutTemplate>
            <table class="gridview" 
                
                 border="1" 
                id="MainContent_ListViewCategories" style="border-collapse: collapse;">
                <tbody>
                    <tr>
                        <th scope="col">
                            <asp:LinkButton Text="SortBY Name" runat="server" ID="LinkButtonSortByCategory" CommandName="Sort" CommandArgument="Name" />
                        </th>
                        <th scope="col">Action</th>
                    </tr>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                    <tr>
                        <td colspan="2">
                            <asp:DataPager runat="server" ID="DataPagerCategories" PagedControlID="ListViewEditCatagory" PageSize="5">
                                <Fields>
                                    <asp:NumericPagerField />
                                </Fields>
                            </asp:DataPager>
                            <%--<asp:LinkButton runat="server" ID="LinkButtonInsert" Text="Insert" OnClick="LinkButtonInsert_Click" CssClass="btn btn-primary pull-right" ></asp:LinkButton>--%>
                        </td>
                    </tr>
                </tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#: Item.Name %></td>
                <td>
                    <asp:LinkButton runat="server" ID="LinkButtonEdit" Text="Edit" CommandName="Edit" />
                    <asp:LinkButton runat="server" ID="LinkButtonDelete" Text="Delete" CommandName="Delete" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="TextBoxName" Text="<%#: BindItem.Name %>" />
                </td>
                <td>
                    <asp:LinkButton runat="server" ID="LinkButtonEdit" Text="Save" CommandName="Update" />
                    <asp:LinkButton runat="server" ID="LinkButtonDelete" Text="Cancel" CommandName="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
             <tr>
                <td>
                    <asp:TextBox runat="server" ID="TextBoxName" Text="<%#: BindItem.Name %>" />
                </td>
                <td>
                    <asp:LinkButton runat="server" ID="LinkButtonEdit" Text="Insert" CommandName="Insert" />
                    <asp:LinkButton runat="server" ID="LinkButtonDelete" Text="Cancel" CommandName="Cancel" />
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>

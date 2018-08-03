<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Compass.aspx.cs" Inherits="Compass.ModuleUI.Compass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
<%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">--%>
                <table>
                    <tr>
                        <td>Job Type </td>
                        <td>
                            <asp:DropDownList ID="ddlJobType" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Branch </td>
                        <td>
                            <asp:DropDownList ID="ddlBranch" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Users </td>
                        <td>
                            <asp:DropDownList ID="ddlUsers" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Status </td>
                        <td>Entry Complete</td>
                    </tr>
                    <tr>
                        <td>Comment</td>
                        <td>
                            <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="50px" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Priority </td>
                        <td>
                            <asp:DropDownList ID="ddlPriority" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Attachments </td>
                        <td>
                            <asp:FileUpload ID="fileJobAttachment" runat="server" AllowMultiple="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                        </td>
                    </tr>
                </table>
 <%--           </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Compass.aspx.cs" Inherits="Compass.ModuleUI.Compass" %>

<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">

                <table>

                    <tr>
                        <td>Job Type </td>
                        <td>
                            <asp:DropDownList ID="ddlJobType" runat="server">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td>Job Status </td>
                        <td>
                        Entry Complete</td>
                    </tr>
                    <tr>
                        <td>Comment </td>
                        <td>
                            <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="50px" Width="250px"></asp:TextBox>
                          <%--  <FTB:FreeTextBox ID="ftbdescription" runat="server" Height="300" Width="900px" EnableToolbars="false" BreakMode="linebreak" AutoGenerateToolbarsFromString="false"></FTB:FreeTextBox>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>Priority </td>
                        <td>
                            <asp:DropDownList ID="ddlPriority" runat="server">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Job attachment </td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                        </td>
                    </tr>
                </table>


            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


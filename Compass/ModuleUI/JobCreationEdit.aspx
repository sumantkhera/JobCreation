<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobCreationEdit.aspx.cs" Inherits="Compass.ModuleUI.JobCreationEdit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">

                <table>

                    <tr>
                        <td style="width:150px">Number</td>
                        <td>
                           <asp:TextBox ID="txtJobNumber" runat="server"></asp:TextBox>
                            </td>
                        <td style="width:50px"></td>
                        
                            <td style="width:150px"> Submit Date</td>
                        <td >
                           <asp:TextBox ID="txtSubmitDate" runat="server"></asp:TextBox>
                            </td>
                    </tr>

                    <tr>
                        <td style="width:150px">Submit By </td>
                        <td>
                           <asp:TextBox ID="txtSubmitBy" runat="server"></asp:TextBox>
                            </td>
                        <td></td>
                        <td style="width:150px">Branch</td>
                        <td>
                           <asp:TextBox ID="txtBranch" runat="server"></asp:TextBox>
                            </td>
                    </tr>
                    <tr>
                        <td style="width:150px">Job Status </td>
                        <td style="width:150px">
                           <asp:DropDownList ID="ddlJobStatus" runat="server" Width="130px">
                               
                            </asp:DropDownList></td>
                        </td>
                        <td></td>
                        <td style="width:150px">Job Type </td>
                        <td style="width:150px">
                           <asp:DropDownList ID="ddlJobType" runat="server" Width="130px">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList></td>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:150px">Team </td>
                        <td style="width:150px">
                           <asp:DropDownList ID="ddlTeam" runat="server" Width="130px">
                                 <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                               <asp:ListItem Value="1" Text="Client"></asp:ListItem>
                               <asp:ListItem Value="2" Text="Damco"></asp:ListItem>
                            </asp:DropDownList></td>
                        </td>
                        <td></td>
                        <td style="width:150px">User</td>
                        <td style="width:150px">
                           <asp:DropDownList ID="ddlUser" runat="server" Width="130px">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList></td>
                        </td>
                        <td></td>
                        <td style="width:150px">QA User</td>
                        <td style="width:150px">
                           <asp:DropDownList ID="ddlQAUser" runat="server" Width="130px">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList></td>
                        </td>
                            
                    </tr>
                    <tr>
                        <td>Description </td>
                        <td>
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="50px" Width="250px"></asp:TextBox>                         
                        </td>
                    </tr>
                      <tr>
                        <td>Internal Use </td>
                        <td>
                            <asp:CheckBox ID="chkInternalUse" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:150px">Comments </td>
                        <td style="width:150px">
                          <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Height="50px" Width="250px"></asp:TextBox>  
                           </td>
                        </td>
                        <td></td>
                        </tr>
                    <tr>
                        <td>Attachments </td>
                        <td>
                            <asp:FileUpload ID="FileUploadAttachments" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
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


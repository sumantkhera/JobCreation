<%@ Page Title="Job List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobList.aspx.cs"
    Inherits="Compass.ModuleUI.JobList"
    EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <asp:Label ID="lblID1" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
        <asp:GridView ID="grdViewJobList" runat="server" AutoGenerateColumns="false"
            OnRowDataBound="grdViewJobList_RowDataBound"
            AutoGenerateSelectButton="true"
            OnSelectedIndexChanged="grdViewJobList_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Job Number">
                    <ItemTemplate>
                        <asp:Label ID="lblJobNumber" runat="server" Text='<%# Eval("JobNumber")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="60px" HeaderText="Branch">
                    <ItemTemplate>
                        <asp:Label ID="lblBranchName" runat="server" Text='<%#Eval("BranchName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="60px" HeaderText="Job Type">
                    <ItemTemplate>
                        <asp:Label ID="lblJobType" runat="server" Text='<%# Eval("JobType")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="60px" HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label ID="lblJobStatus" runat="server" Text='<%#Eval("JobStatus")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="60px" HeaderText="Allocated To">
                    <ItemTemplate>
                        <asp:Label ID="lblAllocatedTo" runat="server" Text='<%# Eval("AllocatedTo")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="60px" HeaderText="Priority">
                    <ItemTemplate>
                        <asp:Label ID="lblPriorityType" runat="server" Text='<%#Eval("PriorityType")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="60px" HeaderText="Submission Date">
                    <ItemTemplate>
                        <asp:Label ID="lblSubmitDate" runat="server" Text='<%# Eval("SubmitDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="60px" HeaderText="Submitted By">
                    <ItemTemplate>
                        <asp:Label ID="lblSubmitByName" runat="server" Text='<%#Eval("SubmitByName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="60px" HeaderText="Last Updated">
                    <ItemTemplate>
                        <asp:Label ID="lblLastUpdatedDate" runat="server" Text='<%# Eval("LastUpdatedDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </section>
</asp:Content>

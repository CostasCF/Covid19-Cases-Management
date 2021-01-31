<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Covid_Case_Management_System.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="enteracaselbl" runat="server" Font-Size="20pt" Text="Enter a covid case:"></asp:Label>
            <br />
            <asp:Label ID="firstNamelbl" runat="server" Text="First Name:"></asp:Label>
            <br />
            <asp:TextBox ID="firstNameBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lastNamelbl" runat="server" Text="Last Name:"></asp:Label>
            <br />
            <asp:TextBox ID="lastNameBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="phoneNumberlbl" runat="server" Text="Phone Number:"></asp:Label>
            <br />
            <asp:TextBox ID="phoneNumberBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="genderLbl" runat="server" Text="Gender:"></asp:Label>
            <br />
            <asp:TextBox ID="genderBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="agelbl" runat="server" Text="Age:"></asp:Label>
            <br />
            <asp:TextBox ID="ageBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="addresslbl" runat="server" Text="Address:"></asp:Label>
            <br />
            <asp:TextBox ID="addressBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="deseaseslbl" runat="server" Text="Underlying Deseases:"></asp:Label>
            <br />
            <asp:TextBox ID="deseasesBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="datelbl" runat="server" Text="Date:"></asp:Label>
            <br />
            <asp:TextBox ID="dateBox" runat="server"></asp:TextBox>
            <br />
        </div>
        <br />


        <asp:Button ID="submitBtn" runat="server" OnClick="submitBtn_Click" Text="Submit" />
         <hr />

        <br />
        <br />
         <!-- search section -->
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <asp:Button ID="searchBtn" runat="server" OnClick="searchBtn_Click" Text="Search" />
        <hr />
        <!-- gridview -->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="649px"
           DataKeyNames="Id" AllowPaging="True" OnPageIndexChanging="OnPaging" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"  OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." > 
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
               <Columns>
                   <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                       <EditItemTemplate>
                           <asp:Label ID="Id" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                       <ItemTemplate>
                           <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                       </ItemTemplate>
                         <EditItemTemplate>
                           <asp:TextBox ID="FirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                       </EditItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                       <EditItemTemplate>
                           <asp:TextBox ID="LastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="PhoneNumber" SortExpression="PhoneNumber">
                       <EditItemTemplate>
                           <asp:TextBox ID="PhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                       <EditItemTemplate>
                           <asp:TextBox ID="Gender" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Age" SortExpression="Age">
                       <EditItemTemplate>
                           <asp:TextBox ID="Age" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblAge" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Address" SortExpression="Address">
                       <EditItemTemplate>
                           <asp:TextBox ID="Address" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Deseases" SortExpression="Deseases">
                       <EditItemTemplate>
                           <asp:TextBox ID="Deseases" runat="server" Text='<%# Bind("Deseases") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblDeseases" runat="server" Text='<%# Bind("Deseases") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Date" SortExpression="Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="Date" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                    ItemStyle-Width="100"  />

       </Columns>
       </asp:GridView>

   
    </form>
</body>
</html>

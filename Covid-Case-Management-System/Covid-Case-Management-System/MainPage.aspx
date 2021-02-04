﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Covid_Case_Management_System.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="enteracaselbl" runat="server" Font-Size="20pt" Text="Enter a covid case:"></asp:Label>
            <br />
            <asp:Label ID="firstNamelbl" runat="server" Text="First Name:"></asp:Label>
            <br />
            <asp:TextBox ID="firstNameBox" runat="server" required="true" maxlength="50"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lastNamelbl" runat="server" Text="Last Name:"></asp:Label>
            <br />
            <asp:TextBox ID="lastNameBox" runat="server" maxlength="50" required="true"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="phoneNumberlbl" runat="server" Text="Phone Number:"></asp:Label>
            <br />
            <asp:TextBox ID="phoneNumberBox" runat="server"  pattern="[0-9]{10}" maxlength="10"  required="true" onkeypress="return !(event.charCode > 31 &&  (event.charCode < 48 || event.charCode > 57))" TextMode="Phone" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="genderLbl" runat="server" Text="Gender:"></asp:Label>
            <br />
            <asp:RadioButton ID="maleRdoBtn" runat="server" Text="Male" GroupName="Gender" required="true" />
            <br />
            <asp:RadioButton ID="femaleRdoBtn" runat="server" Text="Female" GroupName="Gender" required="true"/>
            <br />
            <asp:Label ID="agelbl" runat="server" Text="Age:"></asp:Label>
            <br />
            <asp:TextBox ID="ageBox" runat="server" required="true" TextMode="Number"  maxlength="3" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="addresslbl" runat="server" Text="Address:"></asp:Label>
            <br />
            <asp:TextBox ID="addressBox" runat="server" required="true"  maxlength="100"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="deseaseslbl" runat="server" Text="Underlying Deseases:"></asp:Label>
            <br />
            <asp:TextBox ID="deseasesBox" runat="server"  maxlength="150"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="datelbl" runat="server" Text="Date:"></asp:Label>
            <br />
            <asp:TextBox ID="dateBox" runat="server" required="true"  maxlength="50" TextMode="Date" ></asp:TextBox>
            <br />
        </div>
        <br />


        <asp:Button ID="submitBtn" runat="server" OnClick="submitBtn_Click" Text="Submit" />
         <br />
         <hr />

            <asp:Label ID="searchAcaseLbl" runat="server" Font-Size="20pt" Text="View, Edit and Search the database:"></asp:Label>
        <br />
        <br />
         <!-- search section -->
        <asp:TextBox GroupName="SearchSection" ID="txtSearch" runat="server"></asp:TextBox>
        <asp:Button GroupName="SearchSection" ID="searchBtn" runat="server" OnClick="searchBtn_Click" Text="Search" CausesValidation="False" UseSubmitBehavior="False" />
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
                           <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                       <ItemTemplate>
                           <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                       </ItemTemplate>
                         <EditItemTemplate>
                           <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                       </EditItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="PhoneNumber" SortExpression="PhoneNumber">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtGender" runat="server" Text='<%# Eval("Gender") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Age" SortExpression="Age">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtAge" runat="server" Text='<%# Eval("Age") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Address" SortExpression="Address">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Deseases" SortExpression="Deseases">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtDeseases" runat="server" Text='<%# Eval("Deseases") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblDeseases" runat="server" Text='<%# Eval("Deseases") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Date" SortExpression="Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="txtDate" runat="server" Text='<%# Eval("Date") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                    ItemStyle-Width="70"  />

       </Columns>
       </asp:GridView>

   
        <br />
        <hr />
        <br />
        <asp:Label ID="lblStatistics" runat="server" BorderStyle="None" Font-Size="20pt" Text="Statistics"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

   
    </form>
</body>
</html>

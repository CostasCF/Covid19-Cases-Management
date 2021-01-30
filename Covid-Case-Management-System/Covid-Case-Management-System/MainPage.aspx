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
            <asp:TextBox ID="lastNameBox" required="true" runat="server"></asp:TextBox>
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


        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" Width="531px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Deseases" HeaderText="Deseases" SortExpression="Deseases" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <br />
        <br />
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Covid19-CaseDBConnectionString %>" DeleteCommand="DELETE FROM [newCovidCases] WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [PhoneNumber] = @original_PhoneNumber AND [Gender] = @original_Gender AND [Age] = @original_Age AND [Address] = @original_Address AND (([Deseases] = @original_Deseases) OR ([Deseases] IS NULL AND @original_Deseases IS NULL)) AND [Date] = @original_Date" InsertCommand="INSERT INTO [newCovidCases] ([FirstName], [LastName], [PhoneNumber], [Gender], [Age], [Address], [Deseases], [Date]) VALUES (@FirstName, @LastName, @PhoneNumber, @Gender, @Age, @Address, @Deseases, @Date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [newCovidCases]" UpdateCommand="UPDATE [newCovidCases] SET [FirstName] = @FirstName, [LastName] = @LastName, [PhoneNumber] = @PhoneNumber, [Gender] = @Gender, [Age] = @Age, [Address] = @Address, [Deseases] = @Deseases, [Date] = @Date WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [PhoneNumber] = @original_PhoneNumber AND [Gender] = @original_Gender AND [Age] = @original_Age AND [Address] = @original_Address AND (([Deseases] = @original_Deseases) OR ([Deseases] IS NULL AND @original_Deseases IS NULL)) AND [Date] = @original_Date">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_PhoneNumber" Type="String" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_Age" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_Deseases" Type="String" />
                <asp:Parameter Name="original_Date" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Age" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Deseases" Type="String" />
                <asp:Parameter Name="Date" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Age" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Deseases" Type="String" />
                <asp:Parameter Name="Date" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_PhoneNumber" Type="String" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_Age" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_Deseases" Type="String" />
                <asp:Parameter Name="original_Date" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


    </form>
</body>
</html>

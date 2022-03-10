<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address Form.aspx.cs" Inherits="CourseWork.Address_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Address Details and Form | Advanced Database Coursework | Samit Paudel</title>
    <link rel="stylesheet" href="CSS/style.css" />
    <link rel="stylesheet" href="CSS/student_form.css" />
</head>
<body>
    <h1 class="page-title">Address Detail and Form</h1>
    <h3 class="form-header">Links to Other Forms</h3>
    <div class="navbar">
        <p class="nav-element"><a href="Dashboard.aspx">Home</a></p>
        <p class="nav-element"><a href="Student Form.aspx">Student Form</a></p>
        <p class="nav-element"><a href="Teacher Form.aspx">Teacher Form</a></p>
        <p class="nav-element"><a href="Module Form.aspx">Module Form</a></p>
        <p class="nav-element"><a href="Teacher-Module.aspx">Teacher-Module Details</a></p>
        <p class="nav-element"><a href="Student-Fee.aspx">Student-Fee Details</a></p>
        <p class="nav-element"><a href="Student-Result.aspx">Student-Result Details</a></p>
    </div>
    <form id="form1" runat="server">        
        <div>
            <h3 class="form-header">Address Table</h3>
            <div class="warning">
                <p>Rather than standalone form, it is more suitable to be added from Student Form page or Teacher Form page in which the whole process of entering address of designated person works in conjunction to other values.<br /></p>
                <p>For entering address ID and address only, use this page.<br /></p>
            </div>         
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" CssClass="grid">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot;) VALUES (:ADDRESS_ID, :ADDRESS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot; FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;ADDRESS&quot; = :ADDRESS WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
            <DeleteParameters>
                <asp:Parameter Name="ADDRESS_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ADDRESS_ID" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="ADDRESS_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" CssClass="form-user">
            <EditItemTemplate>
                ADDRESS_ID:
                <asp:Label ID="ADDRESS_IDLabel1" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
                <br />
                ADDRESS:
                <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                ADDRESS_ID:
                <asp:TextBox ID="ADDRESS_IDTextBox" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
                <br />
                ADDRESS:
                <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                ADDRESS_ID:
                <asp:Label ID="ADDRESS_IDLabel" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
                <br />
                ADDRESS:
                <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>

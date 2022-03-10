<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Module Form.aspx.cs" Inherits="CourseWork.Module_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Module Details and Form | Advanced Database Coursework | Samit Paudel</title>
    <link rel="stylesheet" href="CSS/style.css" />
    <link rel="stylesheet" href="CSS/student_form.css" />
</head>
<body>
    <h1 class="page-title">Module Detail and Form</h1>
    <h3 class="form-header">Links to Other Forms</h3>
    <div class="navbar">
        <p class="nav-element"><a href="Dashboard.aspx">Home</a></p>
        <p class="nav-element"><a href="Student Form.aspx">Student Form</a></p>
        <p class="nav-element"><a href="Teacher Form.aspx">Teacher Form</a></p>
        <p class="nav-element"><a href="Address Form.aspx">Address Form</a></p>
        <p class="nav-element"><a href="Teacher-Module.aspx">Teacher-Module Details</a></p>
        <p class="nav-element"><a href="Student-Fee.aspx">Student-Fee Details</a></p>
        <p class="nav-element"><a href="Student-Result.aspx">Student-Result Details</a></p>
    </div>
    <form id="form1" runat="server">
        <div>
            <h3 class="form-header">Module Table</h3>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MODULE_CODE" DataSourceID="SqlDataSource1" CssClass="grid">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" ReadOnly="True" SortExpression="MODULE_CODE" />
                    <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
                    <asp:BoundField DataField="CREDIT_HOUR" HeaderText="CREDIT_HOUR" SortExpression="CREDIT_HOUR" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MODULE&quot; WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE" InsertCommand="INSERT INTO &quot;MODULE&quot; (&quot;MODULE_CODE&quot;, &quot;MODULE_NAME&quot;, &quot;CREDIT_HOUR&quot;) VALUES (:MODULE_CODE, :MODULE_NAME, :CREDIT_HOUR)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MODULE_CODE&quot;, &quot;MODULE_NAME&quot;, &quot;CREDIT_HOUR&quot; FROM &quot;MODULE&quot;" UpdateCommand="UPDATE &quot;MODULE&quot; SET &quot;MODULE_NAME&quot; = :MODULE_NAME, &quot;CREDIT_HOUR&quot; = :CREDIT_HOUR WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE">
            <DeleteParameters>
                <asp:Parameter Name="MODULE_CODE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MODULE_CODE" Type="String" />
                <asp:Parameter Name="MODULE_NAME" Type="String" />
                <asp:Parameter Name="CREDIT_HOUR" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MODULE_NAME" Type="String" />
                <asp:Parameter Name="CREDIT_HOUR" Type="Decimal" />
                <asp:Parameter Name="MODULE_CODE" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="MODULE_CODE" DataSourceID="SqlDataSource1" CssClass="form-user">
            <EditItemTemplate>
                MODULE_CODE:
                <asp:Label ID="MODULE_CODELabel1" runat="server" Text='<%# Eval("MODULE_CODE") %>' />
                <br />
                MODULE_NAME:
                <asp:TextBox ID="MODULE_NAMETextBox" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
                <br />
                CREDIT_HOUR:
                <asp:TextBox ID="CREDIT_HOURTextBox" runat="server" Text='<%# Bind("CREDIT_HOUR") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                MODULE_CODE:
                <asp:TextBox ID="MODULE_CODETextBox" runat="server" Text='<%# Bind("MODULE_CODE") %>' />
                <br />
                MODULE_NAME:
                <asp:TextBox ID="MODULE_NAMETextBox" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
                <br />
                CREDIT_HOUR:
                <asp:TextBox ID="CREDIT_HOURTextBox" runat="server" Text='<%# Bind("CREDIT_HOUR") %>' />
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                MODULE_CODE:
                <asp:Label ID="MODULE_CODELabel" runat="server" Text='<%# Eval("MODULE_CODE") %>' />
                <br />
                MODULE_NAME:
                <asp:Label ID="MODULE_NAMELabel" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
                <br />
                CREDIT_HOUR:
                <asp:Label ID="CREDIT_HOURLabel" runat="server" Text='<%# Bind("CREDIT_HOUR") %>' />
                <br />
                <br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher Form.aspx.cs" Inherits="CourseWork.Teacher_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Details and Form | Advanced Database Coursework | Samit Paudel</title>
    <link rel="stylesheet" href="CSS/style.css" />
    <link rel="stylesheet" href="CSS/student_form.css" />
</head>
<body>
    <h1 class="page-title">Teacher Detail and Form</h1>
    <h3 class="form-header">Links to Other Forms</h3>
    <div class="navbar">
        <p class="nav-element"><a href="Dashboard.aspx">Home</a></p>
        <p class="nav-element"><a href="Student Form.aspx">Student Form</a></p>
        <p class="nav-element"><a href="Address Form.aspx">Address Form</a></p>
        <p class="nav-element"><a href="Module Form.aspx">Module Form</a></p>
        <p class="nav-element"><a href="Teacher-Module.aspx">Teacher-Module Details</a></p>
        <p class="nav-element"><a href="Student-Fee.aspx">Student-Fee Details</a></p>
        <p class="nav-element"><a href="Student-Result.aspx">Student-Result Details</a></p>
    </div>
    <form id="form1" runat="server">
        <div>
            <h3 class="form-header">Steps for insertion</h3>
            <ul class="steps">
                <li>First insert data into Address Table.</li>
                <li>Then insert data into Person Table which requires Address ID to be inserted from the Address Table.</li>
                <li>Finally insert data into Teacher Table which requires inserting Person ID from Person Table.&nbsp;</li>
            </ul>

            <h3 class="form-header">Address Table</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="Address" CssClass="grid">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Address" runat="server" ConnectionString="<%$ ConnectionStrings:FinalConnection %>" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot;) VALUES (:ADDRESS_ID, :ADDRESS)" ProviderName="<%$ ConnectionStrings:FinalConnection.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;ADDRESS&quot; FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;ADDRESS&quot; = :ADDRESS WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="Address" CssClass="form-user">
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
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>

        <h3 class="form-header">Person Table</h3>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="PERSON_ID" DataSourceID="Person" CssClass="grid">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" ReadOnly="True" SortExpression="PERSON_ID" />
                <asp:BoundField DataField="PERSON_NAME" HeaderText="PERSON_NAME" SortExpression="PERSON_NAME" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
            </Columns>
        </asp:GridView>
        
        
        <asp:SqlDataSource ID="Person" runat="server" ConnectionString="<%$ ConnectionStrings:FinalConnection %>" ProviderName="<%$ ConnectionStrings:FinalConnection.ProviderName %>" SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;PERSON_NAME&quot;, &quot;email&quot;, &quot;ADDRESS&quot; FROM &quot;PERSON&quot;" DeleteCommand="DELETE FROM &quot;PERSON&quot; WHERE &quot;PERSON_ID&quot; = :PERSON_ID" InsertCommand="INSERT INTO &quot;PERSON&quot; (&quot;PERSON_ID&quot;, &quot;PERSON_NAME&quot;, &quot;email&quot;, &quot;ADDRESS&quot;) VALUES (:PERSON_ID, :PERSON_NAME, :email, :ADDRESS)" UpdateCommand="UPDATE &quot;PERSON&quot; SET &quot;PERSON_NAME&quot; = :PERSON_NAME, &quot;email&quot; = :email, &quot;ADDRESS&quot; = :ADDRESS WHERE &quot;PERSON_ID&quot; = :PERSON_ID">
            <DeleteParameters>
                <asp:Parameter Name="PERSON_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PERSON_ID" Type="String" />
                <asp:Parameter Name="PERSON_NAME" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PERSON_NAME" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="PERSON_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="PERSON_ID" DataSourceID="Person" CssClass="form-user">
            <EditItemTemplate>
                PERSON_ID:
                <asp:Label ID="PERSON_IDLabel1" runat="server" Text='<%# Eval("PERSON_ID") %>' />
                <br />
                PERSON_NAME:
                <asp:TextBox ID="PERSON_NAMETextBox" runat="server" Text='<%# Bind("PERSON_NAME") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                ADDRESS:
                <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                PERSON_ID:
                <asp:TextBox ID="PERSON_IDTextBox" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                <br />
                PERSON_NAME:
                <asp:TextBox ID="PERSON_NAMETextBox" runat="server" Text='<%# Bind("PERSON_NAME") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                ADDRESS:<br />
                &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="Address" DataTextField="ADDRESS" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("ADDRESS") %>'>
                </asp:DropDownList>
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                PERSON_ID:
                <asp:Label ID="PERSON_IDLabel" runat="server" Text='<%# Eval("PERSON_ID") %>' />
                <br />
                PERSON_NAME:
                <asp:Label ID="PERSON_NAMELabel" runat="server" Text='<%# Bind("PERSON_NAME") %>' />
                <br />
                email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                <br />
                ADDRESS:
                <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                <br />
                &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>

        <h3 class="form-header">Teacher Table</h3>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="TEACHER_ID" DataSourceID="Teacher" CssClass="grid">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TEACHER_ID" HeaderText="TEACHER_ID" ReadOnly="True" SortExpression="TEACHER_ID" />
                <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" SortExpression="PERSON_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Teacher" runat="server" ConnectionString="<%$ ConnectionStrings:FinalConnection %>" DeleteCommand="DELETE FROM &quot;TEACHER&quot; WHERE &quot;TEACHER_ID&quot; = :TEACHER_ID" InsertCommand="INSERT INTO &quot;TEACHER&quot; (&quot;TEACHER_ID&quot;, &quot;PERSON_ID&quot;) VALUES (:TEACHER_ID, :PERSON_ID)" ProviderName="<%$ ConnectionStrings:FinalConnection.ProviderName %>" SelectCommand="SELECT &quot;TEACHER_ID&quot;, &quot;PERSON_ID&quot; FROM &quot;TEACHER&quot;" UpdateCommand="UPDATE &quot;TEACHER&quot; SET &quot;PERSON_ID&quot; = :PERSON_ID WHERE &quot;TEACHER_ID&quot; = :TEACHER_ID">
            <DeleteParameters>
                <asp:Parameter Name="TEACHER_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TEACHER_ID" Type="String" />
                <asp:Parameter Name="PERSON_ID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PERSON_ID" Type="String" />
                <asp:Parameter Name="TEACHER_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <asp:FormView ID="FormView3" runat="server" CssClass="form-user" DataKeyNames="TEACHER_ID" DataSourceID="Teacher">
                <EditItemTemplate>
                    TEACHER_ID:
                    <asp:Label ID="TEACHER_IDLabel1" runat="server" Text='<%# Eval("TEACHER_ID") %>' />
                    <br />
                    PERSON_ID:
                    <asp:TextBox ID="PERSON_IDTextBox" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    TEACHER_ID:
                    <asp:TextBox ID="TEACHER_IDTextBox" runat="server" Text='<%# Bind("TEACHER_ID") %>' />
                    <br />
                    PERSON_ID: <br />
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="Person" DataTextField="PERSON_NAME" DataValueField="PERSON_ID" SelectedValue='<%# Bind("PERSON_ID") %>'>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    TEACHER_ID:
                    <asp:Label ID="TEACHER_IDLabel" runat="server" Text='<%# Eval("TEACHER_ID") %>' />
                    <br />
                    PERSON_ID:
                    <asp:Label ID="PERSON_IDLabel" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                    <br />
                    <br />
                    &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
                </ItemTemplate>
            </asp:FormView>
        <h3 class="form-header">Links to Other Forms</h3>
        <div class="navbar">
            <p class="nav-element"><a href="Dashboard.aspx">Home</a></p>
            <p class="nav-element"><a href="Teacher Form.aspx">Teacher Form</a></p>
            <p class="nav-element"><a href="Address Form.aspx">Address Form</a></p>
            <p class="nav-element"><a href="Module Form.aspx">Module Form</a></p>
            <p class="nav-element"><a href="Teacher-Module.aspx">Teacher-Module Details</a></p>
            <p class="nav-element"><a href="Student-Fee.aspx">Student-Fee Details</a></p>
            <p class="nav-element"><a href="Student-Result.aspx">Student-Result Details</a></p>
        </div>
    </div>
    </form>
</body>
</html>

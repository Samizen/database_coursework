<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student Form.aspx.cs" Inherits="CourseWork.Student_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Details and Form | Advanced Database Coursework | Samit Paudel</title>
    <link rel="stylesheet" href="CSS/style.css" />
    <link rel="stylesheet" href="CSS/student_form.css" />
</head>
<body>
    <h1 class="page-title">Student Detail and Form</h1>
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
    <form id="form1" runat="server">
        <div>
            <h3 class="form-header">Steps for insertion</h3>
            <ul class="steps">
                <li>First insert data into Address Table.</li>
                <li>Then insert data into Person Table which requires Address ID to be inserted from the Address Table.</li>
                <li>Finally insert data into Student Table which requires inserting Person ID from Person Table.&nbsp;</li>
            </ul>

            <h3 class="form-header">Address Table</h3>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="Address" CssClass="grid">
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
            &nbsp;<asp:FormView ID="FormView6" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="Address" CssClass="form-user">
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
                    <br />
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
                </ItemTemplate>
            </asp:FormView>
&nbsp;<h3 class="form-header">Person Table</h3>
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="PERSON_ID" DataSourceID="Person" AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" ReadOnly="True" SortExpression="PERSON_ID" />
                    <asp:BoundField DataField="PERSON_NAME" HeaderText="PERSON_NAME" SortExpression="PERSON_NAME" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Person" runat="server" ConnectionString="<%$ ConnectionStrings:FinalConnection %>" DeleteCommand="DELETE FROM &quot;PERSON&quot; WHERE &quot;PERSON_ID&quot; = :PERSON_ID" InsertCommand="INSERT INTO &quot;PERSON&quot; (&quot;PERSON_ID&quot;, &quot;PERSON_NAME&quot;, &quot;email&quot;, &quot;ADDRESS&quot;) VALUES (:PERSON_ID, :PERSON_NAME, :email, :ADDRESS)" ProviderName="<%$ ConnectionStrings:FinalConnection.ProviderName %>" SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;PERSON_NAME&quot;, &quot;email&quot;, &quot;ADDRESS&quot; FROM &quot;PERSON&quot;" UpdateCommand="UPDATE &quot;PERSON&quot; SET &quot;PERSON_NAME&quot; = :PERSON_NAME, &quot;email&quot; = :email, &quot;ADDRESS&quot; = :ADDRESS WHERE &quot;PERSON_ID&quot; = :PERSON_ID">
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
            <asp:FormView ID="FormView7" runat="server" DataKeyNames="PERSON_ID" DataSourceID="Person" CssClass="form-user">
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
                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="Address" DataTextField="ADDRESS" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("ADDRESS") %>'>
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
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
                </ItemTemplate>
            </asp:FormView>
            <br />
        </div>

        <h3 class="form-header">Student Table</h3>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="Student" CssClass="grid">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" SortExpression="PERSON_ID" />
                <asp:BoundField DataField="RUNNING_SEMESTER" HeaderText="RUNNING_SEMESTER" SortExpression="RUNNING_SEMESTER" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Student" runat="server" ConnectionString="<%$ ConnectionStrings:FinalConnection %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;PERSON_ID&quot;, &quot;RUNNING_SEMESTER&quot;) VALUES (:STUDENT_ID, :PERSON_ID, :RUNNING_SEMESTER)" ProviderName="<%$ ConnectionStrings:FinalConnection.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;PERSON_ID&quot;, &quot;RUNNING_SEMESTER&quot; FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;PERSON_ID&quot; = :PERSON_ID, &quot;RUNNING_SEMESTER&quot; = :RUNNING_SEMESTER WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
                <asp:Parameter Name="PERSON_ID" Type="String" />
                <asp:Parameter Name="RUNNING_SEMESTER" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PERSON_ID" Type="String" />
                <asp:Parameter Name="RUNNING_SEMESTER" Type="Decimal" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Semester" runat="server" ConnectionString="<%$ ConnectionStrings:FinalConnection %>" ProviderName="<%$ ConnectionStrings:FinalConnection.ProviderName %>" SelectCommand="SELECT &quot;SEMESTER&quot; FROM &quot;FEE&quot;"></asp:SqlDataSource>
        <asp:FormView ID="FormView8" runat="server" CssClass="form-user" DataKeyNames="STUDENT_ID" DataSourceID="Student">
            <EditItemTemplate>
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                PERSON_ID:
                <asp:TextBox ID="PERSON_IDTextBox" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                <br />
                RUNNING_SEMESTER:
                <asp:TextBox ID="RUNNING_SEMESTERTextBox" runat="server" Text='<%# Bind("RUNNING_SEMESTER") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                STUDENT_ID:
                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' />
                <br />
                PERSON_ID:<br />
                <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="Person" DataTextField="PERSON_NAME" DataValueField="PERSON_ID" SelectedValue='<%# Bind("PERSON_ID") %>'>
                </asp:DropDownList>
                <br />
                RUNNING_SEMESTER: <br />
                <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="Semester" DataTextField="SEMESTER" DataValueField="SEMESTER" SelectedValue='<%# Bind("RUNNING_SEMESTER") %>'>
                </asp:DropDownList>
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                PERSON_ID:
                <asp:Label ID="PERSON_IDLabel" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                <br />
                RUNNING_SEMESTER:
                <asp:Label ID="RUNNING_SEMESTERLabel" runat="server" Text='<%# Bind("RUNNING_SEMESTER") %>' />
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
    </form>
</body>
</html>

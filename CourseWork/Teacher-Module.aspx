<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher-Module.aspx.cs" Inherits="CourseWork.Teacher_Module" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher-Module | Advanced Database Coursework | Samit Paudel</title>
    <link rel="stylesheet" href="CSS/style.css" />
    <link rel="stylesheet" href="CSS/student_form.css" />
</head>
<body>
    <h1 class="page-title">Teacher-Module Details</h1>
    <h3 class="form-header">Links to Other Forms</h3>
    <div class="navbar">
        <p class="nav-element"><a href="Dashboard.aspx">Home</a></p>
        <p class="nav-element"><a href="Teacher Form.aspx">Teacher Form</a></p>
        <p class="nav-element"><a href="Address Form.aspx">Address Form</a></p>
        <p class="nav-element"><a href="Module Form.aspx">Module Form</a></p>
        <p class="nav-element"><a href="Student Form.aspx">Student Form</a></p>
        <p class="nav-element"><a href="Student-Fee.aspx">Student-Fee Details</a></p>
        <p class="nav-element"><a href="Student-Result.aspx">Student-Result Details</a></p>
    </div>
    <h3 class="form-header">Teacher-Module Details</h3>
    <p class="instructions">Select Teacher Name:</p>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="PERSON_NAME" DataValueField="PERSON_NAME" AutoPostBack="True" CssClass="dropdown">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TEACHER&quot;.&quot;TEACHER_ID&quot;, &quot;PERSON&quot;.&quot;PERSON_NAME&quot;
FROM &quot;TEACHER&quot;
JOIN &quot;PERSON&quot;
ON &quot;TEACHER&quot;.&quot;PERSON_ID&quot;=&quot;PERSON&quot;.&quot;PERSON_ID&quot;"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TEACHER_ID,ADDRESS_ID,MODULE_CODE" DataSourceID="SqlDataSource1" CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="TEACHER_ID" HeaderText="TEACHER_ID" ReadOnly="True" SortExpression="TEACHER_ID" />
                    <asp:BoundField DataField="PERSON_NAME" HeaderText="PERSON_NAME" SortExpression="PERSON_NAME" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                    <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" ReadOnly="True" SortExpression="MODULE_CODE" />
                    <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TEACHER&quot;.&quot;TEACHER_ID&quot;, &quot;PERSON&quot;.&quot;PERSON_NAME&quot;, &quot;PERSON&quot;.&quot;email&quot;, &quot;ADDRESS&quot;.&quot;ADDRESS_ID&quot;, &quot;MODULE&quot;.&quot;MODULE_CODE&quot;, &quot;MODULE&quot;.&quot;MODULE_NAME&quot;
FROM &quot;TEACHER&quot;
JOIN &quot;PERSON&quot;
ON &quot;TEACHER&quot;.&quot;PERSON_ID&quot;=&quot;PERSON&quot;.&quot;PERSON_ID&quot;
JOIN &quot;TEACHER_MODULE&quot;
ON &quot;TEACHER_MODULE&quot;.&quot;TEACHER_ID&quot;=&quot;TEACHER&quot;.&quot;TEACHER_ID&quot;
JOIN &quot;MODULE&quot;
ON &quot;TEACHER_MODULE&quot;.&quot;MODULE_CODE&quot;=&quot;MODULE&quot;.&quot;MODULE_CODE&quot;
JOIN &quot;ADDRESS&quot;
ON &quot;ADDRESS&quot;.&quot;ADDRESS_ID&quot;=&quot;PERSON&quot;.&quot;ADDRESS&quot; 
WHERE (&quot;PERSON&quot;.&quot;PERSON_NAME&quot;=:PERSON_NAME)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PERSON_NAME" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

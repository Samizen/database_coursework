<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student-Result.aspx.cs" Inherits="CourseWork.Student_Result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student-Result | Advanced Database Coursework | Samit Paudel</title>
    <link rel="stylesheet" href="CSS/style.css" />
    <link rel="stylesheet" href="CSS/student_form.css" />
    <link rel="stylesheet" href="CSS/result.css" />
</head>
<body>
    <h1 class="page-title">Student-Result Details</h1>
    <h3 class="form-header">Links to Other Forms</h3>
    <div class="navbar">
        <p class="nav-element"><a href="Dashboard.aspx">Home</a></p>
        <p class="nav-element"><a href="Teacher Form.aspx">Teacher Form</a></p>
        <p class="nav-element"><a href="Address Form.aspx">Address Form</a></p>
        <p class="nav-element"><a href="Module Form.aspx">Module Form</a></p>
        <p class="nav-element"><a href="Student Form.aspx">Student Form</a></p>
        <p class="nav-element"><a href="Teacher-Module.aspx">Teacher-Module Details</a></p>
        <p class="nav-element"><a href="Student-Fee.aspx">Student-Fee Details</a></p>
    </div>
    <h3 class="form-header">Student-Result Details</h3>
    <p class="instructions">Select Student Name:</p>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PERSON_NAME" DataValueField="PERSON_NAME" CssClass="dropdown">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT&quot;.&quot;STUDENT_ID&quot;, &quot;PERSON&quot;.&quot;PERSON_NAME&quot;
FROM &quot;STUDENT&quot;
JOIN &quot;PERSON&quot; 
ON &quot;STUDENT&quot;.&quot;PERSON_ID&quot;=&quot;PERSON&quot;.&quot;PERSON_ID&quot;"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,MODULE_CODE,ASSIGNMENT_TYPE" DataSourceID="SqlDataSource1" CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="PERSON_NAME" HeaderText="PERSON_NAME" SortExpression="PERSON_NAME" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                    <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" ReadOnly="True" SortExpression="MODULE_CODE" />
                    <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
                    <asp:BoundField DataField="ASSIGNMENT_TYPE" HeaderText="ASSIGNMENT_TYPE" ReadOnly="True" SortExpression="ASSIGNMENT_TYPE" />
                    <asp:BoundField DataField="GRADE" HeaderText="GRADE" SortExpression="GRADE" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;RESULT&quot;.&quot;STUDENT_ID&quot;, &quot;PERSON&quot;.&quot;PERSON_NAME&quot;, &quot;PERSON&quot;.&quot;email&quot;, &quot;ADDRESS&quot;.&quot;ADDRESS&quot;, &quot;RESULT&quot;.&quot;MODULE_CODE&quot;, &quot;MODULE&quot;.&quot;MODULE_NAME&quot;, &quot;RESULT&quot;.&quot;ASSIGNMENT_TYPE&quot;, &quot;RESULT&quot;.&quot;GRADE&quot;, &quot;STATUS&quot;.&quot;STATUS&quot;
FROM &quot;RESULT&quot;
JOIN &quot;STUDENT&quot;
ON &quot;RESULT&quot;.&quot;STUDENT_ID&quot;=&quot;STUDENT&quot;.&quot;STUDENT_ID&quot;
JOIN &quot;PERSON&quot;
ON &quot;STUDENT&quot;.&quot;PERSON_ID&quot;=&quot;PERSON&quot;.&quot;PERSON_ID&quot;
JOIN &quot;ADDRESS&quot;
ON &quot;PERSON&quot;.&quot;ADDRESS&quot;=&quot;ADDRESS&quot;.&quot;ADDRESS_ID&quot;
JOIN &quot;MODULE&quot;
ON &quot;RESULT&quot;.&quot;MODULE_CODE&quot;=&quot;MODULE&quot;.&quot;MODULE_CODE&quot;
JOIN &quot;STATUS&quot;
ON &quot;RESULT&quot;.&quot;GRADE&quot;=&quot;STATUS&quot;.&quot;GRADE&quot;
WHERE (&quot;PERSON&quot;.&quot;PERSON_NAME&quot;=:PERSON_NAME)
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PERSON_NAME" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student-Fee.aspx.cs" Inherits="CourseWork.Student_Fee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student-Fee | Advanced Database Coursework | Samit Paudel</title>
    <link rel="stylesheet" href="CSS/style.css" />
    <link rel="stylesheet" href="CSS/student_form.css" />
</head>
<body>
    <h1 class="page-title">Student Fee Details</h1>
    <h3 class="form-header">Links to Other Forms</h3>
    <div class="navbar">
        <p class="nav-element"><a href="Dashboard.aspx">Home</a></p>
        <p class="nav-element"><a href="Teacher Form.aspx">Teacher Form</a></p>
        <p class="nav-element"><a href="Address Form.aspx">Address Form</a></p>
        <p class="nav-element"><a href="Module Form.aspx">Module Form</a></p>
        <p class="nav-element"><a href="Student Form.aspx">Student Form</a></p>
        <p class="nav-element"><a href="Teacher-Module.aspx">Teacher-Module Details</a></p>
        <p class="nav-element"><a href="Student-Result.aspx">Student-Result Details</a></p>
    </div>
    <h3 class="form-header">Student-Fee Details</h3>
    <p class="instructions">Select Student Name:</p>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PERSON_NAME" DataValueField="PERSON_NAME" CssClass="dropdown">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT&quot;.&quot;STUDENT_ID&quot;, &quot;PERSON&quot;.&quot;PERSON_NAME&quot;
FROM &quot;STUDENT&quot;
JOIN &quot;PERSON&quot; 
ON &quot;STUDENT&quot;.&quot;PERSON_ID&quot;=&quot;PERSON&quot;.&quot;PERSON_ID&quot;"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,SEMESTER" DataSourceID="SqlDataSource1" CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="PERSON_NAME" HeaderText="PERSON_NAME" SortExpression="PERSON_NAME" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                    <asp:BoundField DataField="SEMESTER" HeaderText="SEMESTER" ReadOnly="True" SortExpression="SEMESTER" />
                    <asp:BoundField DataField="FEE_TOTAL" HeaderText="FEE_TOTAL" SortExpression="FEE_TOTAL" />
                    <asp:BoundField DataField="PAID_DATE" HeaderText="PAID_DATE" SortExpression="PAID_DATE" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_FEE&quot;.&quot;STUDENT_ID&quot;, &quot;PERSON&quot;.&quot;PERSON_NAME&quot;, &quot;PERSON&quot;.&quot;email&quot;, &quot;ADDRESS&quot;.&quot;ADDRESS&quot;, &quot;STUDENT_FEE&quot;.&quot;SEMESTER&quot;, &quot;FEE&quot;.&quot;FEE_TOTAL&quot;, &quot;STUDENT_FEE&quot;.&quot;PAID_DATE&quot;
        FROM &quot;STUDENT_FEE&quot;
        JOIN &quot;STUDENT&quot;
        ON &quot;STUDENT_FEE&quot;.&quot;STUDENT_ID&quot;=&quot;STUDENT&quot;.&quot;STUDENT_ID&quot;
        JOIN &quot;PERSON&quot;
        ON &quot;STUDENT&quot;.&quot;PERSON_ID&quot;=&quot;PERSON&quot;.&quot;PERSON_ID&quot;
        JOIN &quot;ADDRESS&quot;
        ON &quot;PERSON&quot;.&quot;ADDRESS&quot;=&quot;ADDRESS&quot;.&quot;ADDRESS_ID&quot;
        JOIN &quot;FEE&quot;
        ON &quot;STUDENT_FEE&quot;.&quot;SEMESTER&quot;=&quot;FEE&quot;.&quot;SEMESTER&quot;
        WHERE (&quot;PERSON&quot;.&quot;PERSON_NAME&quot;=:PERSON_NAME)
        ORDER BY &quot;STUDENT&quot;.&quot;STUDENT_ID&quot;, &quot;STUDENT_FEE&quot;.&quot;SEMESTER&quot;">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PERSON_NAME" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p class="warning">Unpaid fees will be denoted by a blank date entry in the table.</p>
    </form>
</body>
</html>

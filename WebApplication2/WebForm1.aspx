<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-8">
            <table class="table">
                <tr>
                    <th>First Name</th>
                    <td> <asp:TextBox runat="server" ID="txtfname"
                        CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>First Name</th>
                    <td> <asp:TextBox runat="server" ID="txtlname"
                        CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>Age</th>
                    <td> <asp:TextBox runat="server" ID="txtage"
                        CssClass="form-control"></asp:TextBox></td>
                </tr>
                
                <tr>
                    <th>Salary</th>
                    <td> <asp:TextBox runat="server" ID="txtsalary"
                        CssClass="form-control"></asp:TextBox></td>
                </tr>
               <tr>
                   <td>
                       <asp:Button runat="server" ID="btnsubmit" Text="Submit"
                           CssClass="btn btn-success" OnClick="btnsubmit_Click" />
                   </td>
               </tr>
                <tr>
                  
                       <td> <asp:Button  runat="server" ID="btncancel"  Text ="Cancel"
                           CssClass="btn btn-danger"/></td>

                   
               </tr>
                <asp:Label runat="server" ID="lblmsg"></asp:Label>
              
            </table>
            <div class="col-md-offset-2" "col-md-offset-2"> 
                <asp:GridView ID="empgrid" runat="server"  CssClass="table"
                    OnRowDeleting="empgrid_RowDeleting"
                    OnRowEditing="empgrid_RowEditing"
                    OnRowUpdating="empgrid_RowUpdating"
                    OnRowCancelingEdit="empgrid_RowCancelingEdit"
                    
                    DataKeyNames="Empid"
                    AutoGenerateColumns="false">
                    <Columns>
                         <asp:BoundField HeaderText="Employee Id" DataField="Empid"  ReadOnly="true"/>
                       <asp:TemplateField HeaderText="FirstName">
                           <ItemTemplate>
                               <asp:Label runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox  ID="txtfname" runat="server" 
                                   Text='<%# Bind("FirstName") %>'></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>
                          <asp:TemplateField HeaderText="LastName">
                           <ItemTemplate>
                               <asp:Label runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="txtlname" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>
                          <asp:TemplateField HeaderText="Age">
                           <ItemTemplate>
                               <asp:Label  runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="txtage" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>
                          <asp:TemplateField HeaderText="Salary">
                           <ItemTemplate>
                               <asp:Label runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox  ID="txtsalary"  runat="server" Text='<%# Bind("Salary") %>'></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>
                            
                         

                        <asp:CommandField ShowDeleteButton="true"
                            ControlStyle-CssClass="btn btn-danger" HeaderText="Remove Record"/>
                         <asp:CommandField ShowEditButton="true"
                            ControlStyle-CssClass="btn btn-primary" HeaderText="Edite Record"/>
                    </Columns>
                   
                   
                </asp:GridView>
            
        </div>
    </form>
</body>
</html>




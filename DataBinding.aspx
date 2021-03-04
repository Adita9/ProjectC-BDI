<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBinding.aspx.cs" Inherits="NeagoeAdrianProiect.DataBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Istoric Masini pe baza Inspectiilor Tehnice Periorice</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="Masini">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                        </td>
                        <td>
                            <asp:Label ID="An_FabricatieLabel" runat="server" Text='<%# Eval("An_Fabricatie") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CombustibilLabel" runat="server" Text='<%# Eval("Combustibil") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="MarcaTextBox" runat="server" Text='<%# Bind("Marca") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="An_FabricatieTextBox" runat="server" Text='<%# Bind("An_Fabricatie") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CombustibilTextBox" runat="server" Text='<%# Bind("Combustibil") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;" runat="server">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="MarcaTextBox" runat="server" Text='<%# Bind("Marca") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="An_FabricatieTextBox" runat="server" Text='<%# Bind("An_Fabricatie") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CombustibilTextBox" runat="server" Text='<%# Bind("Combustibil") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                        </td>
                        <td>
                            <asp:Label ID="An_FabricatieLabel" runat="server" Text='<%# Eval("An_Fabricatie") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CombustibilLabel" runat="server" Text='<%# Eval("Combustibil") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">Id</th>
                                        <th runat="server">Marca</th>
                                        <th runat="server">Model</th>
                                        <th runat="server">An_Fabricatie</th>
                                        <th runat="server">Combustibil</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                        </td>
                        <td>
                            <asp:Label ID="An_FabricatieLabel" runat="server" Text='<%# Eval("An_Fabricatie") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CombustibilLabel" runat="server" Text='<%# Eval("Combustibil") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:DropDownList ID="dp_Masini" runat="server" AutoPostBack="True" DataSourceID="Masini" DataTextField="Id" DataValueField="Id" OnPreRender="dp_Masini_PreRender" OnSelectedIndexChanged="dp_Masini_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Masini" runat="server" ConnectionString="<%$ ConnectionStrings:masini_itpConnectionString %>" SelectCommand="SELECT * FROM [Masini]"></asp:SqlDataSource>
          
            <asp:TextBox ID="tb_DisplayMasina" runat="server" Height="138px" Width="905px"></asp:TextBox>
            <br />
          
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ITP2" style="margin-right: 44px" Width="414px" DataKeyNames="Id">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                    <asp:BoundField DataField="Descriere" HeaderText="Descriere" SortExpression="Descriere" />
                    <asp:BoundField DataField="Proprietar" HeaderText="Proprietar" SortExpression="Proprietar" />
                    <asp:BoundField DataField="Km" HeaderText="Km" SortExpression="Km" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="ITP2" runat="server" ConnectionString="<%$ ConnectionStrings:masini_itpConnectionString %>" SelectCommand="SELECT * FROM [ITP]" UpdateCommand="UPDATE ITP SET Data=@Data,Descriere=@Descriere,Proprietar=@Proprietar,Km=@Km WHERE Id=@Id"
                DeleteCommand="DELETE FROM ITP WHERE Id=@Id;" InsertCommand="INSERT INTO ITP(Id, Data, Descriere, Proprietar, Km) VALUES (,,,,)"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Text="Id ITP"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masini_itpConnectionString %>" InsertCommand="INSERT INTO Masini_ITP(Id, Id_Masina, Id_ITP) VALUES (,,)" SelectCommand="SELECT * FROM [Masini_ITP]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="ID Masina"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Data"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" Text="Descriere"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server" Text="Proprietar"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server" Text="Km"></asp:Label>
            <br />
            <asp:TextBox ID="tb_IdITP" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:TextBox ID="tb_IdMasina" runat="server"></asp:TextBox>
            <asp:TextBox ID="tb_Data" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
            <asp:TextBox ID="tb_Descriere" runat="server"></asp:TextBox>
            <asp:TextBox ID="tb_Proprietar" runat="server"></asp:TextBox>
            <asp:TextBox ID="tb_Km" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" />
            <br />
            <asp:TextBox ID="tb_Consola" runat="server" Height="261px" Width="797px"></asp:TextBox>
            <br />
        </div>
    </form>
</body>
</html>

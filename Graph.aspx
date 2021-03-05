<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Graph.aspx.cs" Inherits="NeagoeAdrianProiect.Graph" %>

<%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <cc1:ZedGraphWeb ID="ZedGraphWeb1" runat="server" Height="800" IsFontsScaled="True" OnPreRender="ZedGraphWeb1_PreRender" OnRenderGraph="ZedGraphWeb1_RenderGraph" Width="800">
        </cc1:ZedGraphWeb>
        <p>
            <asp:Button ID="btn_Back" runat="server" OnClick="btn_Back_Click" Text="Back" />
        </p>
    </form>
</body>
</html>

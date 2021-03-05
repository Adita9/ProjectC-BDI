using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZedGraph;


namespace NeagoeAdrianProiect
{
    public partial class Graph : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ZedGraphWeb1_PreRender(object sender, EventArgs e)
        {

        }

        protected void ZedGraphWeb1_RenderGraph(ZedGraph.Web.ZedGraphWeb webObject, System.Drawing.Graphics g, ZedGraph.MasterPane pane)
        {

            String masina = (String)Cache["CacheMasini"];
            DataSet dataSetITP = (DataSet)Cache["CacheITP"];
            DataSet dataSetMasini_ITP = (DataSet)Cache["CacheMasini_ITP"];




            GraphPane myPane = pane[0];
            myPane.Title.Text = "";
            myPane.XAxis.Title.Text = "Proprietar"; myPane.YAxis.Title.Text = "KM";
            Color[] colors = {
                             Color.Red, Color.Yellow, Color.Green, Color.Blue,
                             Color.Purple,Color.Pink,Color.Plum,Color.Silver, Color.Salmon
                         };
            double media;
            if (Request.QueryString["tip"] != null)
            {
                List<string> listaX = new List<string>();
                List<double> listaY = new List<double>();
                PointPairList list = new PointPairList();
                int i = 0;

                List<int> listaITPPentruMasina = new List<int>();
                foreach (DataRow r in dataSetMasini_ITP.Tables[0].Rows)
                {
                    if ((int)r[1] == int.Parse(masina))
                    {
                        listaITPPentruMasina.Add((int)r[2]);
                    }

                }

                foreach (int id in listaITPPentruMasina)
                {

                    foreach (DataRow r in dataSetITP.Tables[0].Rows)
                    {
                        if (id == (int)r[0])
                        {

                            string v = r[3].ToString();

                            string v2 = r[4].ToString();
                            listaX.Add(r[3].ToString());
                            listaY.Add(double.Parse((r[4].ToString())));
                            list.Add(0,double.Parse((r[4].ToString())));
                        }

                    }
                }
               
         

                switch (Request.QueryString["tip"])
                {
                    case "Bare":
                        {
                            BarItem myCurve = myPane.AddBar("Curve 2", list, Color.Blue);
                            myCurve.Bar.Fill = new Fill(colors);
                            myCurve.Bar.Fill.Type = FillType.GradientByZ;
                            myCurve.Bar.Fill.RangeMin = 0;
                            myCurve.Bar.Fill.RangeMax = list.Count;
                            myPane.XAxis.Type = AxisType.Text;
                            myPane.XAxis.Scale.TextLabels = listaX.ToArray();
                            myPane.XAxis.Scale.FontSpec.Angle = 90;
                            myPane.XAxis.Scale.FontSpec.Size = 10;
                            myPane.YAxis.Scale.FontSpec.Size = 10;
                            //zedGraphControl1.AxisChange();


                            media = (double)listaY.Average();
                            // = media;
                            // myPane.YAxis.MajorGrid.Equals(10);
                            var yScale = myPane.YAxis.Scale;
                         
                            double yMin = yScale.Min;
                            double yMax = yScale.Max;
                            var line = new LineObj(media, 50000.00, media, 10000.000) { IsClippedToChartRect = true };
                            line.Line.Color = Color.DarkGreen;
                            myPane.GraphObjList.Add(line);
                            break;

                        }

                    case "Bare3D": break;
                    case "Pie3D": break;
                    case "Linie":
                        {
                            LineItem curve = myPane.AddCurve("Spline", list, Color.Red, SymbolType.Diamond);
                            curve.Line.IsSmooth = true;
                            curve.Line.SmoothTension = 0.5F;
                            curve.Line.Width = 2;

                            curve = myPane.AddCurve("Dreapta", list, Color.Blue, SymbolType.Diamond);
                            curve.Line.IsSmooth = false;
                            curve.Line.Width = 2;
                            curve.Symbol.Size = 5;

                            curve = myPane.AddCurve("ForwardStep", list, Color.Black, SymbolType.Diamond);
                            curve.Line.StepType = StepType.ForwardStep;
                            curve.Line.Width = 2;
                            curve.Symbol.Size = 5;

                            curve.Symbol.Fill = new Fill(Color.White);
                            curve.Symbol.Size = 10;

                            myPane.XAxis.Scale.TextLabels = listaX.ToArray();
                            myPane.XAxis.Type = AxisType.Text;
                            myPane.XAxis.Scale.FontSpec.Size = 10;
                            myPane.XAxis.Scale.FontSpec.Angle = 90;
                            myPane.YAxis.Scale.FontSpec.Size = 10;
                            break;
                        }
                    case "Pie":
                        {
                            i = 0;


                            foreach (int id in listaITPPentruMasina)
                            {
                                foreach (DataRow r in dataSetITP.Tables[0].Rows)
                                {
                                    if (id == (int)r[0])
                                    {

                                        PieItem segment1 = myPane.AddPieSlice((double.Parse(r[4].ToString())),
                                            colors[(i++) % colors.Length], 
                                            Color.White, 45f, (i % 2 == 0) ? 0.2 : 0, r[3].ToString());
                                    }
                                    }
                            }
                            break;
                        }


                }
            }
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("DataBinding.aspx");
        }
    }
    
}
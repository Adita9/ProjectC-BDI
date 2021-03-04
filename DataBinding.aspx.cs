using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

namespace NeagoeAdrianProiect
{
    public partial class DataBinding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlParameter p1 = new SqlParameter("@ID_ITP", System.Data.SqlDbType.Int);
            SqlParameter p2 = new SqlParameter("@ID_Masina", System.Data.SqlDbType.Int);
            SqlParameter p3 = new SqlParameter("@Data", System.Data.SqlDbType.DateTime);
            SqlParameter p4 = new SqlParameter("@Descriere", System.Data.SqlDbType.VarChar);
            SqlParameter p5 = new SqlParameter("@Proprietar", System.Data.SqlDbType.VarChar);
            SqlParameter p6 = new SqlParameter("@Km", System.Data.SqlDbType.Int);

            SqlParameter p7 = new SqlParameter("@ID_ITP", System.Data.SqlDbType.Int);
            SqlParameter p8 = new SqlParameter("@ID_Masina", System.Data.SqlDbType.Int);
            SqlParameter p9 = new SqlParameter("@ID_ITP", System.Data.SqlDbType.Int);

            p1.Value = int.Parse(tb_IdITP.Text);
            p2.Value = int.Parse(tb_IdMasina.Text);
            p3.Value = tb_Data.Text;
            p4.Value = tb_Descriere.Text;
            p5.Value = (tb_Proprietar.Text);
            p6.Value =int.Parse(tb_Km.Text);


            p7.Value = int.Parse(tb_IdITP.Text);
            p8.Value = int.Parse(tb_IdMasina.Text);
            p9.Value = int.Parse(tb_IdITP.Text);

            string strInsertITP = @"INSERT INTO[ITP]([ID], [Data], [Descriere], [Proprietar], [Km]) VALUES(@ID_ITP, @Data, @Descriere, @Proprietar, @Km)";
            SqlConnection myCon1 = new SqlConnection(@"Data Source=DESKTOP-746A5F2\LOCALHOST;Initial Catalog=masini_itp;Integrated Security=True;Pooling=False");
            SqlCommand myCMD1 = new SqlCommand(strInsertITP, myCon1);

            myCMD1.Parameters.Add(p1);
            myCMD1.Parameters.Add(p2);
            myCMD1.Parameters.Add(p3);
            myCMD1.Parameters.Add(p4);
            myCMD1.Parameters.Add(p5);
            myCMD1.Parameters.Add(p6);
            try
            {
                myCon1.Open();
                myCMD1.ExecuteNonQuery();
                tb_Consola.Text += "\r\nInsert ok.";
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                tb_Consola.Text += "\r\nInsert esuat: " + ex.Message;
            }
            finally { myCon1.Close(); }


            string strInsertMasini_ITP = @"INSERT INTO Masini_ITP([Id], [Id_Masina], [Id_ITP]) VALUES (@ID_ITP,@ID_Masina,@ID_ITP)";
            SqlConnection myCon2 = new SqlConnection(@"Data Source=DESKTOP-746A5F2\LOCALHOST;Initial Catalog=masini_itp;Integrated Security=True;Pooling=False");
            SqlCommand myCMD2 = new SqlCommand(strInsertMasini_ITP, myCon2);
            myCMD2.Parameters.Add(p7);
            myCMD2.Parameters.Add(p8);

            try
            {
                myCon2.Open();
                myCMD2.ExecuteNonQuery();
                tb_Consola.Text += "\r\nInsert in tabela de legatura ok.";
               
            }
            catch (Exception ex)
            {
                tb_Consola.Text += "\r\nInsert in tabela de legatura esuat: " + ex.Message;
            }
            finally { myCon2.Close(); }


        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }



        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
        }
        protected void dp_Masini_SelectedIndexChanged(object sender, EventArgs e)
        {

            tb_DisplayMasina.Text = "";
            SqlConnection myCon2 = new SqlConnection(@"Data Source=DESKTOP-746A5F2\LOCALHOST;Initial Catalog=masini_itp;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true");

            string query = "SELECT * FROM Masini_ITP WHERE Id_Masina = " +dp_Masini.Text;

            SqlCommand myCMD2 = new SqlCommand(query, myCon2);
            


            var list = new ArrayList();
            try
            {
                myCon2.Open();
                myCMD2.ExecuteNonQuery();
                var reader = myCMD2.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string data1 = (reader.GetInt32(0)).ToString();
                        string data2 = (reader.GetInt32(1)).ToString();
                        string data3 = (reader.GetInt32(2)).ToString();
                        list.Add(data1);
                    } 
                }
               

                reader.Close();
                myCon2.Close();

            }
            catch (Exception ex)
            {
                tb_DisplayMasina.Text += "\r\nNu a mers afisarea: " + ex.Message;
            }
            finally { myCon2.Close(); }



            try {
                myCon2.Open();

                foreach(string indice in list){

                    string query2= "SELECT * FROM ITP WHERE Id= " + indice;

                    SqlCommand myCMD3 = new SqlCommand(query2, myCon2);

                    var reader = myCMD3.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            string data1 = (reader.GetInt32(0)).ToString();
                         
                            DateTime data2 = reader.GetDateTime(1);
                            string data3 = (reader.GetString(2)).ToString();
                           string data4 = (reader.GetString(3)).ToString();
                            string data5 = (reader.GetDecimal(4)).ToString();

                            tb_DisplayMasina.Text += "\r\n ITP realizat la data de" + data2.ToString()
                               + "\r\n cu descrierea - " + data3.ToString()
                               + "\r\n proprietarul - " + data4
                               + "\r\n si km -" + data5;

                        }

                    }
                    myCMD3.Cancel();

                     
                }


            }
            catch (Exception ex)
            {
                tb_DisplayMasina.Text += "\r\nNu a mers afisarea: " + ex.Message;
            }
            finally { myCon2.Close(); }


        }

        protected void dp_Masini_PreRender(object sender, EventArgs e)
        {

        }
    }
}
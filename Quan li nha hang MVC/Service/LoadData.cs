using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using Quan_li_nha_hang_MVC.Models;
using System.Web.Mvc;

namespace Quan_li_nha_hang_MVC.Service
{
    public class LoadData
    {
        private static LoadData instance;

        public String sqlString = @"Data Source=.\sqlexpress;Initial Catalog=DoAnQuanLiNH;Integrated Security=True;Integrated Security=True";

        public static LoadData Instance
        {
            get { if (instance == null) instance = new LoadData(); return instance; }
            private set { instance = value; }
        }


       
        public DataTable ExcuteQuery(String query)
        {
            DataTable data = new DataTable();
            using (SqlConnection connection = new SqlConnection(sqlString))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(query, connection);
               
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                adapter.Fill(data);

                connection.Close();
            }
            return data;
        }

        public int ExcuteNoneQuery(String query)
        {
            int data = 0;
            using (SqlConnection connection = new SqlConnection(sqlString))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(query, connection);
                
                data = sqlCommand.ExecuteNonQuery();

                connection.Close();
            }
            return data;
        }
        public object ExcuteScalar(string query)
        {
            object data = new object();
            using (SqlConnection connection = new SqlConnection(sqlString))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(query, connection);
                data = sqlCommand.ExecuteScalar();

                connection.Close();
            }
            return data;

        }

        public SqlDataAdapter ExportReport(string query)
        {
            SqlDataAdapter adapter;
            using (SqlConnection connection = new SqlConnection(sqlString))
            {
                connection.Open();
                adapter = new SqlDataAdapter(query, connection);
                connection.Close();
            }
            return adapter;
        }
       
    }
}

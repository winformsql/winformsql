using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNV.DAO
{
    class DataProvider
    {
        private static DataProvider instance;//đóng gói ctrl+r+e
        

        public static DataProvider Instance
        {
            get
            {
                if (instance == null)
                    instance = new DataProvider();
                return DataProvider.instance;
            }
            private set
            {
                DataProvider.instance = value;
            }
        }
        private DataProvider() { }

        private string connectionSTR = "Data Source=.\\sqlexpress;Initial Catalog=QLNV;Integrated Security=True";//chuỗi thể hiện database mình sẽ kết nối
        public DataTable ExcuteQuery (string query,object[] pararmater = null)
        {
            DataTable data = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionSTR))//kết nối server//kết thúc khối lệnh các biến sẽ được giải phóng
            {

                connection.Open();//mở kết nối
                SqlCommand command = new SqlCommand(query, connection);//câu truy vấn được thực thi
                if(pararmater!=null)//nếu paramater khác rỗng có câu lệnh proc
                {
                    string[] listpara = query.Split(' ');//tách câu query theo dấu cách
                    int i=0;
                    foreach(string item in listpara)//lấy từng phần tử đã tách
                    {
                        if(item.Contains('@'))//nếu có dấu @
                        {
                            command.Parameters.AddWithValue(item, pararmater[i]);//thêm paramater thứ i vào lẹnh command
                            i++;
                        }
                    }
                }
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);//trung gian lấy dữ liệu
                dataAdapter.Fill(data);
                connection.Close();//đóng kết nối
            }
            return data;
        }

        public int ExcuteNoneQuery(string query, object[] pararmater = null)//trả về số dòng thực hiện được
        {
            int data = 0;

            using (SqlConnection connection = new SqlConnection(connectionSTR))//kết nối server//kết thúc khối lệnh các biến sẽ được giải phóng
            {

                connection.Open();//mở kết nối
                SqlCommand command = new SqlCommand(query, connection);//câu truy vấn được thực thi
                if (pararmater != null)//nếu paramater khác rỗng có câu lệnh proc
                {
                    string[] listpara = query.Split(' ');//tách câu query theo dấu cách
                    int i = 0;
                    foreach (string item in listpara)//lấy từng phần tử đã tách
                    {
                        if (item.Contains('@'))//nếu có dấu @
                        {
                            command.Parameters.AddWithValue(item, pararmater[i]);//thêm paramater thứ i vào lẹnh command
                            i++;
                        }
                    }
                }
                //SqlDataAdapter dataAdapter = new SqlDataAdapter(command);//trung gian lấy dữ liệu
                data = command.ExecuteNonQuery();
                connection.Close();//đóng kết nối
            }
            return data;
        }

        public object ExcuteScalar(string query, object[] pararmater = null)//trả về ô đầu tiên trong bảng
        {
            object data = 0;

            using (SqlConnection connection = new SqlConnection(connectionSTR))//kết nối server//kết thúc khối lệnh các biến sẽ được giải phóng
            {

                connection.Open();//mở kết nối
                SqlCommand command = new SqlCommand(query, connection);//câu truy vấn được thực thi
                if (pararmater != null)//nếu paramater khác rỗng có câu lệnh proc
                {
                    string[] listpara = query.Split(' ');//tách câu query theo dấu cách
                    int i = 0;
                    foreach (string item in listpara)//lấy từng phần tử đã tách
                    {
                        if (item.Contains('@'))//nếu có dấu @
                        {
                            command.Parameters.AddWithValue(item, pararmater[i]);//thêm paramater thứ i vào lẹnh command
                            i++;
                        }
                    }
                }
               // SqlDataAdapter dataAdapter = new SqlDataAdapter(command);//trung gian lấy dữ liệu
                data = command.ExecuteScalar();
                connection.Close();//đóng kết nối
            }
            return data;
        }
    }
}

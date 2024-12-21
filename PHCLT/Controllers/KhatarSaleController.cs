using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PHCLT.Models;
using System.Data;
using Newtonsoft.Json;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace PHCLT.Controllers
{
    public class KhatarSaleController : Controller
    {
        // GET: KhatarSale
        ClsSystem ob = new ClsSystem();
        public ActionResult Index(string saltype)
        {
            ViewBag.saltype = saltype;
            return View();
        }
        public ActionResult Indexfrom()
        {
            return View();
        }
        public class Resultpass<T>
        {
            public bool opstatus { get; set; }
            public string opmessage { get; set; }
        }
        public class Product
        {
            public string ItemName { get; set; } // Corresponds to the 'itemName' from the table
            public string Qty { get; set; }      // Corresponds to the 'qty' from the table
        }
        [HttpPost]
        public JsonResult Addsale(string type, string mname, string mmobileno, string mvillagename, string paymentType, string membership, string products)
        {
            Resultpass<object> result = new Resultpass<object>();
            List<Product> productList = JsonConvert.DeserializeObject<List<Product>>(products);
            try
            {
                var dono = ob.FindOneString("select isnull(max(Billid),0)+1 as Billid from billmain");
                int mtype = 0;
                if (membership == "Yes")
                {
                    mtype = 1;
                }
                foreach (var product in productList)
                {
                    ob.excute("Insert Into billmain(Billid, mname, Bmobileno, billtype, ismember, Mvillagename, Witemname, Wqty, isn, isbill,depttype) values(" + dono + ",N'" + mname + "','" + mmobileno + "','" + paymentType + "'," + mtype + ",N'" + mvillagename + "',N'" + product.ItemName + "'," + product.Qty + ",0,0,'" + type + "')");
                }

                result.opstatus = true;
                result.opmessage = dono;
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [HttpPost]
        public JsonResult Addsalefrom(FormCollection formData)
        {
            try
            {
                Resultpass<object> result = new Resultpass<object>();

                // Get the uploaded file
                var profilePhoto = Request.Files["profilePhoto"];
                string fileExtension = System.IO.Path.GetExtension(profilePhoto.FileName).ToLower();
                var mname = Request.Form["mname"];
                var Bmobileno = Request.Form["Bmobileno"];
                var billtype = Request.Form["billtype"];
                var ismember = Request.Form["ismember"];
                var Mvillagename = Request.Form["Mvillagename"];
                int mtype = 0;
                if (ismember == "Yes")
                {
                    mtype = 1;
                }
                var dono = ob.FindOneString("SELECT ISNULL(MAX(Billid), 0) + 1 AS Billid FROM billmain");

                if (profilePhoto != null && profilePhoto.ContentLength > 0)
                {
                    using (var memoryStream = new MemoryStream())
                    {
                        profilePhoto.InputStream.CopyTo(memoryStream);
                        var imageData = memoryStream.ToArray();

                        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                        using (var connection = new SqlConnection(connectionString))
                        {
                            string query = "INSERT INTO billmain(Billid,ImageData, mname, Bmobileno, billtype, ismember, Mvillagename,isn,isbill,Witemname, Wqty,depttype,ftype) VALUES (@dono,@ImageData, @mname, @Bmobileno, @billtype, @ismember, @Mvillagename,@isn,@isbill,@a,@b,@c,@ftype)";

                            using (var command = new SqlCommand(query, connection))
                            {
                                command.Parameters.AddWithValue("@dono", dono);
                                command.Parameters.AddWithValue("@ImageData", imageData);
                                command.Parameters.AddWithValue("@mname", mname);
                                command.Parameters.AddWithValue("@Bmobileno", Bmobileno);
                                command.Parameters.AddWithValue("@billtype", billtype);
                                command.Parameters.AddWithValue("@ismember", mtype);
                                command.Parameters.AddWithValue("@Mvillagename", Mvillagename);
                                command.Parameters.AddWithValue("@isn", 0);
                                command.Parameters.AddWithValue("@isbill", 0);
                                command.Parameters.AddWithValue("@a", "Image");
                                command.Parameters.AddWithValue("@b", 0);
                                command.Parameters.AddWithValue("@c", "Image");
                                command.Parameters.AddWithValue("@ftype", fileExtension);
                                connection.Open();
                                command.ExecuteNonQuery();
                            }
                        }
                    }
                }

                result.opstatus = true;
                result.opmessage = dono;
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { error = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }



    }
}
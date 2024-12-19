using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PHCLT.Models;
using System.Data;
using Newtonsoft.Json;

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

    }
}
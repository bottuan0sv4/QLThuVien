using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QuanLiThuVien.Models.Entities;
namespace QuanLiThuVien.Models.ViewModel
{
    public class CartItemModel
    {
        public Sach sach { get; set; }
        public int Quantity { set; get; }
    }
    public class Cart
    {
        private List<CartItemModel> lineCollection = new List<CartItemModel>();

        public void AddItem(Sach sp, int quantity)
        {
            CartItemModel line = lineCollection
                .Where(p => p.sach.SachID == sp.SachID)
                .FirstOrDefault();

            if (line == null)
            {
                lineCollection.Add(new CartItemModel
                {
                    sach = sp,
                    Quantity = quantity
                });
            }
            else
            {
                line.Quantity += quantity;
                if (line.Quantity <= 0)
                {
                    lineCollection.RemoveAll(l => l.sach.SachID == sp.SachID);
                }
            }
        }
        public void RemoveLine(Sach sp)
        {
            lineCollection.RemoveAll(l => l.sach.SachID == sp.SachID);
        }
        public IEnumerable <CartItemModel> Lines
        {
            get { return lineCollection; }
        }

    }
}
using System.ComponentModel.DataAnnotations;

namespace AbarrotesInventory.Web.Models.Entities;

public class Purchase
{
    public int Id { get; set; }

    [Required]
    [MaxLength(50)]
    public string BillNumber { get; set; } = string.Empty;

    public DateTime PurchaseDate { get; set; } = DateTime.Now;

    public int SupplierId { get; set; }
    public Supplier Supplier { get; set; } = null!;

    public int UserId { get; set; }
    public User User { get; set; } = null!;

    [Range(0, double.MaxValue)]
    public decimal Total { get; set; }

    public ICollection<PurchaseDetail> PurchaseDetails { get; set; } = new List<PurchaseDetail>();
}

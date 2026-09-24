using System.ComponentModel.DataAnnotations;

namespace AbarrotesInventory.Web.Models.Entities;

public class Product
{
    public int Id { get; set; }

    [Required]
    [MaxLength(200)]
    public string Name { get; set; } = string.Empty;

    [MaxLength(100)]
    public string? Barcode { get; set; }

    [MaxLength(500)]
    public string? Description { get; set; }

    [Range(0, double.MaxValue)]
    public decimal CostPrice { get; set; }

    [Range(0, double.MaxValue)]
    public decimal SalePrice { get; set; }

    public int CategoryId { get; set; }
    public Category Category { get; set; } = null!;

    public int SupplierId { get; set; }
    public Supplier Supplier { get; set; } = null!;

    public bool IsActive { get; set; } = true;

    public Inventory? Inventory { get; set; }
    public ICollection<PurchaseDetail> PurchaseDetails { get; set; } = new List<PurchaseDetail>();
    public ICollection<SaleDetail> SaleDetails { get; set; } = new List<SaleDetail>();
    public ICollection<InventoryMovement> InventoryMovements { get; set; } = new List<InventoryMovement>();
}

using System.ComponentModel.DataAnnotations;

namespace AbarrotesInventory.Web.Models.Entities;

public class Inventory
{
    public int Id { get; set; }

    public int ProductId { get; set; }
    public Product Product { get; set; } = null!;

    [Required]
    [MaxLength(150)]
    public string WarehouseName { get; set; } = "Almacén Central";

    public int Stock { get; set; }

    public int MinimumStock { get; set; }

    public DateTime LastUpdated { get; set; } = DateTime.Now;
}

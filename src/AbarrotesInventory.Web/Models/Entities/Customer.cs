using System.ComponentModel.DataAnnotations;

namespace AbarrotesInventory.Web.Models.Entities;

public class Supplier
{
    public int Id { get; set; }

    [Required]
    [MaxLength(200)]
    public string Name { get; set; } = string.Empty;

    [MaxLength(50)]
    public string? Phone { get; set; }

    [MaxLength(200)]
    public string? Email { get; set; }

    [MaxLength(255)]
    public string? Address { get; set; }

    public ICollection<Product> Products { get; set; } = new List<Product>();
    public ICollection<Purchase> Purchases { get; set; } = new List<Purchase>();
}

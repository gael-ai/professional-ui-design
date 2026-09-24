using System.ComponentModel.DataAnnotations;

namespace AbarrotesInventory.Web.Models.Entities;

public class User
{
    public int Id { get; set; }

    [Required]
    [MaxLength(100)]
    public string Username { get; set; } = string.Empty;

    [Required]
    public string PasswordHash { get; set; } = string.Empty;

    [Required]
    [MaxLength(200)]
    public string FullName { get; set; } = string.Empty;

    public int RoleId { get; set; }
    public Role Role { get; set; } = null!;

    public ICollection<Purchase> Purchases { get; set; } = new List<Purchase>();
    public ICollection<Sale> Sales { get; set; } = new List<Sale>();
    public ICollection<InventoryMovement> InventoryMovements { get; set; } = new List<InventoryMovement>();
}

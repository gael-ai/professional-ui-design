using System.ComponentModel.DataAnnotations;

namespace AbarrotesInventory.Web.Models.Entities;

public class InventoryMovement
{
    public int Id { get; set; }

    public int ProductId { get; set; }
    public Product Product { get; set; } = null!;

    public int UserId { get; set; }
    public User User { get; set; } = null!;

    [Required]
    [MaxLength(20)]
    public string Type { get; set; } = "IN";

    public int Quantity { get; set; }

    [MaxLength(250)]
    public string? Reason { get; set; }

    [MaxLength(100)]
    public string? Reference { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.Now;
}

using System.ComponentModel.DataAnnotations;

namespace AbarrotesInventory.Web.Models.Entities;

public class Sale
{
    public int Id { get; set; }

    [Required]
    [MaxLength(50)]
    public string TicketNumber { get; set; } = string.Empty;

    public DateTime SaleDate { get; set; } = DateTime.Now;

    public int CustomerId { get; set; }
    public Customer Customer { get; set; } = null!;

    public int UserId { get; set; }
    public User User { get; set; } = null!;

    [Range(0, double.MaxValue)]
    public decimal Total { get; set; }

    public ICollection<SaleDetail> SaleDetails { get; set; } = new List<SaleDetail>();
}

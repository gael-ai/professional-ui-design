using AbarrotesInventory.Web.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace AbarrotesInventory.Web.Data;

public class InventoryDbContext : DbContext
{
    public InventoryDbContext(DbContextOptions<InventoryDbContext> options) : base(options) { }

    public DbSet<Role> Roles => Set<Role>();
    public DbSet<User> Users => Set<User>();
    public DbSet<Category> Categories => Set<Category>();
    public DbSet<Supplier> Suppliers => Set<Supplier>();
    public DbSet<Customer> Customers => Set<Customer>();
    public DbSet<Product> Products => Set<Product>();
    public DbSet<Purchase> Purchases => Set<Purchase>();
    public DbSet<PurchaseDetail> PurchaseDetails => Set<PurchaseDetail>();
    public DbSet<Sale> Sales => Set<Sale>();
    public DbSet<SaleDetail> SaleDetails => Set<SaleDetail>();
    public DbSet<Inventory> Inventories => Set<Inventory>();
    public DbSet<InventoryMovement> InventoryMovements => Set<InventoryMovement>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<Role>().ToTable("Roles");
        modelBuilder.Entity<User>().ToTable("Users");
        modelBuilder.Entity<Category>().ToTable("Categories");
        modelBuilder.Entity<Supplier>().ToTable("Suppliers");
        modelBuilder.Entity<Customer>().ToTable("Customers");
        modelBuilder.Entity<Product>().ToTable("Products");
        modelBuilder.Entity<Purchase>().ToTable("Purchases");
        modelBuilder.Entity<PurchaseDetail>().ToTable("PurchaseDetails");
        modelBuilder.Entity<Sale>().ToTable("Sales");
        modelBuilder.Entity<SaleDetail>().ToTable("SaleDetails");
        modelBuilder.Entity<Inventory>().ToTable("Inventories");
        modelBuilder.Entity<InventoryMovement>().ToTable("InventoryMovements");

        modelBuilder.Entity<User>()
            .HasOne(u => u.Role)
            .WithMany(r => r.Users)
            .HasForeignKey(u => u.RoleId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<Product>()
            .HasOne(p => p.Category)
            .WithMany(c => c.Products)
            .HasForeignKey(p => p.CategoryId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<Product>()
            .HasOne(p => p.Supplier)
            .WithMany(s => s.Products)
            .HasForeignKey(p => p.SupplierId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<Product>()
            .HasOne(p => p.Inventory)
            .WithOne(i => i.Product)
            .HasForeignKey<Inventory>(i => i.ProductId)
            .OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<Purchase>()
            .HasOne(p => p.Supplier)
            .WithMany(s => s.Purchases)
            .HasForeignKey(p => p.SupplierId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<Purchase>()
            .HasOne(p => p.User)
            .WithMany(u => u.Purchases)
            .HasForeignKey(p => p.UserId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<PurchaseDetail>()
            .HasOne(pd => pd.Purchase)
            .WithMany(p => p.PurchaseDetails)
            .HasForeignKey(pd => pd.PurchaseId)
            .OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<PurchaseDetail>()
            .HasOne(pd => pd.Product)
            .WithMany(p => p.PurchaseDetails)
            .HasForeignKey(pd => pd.ProductId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<Sale>()
            .HasOne(s => s.Customer)
            .WithMany(c => c.Sales)
            .HasForeignKey(s => s.CustomerId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<Sale>()
            .HasOne(s => s.User)
            .WithMany(u => u.Sales)
            .HasForeignKey(s => s.UserId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<SaleDetail>()
            .HasOne(sd => sd.Sale)
            .WithMany(s => s.SaleDetails)
            .HasForeignKey(sd => sd.SaleId)
            .OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<SaleDetail>()
            .HasOne(sd => sd.Product)
            .WithMany(p => p.SaleDetails)
            .HasForeignKey(sd => sd.ProductId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<InventoryMovement>()
            .HasOne(im => im.Product)
            .WithMany(p => p.InventoryMovements)
            .HasForeignKey(im => im.ProductId)
            .OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<InventoryMovement>()
            .HasOne(im => im.User)
            .WithMany(u => u.InventoryMovements)
            .HasForeignKey(im => im.UserId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}

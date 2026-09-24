using AbarrotesInventory.Web.Models.Entities;

namespace AbarrotesInventory.Web.Data;

public static class SeedData
{
    public static void Seed(InventoryDbContext context)
    {
        if (context.Roles.Any())
        {
            return;
        }

        var adminRole = new Role { Name = "Administrador", Description = "Acceso total al sistema" };
        var sellerRole = new Role { Name = "Vendedor", Description = "Registro y atención de ventas" };

        context.Roles.AddRange(adminRole, sellerRole);
        context.SaveChanges();

        var adminUser = new User
        {
            Username = "admin",
            PasswordHash = "admin123",
            FullName = "Administrador del Sistema",
            RoleId = adminRole.Id
        };

        context.Users.Add(adminUser);
        context.SaveChanges();

        var categoryAbarrotes = new Category { Name = "Abarrotes", Description = "Productos de consumo básico" };
        var categoryBebidas = new Category { Name = "Bebidas", Description = "Refrescos, aguas y jugos" };
        var categoryLimpieza = new Category { Name = "Limpieza", Description = "Artículos para limpieza del hogar" };

        context.Categories.AddRange(categoryAbarrotes, categoryBebidas, categoryLimpieza);
        context.SaveChanges();

        var supplier1 = new Supplier { Name = "Distribuidora del Valle", Phone = "555-1010", Email = "ventas@distribuidoradelvalle.com", Address = "Calle Principal 123" };
        var supplier2 = new Supplier { Name = "Alimentos Rápidos SA", Phone = "555-2020", Email = "contacto@alimentosrapidos.com", Address = "Avenida Sur 88" };

        context.Suppliers.AddRange(supplier1, supplier2);
        context.SaveChanges();

        var customer1 = new Customer { Name = "Cliente General", Phone = "555-3030", Email = "cliente@correo.com", Address = "Colonia Centro" };
        context.Customers.Add(customer1);
        context.SaveChanges();

        var product1 = new Product
        {
            Name = "Arroz 5kg",
            Barcode = "7501000001",
            Description = "Arroz blanco de calidad",
            CostPrice = 42.50m,
            SalePrice = 58.00m,
            CategoryId = categoryAbarrotes.Id,
            SupplierId = supplier1.Id,
            IsActive = true
        };

        var product2 = new Product
        {
            Name = "Refresco Cola 600ml",
            Barcode = "7501000002",
            Description = "Botella de refresco sabor cola",
            CostPrice = 12.50m,
            SalePrice = 18.00m,
            CategoryId = categoryBebidas.Id,
            SupplierId = supplier2.Id,
            IsActive = true
        };

        var product3 = new Product
        {
            Name = "Detergente 1L",
            Barcode = "7501000003",
            Description = "Detergente líquido multiuso",
            CostPrice = 22.00m,
            SalePrice = 31.50m,
            CategoryId = categoryLimpieza.Id,
            SupplierId = supplier2.Id,
            IsActive = true
        };

        context.Products.AddRange(product1, product2, product3);
        context.SaveChanges();

        context.Inventories.AddRange(
            new Inventory { ProductId = product1.Id, WarehouseName = "Almacén Central", Stock = 40, MinimumStock = 10 },
            new Inventory { ProductId = product2.Id, WarehouseName = "Almacén Central", Stock = 65, MinimumStock = 20 },
            new Inventory { ProductId = product3.Id, WarehouseName = "Almacén Central", Stock = 25, MinimumStock = 8 }
        );

        context.InventoryMovements.AddRange(
            new InventoryMovement { ProductId = product1.Id, UserId = adminUser.Id, Type = "IN", Quantity = 40, Reason = "Compra inicial", Reference = "INV-001" },
            new InventoryMovement { ProductId = product2.Id, UserId = adminUser.Id, Type = "IN", Quantity = 65, Reason = "Compra inicial", Reference = "INV-002" },
            new InventoryMovement { ProductId = product3.Id, UserId = adminUser.Id, Type = "IN", Quantity = 25, Reason = "Compra inicial", Reference = "INV-003" }
        );

        context.SaveChanges();
    }
}

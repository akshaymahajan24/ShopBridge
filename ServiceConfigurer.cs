using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ShopBridge.Models.EFModels;
using ShopBridge.Repositories.UnitOfWork;
using ShopBridge.Services.Interfaces;
using ShopBridge.Services.Services;

namespace ShopBridge
{
    public static class ServiceConfigurer
    {

        public static void ConfigureAppSetting(IServiceCollection services, IConfiguration configuration)
        {
            var connection = configuration.GetConnectionString("DefaultConnection");
            services.AddDbContext<ShopBridgeContext>(options => options.UseSqlServer(connection));
        }

        public static void RegisterServices(IServiceCollection services)
        {
            services.AddDbContext<ShopBridgeContext>();
            services.AddTransient<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IProductService, ProductService>();
        }
        }
}

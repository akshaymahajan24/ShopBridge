using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using ShopBridge.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace ShopBridge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private IProductService _productService;

        public ProductController(IProductService productService)
        {
            _productService = productService;
        }

        /// <summary>
        /// To get list of all products
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> GetAllProducts()
        {
            try
            {
                var response = await _productService.GetAllProducts();
                return Ok(new { value = response.Payload });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        /// <summary>
        /// To get details of single product by productId
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        [HttpGet("{productId}")]
        public async Task<IActionResult> GetProductById(string productId)
        {
            try
            {
                var response = await _productService.GetProductById(productId);
                return Ok(new { value = response.Payload });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        /// <summary>
        /// To add product in data base
        /// </summary>
        /// <param name="productDetails"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> AddProduct(JObject productDetails)
        {
            try
            {
                var response = await _productService.InsertProduct(productDetails);
                return Ok(new { value = response });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        /// <summary>
        /// To update Product in data base
        /// </summary>
        /// <param name="productId"></param>
        /// <param name="productDetails"></param>
        /// <returns></returns>
        [HttpPut("{productId}")]
        public async Task<IActionResult> UpdateProduct(string productId, JObject productDetails)
        {
            try
            {
                var response = await _productService.UpdateProduct(productId, productDetails);
                return Ok(new { value = response });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        /// <summary>
        /// To delete product from data base
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        [HttpDelete("{productId}")]
        public async Task<IActionResult> DeleteProduct(string productId)
        {
            try
            {
                var response = await _productService.DeleteProduct(productId);
                return Ok(new { value = response });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}

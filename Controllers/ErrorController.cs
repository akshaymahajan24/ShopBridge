using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShopBridge.Models.CommonModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ShopBridge.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ErrorController : ControllerBase
    {
        private readonly IWebHostEnvironment _environment;

        public ErrorController(IWebHostEnvironment environment)
        {
            _environment = environment;
        }
        [Route("")]
        [AllowAnonymous]
        public async void Error()
        {
            var context = HttpContext.Features.Get<IExceptionHandlerFeature>();
            var exception = context.Error; // Your exception
            string message = string.Format("Time: {0}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
            message += Environment.NewLine;
            message += "-----------------------------------------------------------";
            message += Environment.NewLine;
            message += string.Format("Exception: {0}", exception.Message.ToString());
            string fileLocation = @"\Log\ErrorLog.txt";
            string contentRootPath = _environment.ContentRootPath;
            var logPath = contentRootPath + fileLocation;
            using (StreamWriter streamwriter = System.IO.File.CreateText(logPath))
            {
                await streamwriter.WriteLineAsync(message);
            }
        }
    }
}

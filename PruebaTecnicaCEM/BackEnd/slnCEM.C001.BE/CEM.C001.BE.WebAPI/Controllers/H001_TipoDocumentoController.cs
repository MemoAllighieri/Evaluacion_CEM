using CEM.C001.BE.BLL;
using CEM.C001.BE.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;

namespace CEM.C001.BE.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [Produces("application/json")]
    [Authorize]

    public class H001_TipoDocumentoController : ControllerBase
    {
        readonly IConfiguration _configuration;
       
        public H001_TipoDocumentoController(IConfiguration configuration){           
             _configuration = configuration;           
        }

        [AllowAnonymous]
        [HttpGet("ListarTipoDocumento")]
        public IActionResult ListarTipoDocumento()
        {
            EstructuraResponse EstructuraResponse = new EstructuraResponse();
            EstructuraResponse.LastUpdate = DateTime.Now.ToLocalTime();
            EstructuraResponse.success = true;
            try
            {
                using (BLL_H001_TipoDocumento instancia = new BLL_H001_TipoDocumento(_configuration))
                {
                    EstructuraResponse.Data = instancia.ListarTipoDocumento();
                }
            }
            catch (Exception ex)
            {
                ErroresResponse erroresResponse = new ErroresResponse();
                erroresResponse.code = "ERROR";
                erroresResponse.message = "Hubo un error : " + ex.Message;

                EstructuraResponse.success = false;
                EstructuraResponse.errors = erroresResponse;
            }
            return Ok(EstructuraResponse);
        }
    }
}
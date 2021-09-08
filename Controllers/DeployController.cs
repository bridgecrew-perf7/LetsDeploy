using Microsoft.AspNetCore.Mvc;

namespace LetsDeploy.Controllers
{
    [Route("[controller]")]
    public class DeployController : ControllerBase
    {
        public IActionResult Get() => Ok("CI Deploy");
        [HttpGet("vaoow")]
        public IActionResult Vaoow() => Ok("I Feel Good"!);
    }
}
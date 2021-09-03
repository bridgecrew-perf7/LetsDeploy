using Microsoft.AspNetCore.Mvc;

namespace LetsDeploy.Controllers
{
    [Route("[controller]")]
    public class DeployController : ControllerBase
    {
        public IActionResult Get() => Ok("Deployed.");
    }
}
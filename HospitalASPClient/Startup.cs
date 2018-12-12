using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HospitalASPClient.Startup))]
namespace HospitalASPClient
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

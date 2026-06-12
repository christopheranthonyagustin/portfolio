<%@ Import Namespace="iWMS.SystemFramework"%>
<%@ Import Namespace="System.Runtime.Remoting" %>
<%@ Import Namespace="System.IO" %>
<script language="c#" runat="server">
		protected void Application_OnStart()
		{
			ApplicationConfiguration.OnApplicationStart(( HttpRuntime.AppDomainAppVirtualPath ));
			string configPath = Path.Combine((HttpRuntime.AppDomainAppVirtualPath), "remotingclient.cfg");
            
			if(File.Exists(configPath))
				RemotingConfiguration.Configure(configPath);
			
		}
		
</script>
component accessors="false" output="false" extends="BaseConnectionConfig"
{

    /**
     * redis-sentinel://[password@]host1 [: port1][, host2 [:port2]][, hostN [:portN]][/ database]
     * [? [timeout=timeout[d|h|m|s|ms|us|ns]] [ &sentinelMasterId=sentinelMasterId] [&database=database] [&clientName=clientName]]
     */

    property name="connectionHost" type="string";
    property name="connectionPort" type="numeric";

    public RedisConnectionConfig function init(){

        super.init("redis");

        variables.connectionHost = "localhost";
        variables.connectionPort = getRedisDefault("port_redis");
        

        return this;
    }

    public RedisConnectionConfig function host( required string host ){

		//get the domain from argument
        variables.connectionHost = listFirst(arguments.host, ":");

		//if port exists, set it.
        if( listLen( arguments.host, ":" ) >= 2 ){
            this.port( listGetAt(arguments.host, 2, ":") );
        }

        return this;
    }

    public RedisConnectionConfig function port( required numeric port )
    hint="Setter for the port"
    {

        variables.connectionPort = javacast("int", arguments.port);

        return this;
    }

    public string function getHost() hint="Simple getter for Host"{

        return variables.connectionHost;
    }


    public numeric function getPort() hint="Simple getter for Port"{

        return variables.connectionPort;
    }

	public boolean function isSSL(){
		
		return false;
	}

    public string function build()
    hint="returns a RedisURI instance"
    {

		//create a RedisURI instance with builder
        var builder = getRedisURIBuilder().redis( getHost(), getPort() );
        
        builder.withSSL( javacast("boolean", isSSL() ) );
        
        


        //common builder settings
        builderSetTimeout( builder );
        builderSetPassword( builder );
        builderSetDatabase( builder );
        builderSetClientName( builder );

		

        return builder.build();
    }

}
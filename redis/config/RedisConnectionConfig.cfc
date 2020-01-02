component accessors="false" output="false" extends="BaseConnectionConfig"
{

    /**
     * redis://[password@]host [: port][/database][? [timeout=timeout[d|h|m|s|ms|us|ns]] [ &database=database] [&clientName=clientName]]
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


    public string function build(){

		//create a RedisURI instance with builder
        var builder = createObject( "java", "io.lettuce.core.RedisURI" )
            .builder()
            .redis( getHost(), getPort() );

		builder.withTimeout( getTimeout(), getTimeoutUnit() );

		//set the password if provided
        if( ! isNull( getPassword() ) ){
            builder.withPassword( getPassword() );
        }

		//set the database if provided	
        if( ! isNUll( getDatabase() ) ){
            builder.withDatabase( getDatabase() );
        }

		//set the duration if exists
        
        
        

		//set the name if exists
        if( ! isNull( getName() ) ){
            builder.withClientName( getName() );
        }

        return builder.build();
    }

}
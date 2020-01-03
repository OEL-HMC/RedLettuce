component accessors="false" output="false" extends="BaseConnectionConfig"{

    /**
    * redis-socket:// [password@]path[ ?[timeout=timeout[d|h|m|s|ms|us|ns]][&database=database] [&clientName=clientName]]
    */
    
    property name="connectionPath" type="string";

    public SocketConnectionConfig function init(){

        super.init("socket");

        return this;
    }
    
    public SocketConnectionConfig function path( required string socketPath ){
    	
    	variables.connectionPath = arguments.socketPath;
    	
    	return this;
    }
    
    public any function build(){
    	
    	var builder = getRedisURIBuilder().socket( variables.connectionPath );
    	
    	builderSetTimeout( builder );
        builderSetPassword( builder );
        builderSetDatabase( builder );
        builderSetClientName( builder );
    	
    	
    	
    	return builder.build();
    	
    }

    public string function getPath(){

        return variables.connectionPath;
    }

}
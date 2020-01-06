component output="false" accessors="false" {

    property name="clientName" type="string";
    property name="connectionType" type="string";
    property name="databaseID" type="numeric";
    property name="connectionTimeout" type="numeric";
    property name="connectionTimeoutUnit" type="any" hint="instance of a java TimeUnit";
    property name="RedisURI" type="any";
    property name="connectionPassword" type="string";

    public BaseConnectionConfig function init( required string type ){

		variables.connectionType = arguments.type;
        variables.RedisURI = createObject( "java", "io.lettuce.core.RedisURI" );
        variables.connectionTimeout 		= this.getRedisDefault( "timeout" );
        variables.connectionTimeoutUnit 	= this.getRedisDefault( "timeoutUnit" );

        return this;
    }
    
    public any function getRedisURIBuilder(){
    	
    	return variables.RedisURI.builder();
    }

    private void function builderSetTimeout( required any builder  ){
        arguments.builder.withTimeout( this.getTimeout(), this.getTimeoutUnit() );
    }

    private void function builderSetPassword( required any builder ){

        if( isNull( getPassword() ) ){
            return;
        }

        builder.withPassword( getPassword() );
    }

    private void function builderSetDatabase( required any builder ){
        //set the database if provided	
        if( isNull(getDatabase())  ){
            return;
        }
        
        builder.withDatabase( getDatabase() );
        
    }

    private void function builderSetClientName( builder ){
        //set the name if exists
        if( ! isNull( getName() ) ){
            builder.withClientName( getName() );
        }
    }
    
    public any function getRedisDefault( required string def )
    hint="Helps getting the default values for RedisURI"
    {
    	
    	switch( arguments.def ){
            
            case "port_sentinel":
                return variables.RedisURI.DEFAULT_SENTINEL_PORT;
            break;

            case "port_redis":
                return variables.RedisURI.DEFAULT_REDIS_PORT;
            break;

    		case "timeoutUnit":
    			return variables.RedisURI.DEFAULT_TIMEOUT_UNIT;
    		break;
    		
    		case "timeout":
    			return variables.RedisURI.DEFAULT_TIMEOUT;
    		break;
    		
    		default:
    			throw( 
    				name="REDIS.REDISURI_NO_DEFAULT", 
    				message="There is no default value for #arguments.def# in io.lettuce.core.RedisURI" 
    			);
    		break;

    	}
    	
    }

    public BaseConnectionConfig function name( required string name)
    hint="Setter for the clientName property"
    {

        variables.clientName = arguments.name;

        return this;
    }

    public BaseConnectionConfig function timeout( 
    	required numeric timeout, 
    	string unit = "s" 
    ) hint="Setter for the connectionTimeout "
    {

		
        variables.connectionTimeout = javacast("long", arguments.timeout);
        this.timeoutUnit( arguments.unit );

        return this;
    }

    public BaseConnectionConfig function timeoutUnit( required string unit )
    hint="Setter for the timeout unit"
    {
		
		var timeUnitUtil = new redis.util.TimeUnit();
		variables.connectionTimeoutUnit = timeUnitUtil.getTimeUnit( arguments.unit );        

        return this;

        
    }

    public BaseConnectionConfig function database( required numeric id )
    hint="Sets the database id."
    {

        variables.databaseID = javacast("int", arguments.id);

        return this;
    }

    public BaseConnectionConfig function password( required string password )
    hint="Sets the password"
    {

        variables.connectionPassword = arguments.password;

        return this;
    }


    public string function getPassword()
    hint="returns the password for the connection"
    {

        return variables.connectionPassword ?: javacast( "null", 0 );
    }

    public numeric function getTimeout(){

        return variables.connectionTimeout;
    }
    
    public any function getTimeoutUnit(){
    	
    	return variables.connectionTimeoutUnit;
    }

    public string function getName(){

        return variables.clientName ?: javacast("null", 0);
    }

    public string function getType(){

        return variables.connectionType;
    }

    public numeric function getDatabase(){

        return variables.databaseID ?: javacast("null", 0);
    }
    
    public any function build(){
    	
    	throw(
    		type="REDIS.BASECONFIG_CANNOT_BUILD",
    		message="Base configs cannot be built, you must use a sub-component of it."
    	);
    	
    }

    


}
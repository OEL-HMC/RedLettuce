component accessors="false" output="false" extends="BaseConnectionConfig"  {

    /**
     * redis-sentinel://[password@]host1 [: port1][, host2 [:port2]][, hostN [:portN]][/ database]
     * [? [timeout=timeout[d|h|m|s|ms|us|ns]] [ &sentinelMasterId=sentinelMasterId] [&database=database] [&clientName=clientName]]
     */

    property name="connectionMasterId" type="string";
    property name="hosts" type="array";

    public SentinelConnectionConfig function init(){
    	
        super.init("sentinel");
        
        variables.hosts = [];

        return this;
    }
    
    public any function build(){
        
        if( arrayIsEmpty( variables.hosts ) ){
            throw( 
                type="REDIS.SENTINEL_HOSTS_EMPTY",
                message="The sentinel connection cannot be made as there are no know hosts"
            );
        }

        var builder = getRedisURIBuilder();
        
        

        getHosts().each(

            function ( struct sentinelHost, numeric idx, array original ){

                var check = ( arguments.idx == 1 ? 0 : 1 );
                check += structKeyExists( sentinelHost, "port" ) ? 10 : 0;
                check += isNull( variables.connectionMasterId ) ? 0 : 100;

                switch( check ){

                    case 0: //0 the first, no port, no ConnectionMasterId
                    case 1: //1 not the first, no port, no ConnectionMasterId
                    case 101: //101 not the first, no port, has connectionMasterId ( dont use connectionMasterId again )

                        builder.withSentinel( sentinelHost.host );        
                    break;

                    case 10: //10 first, port set, no ConnectionMasterId
                    case 11: //11 not the first, port set, no ConnectionMasterId
                    case 111: //not the first, port set, has masterId ( do not set it again )

                        builder.withSentinel( sentinelHost.host, sentinelHost.port );
                    break;

                    case 100: //the first, no port, has connectionMasterId
                        
                        builder.withSentinel( sentinelHost.host, connectionMasterId );
                    break;

                    case 110: //the first, has port, has masterID

                        builder.withSentinel( sentinelHost.host, sentinelHost.port, connectionMasterId );
                    break;

                }

            }

        );

        //common builder settings
        builderSetTimeout( builder );
        builderSetPassword( builder );
        builderSetDatabase( builder );
        builderSetClientName( builder );

    	return builder.build();
    }
    
    public SentinelConnectionConfig function masterId ( required string masterId )
    hint="Sets the master id"
    {
    	
    	variables.connectionMasterId = arguments.masterId;
    	
    	return this;
    }

    public SentinelConnectionConfig function host( required string host )
    hint="Add a host to the sentinels with host:port"
    {

        var hostInfo = { "host": listFirst( arguments.host, ':' ) };

        if( listLen( arguments.host, ':' ) > 1 ){
            hostInfo.put( "port", javacast("int", listLast( arguments.host, ':' )) );
        }


        variables.hosts.append( hostInfo );
        
        return this;
    }

    public array function getHost()
    hint="Just a alias for getHosts function"
    {
        return getHosts();
    }

    public array function getHosts()
    hint="Get the array of redis sentinels, first one is supposed to be the master"
    {

        return variables.hosts;
    }
    
    public string function getMasterId()
    hint="Get the name for the master sentinel"
    {
    	
    	return variables.connectionMasterId ?: javacast("null", 0);
    }

}
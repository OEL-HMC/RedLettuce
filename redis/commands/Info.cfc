component accessors="false" output="false"{

    property name="allowedSections";

    public Info function init(){

        variables.allowedSections = "";
        variables.allowedSections = listAppend( variables.allowedSections, "server" );
        //server: General information about the Redis server
        variables.allowedSections = listAppend( variables.allowedSections, "clients" );
        //clients: Client connections section
        variables.allowedSections = listAppend( variables.allowedSections, "memory" );
        //memory: Memory consumption related information
        variables.allowedSections = listAppend( variables.allowedSections, "persistence" );
        //persistence: RDB and AOF related information
        variables.allowedSections = listAppend( variables.allowedSections, "stats" );
        //stats: General statistics
        variables.allowedSections = listAppend( variables.allowedSections, "replication" );
        //replication: Master/replica replication information
        variables.allowedSections = listAppend( variables.allowedSections, "cpu" );
        //cpu: CPU consumption statistics
        variables.allowedSections = listAppend( variables.allowedSections, "commandstats" );
        //commandstats: Redis command statistics
        variables.allowedSections = listAppend( variables.allowedSections, "cluster" );
        //cluster: Redis Cluster section
        variables.allowedSections = listAppend( variables.allowedSections, "keyspace" );
        //keyspace: Database related statistics
        variables.allowedSections = listAppend( variables.allowedSections, "all" );
        variables.allowedSections = listAppend( variables.allowedSections, "default" );
        

        return this;
    }
    
    
    public struct function toStruct( required string infoResult ){
    	
    	
    	var arr = arguments.infoResult.split( "\r\n|\r|\n" );

		//arr is a native array so I cant filter through filter()
        var cfArray = [];
        for( var line in arr ){
            cfArray.append( line );
        }

        
        return cfArray.filter(
            function ( item, idx, original ){
                if( item != "" && mid(item, 1, 1) != "##" ){
                    return true;
                }
                return false;
            }
        ).reduce(
        	function ( st, item, idx, original ){
        		st.put( listFirst(item, ":"), listLast( item, ":" )   );
        		return st;	
        	},
        	{}
        );
    	
    }
    
    
    

    public struct function execute(
        required redis.client.RedisClient redisClient,
        string section = ""
    ){

        var lowSection = lcase( arguments.section );

        if( listFindNoCase( variables.allowedSections, lowSection ) == 0 ){



            return toStruct( redisClient.getCommands().info() );
        }

        return toStruct( redisClient.getCommands().info( lowSection ) );

    }

}
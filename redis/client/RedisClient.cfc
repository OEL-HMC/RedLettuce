component accessors="false" output="false"
{

    property name="jRedisClient" hint="instance of a redisConnection";
    property name="jConnection" hint="instance of a statefulRedisConnection";

    public RedisClient function init( required any redisClient ){

        variables.jRedisClient = arguments.redisClient;

        return this;
    }

    public RedisClient function connect(){

        //statefulConnection
        variables.jConnection =  variables.jRedisClient.connect();

        return this;
    }

    public RedisClient function shutdown(){

        if( !isNull( variables.jConnection ) ){
            variables.jConnection.close();
        }

        variables.jRedisClient.shutdown();

        return this;
    }

    public any function getCommands(){
        
        if( ! isNull(variables.jConnection) && variables.jConnection.isOpen() ){
            return variables.jConnection.sync();
        }

		throw( type="REDIS_CLIENT.NO_CONNECTION", message="You can't get the commands as the connection does " );
    }

    public any function getConnection(){

        return variables.jConnection;
    }

}
component extends="testbox.system.BaseSpec" 
{

    function beforeAll(){

        var builder = new redis.client.RedisClientBuilder();
        var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
        variables.redisClient = builder.createRedisClientWithRedisURI( conf );
        
        variables.redisClient.connect(); 

    }

    function afterAll(){
        variables.redisClient.shutdown();
    }

}
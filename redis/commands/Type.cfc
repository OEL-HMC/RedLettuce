component accessors="false" output="false"
{

    import "redis.client.RedisClient";

    public string function execute(
        required RedisClient redisClient,
        required string match
    )
    hint="Returns the type of value associated with key : returned string can be string, list, set, zset, hash and stream"
    {

        return redisClient.getCommands().type( arguments.match ); 
    }

}
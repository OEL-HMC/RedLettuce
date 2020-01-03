component accessors="false" output="false"
{

    import "redis.client.RedisClient";

    public array function execute(
        required RedisClient redisClient,
        string match = "*"

    ){

        return redisClient.getCommands().keys( arguments.match );

    }

}
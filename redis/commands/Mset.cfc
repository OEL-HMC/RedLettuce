component{

    import "redis.client.RedisClient";

    public string function execute(
        required RedisClient redisClient,
        required struct values
    ){

        //always returns "OK"
        return redisClient.getCommands().mset( arguments.values );

    }

}
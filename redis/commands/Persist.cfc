component{

    import "redis.client.RedisClient";

    public numeric function execute(
        required RedisClient redisClient,
        required key
    ){
        //returns 1 if the timeout was removed.
        //returns 0 if key does not exist or does not have an associated timeout.
        return redisClient.getCommands().persist( arguments.key );
    }

}
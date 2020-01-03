component{

    import "redis.client.RedisClient";

    public any function execute(
        required RedisClient redisClient
    ){

        return redisClient.getCommands.randomkey();
    }

}
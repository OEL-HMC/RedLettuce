component output="false" accessors="true" 
hint="Returns the number of keys in the selected database"
{

    public DBSize function init(){

        return this;
    }

    public numeric function execute(
        required redis.client.RedisClient redisClient
    )
    {
        return redisClient.getCommands().dbsize();
    }

}
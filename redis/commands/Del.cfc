component accessors="false" output="false" 
hint="Command to delete one or more keys. Beware : blocking operation"
{

    import "redis.client.RedisClient";

    public any function execute(
        required RedisClient redisClient,
        any matches hint="array of keys to delete or just a string"
    )
    hint="Deletes one or more keys and returns of entries deleted"
    {

        var delArguments = isSimpleValue(arguments.matches) ? [ arguments.matches ] : arguments.matches;

        return redisClient.getCommands().del( delArguments );
    }

}
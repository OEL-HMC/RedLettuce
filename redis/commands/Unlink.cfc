component accessors="false" output="false" 
hint="Command to unlink one or more keys, same as DEL command but this one is not blocking."
{

    import "redis.client.RedisClient";

    public any function execute(
        required RedisClient redisClient,
        any matches hint="array of keys to delete or just a string"
    )
    hint="Deletes one or more keys and returns of entries deleted"
    {

        var delArguments = isSimpleValue(arguments.matches) ? listToArray(arguments.matches) : arguments.matches;

        //writeDump( redisClient.getCommands() );

        return redisClient.getCommands().unlink( delArguments );
    }

}
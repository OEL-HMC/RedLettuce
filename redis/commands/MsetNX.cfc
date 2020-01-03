component accessors="false" output="false" {

    public any function execute(
        required RedisClient redisClient,
        required struct values
    ){

        //returns 1 if ALL keys have been set
        //returns 0 if none keys have been set ( because at least one key already existed )
        return redisClient.getCommands().msetnx( arguments.values ); 
    }

}  
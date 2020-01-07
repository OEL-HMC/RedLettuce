component  extends="testbox.system.BaseSpec"{
    
    

    public function run(){

        describe(
            "SetRange command",
            function(){
                it(
                    "XXX",
                    function(){

                        var builder = new redis.client.RedisClientBuilder();
                        var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                        var redisClient = builder.createRedisClientWithRedisURI( conf );
                        
                        redisClient.connect();

                        var result = new redis.commands.Set().execute( redisClient, "setRangeKey", "Hello" );

                        expect( result ).toBe("OK");

                        var hhh = new redis.commands.SetRange().execute( redisClient , "setRangeKey", 6, "World");

                        //expect( hhh  ).toBe( 10 );

                        var hhh = new redis.commands.Get().execute( redisClient , "setRangeKey");

                        expect( asc(mid( hhh, 6,1 )) ).toBe( 0 );

                        var result = new redis.commands.Set().execute( redisClient, "setRangeKey", "Hello" );

                        var result= new redis.commands.Del().execute( redisClient, "setRangeKey" );

                        redisClient.shutdown();
                    }
                );
            }
        );

    }

}
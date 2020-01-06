component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "STRLEN COMMAND",
                function(){

                    it(
                        "DECRBY key 1", 
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.Set().execute( redisClient,  "blablabla", "blobloblo-");

                            expect( local.res ).toBe("OK");

                            var res = new redis.commands.StrLen().execute( redisClient,  createUUID());

                            expect(local.res).toBe(0);

                            var res = new redis.commands.StrLen().execute( redisClient,  "blablabla" );

                            expect(local.res).toBe(10);

                            var res = new redis.commands.Del().execute( redisClient,  "blablabla");

                            expect( local.res ).toBe(1);


                        }
                    );


                }
            );

            

            
            
        };

}
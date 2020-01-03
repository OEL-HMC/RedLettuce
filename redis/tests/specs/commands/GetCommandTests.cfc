component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "GET COMMAND",
                function(){

                    it(
                        "Get a key that exists, and which is a string.", 
                        function(){

                            var builder = new redis.RedisClientBuilder();
                            var conf = new redis.config.RedisConnection().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            res = new redis.commands.Del().execute( redisClient, "TOM" );

                            var str = "Tom sawyer";
                            var res = new redis.commands.Append().execute( redisClient, "TOM", str );

                            expect( res ).toBe( str.len()  );

                            var res = new redis.commands.get().execute( redisClient, "TOM" );
                            expect( res ).toBe( str );

                            res = new redis.commands.Del().execute(redisClient, "TOM" );
                            expect(res).toBe(1);

                            redisClient.shutdown();  

                        }
                    );


                    it(
                        "Get a key that DOES NOT exists, NULL is returned.", 
                        function(){

                            var builder = new redis.RedisClientBuilder();
                            var conf = new redis.config.RedisConnection().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            

                            var res = new redis.commands.get().execute( redisClient, "HAHAHAHAHA" );
                            expect( isNull(res) ).toBeTrue();

                            

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            

            
            
        };

}
component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "ExpireAt COMMAND",
                function(){

                    it(
                        "Try to delete an non-existing key. Must return 0", 
                        function(){

                            var builder = new redis.RedisClientBuilder();
                            var conf = new redis.config.RedisConnection().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.Del().execute( redisClient,  "A" );
                            //dont expect nothing from that one

                            var res = new redis.commands.Append().execute( redisClient,  "A", "B");

                            expect(res).toBe(1);

                            var res = new redis.commands.ExpireAt().execute( 
                                redisClient, 
                                "A", 
                                createDate( 2020, 1, 1 ) 
                            );
                            
                            expect( res ).toBe(1);

                            var res = new Redis.commands.TTL().execute(
                                redisClient,
                                "A"
                            );
                            
                            expect( res > 0 ).toBeTrue();

                            var res = new redis.commands.persist().execute(
                                redisClient, "A"
                            );
                            expect( res ).toBe(1);

                            var res = new redis.commands.persist().execute(
                                redisClient, "A"
                            );
                            expect( res ).toBe(0);

                            var res = new redis.commands.Del().execute( redisClient,  "A" );
                            expect( res ).toBe(1);
                            //dont expect nothing from that one

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            

            
            
        };

}
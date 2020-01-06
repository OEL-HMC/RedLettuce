component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "Append COMMAND",
                function(){

                    it(
                        "Try to delete an non-existing key. Must return 0", 
                        function(){

                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var res = new redis.commands.Del().execute( redisClient,  "A" );
                            //dont expect nothing from that one

                            var res = new redis.commands.Append().execute( redisClient,  "A", "B");

                            expect(res).toBe(1);

                            var res = new redis.commands.Rename().execute( redisClient,  "A", "B");

                            expect(res).toBe("OK");

                            var res = new redis.commands.Get().execute( redisClient,  "B");

                            expect( res ).toBe("B");

                            var res = new redis.commands.Rename().execute( redisClient,  "A", "B");

                            expect(res).toBe("ERR");



                            var res = new redis.commands.Del().execute( redisClient,  "B" );

                            expect( res ).toBe(1);

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            

            
            
        };

}
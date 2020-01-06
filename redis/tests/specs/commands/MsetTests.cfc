component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "INCRBY COMMAND",
                function(){

                    it(
                        "MSET 1000 key(String):Value(string)", 
                        function(){



                            var builder = new redis.client.RedisClientBuilder();
                            var conf = new redis.config.RedisConnectionConfig().host("#request.masterRedis.host#").name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );
                            
                            redisClient.connect();

                            var m1000 = {};
                            for( var i =1; i<=1000; i++ ){
                                m1000.put("MSET_#i#", "Hello World #i#");
                            }

                            var res = new redis.commands.Mset().execute( redisClient,  m1000 );

                            expect(res).toBe("OK");

                            

                            var res = new redis.commands.Unlink().execute( redisClient,  structKeyArray( m1000 ) );

                            expect( res ).toBe(1000);

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            

            
            
        };

}
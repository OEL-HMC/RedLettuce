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
                            for( var i =1; i<=5; i++ ){
                                m1000.put("MSET_#i#", "Hello World #i#");
                            }

                            var res = new redis.commands.MsetNX().execute( redisClient,  m1000 );

                            expect(res).toBe(1);

                            var res = new redis.commands.MsetNX().execute( redisClient,  m1000 );

                            expect(res).toBe(0);


                            var res = new redis.commands.Unlink().execute( redisClient,  structKeyArray( m1000 ) );

                            expect( res ).toBe( m1000.len() );

                            redisClient.shutdown();  

                        }
                    );

                }
            );

            

            
            
        };

}
component extends="BaseCommandTest"{


        function run(){
        

            describe(
                "INCRBY COMMAND",
                function(){

                    it(
                        "DECRBY key 1", 
                        function(){

                            

                            var res = new redis.commands.DecrBy().execute( redisClient,  "INCRBY_KEY", 1);

                            expect(res).toBe(-1);

                            var res = new redis.commands.DecrBy().execute( redisClient,  "INCRBY_KEY", 1);

                            expect(res).toBe(-2);

                            var res = new redis.commands.Del().execute( redisClient,  "INCRBY_KEY" );

                            expect( res ).toBe(1);

                            

                        }
                    );

                    it(
                        "DECRBY key 1", 
                        function(){


                            var res = new redis.commands.DecrBy().execute( redisClient,  "INCRBY_KEY", 2);

                            expect(res).toBe(-2);

                            var res = new redis.commands.DecrBy().execute( redisClient,  "INCRBY_KEY", 2);

                            expect(res).toBe(-4);

                            var res = new redis.commands.Del().execute( redisClient,  "INCRBY_KEY" );

                            expect( res ).toBe(1);



                        }
                    );

                }
            );

            

            
            
        };

}
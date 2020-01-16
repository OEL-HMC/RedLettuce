component extends="BaseCommandTest"{

    public RandomKey function init(){

        return this;
    }

    

    function run(){

        describe(
            "Tests for randomKey",
            function(){
                it(
                    "Get a random key from current database or null if database is empty",
                    function(){
                        expect(
                            
                                new redis.commands.Info().execute( redisClient )
                            
                        ).toBe("");
                    }
                );
            }
        );

    }

}
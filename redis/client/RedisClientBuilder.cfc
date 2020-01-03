component output="false" accessors="false" {

    import "redis.config.BaseConnectionConfig";

    public RedisClient function createRedisClientWithRedisURI ( required BaseConnectionConfig config ){

        var jRedisClient =  createObject('java', "io.lettuce.core.RedisClient").create( config.build() );

        return new RedisClient( jRedisClient );

    }

}
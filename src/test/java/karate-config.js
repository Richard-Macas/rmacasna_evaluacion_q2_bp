function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property is:', env);
    if (!env) {
        env = 'dev'; // a default value
    }   
    var config = {
        baseUrl: 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters',
        env: env
    }
    if (env === 'dev') {
        // customize for dev environment
        config.baseUrl= 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
        
    } else if (env === 'e2e') {
        // customize for e2e environment
    }
    return config;
    
}
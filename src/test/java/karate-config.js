function fn() {
  var config = {
    baseURL: 'https://heimdall.eka.io',
    headers: {
      'DICE-APP-ID': 'dnvtest',
      'X-CLIENT-ID': 'bfaaa382e',
      'X-CLIENT-SECRET': 'bb8987a132ab4e889ae7cd0062f80169',
      'Content-Type': 'application/json'
    }
  };

  // Return the config object to be used by Karate
  return config;
}